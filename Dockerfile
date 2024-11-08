FROM pytorch/torchserve

COPY /model_store/densenet121_aug.mar /home/model-server/model-store/

CMD ["torchserve", " - start", " - ncs", " - model-store", "/home/model-server/model-store", " - models", "densenet121_aug.mar"]