png:
	gdalinfo data/vt.tif  # transverse mercator
#	gdalwarp -t_srs EPSG:3857 -r near vt.tif webmap.tif
#	gdalinfo -json webmap.tif # `wgs84Extent` has corner coordinates in decimal degrees
#	gdal_translate webmap.tif webmap.png

tiles:
#	-rm -rf vt
#	gdal2tiles.py webmap.tif -- this produces TMS -- Looks like MapLibre doesn't support it
#	gdal2tiles.py -xyz webmap.tif -- this crashes -- in principle MapLibre should support the output

experiment:
	gdal_translate vt.tif vt.mbtiles
