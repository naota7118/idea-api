# APIの操作方法

## アイディア名とカテゴリー名を登録する操作

アイディア名とカテゴリ名を登録するリクエストをする際は、こちらのコマンドを入力してください。
```
curl --data '{"idea":{"body":"アイディア名"},"category":{"name":"カテゴリー名"}}' -H "Content-Type: application/json" -X POST http://localhost:3000/ideas
```

## アイディア一覧をリクエストする操作

アイディア一覧をリクエストするには、こちらのコマンドを入力してください。

```
curl http://localhost:3000/ideas | jq .
```

上記の操作を行うためには、お手数ですが、こちらのコマンドでjqをインストールして頂く必要がございます。

```
$ brew install jq
```

