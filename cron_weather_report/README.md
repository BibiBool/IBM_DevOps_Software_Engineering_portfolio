# Weather Forecast Accuracy Monitoring System

## Project Overview

This project implements an automated system to monitor and evaluate the accuracy of weather forecasts for a city, in our case Casablanca, Morocco. The system collects daily weather dataat noon, compares forecasted temperatures with actual temperatures, and generates a simple statistical analysis of forecast accuracy over the last seven days.

## Features

- Daily weather data collection for Casablanca
- Automated comparison of forecasted vs. actual temperatures
- Forecast accuracy classification (excellent, good, fair, poor)
- Weekly statistical analysis of forecast accuracy
- Historical data logging and tracking

## Components

### 1. Weather Data Collection (`rx_poc.sh`)

- Fetches current weather data from wttr.in
- Records current temperature and tomorrow's forecasted temperature
- Logs data with timestamp in a structured format

### 2. Forecast Accuracy Analysis (`fc_accuracy.sh`)

- Compares yesterday's forecast with today's actual temperature
- Calculates the forecast accuracy deviation
- Classifies accuracy into categories:
  - Excellent: ±1°C deviation
  - Good: ±2°C deviation
  - Fair: ±3°C deviation
  - Poor: > ±3°C deviation
- Logs results to historical accuracy database

### 3. Weekly Statistics (`weekly_stats.sh`)

- Analyzes the last 7 days of forecast accuracy
- Calculates and provide minimum and maximum absolute forecasting errors

## Data Storage

- `rx_poc.log`: Raw weather data logs
- `historical_fc_accuracy.tsv`: Processed accuracy analysis
- `synthetic_historical_fc_accuracy.tsv`: Generated data for testing

## Implementation

The system uses shell scripting and cron jobs to:

1. Collect daily weather data at specified intervals
2. Process and analyze forecast accuracy
3. Generate statistical reports
4. Maintain historical records

## Technologies Used

- Bash scripting
- cron job scheduling
- wttr.in weather API
- Text processing utilities (grep, cut, tail, etc.)

## Possible Future Enhancements

- Support for multiple cities
- Advanced statistical analysis
- Data visualization
- API integration for weather data
- Web interface for viewing reports
