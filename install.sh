cd ..

sudo apt-get update

echo Install tippecanoe

sudo apt-get install build-essential libsqlite3-dev zlib1g-dev -y
git clone https://github.com/mapbox/tippecanoe
cd tippecanoe
make
cd ..

echo Install ogr2ogr / GDAL

sudo apt-get install gdal-bin -y


echo Install osmconvert + osmfilter

mkdir bin
cd bin
wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o osmfilter
wget http://m.m.i24.cc/osmconvert64
ln osmconvert64 osmconvert
chmod 0744 osmconvert
cd ..

echo Install osmium

sudo apt-get install osmium-tool -y

### Create data directory

`mkdir Map`

