アプリケーション名
----------------

- 概要
（アプリケーションでできること）

- ##URL
https://selfstudy-29216.herokuapp.com/

- テスト用アカウント
○Basic認証
ID/Pass
ID: stustu
Pass: 1818
○テスト用アカウント等
Name:TEST
メールアドレス: 1111@yahoo.co.jp
パスワード: 1234aa

- 利用方法

- 課題解決
(このアプリケーションを通じて、どのような人、どのような課題を解決したかったかの記述)

- 洗い出した要件
|実装機能        |要件
|---------------|---------------------------------------------------------|
|ログイン機能     |・新規登録できるようにする。                                  |
|               |・ログインしている人は新規登録はできないようにする。              |
|               |・名前・email・password・password-confirminationの４つで登録 |
|               |・パスワードのチェックボックスで表示したり隠したりできる。         |
###①ログイン機能
目的:各個人用なので、他の人の学習と分けるために実装
詳細:ログインと新規登録機能を実装する
要件:以下の4点
i)ログインできるようにする。
・新規登録できるようにする。
・ログインしている人は新規登録はできないようにする。
・名前・email・password・password-confirminationの４つで登録。
・パスワードのチェックボックスで表示したり隠したりできる。"
###②経験値機能
###③ダークモード
###③レスポンシブデザイン
###③Basic認証
###③デプロイ

- GIF説明
(機能ごとのGIF)

- 実装予定機能
①10月までに"Vue.js"と"Nuxt.js"を利用して"SPA"の実装
②11月までに以下の2点の実装
i)経験値バーに動きをつける
ii)LvUp機能に動きをつける
③12月までにSNSとして機能させるために以下の2点の実装
i)フォロー機能
ii)いいね機能
iii)勉強時間ランキング機能
iv)プライベートメッセージ機能

- DB図
(ER図<Github> )
## users テーブル
| Column          | Type     | Options                        |
| --------------  | -------  | ------------------------------ |
| name            | string   | null: false                    |
| email           | string   | null: false , default: ""      |
| password        | int      | null: false                    |
| first_name      | int      | null: false                    |
| level           | int      | default: 1                     |
| exp_point       | int      | default: 0                     |
| sum_time:float  | float    |                                |

### Association
- has_many :time_reports
- has_many :comments


## time_reports テーブル
| Column            | Type    | Options                       |
| ----------------- | ------- | ----------------------------- |
| user_id           | integer | null: false, foreign_key: true| 
| sutudy_time       | float   | null: false                   |
| sutudy_date       | datetime| null: false                   |
| memo              | text    | null: false                   |
| exp               | int     |                               |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    | null:false, foreign_key: true  |
| time_report_id | integer    | null:false, foreign_key: true  |
| content        | text       | null:false                     |

### Association
- has_one    :sell_item
- belongs_to :user


- ローカル動作方法
1)$ git clone https://github.com/takanookapi/SelfStudy.git
2)$ ruby -v
3)$ rails -v
4)$ bundle install
5)$ rails db:create
6)$ rails db:migrate
7)$ rails s
8)  http://localhost:3000

- 開発環境
Ruby 2.6.5
Rails 6.0.3.3
HTML/CSS/Javascript
MySQL
GitHub
Heroku
Visual Studio Code