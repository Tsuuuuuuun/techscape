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

## Mechanism

一般的に以下の要素とライフサイクルで構成される：

1. **標準化された提案テンプレート**:
   単なるアイデア表明にとどまらず、動機（Motivation）、具体的な仕様（Specification）、代替案（Alternatives / Prior art）、未解決課題（Unresolved questions）などの必須記述項目を定め、提案者に多角的な考察を促す[^pep1]。
2. **公開レビュー期間**:
   Issue トラッカー、プルリクエスト、メーリングリスト等を通じて、コミュニティやレビュー担当者からのフィードバックを非同期に受け付ける。
3. **合意形成（Consensus）と収束基準**:
   単純な多数決ではなく、技術的な懸念点（Blocking concerns）の解消を重視する合意形成（ラフ・コンセンサス等）を経て、責任組織・サブチームが承認／却下の意思決定を行う。
4. **ステータス遷移（Lifecycle）**:
   `Draft`（下書き）→ `Proposed / Under Review`（レビュー中）→ `Accepted`（採択）/ `Rejected`（却下）→ `Implemented`（実装完了）/ `Final`（確定）といった状態遷移で進行を追跡する[^pep1]。

## Example

- **ARPANET / IETF RFC**: 1969年に Steve Crocker が提案した技術メモが起源。完成した規格の通達ではなく、「コメントを求める（Request for Comments）」という非権威的・協調的な草案共有として始まった[^rfc3][^rfc1000]。
- **言語・OSS プロジェクトへの展開**: Python の PEP（Python Enhancement Proposals）[^pep1] や [Rust RFC](../30%20Technologies/Rust%20RFC.md)、Swift Evolution、React RFC など、現代の大規模 OSS の多くが自プロジェクトの意思決定機構として導入している。また、企業のエンジニアリング組織における Design Doc や提案制度としても応用されている。

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

## Relations

- 下位の具体的実装 (Technology):
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
