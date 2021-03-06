# ===========================================================================================
# Dockerfile for a development environment for Xilinx's FPGA
# ===========================================================================================

FROM tethys/build-yocto

# Copy in the license file
RUN mkdir /home/build/.Xilinx
COPY Xilinx.lic /home/build/.Xilinx/

USER root

# Vivado version
ARG VIV_NAME="Xilinx_Vivado_SDK"
ARG VIV_MAIN_VER="2018.1"
ARG VIV_REV_VER="0405_1"
ARG VIV_DIR=${VIV_NAME}_${VIV_MAIN_VER}_${VIV_REV_VER}
ARG VIVADO=${VIV_NAME}_${VIV_MAIN_VER}_${VIV_REV_VER}.tar.gz

# Copy files
ADD ${VIVADO} /tmp/
ADD install_config.txt /tmp/

# Install the following utilities (required later)
RUN apt-get -y install curl nano vim libsdl1.2-dev xterm

# Install Vivado
RUN /tmp/${VIV_DIR}/xsetup --agree XilinxEULA,3rdPartyEULA,WebTalkTerms --batch Install --config /tmp/install_config.txt && rm -r /tmp/${VIV_DIR}
RUN echo "source /opt/Xilinx/Vivado/${VIV_MAIN_VER}/settings64.sh" >> /home/build/.bashrc

# Get Digilent board files
RUN git clone https://github.com/Digilent/vivado-boards && \
    cp -r vivado-boards/new/board_files/arty-z7-20/ \
          vivado-boards/new/board_files/zybo \
          vivado-boards/new/board_files/zybo-z7-20 \
          /opt/Xilinx/Vivado/${VIV_MAIN_VER}/data/boards/board_files && \
    rm -r vivado-boards

# Define container entry point
ENTRYPOINT ["/bin/bash"]

# Expose sshd port
EXPOSE 22

# EOF

