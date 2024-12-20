# Vermont

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
  center: [-72.8, 43.1], zoom: 10, // Vermont
  style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json",
  scrollZoom: true
})

 map.addControl(new maplibregl.NavigationControl());

  // Set map limits
  map.setMinZoom(7);
  map.setMaxZoom(15);
  let bounds = [
      [-73.8, 42.5], // [west, south]
      [-71.7, 43.6]  // [east, north]
  ];
  map.setMaxBounds(bounds);

  map.on('load', () => {
    map.addSource('vt', {
        "type": "image",
        "url": "https://pbogden.github.io/webmap.png", 
        "coordinates": [
            [-72.8699937, 43.1636548], // upper left
            [-72.6942517, 43.1636548], // upper right
            [-72.6942517, 43.0343442], // bottom right
            [-72.8699937, 43.0343442], // bottom left
        ]
    });
    map.addLayer({
                    'id': 'vt',
                    'type': 'raster',
                    'source': 'vt',
                    'minzoom': 0,
                    'maxzoom': 22,
                    'paint': {'raster-opacity': .5},
                })
  })
```

```js
map.isStyleLoaded() // don't attempt to change things unless layer is actually loaded
  ? map.setPaintProperty("vt", "raster-opacity", opacity)
  : null;
```
