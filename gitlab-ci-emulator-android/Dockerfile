FROM ubuntu:18.04
LABEL maintainer="Christian Ohrfandl"

# Set environment (available in image and container)
ENV ANDROID_HOME /opt/android
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator

# Add emulator start scripts and make them executable
ADD start-default-emulator.sh /opt
ADD start-default-emulator-headless.sh /opt
ADD start-default-emulator-headless-noaccel.sh /opt
RUN chmod a+x /opt/start-default-emulator.sh
RUN chmod a+x /opt/start-default-emulator-headless.sh
RUN chmod a+x /opt/start-default-emulator-headless-noaccel.sh

# Set timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Vienna /etc/localtime

# Misc. config
RUN mkdir /opt/android
RUN mkdir /root/.android
RUN echo "" > /root/.android/repositories.cfg

# Update system and install needed applications
RUN apt update
RUN apt install openjdk-8-jdk wget unzip git curl -y

# Download SDK
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -qO android-sdk.zip
RUN unzip android-sdk.zip -d /opt/android
RUN rm android-sdk.zip

# Download SDK files
RUN echo "y" | sdkmanager "tools"
RUN echo "y" | sdkmanager "platform-tools"
RUN echo "y" | sdkmanager "build-tools;29.0.2"
RUN echo "y" | sdkmanager "extras;android;m2repository"
RUN echo "y" | sdkmanager "extras;google;m2repository"
RUN echo "y" | sdkmanager "emulator"
RUN echo "y" | sdkmanager "platforms;android-28"
RUN echo "y" | sdkmanager "system-images;android-28;google_apis;x86"
RUN echo "y" | sdkmanager --update

# Create emulator
RUN echo "no" | avdmanager create avd -n default -k "system-images;android-28;google_apis;x86" -c 100M -d 17

# Remove unnecessary files
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
