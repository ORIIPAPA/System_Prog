#!/bin/bash

# Scanning details
read -p "Enter CustomerID: " customer_id
read -p "Enter CustomerName: " customer_name
read -p "Enter unitsConsumed: " units_consumed

# Initialisation of my variables
total_bill=0

# Calculation of  bill based on units consumed
if [ "$units_consumed" -lt 200 ]; then
    total_bill=$(( units_consumed * 120 ))
elif [ "$units_consumed" -ge 200 ] && [ "$units_consumed" -lt 400 ]; then
    total_bill=$(( units_consumed * 150 ))
elif [ "$units_consumed" -ge 400 ] && [ "$units_consumed" -lt 600 ]; then
    total_bill=$(( units_consumed * 180 ))
else
    total_bill=$(( units_consumed * 200 ))
fi

# Displayment of total bill
echo "CustomerID: $customer_id"
echo "CustomerName: $customer_name"
echo "Units Consumed: $units_consumed"
echo "Total Bill: Ksh $total_bill"
