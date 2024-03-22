
FROM debian:bookworm-slim AS build_sdk_android

COPY 01_nodoc /etc/dpkg/dpkg.cfg.d/

# cpu-checker : pour kvm-ok
# iproute2 et net-tools : pour ss et netstat
RUN apt update && apt upgrade -y          && \
    apt install -y openjdk-17-jdk unzip libpulse0 x11-apps wget \
                   cpu-checker \
                   tcpdump tshark iproute2 net-tools \
                   netcat-openbsd
#qemu-ssystem
#RUN apt install -y virt-manager qemu qemu-utils qemu-system-86 qemu-system-gui

RUN mkdir -p /root/Android/Sdk

ENV ANDROID_SDK_ROOT=/root/Android/Sdk
ENV ANDROID_HOME=$ANDROID_SDK_ROOT

ENV ANDROID_COMMAND_LINTE_TOOLS=commandlinetools-linux-11076708_latest.zip

# TODO : transformer le COPY en wget
RUN wget https://dl.google.com/android/repository/${ANDROID_COMMAND_LINTE_TOOLS} -O /root/Android/${ANDROID_COMMAND_LINTE_TOOLS} && \
     cd /root/Android && unzip -qq ${ANDROID_COMMAND_LINTE_TOOLS} -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
     rm /root/Android/${ANDROID_COMMAND_LINTE_TOOLS}

RUN mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/tools
ENV PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin"

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


