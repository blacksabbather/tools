token=$1
disputeID=$2
curl -X post https://api.sandbox.paypal.com/v1/customer/disputes/$disputeID/escalate \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" \
-d '{
	"note": "Escalating to PayPal claim for resolution."
}'| jq
