FROM eklementev/build-image-gcc

RUN apt-get update
RUN apt-get install -y -q  \
      wget 

RUN wget https://github.com/danmar/cppcheck/archive/2.3.tar.gz && tar -xvzf 2.3.tar.gz && rm 2.3.tar.gz

RUN cd cppcheck-2.3 && mkdir build && cd build && cmake -DUSE_MATCHCOMPILER=ON .. && cmake --build . 
RUN mkdir /cppcheck && cp /cppcheck-2.3/build/bin/cppcheck /cppcheck/cppcheck && cp -r /cppcheck-2.3/cfg/ /cppcheck/cfg/ && rm -r cppcheck-2.3
