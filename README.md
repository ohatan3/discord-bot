# O_o
## requirements
* gcloud CLI

## file
### deploy_gce.sh
* ローカル環境から実行するとGCEのインスタンスにデプロイできる
* 既にインスタンスが存在した場合、削除して作り直す
* GCEの永久無料枠(e2-micro)を利用

### main.py
* discord botの本体（公式のサンプル動かしてるだけ）

### dockerfile
* GCEでこのプログラムを起動と同時に動かすためのもの
* 既にdockerhubへ公開しているのでもう変更なければdockerビルドとかはしなくてよい

### requirements.txt
* 普通のrequirements.txt

## 開発の仕方メモ
以下でデプロイまでできる
1. ローカルでコード修正
2. githubにコミット
3. `$ ./deploy_gce.sh`でデプロイ（公開）
