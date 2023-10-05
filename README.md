# O_o
## 必要環境
* gcloud CLI

## ファイルの説明
### deploy_gce.sh
* ローカル環境から実行するとGCEのインスタンスにデプロイしそのまま起動できる
* 既にインスタンスが存在した場合、削除して作り直す
* GCEの永久無料枠(e2-micro)を利用

### main.py
* discord botの本体（公式のサンプル動かしてるだけ）

### dockerfile
* GCEでこのプログラムを起動と同時に動かすためのもの
* 既にビルドしたイメージをdockerhubへ公開しており、GCEではdockerhubの公開イメージを用いる
* 変更なければdocker build等触らないでよい

### requirements.txt
* 通常のpython requirements.txt

## 開発のやり方メモ
以下でデプロイまでできる
1. ローカルでコード修正
2. githubにコミット
3. `$ ./deploy_gce.sh`でデプロイ（公開）
