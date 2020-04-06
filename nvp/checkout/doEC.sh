TOKEN=$1
PAYERID=$2
curl https://api-3t.sandbox.paypal.com/nvp \
  -d User=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=DoExpressCheckoutPayment \
  -d VERSION=204 \
  -d AMT=80 \
  -d PAYMENTACTION=Sale \
  -d TOKEN=$TOKEN \
  -d PAYERID=$PAYERID |sed 's/&/\n/g'
