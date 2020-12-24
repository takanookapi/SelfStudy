アプリケーション名
----------------
- SelfStudy(セルフスタディ)

概要
----------------
- 自分が学習した時間分だけLvアップできる学習記録アプリです。
- 学習を記録する際に学習日時,学習時間,メモを記載でき、追加でコメントを残せます。
- 学習予定を記録する際にはメモだけ残し、日付を自由に変更できます。
- 学習記録した学習日時,学習時間,メモを編集したり,記録自体を削除できます。

URL
----------------
- https://lvstudy.herokuapp.com/

テスト用アカウント
----------------
- Basic認証(ID/Pass)</br>
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

要件定義
----------------
| 機能                 | 目的                                                                                   | 要件                                                                                                                                                                                                                                                                        | 
| -------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | 
| 学習記録機能 | ・自分の学習時間/日付/メモを記録するためです。 | ・日付を記録できるようにする。<br>・勉強時間を記録できるようにする。<br>・メモを記録できるようにする。 | 
| ログイン機能         | ・各個人用なので、他人の学習と混合しないようにするためです。                           | ・ログインできるようにする。<br>・新規登録できるようにする。<br>・ログインしている人は新規登録はできないようにする。<br>・Name/email/password/password-confirminationの４つで登録できるようにする。<br>・パスワードのチェックボックスで表示したり隠したりできるようにする。 | 
| 経験値機能           | ・学習時間に応じた経験値を取得することによってやる気をアップするためです。             | ・学習時間に応じて経験値を取得できるようにする。<br>・トップページにLvと総合学習時間を表示する。                                              | 
| ダークモード         | ・学生の目に優しくするためです。<br>・バッテリー消費を抑え目の疲れを軽減するためです。 | ・ライトモード/ダークモードを<br>チェックボックスによって切り替えられるようにする。                                                                                                                                                                                         | 
| Basic認証            | ・最低限のセキュリティ確保のためです。                                                 | ・Basic認証の導入する。<br>・環境変数で見えない形にする。                                                                                                                                                                                                                   | 
| デプロイ             | ・実際に第三者に使用してもらうためです。                                               | ・環境変数で見えない形にする。                                                                                                                                                                                                                                              | 
| レスポンシブデザイン | ・中高生のスマホ活用時間が長いためです。                           | ・iPhone6/7/8の携帯端末機の画面のサイズに設定する。                                                                                                                                                                                                                         | 

- 工夫した点</br>
①Basic認証や、デプロイする際にID/パスワードをソースコードから見られないように環境変数にしました。</br>
②経験値を取得する際に、1分を1expと考え一定の経験値幅でLvUpするようにしました。また、見易いようにトップページに一番上に大きく"現在のLv","合計勉強時間"を表記しました。</br>
③レスポンシブデザインは一定の画面サイズになるとiPhone6/7/8用にCSSが適用されるメディアクエリを使用しました。</br>
④ダークモードにチェックを入れた際に、どのページに遷移しても適用されるようにcookieを利用しました。</br>
⑤パスワード入力部分はセキュリティ面とユーザーの利便性を考慮し、表示と非表示機能をつけました。</br>
⑥単体/結合テストコード（Basic認証も含)をコーディングすることにより、追加実装した際に基本的な機能を効率的にテストできるようにしました。また、</br>

GIF説明
----------------
- 時間記録(LvUp,経験値取得)

![時間記録](https://gyazo.com/d80777c447ac96a61f2ce01076390e94/raw)

- レスポンシブデザイン

![iPhone/6/7/8](https://gyazo.com/b410e090d5c0de00d4f7e6698b85de95/raw)
![iPhone/6/7/8 (2)](https://gyazo.com/1802afc7b445f02616fe4bcd4590eb6f/raw)

- ダークモード維持

![ダークモード](https://gyazo.com/f86dca8e2e1ec1d11a08158daf3bc5e1/raw)


- パスワード表示/非表示

![パスワード表示非表示](https://gyazo.com/f7463c2faca1b625bd754dd7f17c1c49/raw)

今後の実装予定機能
----------------
①"Vue.js"と"Nuxt.js"を利用して"SPA"の実装</br>
②以下の2点の実装を予定</br>
  i)経験値バーに動きをつける</br>
  ii)LvUp機能に動きをつける</br>
③SNSとして機能させるために以下の4点の実装予定</br>
  i)フォロー機能</br>
  ii)いいね機能</br>
  iii)勉強時間ランキング</br>
  iv)プライベートメッセージ機能</br>

画面遷移図/ER図/テーブル表
----------------
- 画面遷移図

![自己学習トップページ遷移図](https://user-images.githubusercontent.com/69524194/94257860-ea3f8580-ff66-11ea-95aa-d8d9f14aff4f.jpg)


- ER図

![自己学習機能DB設計図](https://user-images.githubusercontent.com/69524194/94257665-9a60be80-ff66-11ea-8c98-17bd623f42f9.jpg)



### users テーブル
| Column          | Type     | Options                        |
| --------------  | -------  | ------------------------------ |
| name            | string   | null: false                    |
| email           | string   | null: false , default: ""      |
| password        | int      | null: false                    |
| first_name      | int      | null: false                    |
| level           | int      | null: false,default: 1         |
| exp_point       | int      | default: 0                     |
| sum_time:float  | float    | null: false,default: 0         |

#### Association
- has_many :time_reports
- has_many :comments


### time_reports テーブル
| Column            | Type    | Options                       |
| ----------------- | ------- | ----------------------------- |
| user_id           | integer | null: false, foreign_key: true| 
| study_time       | float   | null: false                   |
| study_date       | datetime| null: false                   |
| memo              | text    | null: false                   |
| exp               | int     |                               |

#### Association
- belongs_to :user
- has_many   :comments


### comments テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | integer    | null:false, foreign_key: true  |
| time_report_id | integer    | null:false, foreign_key: true  |
| content        | text       | null:false                     |

#### Association
- belongs_to :time_report
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
MySQL 5.6.47/SequelPro 1.1.2</br>
GitHub</br>
Heroku</br>
Visual Studio Code 1.49.2</br>
