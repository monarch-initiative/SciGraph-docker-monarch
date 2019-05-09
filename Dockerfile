FROM maven:3.6.0-jdk-8-slim

VOLUME /data
WORKDIR /scigraph

RUN apt-get -y update && apt-get install -y git xvfb libxrender1 libxi6 libxtst6

# Avoid java.awt.AWTError: Assistive Technology not found: org.GNOME.Accessibility.AtkWrapper
# https://askubuntu.com/a/723503
RUN sed -i -e '/^assistive_technologies=/s/^/#/' /etc/java-8-openjdk/accessibility.properties

# Clone and build
RUN git clone https://github.com/SciGraph/SciGraph.git /scigraph

ADD ./scripts /scigraph/

# Directory for configuration files
RUN mkdir -p /scigraph/conf

# Build scigraph
RUN cd /scigraph && mvn install -DskipTests -DskipITs

ENV PATH="/scigraph/scripts/:$PATH"

ENTRYPOINT ["/bin/sh"]
