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

# 使いかた 
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
│          │             │
│          │             └─⫸ 現在形で簡潔な要約, 大文字でない, 最後にピリオド(句点)なし (#issue)
│          │      
│          └─⫸ コミットの種類: build|ci|docs|feat|fix|perf|refactor|test
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
$  ./test.sh
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
```
echo 'Hello world!'; pwd; echo 'End world!';
```

### 変数の代入
スペースを入れずに = で代入
```sh
var='value1'
```

### 変数の参照 
```sh
$ or  ${}
```

### 変数の上書きを防止
```sh
$ UWAGAKI='上書き'
$ UWAGAKI='オーバーライド'
./test.sh: line 42: UWAGAKI: readonly variable
```

### 変数の初期化
unsetを使うと 未定義の状態にもどす
```sh
$ var='set'
$ echo $var
$ unset var
$ echo $var
$ echo '↑ 空白(初期化)'

set

↑ 空白(初期化)
```

