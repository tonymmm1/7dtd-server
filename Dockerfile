FROM ubuntu:18.04
COPY ./scripts/setup.sh .
COPY ./scripts/start.sh .
RUN chmod +x setup.sh && chmod +x start.sh && ./setup.sh
ENV instance_name instance1
CMD 7dtd.sh start "$instance_name" && tail -f /dev/null

