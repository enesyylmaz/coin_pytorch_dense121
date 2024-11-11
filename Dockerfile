FROM pytorch/torchserve

COPY model_store/dense121_aug.mar /home/model-server/model-store/

ENV ENABLE_AUTH=false

CMD ["torchserve", "--start", "--ncs", "--model-store", "/home/model-server/model-store", "--models", "dense121_aug.mar"]
