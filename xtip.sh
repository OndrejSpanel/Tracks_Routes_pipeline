base=../Map/$1
./ltip.sh $base/power-ways
./ltip.sh $base/other-lines
./ltipx.sh $base/poi.mbtiles $base/poi.geojson $base/poi-poly.geojson $base/poi-line.geojson -l poi
./ltip.sh $base/relations
