#!/bin/bash

# -------------------------------------------------------------------------------
# This example shows a time-looping way to download data from Mercator Forecast PHY Ocean Model 
# It can be used for any other data available in CMEMS: 
# http://marine.copernicus.eu/services-portfolio/access-to-products/
# More information in: 
# http://marine.copernicus.eu/faq/what-are-the-motu-and-python-requirements/
# https://github.com/clstoulouse/motu-client-python
# -------------------------------------------------------------------------------

# Define your CMEMS Login credentials
CMEMS_USERNAME="userid"
CMEMS_PWD="password"

# Define your output directory where daily .nc files will be saved. Choose also a file name.
OUTPUT_DIR="/your/output/directory"
FILENAME="nest_"
IFS=''

# Initiate loop to download data based on daily outputs
for y in 2015 2016 2017
do
for m in  01 02 03 04 05 06 07 08 09 10 11 12
do
for d in  01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
do

# Defining individual filenames from source
ti=''$y'-'$m'-'$d' 12:00:00'
tf=''$y'-'$m'-'$d' 12:00:00'

# Define your output individual filename
tname=''$y''$m''$d'000000'

# Download Loop 
python /home/yourmotupythonfolder/motu-client-python-V16/motu-client.py --user $CMEMS_USERNAME --pwd $CMEMS_PWD...
--motu http://nrt.cmems-du.eu/motu-web/Motu --service-id GLOBAL_ANALYSIS_FORECAST_PHY_001_024-TDS...
--product-id global-analysis-forecast-phy-001-024...
--longitude-min -30 --longitude-max -5 --latitude-min 5 --latitude-max 44 --date-min $ti --date-max $tf...
--depth-min 0.493 --depth-max 109.7294 --variable thetao --variable so --variable uo --variable vo...
--out-dir $OUTPUT_DIR --out-name "$FILENAME"_"$tname".nc

echo $ti
done
done
done
                                                                                                                                                            
