環境 wsl2 Ubuntu 22.04

install
```sh
$ npm install -g git-cz
```

commit のテンプレートの設定
```sh
$ cd ~ 
$ touch  changelog.config.js
$ vim  changelog.config.js

module.exports = {
  disableEmoji: false,
  format: '[{scope}] {type}: {subject}',
  list: [
    'chore',
    'ci',
    'config',
    'docs',
    'feat',
    'fix',
    'package',
    'perf',
    'refactor',
    'release',
    'style',
    'test',
  ],
  maxMessageLength: 64,
  minMessageLength: 3,
  questions: [
         'scope',
    'type',
    'subject',
    'lerna',
  ],
        scopes: ['dir', 'com', 'package', 'apps', ''],
  types: {
    chore: {
      description: 'ビルド関連や補助ツールの変更',
      value: 'chore',
    },
    ci: {
      description: 'CI関連の変更',
      value: 'ci',
    },
    config: {
      description: '設定ファイル',
      value: 'config',
    },
    docs: {
      description: 'ドキュメントの更新',
      value: 'docs',
    },
    feat: {
      description: '機能の追加、変更、削除）',
      value: 'feat',
    },
    fix: {
      description: 'バグ修正',
      value: 'fix',
    },
    package: {
      description: 'パッケージ',
      value: 'package',
    },
    perf: {
      description: 'パフォーマンス改善',
      value: "pref"
    },
    refactor: {
      description: 'リファクタリング',
      value: 'refactor',
    },
    release: {
      description: 'リリース、公開',
      value: 'release',
    },
    style: {
      description:
        'コードのスタイル調整（マークアップ、フォーマット、セミコロン、etc）',
      value: 'style',
    },
    test: {
      description: 'テストコードの変更',
      value: 'test',
    },
  },
  messages: {
    type: 'コミットする内容はどの型ですか:',
    scope: 'コミットが影響するスコープを選んでください:',
    subject: '変更内容を簡潔に書いてください:\n',
    body: '変更内容の詳細があれば書いてください:\n ',
    breaking: '重要な変更があれば書いてください:\n',
    issues: 'このコミットで閉じるIssuesがあれば書いてください。例： #123:',
  },
};
```

# 使い方
```sh
$ git add .

$ git cz
? コミットする内容はどの型ですか: (Use arrow keys or type to search)
❯ chore:      ビルド関連や補助ツールの変更 
  ci:         CI関連の変更 
  config:     設定ファイル 
  docs:       ドキュメントの更新 
  feat:       機能の追加、変更、削除） 
  fix:        バグ修正 
  package:    パッケージ 

? 変更内容を簡潔に書いてください:
chore: メッセージ (#issue num)
```

### コミット履歴が見やすくなる
```sh
$ git log --oneline
2732326 chore: メッセージ (#issue num)
0a46e68 refactor: Readmeに 設定を追加 (#4)
10e11a8 chore: git czのbodyとかが反応しない (#1)
```

[angular](https://github.com/angular/angular/tree/main) の規約を参考にした
githubのコーディング規約

``` sh
<[scope]><type>: <short summary>
   │       │             │
   │       │             └─⫸ 現在形で簡潔な要約, 大文字でない, 最後にピリオド(句点)なし (#issue)
   │       │      
   │       └─⫸ コミットの種類: build|ci|docs|feat|fix|perf|refactor|test
   │ 
   └─⫸ コミットの対象となるGoモジュールを特定するためのもの
```

 
 # Shell 

## 使い時
- 定期的なシステムメンテナンス
ファイルのバックアップ、ログの分割・圧縮・削除、システムの状態チェックなど、定期的に行う作業の自動化

- データ処理
ファイルの検索やテキストの加工など

- システムセットアップ
ソフトウェアのインストール、設定ファイルの編集、サービスの起動・停止など、システムの初期設定やアップデートの自動化

- テスト
動作チェックなどの簡単なテストスクリプト


## shebang
#! で始まる行を shebang (シェバン/シェバング/シバン)と言う
どのプログラムでスクリプトを実行するか指定
スクリプトファイルに後述の実行権限をつけて実行すると shebangを見て実行

## #!/bin/bash と #!/bin/sh

- #!/bin/bash
機能が豊富

- #!/bin/sh
UNIX 間のアプリの移植性を高めるための規格


# Shellの実行
```sh
$ ./test.sh
bash: ./test.sh: Permission denied
```

権限の付与が必要
```sh
$ chmod +x test.sh
```

改行
``` 
echo  
\
```

複数コマンド ; で区切る
```sh
echo 'Hello world!'; pwd; echo 'End world!';
```

### 変数の代入
スペースを入れずに = で代入
```sh
var='value1'
```

### 変数の参照 
```sh
or  ${}
```

### 変数の上書きを防止
```sh
UWAGAKI='上書き'
UWAGAKI='オーバーライド'
./test.sh: line 42: UWAGAKI: readonly variable
```

### 変数の初期化
unsetを使うと 未定義の状態にもどす
```sh
var='set'
echo $var
unset var
echo $var
echo '↑ 空白(初期化)'

set

↑ 空白(初期化)
```

### 文字列の扱い
```sh
var=a       # クォーテーションをつけなくても文字列の扱いになる
echo $var
var='a b' # スペースを含む場合はクォーテーションをつける必要がある
echo $var
var=a b  # エラー

a
a b
./test.sh: line 60: b: command not found
```

### Shell の特殊文字とエスケープ
```sh
* ? [ ' " ` \ $ ; & ( ) | ~ < > # % = スペース タブ 改行
```


### エスケープ (\)
- パラメータを展開させない
- スペースをエスケープして文字列を連結
- 自分自身もエスケープ

```sh
echo 'エスケープ'
var=value
echo $var
echo \$var      # $ をエスケープすることでパラメータ展開させない
echo \$var $var # 並べて出力
echo \\         # \ 自身も \ でエスケープできる

var=hoge\ fuga  # スペースをエスケープすることで連続した文字列として処理できる(見づらいので非推奨)
echo $var

value
$var
$var value
\
hoge fuga
```


### シングルクォーテーション と ダブルクォーテーション
- シングルは '' 内が展開されない
- ダブルは "" で展開される

```sh
single='${single}'
double="${double}"
echo $single
echo $double

${single}
(空白を参照してるので空が帰る)
```

### 文字列の連結
$var1$var2 のように つなげるだけで連結がされる



### Shellへの 引数の渡し方
```sh
$ ./test.sh arg1 arg2 arg3
```


### 引数の受け取り方
```sh
$1 or ${1}
```  
引数の順番を指定して受け取る
10番目以降は {} が必要


### $0 の意味
```sh
$ ./test.sh 1

echo $0 # コマンド自体
echo $1 # 引数
./test.sh
1
```


### 終了ステータス
終了ステータスとは、スクリプトが終了した際にスクリプトを実行したツールに返される値
Linux におけるコマンドの終了ステータスの範囲は符号なしの8ビットの範囲である 0 ~ 255 に限られる
- 0  (デフォルト)
- 1-255  (エラー)

```sh
$ ./test.sh 256; echo '終了ステータス' $?

echo '入力値' $1 # 第１引数を出力
exit $1 # exit コマンドで終了ステータスを指定

入力値 256 
終了ステータス 0 
```

### $# と shift と ステータスコード
$# で引数の数を表す
shift は $2 の値が $1 に、 $3 の値が $2へと 左にシフト
```sh
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

-----------
引数の数 2
$1の値 arg1
$2の値 arg2
0
-----------
引数の数 1
$1の値 arg2
$2の値
0
-----------
引数の数 0
$1の値
$2の値
1
--------
```

