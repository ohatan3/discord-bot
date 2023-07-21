# docker起動コマンド
# # DockerイメージをDocker Hubからpull
# docker pull your_dockerhub_username/your_image_name

# # コンテナを起動して実行
# docker run -d --restart=always your_dockerhub_username/your_image_name

# ベースイメージの指定（Pythonイメージを使用）
FROM python:3.11

# 作業ディレクトリの指定
WORKDIR /app

# Gitのインストール
RUN apt-get update && apt-get install -y git

# プロジェクトをクローンしてコンテナ内にコピー
RUN git clone https://github.com/ohatan3/discord-bot.git /app/discord-bot

# コンテナ内に必要なPythonパッケージをインストール
RUN pip install -r /app/discord-bot/requirements.txt

# 起動スクリプトとしてPythonファイルを実行
CMD ["python", "/app/discord-bot/main.py"]

