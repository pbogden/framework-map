# Satellite tiles

Testing -- elevation contours from Maine GIS

<link rel="stylesheet" type="text/css" href="https://unpkg.com/maplibre-gl@4.0.2/dist/maplibre-gl.css">

```js
import maplibregl from "npm:maplibre-gl@4.0.2";
```

```js
const data = FileAttachment("data/portland_filtered.geojson").json();
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
//  style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json", // works local and remote
//  style: "https://api.maptiler.com/maps/hybrid/style.json?key=get_your_own_OpIi9ZULNHzrESv6T2vL", // localhost only
//  style: "https://api.maptiler.com/tiles/satellite-v2/tiles.json?key=CWCYPYhJwnzgcYMXp0oC", // doesn't work
       style: {
            'version': 8,
            'sources': {
                'raster-tiles': {
                    'type': 'raster',
                    'tiles': [
                        // NOTE: Layers from Stadia Maps do not require an API key for localhost development or most production
                        // web deployments. See https://docs.stadiamaps.com/authentication/ for details.
//                        'https://tiles.stadiamaps.com/tiles/stamen_watercolor/{z}/{x}/{y}.jpg'
                          'https://api.maptiler.com/tiles/satellite-v2/{z}/{x}/{y}.png?key=CWCYPYhJwnzgcYMXp0oC'
                    ],
                    'tileSize': 256,
        attribution: "\u003ca href=\"https://www.maptiler.com/copyright/\" target=\"_blank\"\u003e\u0026copy; MapTiler\u003c/a\u003e \u003ca href=\"https://www.openstreetmap.org/copyright\" target=\"_blank\"\u003e\u0026copy; OpenStreetMap contributors\u003c/a\u003e",
                }
            },
            'layers': [
                {
                    'id': 'simple-tiles',
                    'type': 'raster',
                    'source': 'raster-tiles',
                    'minzoom': 0,
                    'maxzoom': 22
                }
            ]
        },
  scrollZoom: true
})

 map.addControl(new maplibregl.NavigationControl());

  // Set map limits
  map.setMinZoom(11);
  map.setMaxZoom(20);

  map.on('load', () => {
    map.addSource("contours", {
          type: "geojson",
          data: data,
    });

    map.addLayer({
      'id': 'portland',
      'source': 'contours',
            'type': 'line',
            'paint': {
                'line-color': '#000',
                'line-width': 1,
            }
    });

  });
```
