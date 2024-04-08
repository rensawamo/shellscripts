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
  format: '{type}: {subject}',
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
    'type',
    'subject',
    'lerna',
  ],
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
<type>: <short summary>
  │             │
  │             └─⫸ 現在形で簡潔な要約, 大文字でない, 最後にピリオド(句点)なし (#issue)
  │      
  └─⫸ コミットの種類: build|ci|docs|feat|fix|perf|refactor|test 
```

scope
d
dd
dddddd
dffdf
