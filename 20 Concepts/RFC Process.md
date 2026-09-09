---
aliases:
  - RFC プロセス
  - Request for Comments Process
---
# RFC Process

## Definition

ソフトウェアやプロトコルの開発において、重要な変更や新機能の実装に着手する前に、設計案・動機・トレードオフをまとめた提案書を公開し、非同期かつオープンにピアレビューと合意形成を行う仕様策定・意思決定プロセス[^pep1][^rfc3]。

## Purpose

- **実装コストの浪費防止**: 実装完了後に設計の根本的欠陥や不整合が発覚して手戻りが発生するのを防ぎ、事前合意を形成する。
- **設計空間と代替案の透明化**: なぜその設計が選ばれ、どのような代替案が不採用になったのか（Why）を将来にわたって検証可能な形で記録する。
- **分散コミュニティの非同期合意形成**: 地理的・時間的に分散した貢献者やステークホルダーが、対等かつオープンに議論に参加できる場を提供する。
- **言語・設計思想のレンズ（Why と Why not の理解）**: 公式ドキュメントが「決定事項（What）」を提示するのに対し、RFC は「なぜその設計に至り、何を犠牲にしたのか（Why と Why not）」を記録する。また、各コミュニティの「RFC テンプレートの型（何を強制して書かせるか）」自体が、その言語が最も尊ぶ価値観と最も恐れるリスクを直接映し出す。

## Mechanism

一般的に以下の要素とライフサイクルで構成される：

1. **標準化された提案テンプレート**:
   単なるアイデア表明にとどまらず、動機（Motivation）、具体的な仕様（Specification）、代替案（Alternatives / Prior art）、未解決課題（Unresolved questions）などの必須記述項目を定め、提案者に多角的な考察を促す[^pep1]。
   特に各エコシステムごとにテンプレートの構造的誘導（バイアス）が異なる：
   - **自己批判の強制 (Drawbacks)**: [Rust RFC](../30%20Technologies/Rust%20RFC.md) のように「採用すべきでない理由」を独立項目として書かせることで、提案の過剰追加（feature creep）を抑止する。
   - **エコシステム移行・影響評価 (Backwards Compatibility)**: [PEP](../30%20Technologies/PEP.md) のように既存コードへの破壊的影響と移行措置の提示を必須化し、コミュニティ分断や破壊的変更のリスクを未然に防ぐ。
2. **公開レビュー期間**:
   Issue トラッカー、プルリクエスト、メーリングリスト等を通じて、コミュニティやレビュー担当者からのフィードバックを非同期に受け付ける。
3. **合意形成（Consensus）と収束基準**:
   単純な多数決ではなく、技術的な懸念点（Blocking concerns）の解消を重視する合意形成（ラフ・コンセンサス等）を経て、責任組織・サブチームが承認／却下の意思決定を行う。
4. **ステータス遷移（Lifecycle）**:
   `Draft`（下書き）→ `Proposed / Under Review`（レビュー中）→ `Accepted`（採択）/ `Rejected`（却下）→ `Implemented`（実装完了）/ `Final`（確定）といった状態遷移で進行を追跡する[^pep1]。

## Example

- **ARPANET / IETF RFC**: 1969年に Steve Crocker が提案した技術メモが起源。完成した規格の通達ではなく、「コメントを求める（Request for Comments）」という非権威的・協調的な草案共有として始まった[^rfc3][^rfc1000]。
- **言語・OSS プロジェクトへの展開**:
  現代の大規模 OSS の多くが自プロジェクトの意思決定機構として導入しているが、対象とする領域によって重視する論点が派生・特化している：
  - **[PEP](../30%20Technologies/PEP.md)** (Python): 提案者の推進責任（Champion）と、後方互換性（Backwards Compatibility）の厳格な事前提示。
  - **[Rust RFC](../30%20Technologies/Rust%20RFC.md)**: 教育メンタルモデル（Guide）と実装（Reference）の分離、および「あえて採用しない理由（Drawbacks）」の自己批判。
  - **React RFC**: Rust RFC の直系。UI ライブラリ特有の「導入・移行戦略（Adoption strategy）」、自動移行ツール（Codemod）、段階的オプトインの実現性を重視。
  - **Swift Evolution**: Rust/PEP を融合。OS 組み込み言語としての「バイナリ互換性（Effect on ABI stability）」および将来の変更容易性（Effect on API resilience）の審査を義務付け。
  - **Go Proposal**: 最初から長文 RFC を書かせず、まず短い GitHub Issue で週次トリアージ（即時 Accept / Decline）を行い、大規模・複雑な案件のみ Design Doc を要求する「Issue ファースト」の軽量方式。

## Properties and limits

- **成立条件**:
  - 提案を精査・意思決定できる明確な責任主体（メンテナ、専門委員会、サブチーム等）が存在すること。
  - 建設的な議論を行える公開の場と行動規範が維持されていること。
- **限界・トレードオフ**:
  - **合意形成の遅延とプロセス疲弊**: 議論が長期化しやすく、些細な論点に議論が集中するパーキンソンの凡俗法則（Bikeshedding）に陥るリスクがある。
  - **採択と実装の乖離**: 提案書が承認されても、実装を担当するリソースが確保できず、機能が長期間放置される場合がある。
- **よくある誤解**:
  - 「全員一致（100% の賛成）が必要」という誤解。実際には合理的な反論が出尽くしたか、未解決事項を将来のフェーズに切り出せるかを見極めて前進させる運用が多い。
  - 「RFC は拘束力を持つ完全な仕様書である」という誤解。初期 RFC は方針合意であり、試作実装（プロトタイプや Nightly 実装）からのフィードバックによって改訂されることが前提となる。

### アプリケーション開発への適用と製品フェーズによる重み付け

言語や基盤 OSS ではなく、一般的な業務・Web アプリケーション開発に RFC（Design Doc）を適用する場合、システムのライフサイクルによって Rust RFC 型と PEP 型のどちらに比重を置くべきかが変化する：

- **PoC / パイロット期（探索・立ち上げフェーズ） → [Rust RFC](../30%20Technologies/Rust%20RFC.md) 型が優位**:
  - **最大のリスク**: 仕様の過剰追加（Feature creep）、不可逆な複雑化、利用者の認知負荷の増大。
  - **効く仕組み**: `Guide-level explanation`（ユーザーのメンタルモデルの単純さの検証）と `Drawbacks`（「あえて今これを追加しない理由」「複雑化のコスト」を自白させること）を課すことで、YAGNI（不要な作り込み）を抑止できる。
- **本番運用・リリース後（成熟・運用フェーズ） → [PEP](../30%20Technologies/PEP.md) 型が優位**:
  - **最大のリスク**: 稼働中クライアントや保存データのサイレント破損、移行不能による障害。
  - **効く仕組み**: `Backwards Compatibility`（互換性影響の重大度、非推奨化期間、移行パス）を独立必須項目として審査することで、安全なマイグレーションを保証する。
- **Rust RFC 形式における後方互換性の収容パターン**:
  Rust RFC の構成をベースに運用する場合でも、後方互換性の議論は以下のように各セクションへ分散して収容できる：
  - **互換性破壊のリスク・不採用理由**: `Drawbacks` に記述（例: 既存 API や DB レコードとの互換性維持が不確実である点）。
  - **破壊を受け入れる妥当性と別案の検討**: `Rationale and alternatives` に記述（なぜ互換性を壊してでも新設計を選ぶのか、互換レイヤーを挟む別案がなぜ劣るのか）。
  - **移行手順・ワークアラウンドの詳細**: `Reference-level explanation`（内部の段階的移行・フォールバック実装）および `Guide-level explanation`（開発者・利用者のコード書き換えガイド）に記述。

## Relations

- 対をなす事後記録概念 (Concept):
  - [ADR](ADR.md) — アーキテクチャ決定をコードリポジトリ内で軽量・不変に記録する手法（Context → Decision → Consequences）。RFC Process（事前合意）と事後記録の両輪をなす。
- 下位の具体的実装 (Technology):
  - [Google Design Doc](../30%20Technologies/Google%20Design%20Doc.md) — Google における実装前技術設計書の標準化（Goals/Non-goals、横断的関心事、Alternatives）。
  - [PEP](../30%20Technologies/PEP.md) — Python における提案・仕様策定プロセスの具現化（Standards Track / Informational / Process の分類、Discourse 議論、Steering Council による採否判定）。
  - [PR-FAQ](../30%20Technologies/PR-FAQ.md) — Amazon における Working Backwards（顧客視点の模擬プレスリリースと社内外 FAQ）によるプロダクト提案。
  - [Rust RFC](../30%20Technologies/Rust%20RFC.md) — Rust 言語およびエコシステムにおける RFC プロセスの具現化（GitHub PR、サブチーム、FCP、Nightly feature gate 等による制度設計）。
- 関連する問題・問い (Issue 候補):
  - 分散コミュニティにおいてどのように技術的意思決定と仕様合意を行うべきか（How should distributed communities make technical decisions?）
- 関連する原理・概念 (Concept 候補):
  - ラフ・コンセンサス（Rough Consensus）: 全員一致ではなく強い反対の解消を基準とする合意形成モデル。

## Open questions

- OSS の RFC プロセスと企業内の Design Doc プロセスにおける、意思決定責任者（Owner）の権限と合意形成スピードの構造的な違い。
- プロセス疲弊（RFC fatigue）を防ぐためのトリアージ手法や事前スクリーニング基準のベストプラクティス。

## References

[^rfc3]: [RFC 3: Documentation Conventions](https://www.rfc-editor.org/rfc/rfc3) — S. Crocker (1969). RFC が権威的な通達ではなく、迅速でオープンなフィードバックを求めるためのメモランダムとして始まった経緯と初期ルールを確認。確認日: 2026-09-09.
[^rfc1000]: [RFC 1000: The Request for Comments Reference Guide](https://www.rfc-editor.org/rfc/rfc1000) — J. Reynolds, J. Postel (1987). 初代 RFC からの歴史的変遷と Steve Crocker による RFC 誕生の経緯の回顧を確認。確認日: 2026-09-09.
[^pep1]: [PEP 1 – PEP Purpose and Guidelines](https://peps.python.org/pep-0001/) — Python 開発における仕様策定・拡張提案プロセスの目的、種別（Standards Track, Informational, Process）、ワークフローを確認。確認日: 2026-09-09.
