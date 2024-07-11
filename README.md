# framework-map

How to put a satellite image on MapLibre in Observable Framework

## satellite image processing

* [GeoTIFF](https://www.earthdata.nasa.gov/esdis/esco/standards-and-practices/geotiff)
  * demo source downloaded from Google Earth Engine: vt.tif -- credit: Qian (Penny) Yin's Masters project
* [GDAL](https://gdal.org/index.html) (rhymes with "noodle")
* [conda-forge install](https://anaconda.org/conda-forge/gdal)

## pipeline

data-processing pipeline (see the Makefile)

* `gdalinfo data/vt.tif` # it's [transverse mercator](https://en.wikipedia.org/wiki/Transverse_Mercator_projection)
* `gdalwarp -t_srs EPSG:3857 -r near vt.tif webmap.tif` # converts to web mercator
* `gdalinfo -json webmap.tif` # provides corner coordinates in decimal degrees
* `gdal_translate webmap.tif webmap.png` # convert GeoTIFF to PNG (a web standard format)

## some demos

for data files < 50 MB

* GeoJSON -- https://ds5010.github.io/broadband-4/
* https://observablehq.com/@pbogden/vermont
* raster tiles -- https://pbogden.github.io/colorado/

## Framework

* [Framework](https://observablehq.com/framework/)
* [getting started](https://observablehq.com/framework/getting-started)

```
yarn create @observablehq
```

* [MapLibre GL](https://observablehq.observablehq.cloud/pangea/party/maplibre-gl#12/47.27574/11.39085/0/52) -- Fil demo
* [mcclare.blog](https://mclare.blog/posts/building-oss-map-apps-with-observable-framework/)
* [observable-framework-maps](https://github.com/bdon/observable-framework-maps) -- github
  * [demo](https://bdon.github.io/observable-framework-maps/)
