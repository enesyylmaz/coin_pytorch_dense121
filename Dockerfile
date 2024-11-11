FROM pytorch/torchserve

COPY model_store/dense121_aug.mar /home/model-server/model-store/

RUN echo "enable_envvars_config=true" >> /home/model-server/config/config.properties

ENV TS_DISABLE_TOKEN_AUTHORIZATION=true

CMD ["torchserve", "--start", "--ncs", "--model-store", "/home/model-server/model-store", "--models", "dense121_aug.mar"]
