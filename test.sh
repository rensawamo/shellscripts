#!/bin/bash

# 改行
echo 'Hello world!'
pwd
echo \
'r' \
'e' \
'n'
echo
'End world!'


# 複数コマンドの実行
echo '複数コマンドの実行'
echo 'Hello world!'; pwd; echo 'End world!';

# 変数の代入
echo '変数代入'
var='value1'
echo $var
var='change'
echo $var

# 変数参照
echo '変数参照'
var1='value'
echo $var1
var2=$var1
echo ${var2}

# 大文字と小文字の区別
echo '大文字と小文字の区別'
var='lower'
echo $var
VAR='UPPER'
echo $VAR

# 変数の上書き防止
echo 'read only'
readonly UWAGAKI='上書き'
UWAGAKI='オーバーライド'


# 変数を未定義の状態に戻す
echo '初期化'
var='set'
echo $var
unset var
echo $var
echo '↑ 空白(初期化)'


# Shell の文字列
echo '文字列'
var=a       # クォーテーションをつけなくても文字列の扱いになる
echo $var
var='a b' # スペースを含む場合はクォーテーションをつける必要がある
echo $var
var=a b  # エラー



# ESCAPE
echo 'エスケープ'
var=value
echo $var
echo \$var      # $ をエスケープすることでパラメータ展開させない
echo \$var $var # 並べて出力
echo \\         # \ 自身も \ でエスケープできる

var=hoge\ fuga  # スペースをエスケープすることで連続した文字列として処理できる(見づらいので非推奨)
echo $var


# シングルとダブル
echo 'single or double'
single='${single}'
double="${double}"
echo $single
echo $double


# 文字列の連結
echo '文字列'
var1='hoge''fuga'
echo '$var1': $var1

var2=hoge
var3=$var1$var2
echo '$var3': $var3

echo "\$var1hoge": $var1hoge
echo "\$var1'hoge'": $var1'hoge'
echo "\${var1}hoge": ${var1}hoge
echo "\${var1}'hoge'": ${var1}'hoge'


# 引数の受け取り
echo ' ./test.sh arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8 arg9 arg10 を実行します'
echo '$1': $1       # {} なくても OK
echo '${2}': ${2}   # {} があっても OK
echo '"$3"': "$3"   # ダブルクォーテーションの中でも展開される
echo '${10}': ${10} # 10番目以降は {} が必要
echo '${11}': ${11} # 引数として指定されていない番号の位置パラメータには値が設定されない
echo '$10':$10

# $0 ついて
echo '$0 パラメータ'
echo $0  # 実行コマンドが出力される
echo $1  # 引数が出力される


# 終了ステータス $ ./test.sh 256; echo '終了ステータス' $?
echo '終了ステータス'
echo '入力値' $1 # 第１引数を出力
exit $1 # exit コマンドで終了ステータスを指定


#!/bin/bash
echo -----------
echo 引数の数 $#
echo '$1'の値 $1
echo '$2'の値 $2
shift
echo $?
echo -----------
echo 引数の数 $#
echo '$1'の値 $1
echo '$2'の値 $2
shift
echo $?
echo -----------
echo 引数の数 $#
echo '$1'の値 $1
echo '$2'の値 $2
shift   # ここで 変数に値がなくなるから
echo $? # ステータスコードで 1が表示
echo -----------
