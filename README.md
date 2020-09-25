アプリケーション名
----------------
- SelfStudy

概要
----------------
- (アプリケーションでできること）

URL
----------------
- https://selfstudy-29216.herokuapp.com/

テスト用アカウント
----------------
- Basic認証</br>
ID/Pass</br>
ID: stustu</br>
Pass: 1818
- テスト用アカウント等</br>
Name:TEST</br>
メールアドレス: 1111@yahoo.co.jp</br>
パスワード: 1234aa</br>

利用方法
----------------

課題解決
----------------
(このアプリケーションを通じて、どのような人、どのような課題を解決したかったかの記述)

洗い出した要件
----------------
|実装機能        |要件
|---------------|---------------------------------------------------------|
|ログイン機能     |・新規登録できるようにする。・ログインしている人は新規登録はできないようにする。・名前/email/password/password-confirminationの4つで登録できる。・パスワードのチェックボックスで表示したり隠したりできる。                                       |
|               |

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

GIF説明
----------------
(機能ごとのGIF)

実装予定機能
----------------
①10月までに"Vue.js"と"Nuxt.js"を利用して"SPA"の実装</br>
②11月までに以下の2点の実装</br>
  1)経験値バーに動きをつける</br>
  2)LvUp機能に動きをつける</br>
③12月までにSNSとして機能させるために以下の2点の実装</br>
  1)フォロー機能</br>
  2)いいね機能</br>
  3)勉強時間ランキング</br>
  4)プライベートメッセージ機能</br>

DB図
----------------
(ER図<Github> )
### users テーブル
| Column          | Type     | Options                        |
| --------------  | -------  | ------------------------------ |
| name            | string   | null: false                    |
| email           | string   | null: false , default: ""      |
| password        | int      | null: false                    |
| first_name      | int      | null: false                    |
| level           | int      | default: 1                     |
| exp_point       | int      | default: 0                     |
| sum_time:float  | float    |                                |

#### Association
- has_many :time_reports
- has_many :comments


### time_reports テーブル
| Column            | Type    | Options                       |
| ----------------- | ------- | ----------------------------- |
| user_id           | integer | null: false, foreign_key: true| 
| sutudy_time       | float   | null: false                   |
| sutudy_date       | datetime| null: false                   |
| memo              | text    | null: false                   |
| exp               | int     |                               |

#### Association
- belongs_to :user
- has_many :comments


### comments テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    | null:false, foreign_key: true  |
| time_report_id | integer    | null:false, foreign_key: true  |
| content        | text       | null:false                     |

#### Association
- has_one    :sell_item
- belongs_to :user


ローカル動作方法
----------------
1)$ git clone https://github.com/takanookapi/SelfStudy.git</br>
2)$ ruby -v</br> #任意#
3)$ rails -v</br> #任意#
4)$ bundle install</br>
5)$ rails db:create</br>
6)$ rails db:migrate</br>
7)$ rails s</br>
8)  http://localhost:3000</br>

開発環境
----------------
Ruby 2.6.5</br>
Rails 6.0.3.3</br>
HTML/CSS/Javascript</br>
MySQL</br>
GitHub</br>
Heroku</br>
Visual Studio Code</br>