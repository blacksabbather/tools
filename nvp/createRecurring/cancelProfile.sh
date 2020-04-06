PROFILEID=$1 
curl https://api-3t.sandbox.paypal.com/nvp \
  -d USER=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=ManageRecurringPaymentsProfileStatus \
  -d VERSION=204 \
  -d PROFILEID=$PROFILEID \
  -d ACTION=CANCEL
