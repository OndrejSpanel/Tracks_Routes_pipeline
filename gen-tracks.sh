echo "Diff"
base="../Map/$1"
../bin/osmconvert $base-ref.o5m $base-curr.osm.pbf --diff -o="$base-changes.o5c"
echo "Filter tracks"
../bin/osmfilter --parameter-file=filterpars-tracks.txt "$base-changes.o5c" -o="$base-changes-tracks.osm"
echo "Convert to Geojson"
ogr2ogr -f GeoJSON "$base-changes-tracks.geojson" "$base-changes-tracks.osm" lines
./ltip.sh "$base-changes-tracks"