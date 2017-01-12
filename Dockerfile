FROM node:6.7.0

RUN apt-get update && apt-get install -y bc
RUN npm install -g podigg-lc
ADD bin/performance.sh /bin/performance.sh
ADD bin/memusg /bin/memusg
RUN chmod a+x /bin/memusg

CMD cd /bin && ./performance.sh
