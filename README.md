# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

＄git branch ブランチの確認（現在いるブランチには*がつく）
$git checkout -b "作成したいブランチ名" (ブランチ作成)
$git commit --allow-empty -m "コミットメッセージ"(空コミット　新規ファイルや修正ファイルがなくてもコミットできる)
＄git push origin ブランチ名　（リモートリポジトリにpushする）
＄git pull origin ブランチ名　(リモートの最新版をローカルに反映させる)

トピックブランチ作成法

1.$git branch develop (統合ブランチであるdevelopブランチに移動)
2.$git checkout -b トピックブランチ名 (トピックブランチを作成する)

トピックブランチの内容をリモートリポジトリへpushする

＄git status (ファイルの変更等を確認)
＄git add -a (変更のあったファイルをaddする）
＄git commit -m "コミットメッセージ" (ローカルリポジトリにコミットする)
＄git push origin 自分の作業ブランチ (リモートの自分の作業ブランチに変更内容を反映させる)※トピックブランチの反映の確認の仕方はスライドの３９．４０を確認

プルリクについてはスライドの４１～４７を確認

マージについては48～51を確認

統合が終わったら
$git checkout develop (developブランチに移動)
$git pull origin develop (リモートの統合ブランチの最新版をプル、動作確認)
$git checkout 自分の作業ブランチ (自分の作業ブランチに移動)
$git merge origin/develop (動作に問題がなければ自分のブランチにも反映)

$git push origin 自分の作業ブランチ (リモートの自分のブランチに反映)


