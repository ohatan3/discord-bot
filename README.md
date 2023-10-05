# O_o
## file
### deploy_gce.sh
* ローカル環境からGCEのインスタンスにデプロイする
* 既にインスタンスが存在した場合、削除して作り直す

### main.py
* discord botの本体（公式のサンプル動かしてるだけ）

### dockerfile
* GCEでpythonのプログラムを1発で動かすためだけの存在。既にdockerhubへ公開しているのでもうビルドしないはず。

### requirements.txt
* 普通のrequirements.txt

## 開発の仕方メモ
以下でデプロイまでできる
1. ローカルでコード修正
2. githubにコミット
3. `$ ./deploy_gce.sh`でデプロイ（公開）
