アプリケーション名
----------------
- SelfStudy

概要
----------------
- 自分が学習した時間分だけLvアップできる学習記録アプリです。
- 学習を記録する際に学習日時,学習時間,メモを記載でき、追加でコメントを残せます。
- 学習予定を記録する際にはメモだけ残し、日付を自由に変更できます。
- 学習記録した学習日時,学習時間,メモを編集したり、記録自体を削除できます。

URL
----------------
- https://selfstudy-29216.herokuapp.com/

テスト用アカウント
----------------
- Basic認証(ID/Pass)</br>ID/Pass
ID: stustu</br>
Pass: 1818</br>
- テスト用アカウント等</br>
Name:TEST</br>
Email: 1111@yahoo.co.jp</br>
Password: 1234aa</br>

利用方法
----------------
①始めにログイン画面が出るのでテスト用アカウントでサインインするか、
ご自分でお好きなアカウントをお作りして新規登録していただきます。</br>
②トップページから右上にご登録していただいたお名前をマウスをかざすと時間登録ボタンが出るので押下します。</br>
③"学習日時","学習時間","*上記と同時間入力","メモ" を入力し"保存"を押します。</br>
④トップページに遷移し確認後、ログアウトをお願いいたします。
(必要に応じて"編集","削除"ボタンを押しても構いません。 )</br>

課題解決
----------------
- ターゲットは12~18才の中高生です。</br>
- 中高生の"やる気があがらない"という課題に対して、”やる気をあげる"ことが課題解決でした。そのために学習という抽象的な概念を面白く具現化できればと思いこのアプリを作りました。</br>
- 背景としては中高生の悩みとして第1位に上がっていたのが"やる気があがらない"という理由でした。自分の学習をゲームのようにLvで可視化することでやる気を出そうと考えました。また、昨今では若者はTVを見ない傾向にあり、スマホでYoutubeやSNSアプリを使うようになりました。なので、スマホにも対応した画面サイズかつ、長時間目にも優しいようにダークモード搭載のアプリを作成しました。</br>

洗い出した要件
----------------
実装機能        |要件
---------------|---------------------------------------------------------
  ログイン機能   |・新規登録できるようにする。・ログインしている人は新規登録はできないようにする。・名前/email/password/password-confirminationの4つで登録できる。・パスワードのチェックボックスで表示したり隠したりできる。                                     

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
  i)経験値バーに動きをつける</br>
  ii)LvUp機能に動きをつける</br>
③12月までにSNSとして機能させるために以下の4点の実装</br>
  i)フォロー機能</br>
  ii)いいね機能</br>
  iii)勉強時間ランキング</br>
  iv)プライベートメッセージ機能</br>

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
2)$ ruby -v #任意</br>
3)$ rails -v #任意</br>
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