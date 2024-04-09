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
