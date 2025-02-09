#!/bin/bash

# Database credentials (environment variables are recommended)
DB_HOST="${DB_HOST:-127.0.0.1}"  # Default to 127.0.0.1 if not set
DB_PORT="${DB_PORT:-4000}"      # Default to 4000 if not set
DB_USER="${DB_USER:-root}"      # Default to root if not set
DB_NAME="${DB_NAME:-UniversityDB}"      # Default to root if not set

# Function to execute SQL queries and handle errors
execute_sql() {
  mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -D "$DB_NAME" -e "$1"
  if [[ $? -ne 0 ]]; then
    echo "Error executing SQL: $1"
    exit 1
  fi
}

# Check the number of remaining records (should be 2)
record_count=$(execute_sql "SELECT COUNT(*) FROM Students;" | tail -n 1)
if [[ "$record_count" -eq 2 ]]; then
  echo "Record count validation passed: 2 records found."
else
  echo "Record count validation FAILED: Expected 2 records, found $record_count."
  exit 1  # Or you can choose to continue with other validations
fi

# Verify Alice's data
alice_data=$(execute_sql "SELECT FirstName, LastName, Email FROM Students WHERE FirstName = 'Alice';" | tail -n 1)
expected_alice_data="Alice	Smith	alice.smith@example.com"  # Tab-separated values
if [[ "$alice_data" == "$expected_alice_data" ]]; then
  echo "Alice's data validation passed."
else
  echo "Alice's data validation FAILED. Expected: '$expected_alice_data', Found: '$alice_data'"
  exit 1
fi


# Verify Bob's updated email
bob_email=$(execute_sql "SELECT Email FROM Students WHERE FirstName = 'Bob';" | tail -n 1)
if [[ "$bob_email" == "bob.j@example.com" ]]; then
  echo "Bob's email validation passed."
else
  echo "Bob's email validation FAILED. Expected: 'bob.j@example.com', Found: '$bob_email'"
  exit 1
fi

echo "All validations passed successfully!"

exit 0