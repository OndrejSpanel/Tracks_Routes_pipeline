# xprocess.sh should be run before running this to create data.o5m file
base="../Map/$1"
echo "Filter tracks"
../bin/osmfilter --parameter-file=filterpars-tracks.txt "$base/data.o5m" -o="$base/all-tracks.osm"

echo "Convert to Geojson"
export OSM_CONFIG_FILE="./osmconf.ini"
rm "$base/all-tracks.geojson"
ogr2ogr -f GeoJSON "$base/all-tracks.geojson" "$base/all-tracks.osm" lines
./ltip.sh "$base/all-tracks"