png:
#	gdalinfo data/vt.tif  # transverse mercator
	gdalwarp -t_srs EPSG:3857 -r near data/vt.tif data/webmap.tif
	gdalinfo -json data/webmap.tif # `wgs84Extent` has corner coordinates in decimal degrees
	gdal_translate data/webmap.tif data/webmap.png

# Demo: https://observablehq.com/@pbogden/vermont-tiles
tiles:
	gdal2tiles.py data/webmap.tif docs/webmap # this produces TMS tiles -- set scheme to "tms" for MapLibre
#	gdal2tile#.py --xyz data/webmap.tif docs/webmap # this crashes -- MapLibre should support the output by default
#	gdal_translate data/webmap.tif data/webmap.mbtiles -of MBTILES # requires a special server
