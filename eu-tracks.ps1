echo "Diff"
.\osmconvert ..\europe-ref.o5m ..\europe-latest.osm.pbf --diff -o="..\eu-changes.o5c"
echo "Filter tracks"
.\osmfilter.exe --parameter-file=filterpars-tracks.txt "..\eu-changes.o5c" -o="..\eu-changes-tracks.osm"
echo "Convert to Geojson"
.\bin\ogr2ogr.exe -f GeoJSON "..\eu-changes-tracks.geojson" "..\eu-changes-tracks.osm" lines
