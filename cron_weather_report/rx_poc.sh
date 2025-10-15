city=casablanca

# Request temperature data for the city
curl -s wttr.in/$city?T --output weather_report 

# To extract the current temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.'| grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"

# To extract temperature at noon
fc_temp=$(curl -s wttr.in/$city?T | head -n 23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forcasted temperature at noon of $city: $fc_temp" 

#Store current day, month, and year in variables
day=$(TZ='Morocco/Casablanca' date -u +%d)
month=$(TZ='Morocco/Casablanca' date -u +%m)
year=$(TZ='Morocco/Casablanca' date -u +%Y)

# Merge the fields to add them as a record in the log file
record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp C")
echo $record>> rx_poc.log
