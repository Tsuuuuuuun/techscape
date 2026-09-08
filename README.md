# techscape

技術的な疑問を、問題・概念・具体技術のノートへ整理し、必要に応じて Survey に統合するためのスターター。本文は日本語、Issue の題名は自然な英語の How ...? とします。

## フォルダ

```text
techscape/
├── AGENTS.md
├── README.md
├── 10 Issues/
├── 20 Concepts/
├── 30 Technologies/
├── 40 Surveys/
├── 90 Templates/
│   ├── issue.md
│   ├── concept.md
│   ├── technology.md
│   └── survey.typ
└── .agents/skills/
    ├── explore/SKILL.md
    ├── research/SKILL.md
    └── synthesize-survey/SKILL.md
```

## 使い始める

1. フォルダを任意の場所に展開し、必要なら Obsidian の vault として開きます。
2. チャットで疑問や理解したいテーマを伝え、対話・調査を通じて理解を深めます。保存したい時点でノートの作成・更新を依頼します。
3. エージェントに vault の場所を伝え、ルートの `AGENTS.md` と使いたい `.agents/skills/<name>/SKILL.md` を読ませます。スキルはこの vault 専用として配置しています。
4. 必要になったノートだけ各テンプレートから作成します。案内文とテンプレート変数は手動またはエージェントで置き換え、不要な節は削除します。Concept はフラットに配置し、ノート間の関係はリンクで表します。

`.agents/skills/` は Codex のプロジェクト用スキルの検出先です。この vault を作業ディレクトリとして開いて使います。認識されない場合は Codex を再起動してください。以下のようにパスを指定して読ませることもできます。スキルは外部サービスや特定のコネクタに依存しません。

## 依頼例

- 「.agents/skills/explore/SKILL.md を使って Ownership の理解を深めたい。最後に分かったことを vault に保存して」
- 「.agents/skills/research/SKILL.md を使って、対象 Technology ノートのこの疑問を公式資料で確認して更新して。関連領域全体の調査は不要」
- 「.agents/skills/synthesize-survey/SKILL.md を使って、指定した複数ノートから比較を中心とした Survey を作って」

候補だけ見たい場合は「候補提示のみ」、会話だけなら「保存せず対話のみ」と伝えます。通常の整理・更新依頼は、毎回の承認待ちを挟まず進める設計です。

## 日々の運用

チャットで疑問を出し、explore で理解を深め、必要な Issue・Concept・Technology を直接作成・更新します。外部資料で確認したい不足は research で補い、複数ノートを横断して理解をまとめたいときは synthesize-survey を使います。残る問いは関連ノートの Open questions に記録し、保存先がない問いは対話のまとめで示します。

Issue は単なる疑問ではありません。例えば「Rust のこの挙動はなぜ？」はまず Rust の節で扱い、技術を離れても成立する設計問題だけを How ...? の Issue にします。Concept は名詞、Technology は具体的な対象の名称にします。関係は既存ノートへの Markdown リンクで表します。リンク先はリンク元ファイルからの相対パスで指定し、`.md` を含め、空白を `%20` にします。例えば `30 Technologies/Rust.md` から Ownership を参照する場合は `[Ownership](../20%20Concepts/Ownership.md)` と書きます。

## Survey

`90 Templates/survey.typ` を `40 Surveys/<slug>/main.typ` にコピーして編集します。Typst が利用できる環境では vault ルートから次のようにコンパイルできます（`<slug>` は実際のフォルダ名に置換）。

```sh
typst compile '40 Surveys/<slug>/main.typ' '40 Surveys/<slug>/main.pdf'
```

外部パッケージは不要です。日本語フォントには Hiragino Mincho ProN を指定しています。環境にない場合は Noto Serif CJK JP など利用できる日本語フォントに変更してください。配布の `.typ` は内容を書き込むためのテンプレートであり、完成した Survey ではありません。

## References と手入れ

外部資料は各ノート末尾の References に直接記載します。本文の重要な主張と脚注記法（`[^slug]`）を対応させます。未読の資料候補は、関連ノートの Open questions に未読と明記して添えます。ノートの「reviewed」は今回の範囲で確認した意味です。

新しい用語のたびにファイルを増やさず、既存ノートの節とリンクを優先します。答えと根拠が揃ったら調査を止め、残った問いだけ記録します。運用で困ったときに AGENTS.md の共通規則、Skills の作業手順、Templates の記述項目をそれぞれ調整してください。
