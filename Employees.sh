#!/bin/bash

# Prompt the user for employee information
read -p "Enter employee name: " name
read -p "Enter hours worked: " hours_worked
read -p "Enter rate per hour: " rate_per_hour

# Calculate basic pay
basic_pay=$(echo "$hours_worked * $rate_per_hour")

# Calculate tax based on basic pay (assuming simple tax brackets)
if [ $(echo "$basic_pay < 15000") ]; then
  # No tax for basic pay less than 15000
  tax=0
elif [ $(echo "$basic_pay <= 70000") ]; then
  # 15% tax for basic pay between 15000 and 70000
  tax=$(echo "0.15 * $basic_pay")
else
  # 25% tax for basic pay above 70000
  tax=$(echo "0.25 * $basic_pay")
fi

# Calculate net pay
net_pay=$(echo "$basic_pay - $tax")

# Display results
echo "Employee Name: $name"
echo "Basic Pay: Ksh$basic_pay"  # Use $$ for displaying currency symbol
echo "Tax: Ksh$tax"
echo "Net Pay: Ksh$net_pay"
