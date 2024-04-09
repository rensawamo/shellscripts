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
