# MySQLチュートリアル
## 手順
```bash
# MySQLクライアントをインストール
$ brew update
$ brew install mysql

# MySQLコンテナを起動
$ docker container run --rm -d \
  -v `pwd`/init:/docker-entrypoint-initdb.d \
  -e MYSQL_ROOT_PASSWORD=mysql \
  -p 43306:3306 --name mysql mysql:5.7

# MySQLにログイン
$ mysql -h 127.0.0.1 --port 43306 -uroot -pmysql

# MySQLコンテナを停止
$ docker container stop mysql
```

## クエリ集
### はじめに
```sql
-- データベースを表示
show databases;

-- [ database name ]を利用
use [ database name ];

-- テーブルを表示
show tables;
```
### 内部結合 (INNER JOIN)
```sql
SELECT
  stock.name,
  stock.item_id,
  item.name,
  item.price,
  stock.quantity
FROM
  stock
INNER JOIN
  item
ON
  stock.item_id = item.id
;
```

### 外部結合
#### LEFT OUTER JOIN
```sql
SELECT
  stock.name,
  stock.item_id,
  item.name,
  item.price,
  stock.quantity
FROM
  stock
LEFT OUTER JOIN
  item
ON
  stock.item_id = item.id
;
```

#### RIGHT OUTER JOIN
```sql
SELECT
  stock.name,
  stock.item_id,
  item.name,
  item.price,
  stock.quantity
FROM
  stock
RIGHT OUTER JOIN
  item
ON
  stock.item_id = item.id
;
```

## 参考資料
- [Dockerで使い捨てのMySQL環境を用意する。事前データを投入して起動する。 - My External Storage](https://budougumi0617.github.io/2018/05/20/create-instant-mysql-by-docker/)
