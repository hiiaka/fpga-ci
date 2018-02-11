# ===========================================================================================
# Dockerfile for a development environment for Xilinx's FPGA
# ===========================================================================================

FROM tethys/build-yocto

USER root

# Vivado version
ARG VIV_NAME="Xilinx_Vivado_SDK"
ARG VIV_MAIN_VER="2017.4"
ARG VIV_REV_VER="1216_1"
ARG VIV_DIR=${VIV_NAME}_${VIV_MAIN_VER}_${VIV_REV_VER}
ARG VIVADO=${VIV_NAME}_${VIV_MAIN_VER}_${VIV_REV_VER}.tar.gz

# Copy files
ADD ${VIVADO} /tmp/
ADD install_config.txt /tmp/

# Install the following utilities (required later)
RUN apt-get -y install curl nano vim libsdl1.2-dev xterm

# Install Vivado
RUN /tmp/${VIV_DIR}/xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /tmp/install_config.txt 

# Define container entry point
ENTRYPOINT ["/bin/bash"]

# Expose sshd port
EXPOSE 22

# EOF

