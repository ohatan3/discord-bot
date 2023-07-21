#!/bin/bash

# シェルの引数TOKENをセット
TOKEN=("$@")[0]

# 変数の設定
INSTANCE_NAME="free-instance"
ZONE="us-west1-b"
MACHINE_TYPE="e2-micro"
IMAGE_FAMILY="cos-101-lts"
DISK_SIZE="25GB"
DEPLOY_CONTAINER="rikitaro/py-run"  # デプロイコンテナイメージ名とタグに置き換えてください

# 既存の同名インスタンスの確認と削除
EXISTING_INSTANCE=$(gcloud compute instances list --filter="name=$INSTANCE_NAME" --format="value(name)")
if [ -n "$EXISTING_INSTANCE" ]; then
  echo "Deleting existing instance: $EXISTING_INSTANCE"
  gcloud compute instances delete $INSTANCE_NAME --zone=$ZONE --quiet
fi

# GCEインスタンスの作成
echo "Creating a new instance..."
gcloud compute instances create $INSTANCE_NAME \
    --zone=$ZONE \
    --machine-type=$MACHINE_TYPE \
    --image-project=cos-cloud \
    --image-family=$IMAGE_FAMILY \
    --boot-disk-size=$DISK_SIZE \
    --boot-disk-type=pd-standard \
    --metadata=startup-script="#! /bin/bash
sudo docker run --restart=always -d $DEPLOY_CONTAINER -e TOKEN=$TOKEN
"

echo "Instance created: $INSTANCE_NAME"