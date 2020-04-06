token=$1
#/usr/bin/curl -X GET 'https://api.sandbox.paypal.com/v1/reporting/transactions' \
/usr/bin/curl -X GET 'https://api.sandbox.paypal.com/v1/reporting/transactions?start_date=2020-03-06T00:00:00-0700&end_date=2020-03-07T23:59:59-0700&fields=all&page_size=100&page=1' \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" 
