BAID=$1
curl https://api-3t.sandbox.paypal.com/nvp \
  -d User=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=DoReferenceTransaction \
  -d VERSION=204 \
  -d AMT=14.00 \
  -d PAYMENTACTION=SALE \
  -d REFERENCEID=$BAID \
  -d cancelUrl=https://example.com/cancel \
  -d returnUrl=https://example.com/success | sed 's/&/\n/g'
