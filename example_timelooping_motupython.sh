#!/bin/bash

# -------------------------------------------------------------------------------
# This example shows a time-looping method to download data from Mercator Forecast PHY Ocean Model 
# It can be used for any other data available in CMEMS: 
# http://marine.copernicus.eu/services-portfolio/access-to-products/
# More information at: 
# http://marine.copernicus.eu/faq/what-are-the-motu-and-python-requirements/
# https://github.com/clstoulouse/motu-client-python
# -------------------------------------------------------------------------------

# Define your CMEMS Login credentials
CMEMS_USERNAME="userid"
CMEMS_PWD="password"

# Define your output directory where daily .nc files will be saved. Choose also a file name.
OUTPUT_DIR="/your/output/directory"


# Initiate loop to download data based on daily outputs

startdate=20211101
enddate=20220530

d=
n=0

until [ "$d" = "$enddate" ]
do

((n++))
d=$(date -d "$startdate + $n days" +%Y-%m-%d)
ti=''$d' 00:30:00'
tf=''$d' 23:30:00'
tname=''$d'.nc'
echo $ti

python -m motuclient --motu https://nrt.cmems-du.eu/motu-web/Motu --service-id GLOBAL_ANALYSIS_FORECAST_PHY_001_024-TDS --product-id cmems_mod_glo_phy_anfc_merged-uv_PT1H-i --longitude-min -50 --longitude-max 15 --latitude-min -15 --latitude-max 15 --date-min $ti --date-max $tf --depth-min 0.494 --depth-max 0.4941 --variable uo --variable utide --variable utotal --variable vo --variable vsdx --variable vsdy --variable vtide --variable vtotal --out-dir $OUTPUT_DIR --out-name $tname --user ivalles --pwd 3cants3roses

done                                                                                                                                              
