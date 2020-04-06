ORDER=$1
curl https://api-3t.sandbox.paypal.com/nvp \
  -d User=jay_wong-sellercn_api1.me.com \
  -d PWD=REHEFEM88Y4HXG9Y \
  -d SIGNATURE=Aeyfrd2qh4o90InMoav7DxUO4HVOAQ619yX4nJXBuDGj0nPTTKlZcf3E \
  -d METHOD=DoAuthorization \
  -d VERSION=204 \
  -d AMT=8 \
  -d TRANSACTIONID=$ORDER \
  -d COMPLETETYPE=NotComplete 
#| perl -ne 'print $1."\n" if(/TRANSACTIONID=(\S+?)&/);'
