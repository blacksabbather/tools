token=$1
/usr/bin/curl -X POST https://api.sandbox.paypal.com/v1/payments/payment \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $token" \
-d '{
  "intent": "sale",
  "payer": {
    "payment_method": "paypal"
  },
  "application_context":{
	"landing_page":"billing"
  },
  "transactions": [
    {
      "amount": {
        "total": "30.11",
        "currency": "USD",
        "details": {
          "subtotal": "30.00",
          "tax": "0.07",
          "shipping": "0.03",
          "handling_fee": "1.00",
          "shipping_discount": "-1.00",
          "insurance": "0.01"
        }
      }
    }
  ],
  "note_to_payer": "Contact us for any questions on your order.",
  "redirect_urls": {
    "return_url": "http://10.225.227.151:8080/payment_successful",
    "cancel_url": "http://10.225.227.151:8080/payment_cancel"
  }
}'
