FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        bwa \
        samtools \
        wget \
        unzip \
        default-jre \
        python

RUN mkdir WGStoolsDir
RUN mkdir WGSWorkingDir
WORKDIR WGStoolsDir

RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip && \
    unzip fastqc_v0.12.1.zip && \
    rm fastqc_v0.12.1.zip && \
    wget -O picard.jar "https://github.com/broadinstitute/picard/releases/download/2.26.5/picard.jar" && \
    wget https://github.com/broadinstitute/gatk/releases/download/4.4.0.0/gatk-4.4.0.0.zip && \
    unzip gatk-4.4.0.0.zip && rm gatk-4.4.0.0.zip && \
    wget http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz && \
    tar -xvzf annovar.latest.tar.gz && \
    rm annovar.latest.tar.gz && \
    mv FastQC /opt/fastqc && \
    ln -s /opt/fastqc/fastqc /usr/local/bin/fastqc \
    mv gatk-4.4.0.0 /opt/gatk && \
    ln -s /opt/gatk/gatk /usr/local/bin/gatk && \
    ln -s /opt/picard.jar /usr/local/bin/picard.jar


# You can specify a default command or entrypoint if needed
CMD ["bash"]
