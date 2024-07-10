# framework-map

How to put a satellite image on MapLibre in Observable Framework

## satellite image processing

* [GeoTIFF](https://www.earthdata.nasa.gov/esdis/esco/standards-and-practices/geotiff)
  * demo source downloaded from Google Earth Engine: vt.tif -- from Qian (Penny) Yin's Masters project
* [GDAL](https://gdal.org/index.html) (rhymes with "noodle")
* [conda-forge install](https://anaconda.org/conda-forge/gdal)
* data-processing pipeline (see the Makefile)
  * `gdalinfo data/vt.tif` 
  * `gdalwarp -t_srs EPSG:3857 -r near vt.tif webmap.tif


## vector on a map

* GeoJSON -- https://ds5010.github.io/broadband-4/

## raster on a map

* raster tiles -- https://pbogden.github.io/colorado/
