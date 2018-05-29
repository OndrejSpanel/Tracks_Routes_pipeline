[string]$prefix=$args[0]
$base = "..\$prefix"
$pbf = "$base.osm.pbf"
$o5m = "$base.o5m"
echo "Processing $pbf"
echo "Adding tags"
.\osmconvert64.exe --parameter-file=modifypars.txt "$pbf" -o="$o5m"
echo " tracks"
.\osmfilter.exe --parameter-file=filterpars-tracks.txt "$o5m" -o="$base-tracks.osm"

$env:OSM_CONFIG_FILE="./osmconf.ini"

echo "Extracting layers"
.\bin\ogr2ogr.exe -f GeoJSON "$base-tracks.geojson" "$base-tracks.osm" lines
