token=$1
/usr/bin/curl https://api.sandbox.paypal.com/v1/notifications/webhooks-events \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" 
