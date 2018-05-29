[string]$prefix=$args[0]
$base = "..\$prefix"
echo "Processing $pbf"
echo "Adding tags"
.\osmconvert64.exe --parameter-file=modifypars.txt "$base.osm.pbf" -o="$base.o5m"
echo "Filtering"
echo " routes"
.\osmfilter.exe --parameter-file=filterpars.txt "$base.o5m" -o="$base-relations.osm"
echo " power"
.\osmfilter.exe --parameter-file=filterpars-power.txt "$base.o5m" -o="$base-power.osm"
echo " tourism"
.\osmfilter.exe --parameter-file=filterpars-bus.txt "$base.o5m" -o="$base-bus-stops.osm"

$env:OSM_CONFIG_FILE="./osmconf.ini"

echo "Extracting layers"
.\bin\ogr2ogr.exe -f GeoJSON "$base-relations.geojson" "$base-relations.osm" multilinestrings
.\bin\ogr2ogr.exe -f GeoJSON "$base-relation-points.geojson" "$base-relations.osm" points
.\bin\ogr2ogr.exe -f GeoJSON "$base-power-ways.geojson" "$base-power.osm" lines
.\bin\ogr2ogr.exe -f GeoJSON "$base-bus-stops.geojson" "$base-bus-stops.osm" points
