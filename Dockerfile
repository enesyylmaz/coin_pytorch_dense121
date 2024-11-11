FROM pytorch/torchserve

COPY model_store/dense121_aug.mar /home/model-server/model-store/

CMD ["sh", "-c", "torchserve --start --ncs --model-store /home/model-server/model-store --models dense121_aug.mar && cat /home/model-server/key_file.json"]
