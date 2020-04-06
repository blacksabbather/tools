TOKEN=$1 
curl https://api-3t.sandbox.paypal.com/nvp \
  -d USER=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=CreateRecurringPaymentsProfile \
  -d VERSION=204 \
  -d TOKEN=$TOKEN \
  -d PROFILESTARTDATE=2020-01-17T00:00:00Z \
  -d DESC=FitnessMembership \
  -d BILLINGPERIOD=Day \
  -d BILLINGFREQUENCY=1 \
  -d AMT=1032 \
  -d MAXFAILEDPAYMENTS=3
