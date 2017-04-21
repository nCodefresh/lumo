FROM ncodefresh/lumo-pre:latest

RUN mkdir -p /out

#RUN git clone https://github.com/anmonteiro/lumo.git /out \

WORKDIR /out

COPY package.json /out
COPY yarn.lock /out

RUN yarn install

COPY . /out

RUN boot release-ci && ls | grep -v tmp | xargs rm -rf

CMD [ "/bin/bash" ]
