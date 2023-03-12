FROM ubuntu:18.04

WORKDIR /app

# Inital Liberaries
RUN apt-get -y update
RUN apt-get install -y libgmp-dev build-essential flex bison git curl python3-pip
#-------------------------------------------------------------------------------


# Install PBC
RUN curl -L https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz | tar zxv
#RUN cd pbc-0.5.14 && sh ./setup
RUN cd pbc-0.5.14 && ./configure --prefix=/usr --enable-shared
RUN cd pbc-0.5.14 && make && make install && ldconfig
#-------------------------------------------------------------------------------

# Install PyPBC
RUN git clone --depth 1 https://github.com/debatem1/pypbc.git
RUN cd pypbc &&  pip3 install .

WORKDIR /app/dev


CMD python3 index.py

