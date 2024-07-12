png:
#	gdalinfo data/vt.tif  # transverse mercator
	gdalwarp -t_srs EPSG:3857 -r near data/vt.tif data/webmap.tif
	gdalinfo -json data/webmap.tif # `wgs84Extent` has corner coordinates in decimal degrees
	gdal_translate data/webmap.tif data/webmap.png

tiles:
	-rm -rf docs/webmap
	gdal2tiles.py data/webmap.tif docs # this produces TMS tiles -- set scheme to "tms" for MapLibre
#	gdal2tile#.py --xyz data/webmap.tif # this crashes -- in principle MapLibre should support the output
#	gdal_translate data/webmap.tif data/webmap.mbtiles -of MBTILES
