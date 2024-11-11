FROM pytorch/torchserve

COPY model_store/dense121_aug.mar /home/model-server/model-store/

COPY config.properties /home/model-server/

ENV TS_DISABLE_TOKEN_AUTHORIZATION=true

CMD ["torchserve", "--start", "--ncs", "--model-store", "/home/model-server/model-store", "--models", "dense121_aug.mar"]
