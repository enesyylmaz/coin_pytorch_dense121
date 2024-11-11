FROM pytorch/torchserve

COPY model_store/dense121_aug.mar /home/model-server/model-store/

COPY key_file.json /home/model-server/

CMD ["torchserve", "--start", "--ncs", "--model-store", "/home/model-server/model-store", "--models", "dense121_aug.mar"]
