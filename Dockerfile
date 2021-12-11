FROM martenseemann/quic-network-simulator-endpoint:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y git-core libssl-dev python3-dev python3-pip
RUN git clone https://github.com/attilio-oliva/scapy-quic && cd /scapy-quic
WORKDIR /scapy-quic
RUN pip3 install -r requirements.txt

ADD run_endpoint.sh .
RUN chmod +x run_endpoint.sh

ENTRYPOINT [ "./run_endpoint.sh" ]
