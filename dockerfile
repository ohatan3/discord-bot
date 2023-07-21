# Usage:
# docker build -t py-run .

FROM python:3.11

# Gitのインストール
RUN apt-get update && apt-get install -y git

# プロジェクトをクローンしてコンテナ内にコピー
RUN git clone https://github.com/rikitaro3/discord-bot.git /app/discord-bot

# 作業ディレクトリの指定
WORKDIR /app/discord-bot

# コンテナ内に必要なPythonパッケージをインストール
RUN python -m pip install -r requirements.txt

# 起動スクリプトとしてPythonファイルを実行
CMD ["python", "main.py"]

