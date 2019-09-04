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
  -p 43306:3306 \
  --name mysql mysql:8.0

# MySQLにログイン
## -h | --host ....... Host name
## --port ............ Port number
## -u | --user ....... User name
## -p | --password ... Password
$ mysql -h 127.0.0.1 --port 43306 -u root -pmysql
$ mysql --host 127.0.0.1 --port 43306 --user root --password

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
  s.name,
  s.item_id,
  i.name,
  i.price,
  s.quantity
FROM
  stock AS s
LEFT OUTER JOIN
  item AS i
ON
  s.item_id = i.id
;
```

#### RIGHT OUTER JOIN
```sql
SELECT
  s.name,
  s.item_id,
  i.name,
  i.price,
  s.quantity
FROM
  stock s
RIGHT OUTER JOIN
  item i
ON
  s.item_id = i.id
;
```

#### FULL OUTER JOIN
```sql
-- MySQLではサポートされていない
SELECT
  stock.name,
  stock.item_id,
  item.name,
  item.price,
  stock.quantity
FROM
  stock
FULL OUTER JOIN
  item
ON
  stock.item_id = item.id
;
```

### WITH句
```
WITH t1 AS (
  SELECT
    *
  FROM
    stock
  WHERE
    quantity BETWEEN 500 AND 1000
),
t2 AS (
  SELECT
    *
  FROM
    item
  WHERE
    category LIKE 'M%'
)

SELECT
  *
FROM
  t1
LEFT OUTER JOIN
  t2
ON
  t1.item_id = t2.id
;
```

## 参考資料
- [Dockerで使い捨てのMySQL環境を用意する。事前データを投入して起動する。 - My External Storage](https://budougumi0617.github.io/2018/05/20/create-instant-mysql-by-docker/)
