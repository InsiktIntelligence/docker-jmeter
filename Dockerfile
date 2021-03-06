FROM openjdk:8-jre-slim

ADD src/jmeter-5.0_with_plugins.tar.gz /jmeter/app

ENV JMETER_BIN /jmeter/app/apache-jmeter-5.0/bin/jmeter.sh
RUN chmod +x ${JMETER_BIN}

COPY src/jmx-runner.sh /jmeter/
COPY src/analyze-xml.sh /jmeter/

RUN mkdir -p /output
WORKDIR /jmeter

CMD ["bash", "jmx-runner.sh"]