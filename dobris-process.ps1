echo "Adding tags"
.\osmconvert64.exe --parameter-file=modifypars.txt ..\dobris.osm.pbf -o="..\dobris.osm"
echo "Filtering"
.\osmfilter.exe --parameter-file=filterpars.txt ..\dobris.osm -o="..\dobris-relations.osm"
.\osmfilter.exe --parameter-file=filterpars-power.txt ..\dobris.osm -o="..\dobris-power.osm"
.\osmfilter.exe --parameter-file=filterpars-bus.txt ..\dobris.osm -o="..\dobris-bus-stops.osm"

$env:OSM_CONFIG_FILE="./osmconf.ini"

echo "Extracting layers"
.\bin\ogr2ogr.exe -f GeoJSON "..\cz-relations.geojson" "..\dobris-relations.osm" multilinestrings
.\bin\ogr2ogr.exe -f GeoJSON "..\cz-relation-points.geojson" "..\dobris-relations.osm" points
.\bin\ogr2ogr.exe -f GeoJSON "..\cz-power-ways.geojson" "..\dobris-power.osm" lines
.\bin\ogr2ogr.exe -f GeoJSON "..\cz-bus-stops.geojson" "..\dobris-bus-stops.osm" points
