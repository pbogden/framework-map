# Portland

Testing -- MapTiler satellite tiles & selected elevation contours from Maine GIS

<link rel="stylesheet" type="text/css" href="https://unpkg.com/maplibre-gl@4.0.2/dist/maplibre-gl.css">

```js
import maplibregl from "npm:maplibre-gl@4.0.2";
```

```js
const data = FileAttachment("data/portland_filtered.geojson").json();
```

```js
const map = new maplibregl.Map({
  container: "map",
  // interactive: false,
  boxZoom: true, // use shift+drag to create bounding box, "zoom to" follows
  pitch: 0,
  bearing: 0,
  maplibreLogo: true,
  center: [-70.2568, 43.6591], zoom: 12, // Portland
//  style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json", // YES
    style: 'https://api.maptiler.com/maps/hybrid/style.json?key=xd89AQeIL88tBv6PUuRH',
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
                'line-color': '#f00',
                'line-width': 1,
            }
    });

    map.on('mousemove', (e) => {
        document.getElementById('info').innerHTML =
            // e.point is the x, y coordinates of the mousemove event relative
            // to the top-left corner of the map
            `${JSON.stringify(e.point)}
             <br />${
              'Zoom: ' + map.getZoom()}
             <br />${
                // e.lngLat is the longitude, latitude geographical position of the event
                JSON.stringify(e.lngLat.wrap())}`;
    });

  });
```

<div id="mycontainer">
  <div id="map"></div>
  <div id="info"></div>
</div>
<style>
    #mycontainer {
        position: relative;
    }
    #map {
        height: 400px;
    }
    #info {
        display: block;
        position: absolute;
        top: 20px;
        left: 50%;
        transform: translate(-50%);
        width: 50%;
        padding: 10px;
        border: none;
        border-radius: 3px;
        font-size: 12px;
        text-align: center;
        color: #222;
        background: #fff;
    }
</style>
