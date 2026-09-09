---
aliases:
  - Design Doc
  - Engineering Design Doc
---
# Google Design Doc

## Summary

Google において、新機能や大規模システムの実装に着手する前に、設計案・目標・横断的関心事・代替案を文書化し、関係者間でピアレビューと合意形成を行うための公式設計文書および文化制度[^swe-google]。[RFC Process](../20%20Concepts/RFC%20Process.md) の企業内エンジニアリングにおける事実上の業界標準モデルの一つ。

## Motivation

大規模な分散エンジニアリング組織において、コードを書き始めてから根本的な設計ミスやスケーラビリティの破綻、セキュリティ・プライバシー違反が発覚した場合の手戻りコストは極めて大きい。実装前に自然文の設計書を書き、組織内のドメインエキスパートによる批判的レビュー（ストレステスト）にかけることで、設計の盲点を最小化する仕組みが必要とされた[^swe-google]。

## Goals and non-goals

- **Goals**:
  - 実装前に設計者の思考を整理し、論理的矛盾を可視化する（Force clarity）[^swe-google]。
  - セキュリティ、プライバシー、SRE、インフラコストなどの横断的ステークホルダーから早期にフィードバックと承認（Sign-off）を得る[^swe-google]。
  - 将来の保守者や新規参加者に対し、「なぜこのアーキテクチャになったのか」という歴史的文脈（Why）を恒久的に残す[^swe-google]。
- **Non-goals**:
  - 実装の細部を 100% 網羅した不変の仕様書（Waterfall 的な詳細設計書）の作成（実装中の発見に応じた調整を許容）。
  - 小規模なバグ修正や内部リファクタリングなど、システムの境界や外部インターフェースに影響しない変更の形式化。

## User-level explanation

標準的な Design Doc は社内 Google ドキュメント（Google Docs）上で作成され、以下のセクションで構成される[^swe-google]:

1. **Title & Metadata**: 作成者、レビュアー、ステータス（Draft, In Review, Approved）、作成日。
2. **Context & Problem Statement**: なぜこのプロジェクトが必要なのか、どのような背景と前提条件があるのか。
3. **Goals & Non-goals**:
   - **Goals**: この設計が解決すること・保証する品質。
   - **Non-goals**: 今回**意図的に解決しないこと**（スコープクリープ防止のための重要項目）。
4. **Proposed Design**:
   - システムアーキテクチャ（図、コンポーネント構成）。
   - API / データモデル / ストレージスキーマ。
   - 処理シーケンスやスケーラビリティ（QPS、データ量）の見積もり。
5. **Cross-cutting Concerns（横断的関心事）**:
   - **Security & Privacy**: データの保護、認証・認可、暗号化。
   - **Observability**: メトリクス、ログ、アラート設計。
   - **Cost & Resource**: クラウドリソース消費量やハードウェア見積もり。
6. **Alternatives Considered（検討した代替案）**:
   - 比較検討した他の設計案と、それを採用しなかった理由（Pros/Cons）。

## Developer-level explanation

Design Doc は「作成・公開・レビュー・承認」という明確なワークフローに沿って運用される[^swe-google]:

1. **Drafting（執筆）**: 設計者が 1〜数ページのドラフトを作成。
2. **Team Review（チーム内精査）**: まず直属のチームメンバーと共有し、コメント機能で粗削りな論点を解消。
3. **Cross-functional Sign-off（横断レビュー）**: 関連チーム（API 利用者、インフラ担当、セキュリティ専門組織等）に共有し、必須の Sign-off を受ける。
4. **Approval & Implementation**: 合意に達した後、ドキュメントを `Approved` とし、実装フェーズへ移行する。

## Design rationale

- **Goals と Non-goals の明確な分離**: 「やること」以上に「あえてやらないこと（Non-goals）」を合意させることで、レビューアからの過度な要求追加や目的の脱線を防ぐ[^swe-google]。
- **Alternatives Considered の義務付け**: [Rust RFC](Rust%20RFC.md) の `Rationale and alternatives` と同様、単一の提案の正当化に終始せず、トレードオフの比較を強制する[^swe-google]。
- **リアルタイムコメントによる非同期ピアレビュー**: 会議で口頭審議するのではなく、Google Docs のインラインコメントで並行・非同期にフィードバックを交わすことで、議論の質と記録性を最大化する。

## Trade-offs and limitations

- **利点**:
  - 実装前に盲点・障害リスクを叩き出せる。
  - 役職に関係なく、文書の論理性に基づいて若手でも合意を形成できる。
- **費用・限界**:
  - **コードとの乖離（Stale Doc 問題）**: Git リポジトリの外（Google Docs 等）に保存されることが多く、実装完了後の改訂やリファクタリングに追従せず、時間が経つと実態と食い違う（この課題を解決するために考案されたのが [ADR](../20%20Concepts/ADR.md) である）。
  - **承認プロセスの長期化**: 関係者が多すぎると、コメント対応だけで数週間〜数ヶ月を浪費する。

## Alternatives

- **[ADR](../20%20Concepts/ADR.md) (Architecture Decision Records)**:
  長文の設計書ではなく、リポジトリ内に決定事項と理由を短文（1ページ）でコミットしていく軽量な方式。
- **[PR-FAQ](PR-FAQ.md)**:
  Amazon 方式。技術的詳細ではなく、顧客価値（プレスリリース）から逆算するプロダクト視点の提案書。

## Mental model

「コードを書く前に、**システムの設計図・建設計画書・安全点検チェックリスト** を 1 つの文書にまとめ、専門家のストレステストにかける仕組み」。

## References

[^swe-google]: Titus Winters, Tom Manshreck, Hyrum Wright (2020), [Software Engineering at Google - Chapter 10: Documentation](https://abseil.io/resources/swe-book/html/ch10.html), O'Reilly Media / Abseil. Google における Design Doc の目的、構成要素（Goals/Non-goals, Alternatives）、文化的位置づけを確認。確認日: 2026-09-09.
