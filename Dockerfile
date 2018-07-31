FROM elasticsearch:5.5.2

#RUN elasticsearch-plugin install lmenezes:elasticsearch-kopf:v2.1.2
RUN elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.5.2
COPY readonlyrest-1.16.11-pre5_es5.5.2.zip /
RUN elasticsearch-plugin install file:///readonlyrest-1.16.11-pre5_es5.5.2.zip && rm /readonlyrest-1.16.11-pre5_es5.5.2.zip

ENV BOOTSTRAP_MLOCKALL=false NODE_DATA=true NODE_MASTER=true JAVA_OPTS=-Djava.net.preferIPv4Stack=true

# pre-stop-hook.sh and dependencies
RUN apt-get update && apt-get install -y \
    jq \
    curl \
 && rm -rf /var/lib/apt/lists/*
COPY pre-stop-hook.sh /pre-stop-hook.sh

ADD elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
