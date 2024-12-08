# Portland

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
  style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json",
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
