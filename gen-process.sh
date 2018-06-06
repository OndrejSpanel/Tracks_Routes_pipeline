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
echo " tourism"
../bin/osmfilter --parameter-file=filterpars-poi.txt "$base/data.o5m" -o="$base/poi.osm"

export OSM_CONFIG_FILE="./osmconf.ini"

echo "Extracting layers"
ogr2ogr -f GeoJSON "$base/relations.geojson" "$base/relations.osm" multilinestrings
ogr2ogr -f GeoJSON "$base/power-ways.geojson" "$base/power.osm" lines
ogr2ogr -f GeoJSON "$base/poi.geojson" "$base/poi.osm" points
