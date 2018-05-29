echo "Diff"
.\osmconvert ..\czech-republic-ref.o5m ..\czech-republic-latest.osm.pbf --diff -o="..\cz-changes.o5c"
echo "Filter tracks"
.\osmfilter.exe --parameter-file=filterpars-tracks.txt "..\cz-changes.o5c" -o="..\cz-changes-tracks.osm"
echo "Convert to Geojson"
.\bin\ogr2ogr.exe -f GeoJSON "..\cz-changes-tracks.geojson" "..\cz-changes-tracks.osm" lines
