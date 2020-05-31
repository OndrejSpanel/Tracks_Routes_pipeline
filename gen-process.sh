base="../Map/$1"
echo $base
echo "Processing $base.osm.pbf"
mkdir $base
echo "Adding tags"
../bin/osmconvert64 --parameter-file=modifypars.txt "$base.osm.pbf" -o="$base/data.o5m"
echo "Filtering"
echo " routes"
../bin/osmfilter --parameter-file=filterpars.txt "$base/data.o5m" -o="$base/relations.osm"
echo " power"
../bin/osmfilter --parameter-file=filterpars-power.txt "$base/data.o5m" -o="$base/power.osm"
echo " other-lines"
../bin/osmfilter --parameter-file=filterpars-other-lines.txt "$base/data.o5m" -o="$base/other-lines.osm"
echo " tourism"
../bin/osmfilter --parameter-file=filterpars-poi.txt "$base/data.o5m" -o="$base/poi.osm"

export OSM_CONFIG_FILE="./osmconf.ini"

echo "Extracting layers"
rm "$base/relations.geojson"
ogr2ogr -f GeoJSON "$base/relations.geojson" "$base/relations.osm" multilinestrings
rm "$base/power-ways.geojson"
ogr2ogr -f GeoJSON "$base/power-ways.geojson" "$base/power.osm" lines
rm "$base/other-lines.geojson"
ogr2ogr -f GeoJSON "$base/other-lines.geojson" "$base/other-lines.osm" lines
rm "$base/poi.geojson"
ogr2ogr -f GeoJSON "$base/poi.geojson" "$base/poi.osm" points
rm "$base/poi-poly.geojson"
ogr2ogr -f GeoJSON "$base/poi-poly.geojson" "$base/poi.osm" multipolygons
rm "$base/poi-line.geojson"
ogr2ogr -f GeoJSON "$base/poi-line.geojson" "$base/poi.osm" lines
