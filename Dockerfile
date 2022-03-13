FROM ubuntu:18.04

RUN set -x 
RUN apt update -y -qq 

RUN        apt-get upgrade -y -qq --no-install-recommends 
RUN        apt-get install -y -qq build-essential 
# RUN        apt-get install -y gdb 
RUN        apt-get install -y gcc-multilib 
# RUN        apt-get install -y gdb-multiarch 
RUN        apt-get install -y tmux 
RUN        apt-get install -y qemu
RUN         apt-get install -y git
RUN         apt-get install -y sudo
# Amendment for Qemu
RUN apt-get update && apt-get -y upgrade
RUN apt-get --no-install-recommends -y install iproute2 \
        jq \
        python3 \
        qemu-system-x86 \
        udhcpd \
    && apt-get clean

COPY generate-dhcpd-conf /run/
COPY qemu-ifdown /run/
COPY qemu-ifup /run/
COPY run.sh /run
VOLUME /image

ENTRYPOINT ["/run/run.sh"]
# Amendment for Qemu
RUN git config --global core.autocrlf false

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install -y gdb
RUN apt-get install -y expect
RUN apt-get install -y gawk

RUN adduser xv6user
RUN echo xv6user:new_password | chpasswd
RUN usermod -aG sudo xv6user
USER xv6user
WORKDIR /home/xv6user/xv6/
RUN chdir /home/xv6user/xv6/
RUN git clone git://github.com/mit-pdos/xv6-riscv.git
RUN git config --global core.autocrlf true
RUN chmod 777 -R /workspaces


# CMD ["/bin/bash"]