FROM centos

ENV JAVA_RPM=jdk-7u79-linux-x64.rpm \
	WLS_PKG=wls1036_generic.jar \
	WLS_SILENT_XML=silent.xml \
	TMP_DIR=/tmp/wl-install \
	BEA_HOME=/opt/oracle/Middleware \
	JAVA_HOME=/usr/java/default \
	JAVA_OPTIONS="-Djava.security.egd=file:/dev/./urandom -Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.nodemanager.sslHostNameVerificationEnabled=false"
ENV WL_HOME=$BEA_HOME/wlserver_10.3
ENV NM_HOME=$WL_HOME/common/nodemanager
ENV PATH=$PATH:$WL_HOME/common/bin:$WL_HOME/server/bin

# Copy packages
COPY $JAVA_RPM $WLS_PKG $WLS_SILENT_XML $TMP_DIR/

WORKDIR $TMP_DIR

# Install JDK
RUN rpm -i $JAVA_RPM

# Install Weblogic
RUN java -jar $WLS_PKG -mode=silent -log_priority=debug -silent_xml=./$WLS_SILENT_XML

WORKDIR /

#Cleanup
RUN rm -rf $TMP_DIR

ENTRYPOINT "/bin/bash"