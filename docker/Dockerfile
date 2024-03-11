
FROM debian:bookworm-slim AS build_sdk_android


COPY 01_nodoc /etc/dpkg/dpkg.cfg.d/

RUN apt update && apt upgrade -y          && \
    apt install -y openjdk-17-jdk unzip libpulse0 x11-apps \
                   cpu-checker
#qemu-ssystem
#cpu-checker


RUN mkdir -p /root/Android/Sdk

ENV ANDROID_SDK_ROOT=/root/Android/Sdk
ENV ANDROID_HOME=$ANDROID_SDK_ROOT

#wget https://dl.google.com/android/repository/commandlinetools-mac-6858069_latest.zip -O $ANDROID_SDK_ROOT/clt.zip
#     https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip
#unzip -qq $ANDROID_SDK_ROOT/clt.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools
COPY commandlinetools-linux-11076708_latest.zip /root/Android

RUN cd /root/Android && unzip -qq commandlinetools-linux-11076708_latest.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools

RUN mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/tools
ENV PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin"



#RUN cd /root/Android/cmdline-tools && \
#    ln -s bin/ Sdk

RUN     yes | sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --licenses && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} "platform-tools" "platforms;android-33" && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "ndk;21.3.6528147" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "ndk;26.2.11394342" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "cmake;3.22.1" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "emulator" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "build-tools;33.0.0" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "platform-tools" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install "system-images;android-33;google_apis;x86_64" --channel=0 && \
        sdkmanager --sdk_root=${ANDROID_SDK_ROOT} --install  "extras;google;instantapps" --channel=0

ENV PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools:$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT:$ANDROID_HOME/bin"


#RUN avdmanager -v create avd -n android-image -k "system-images;android-33;google_apis;x86_64" -d "28"

#    export ANDROID_SDK_ROOT=$(pwd)/Sdk  && \
#    export ANDROID_HOME=$ANDROID_SDK_ROOT


#/root/cmdline-tools


