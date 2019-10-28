Asagao -- ある草野球チームのブログサイト
========================================

『改訂4版　基礎Ruby on Rails』（株式会社オイアクス、黒田努、佐藤和人著。インプレス・ジャパン刊、2018年）のサンプルアプリケーションです。

動作条件
--------

* オペレーティングシステム
    * macOS Sierra （v10.12）
    * macOS High Sierra （v10.13）
    * Windows 10
* Ruby 2.5.1

書籍のChapter 13で解説されているActive Storageの機能を利用するには、さらにImageMagickのインストールが必要です。

ダウンロード
------------

https://github.com/oiax/asagao5 の「Clone or download」ボタンをクリックし、「Download ZIP」リンクをクリックしてください。

ダウンロードされたファイルの名前は `oiax-asagao5-master.zip` です。
これを適当なフォルダに展開してください。

インストール
------------

コマンドプロンプト（ターミナル）を開き、展開されたソースコードのフォルダにcdコマンドで移動します。そして、以下のコマンドを実行してください。

    bundle install
    rake db:rebuild RAILS_ENV=production

起動
----

    rails s -e production

ブラウザで http://localhost:3000/ を開くと、ローカルマシン上でアプリケーションが利用できます。

著作権
-----

このソフトウェアは、MITライセンスのもとで公開されています。詳しくは[LICENSE]をご覧ください。
