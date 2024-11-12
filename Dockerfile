FROM pytorch/torchserve

COPY model_store/dense121_aug.mar /home/model-server/model-store/

CMD ["torchserve", "--start", "--model-store", "/home/model-server/model-store", "--disable-token-auth", "--models", "dense121_aug.mar"]
