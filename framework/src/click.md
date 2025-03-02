```js
const opacity = view(Inputs.range([0, 1], {label: "Opacity", format: x => x.toFixed(2)}))
```

```js
demData.attr("opacity", opacity)
map.on("click", ({offsetX: xs, offsetY: ys}) => {
     demData.selectAll("image").remove();
     demData.append(() => getTile(xs, ys));
});
```

```js
const map = d3.create("svg")
    .attr("width", width)
    .attr("height", height)
    .attr("viewBox", `0 0 ${width} ${height}`)

const tiles = tiler();
const {translate: [tx, ty], scale: k} = tiles;

map.selectAll("image")
     .data(tiles)
     .join("image")
     .attr("width", k)
     .attr("height", k)
     .attr("x", ([x, y, z]) => (x + tx) * k)
     .attr("y", ([x, y, z]) => (y + ty) * k)
     .attr("href", ([x, y, z]) => url(x, y, z))

const demData = map.append("g")

display(map.node());
```

<div id="tile"></div>

```js
const height = 500;
const center = [-70.255, 43.652];
const tileSize = 256 // 256 is default tileSize for d3-tile
const zoom = 14.5;

const projection = d3.geoMercator()
    .scale(2**zoom * tileSize / 2 / Math.PI)
    .translate([width / 2, height / 2])
    .center(center);

const tiler = tile()
    .size([width, height])
    .scale(projection.scale() * 2 * Math.PI)
    .translate(projection([0, 0]))

const dem = (x, y, z) => `https://pbogden.github.io/geo/xyz/${z}/${x}/${y}.png`;
//const dem = (x, y, z) => `https://pbogden.github.io/geo/color/${z}/${x}/${y}.png`;
const url = (x, y, z) => `https://tiles.stadiamaps.com/tiles/alidade_smooth/${z}/${x}/${y}${devicePixelRatio > 1 ? "@2x" : ""}.png`;
```

```js
function getTile(xs, ys) {
  // Indices of tile that was clicked
  const {translate: [tx,ty], scale: k} = tiler();
  const i = xs / k - tx;
  const j = ys / k - ty;

  // {x}/{y}/{z} tile coordinates
  const x = Math.floor(i);
  const y = Math.floor(j);
  const z = Math.round(Math.log2(tiler.scale()() / 256));
  
  // Coordinates of tile on map
  const xt = (x + tx) * k;
  const yt = (y + ty) * k;

  const [xc, yc] = [xs - xt, ys - yt];
  const [xp, yp] = [Math.floor(tileSize * xc / k), 
                    Math.floor(tileSize * yc / k)];

  const image = d3.create("svg:image")
    .attr("x", xt)
    .attr("y", yt)
    .attr("width", k)
    .attr("height", k)
    .classed("dem", true)
    .on("load", (e) => { getPixelValue(xp, yp, image, e) })
    .attr("href", dem(x, y, z))
    .node();

  return image;
}

function getPixelValue(xp, yp, image, e) {
  const canvas = d3.create("canvas").attr("height", 256).attr("width", 256).node();
  const ctx = canvas.getContext("2d");

  // evidently the next line triggers a "load" event, hence the return
  if (!image.crossOrigin) return image.crossOrigin = "anonymous"; // allows "non-authenticated" cross-origin loading of the image
  
  ctx.drawImage(image, 0, 0, 256, 256)
  const imageData = ctx.getImageData(0, 0, 256, 256);

  let height = null;
  const k0 = 4 * (256 * yp + xp); // 1-D index of the clicked pixel;
  const color = d3.scaleSequential([-1, 5], d3.interpolateMagma);
  for (let i = 0; i < imageData.data.length; i += 4) {
      const r = imageData.data[i];
      const g = imageData.data[i + 1];
      const b = imageData.data[i + 2];
      const h = -10000 + ((r * 256 * 256 + g * 256 + b) * 0.1);
      if (i == k0) height = h; 
    
      const rgb = d3.rgb(color(h));
      imageData.data[i] = rgb.r;
      imageData.data[i + 1] = rgb.g;
      imageData.data[i + 2] = rgb.b;
  }
  display(`getPixelValue: ${xp}, ${yp}, ${d3.format(".1f")(height)}`)

  const dx = 10;
  const i0 = yp;  // row (0-255 starting from top)
  const j0 = xp;  // column (0-255 starting from left)
  for (let i= 4 * (i0 - dx / 2); i < 4 * (i0 + dx / 2); i += 4) {
    for (let j = 4 * (j0 - dx / 2); j < 4 * (j0 + dx / 2); j += 4) {
      const k = 256 * i + j; // black center pixel in white square
      const value = (i == 4 * i0 & j == 4 * j0) ? 0: 255;
      imageData.data[k] = value;     // red
      imageData.data[k + 1] = value; // green 
      imageData.data[k + 2] = value; // blue
      imageData.data[k + 3] = 255; // alpha
    }
  }

  ctx.putImageData(imageData, 0, 0);

  const mydiv = d3.select("#tile");
  mydiv.selectAll("canvas").remove()
  mydiv.append(() => canvas);
}
```

```js
import {tile} from "npm:d3-tile";
```
