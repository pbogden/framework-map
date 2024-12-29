# Vermont tiles

This version uses map tiles instead of a single PNG.

<link rel="stylesheet" type="text/css" href="https://unpkg.com/maplibre-gl@4.0.2/dist/maplibre-gl.css">

```js
import maplibregl from "npm:maplibre-gl@4.0.2";
```

```js
const opacity = view(Inputs.range([0, 1], {label: "Opacity", format: x => x.toFixed(2)}))
```

```js
const div = display(document.createElement("div"));
div.style = "height: 400px;";
const map = new maplibregl.Map({
  container: div,
  // interactive: false,
  boxZoom: true, // use shift+drag to create bounding box, "zoom to" follows
  pitch: 0,
  bearing: 0,
  maplibreLogo: true,
  div,
  center: [-70.2568, 43.6591], zoom: 12, // Portland
//  style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json",
  style: 'https://api.maptiler.com/maps/hybrid/style.json?key=xd89AQeIL88tBv6PUuRH',
  scrollZoom: true
})

 map.addControl(new maplibregl.NavigationControl());

  // Set map limits
  map.setMinZoom(7);
  map.setMaxZoom(17);
  // let bounds = [
  //     [-73.8, 42.5], // [west, south]
  //     [-71.7, 43.6]  // [east, north]
  // ];
  // map.setMaxBounds(bounds);

  map.on('load', () => {
    map.addSource('vt', {
        type: "raster",
        scheme: "tms",
        tiles: ["https://pbogden.github.io/geo/color/{z}/{x}/{y}.png"],
    });
    map.addLayer({
        id: 'vt',
        type: 'raster',
        source: 'vt',
        paint: {'raster-opacity': .5},
    })
  });
```

```js
map.isStyleLoaded() // don't attempt to change things unless layer is actually loaded
  ? map.setPaintProperty("vt", "raster-opacity", opacity)
  : null;
```
