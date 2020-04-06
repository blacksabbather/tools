payKey=`/usr/bin/curl https://svcs.sandbox.paypal.com/AdaptivePayments/Pay \
  -s \
  --insecure \
  -H "X-PAYPAL-SECURITY-USERID: sb-typ8v15519_api1.business.example.com" \
  -H "X-PAYPAL-SECURITY-PASSWORD: PHWYRCFEUNRUWQWM" \
  -H "X-PAYPAL-SECURITY-SIGNATURE: A8iHridokODAOI7h2cIy.B4KWYROATOxwKKfowLJLXvlpOtm0cNuCNt9" \
  -H "X-PAYPAL-REQUEST-DATA-FORMAT: JSON" \
  -H "X-PAYPAL-RESPONSE-DATA-FORMAT: JSON" \
  -H "X-PAYPAL-APPLICATION-ID: APP-80W284485P519543T" \
  -d '{
  "actionType": "PAY",
  "currencyCode": "USD",
  "receiverList": {
    "receiver": [
	{
	      "amount": "2.00",
	      "email": "jay_wong-customer@me.com"
        }
    ]
  },
  "returnUrl": "https://example.com/success.html",
  "cancelUrl": "https://example.com/failure.html",
  "requestEnvelope": {
    "errorLanguage": "en_US",
    "detailLevel": "ReturnAll"
  }
}'|jq ".payKey"| sed -e 's/^"//' -e 's/"$//'`
echo "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_ap-payment&paykey=$payKey"
