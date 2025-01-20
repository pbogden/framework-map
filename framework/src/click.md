```js
const opacity = view(Inputs.range([0, 1], {label: "Opacity", format: x => x.toFixed(2)}))
```

```js
demData.selectAll("image").attr('opacity', opacity);
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
map.on("click", ({offsetX: xs, offsetY: ys}) => {
    demData.selectAll("image").remove();
    display(`${xs}, ${ys}`)
    display(getTile(xs, ys))
    demData.append(() => getTile(xs, ys));
  });

display(map.node());
```

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

//const dem = (x, y, z) => `https://pbogden.github.io/geo/xyz/${z}/${x}/${y}.png`;
const dem = (x, y, z) => `https://pbogden.github.io/geo/color/${z}/${x}/${y}.png`;
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

  const image = d3.create("svg:image")
    .attr("x", xt)
    .attr("y", yt)
    .attr("width", k)
    .attr("height", k)
    .attr("href", dem(x, y, z))
  
  return image.node();
}
```

```js
import {tile} from "npm:d3-tile";
```