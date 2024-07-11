# my map

<div id="map" style="width: 100%; height: 450px;"></div>

<link rel="stylesheet" href="${import.meta.resolve("npm:maplibre-gl/dist/maplibre-gl.css")}">

```js
import maplibregl from "npm:maplibre-gl";
```

```js
const map = new maplibregl.Map({
    interactive: false,
    boxZoom: true, // use shift+drag to create bounding box, "zoom to" follows
    pitch: 0,
    bearing: 0,
    maplibreLogo: true,
    container: "map",
    center: [-72.8, 43.1], zoom: 10, // Vermont
    style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json",
    scrollZoom: true
  });

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
