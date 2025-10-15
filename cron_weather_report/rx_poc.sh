city=casablanca

# Request temperature data for the city
curl -s wttr.in/$city?T --output weather_report 

# To extract the current temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.'| grep -Eo -e '-?[[:digit:]].*')
echo "The current Temperature of $city: $obs_temp"

# To extract temperature at noon
fc_temp=$(curl -s wttr.in/$city?T | head -n 23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*')
echo "The forcasted temperature at noon of $city: $fc_temp" 