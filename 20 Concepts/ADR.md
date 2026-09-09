---
aliases:
  - Architecture Decision Record
  - Architecture Decision Records
  - アーキテクチャ決定記録
---
# ADR

## Definition

ソフトウェア開発において、重要なアーキテクチャ上の決定事項、その背景・制約（Context）、および選択がもたらす結果・副作用（Consequences）を、ソースコードと同じリポジトリ内に軽量・不変（イミュータブル）に記録・蓄積する設計プラクティスおよびメンタルモデル[^nygard-adr]。

## Purpose

- **ドキュメントの形骸化（腐敗）防止**: Wiki や外部文書ツールと異なり、コード変更と同じ PR・Git 履歴で管理することで、コードと意思決定の乖離を防ぐ[^nygard-adr]。
- **「チェスタートンの柵（Chesterton's Fence）」の回避**: 新規参画者や将来の保守者が既存コードを見た際に、「なぜこの奇妙な構造・ライブラリ選定になっているのか（Why）」を理解できるようにし、過去に議論された失敗パターンの安易な再実装や誤った破壊を防ぐ[^nygard-adr]。
- **トレードオフ（代償）の明文化**: 決定のメリットだけでなく、将来にわたって受け入れた制約や運用コスト（Consequences）を記録し、後から検証可能にする。

## Mechanism

Michael Nygard が 2011 年に提唱し、ThoughtWorks Technology Radar や各種クラウド機関で標準化された手法は、以下の要素と原則で運用される[^nygard-adr]:

### 1. 標準構成（Nygard フォーマット）
1〜2 ページの短い Markdown 文書（`doc/adr/0001-record-architecture-decisions.md` 等）として記述する[^nygard-adr]:
- **Title**: 連番と決定内容を表す短い句（例: `0002-use-postgresql-for-user-store`）。
- **Status**: 決定の状態（`Proposed`, `Accepted`, `Rejected`, `Deprecated`, `Superseded by [ADR-0005](0005-xxx.md)`）。
- **Context**: 意思決定を促した状況・背景・技術的制約・ビジネス要件。
- **Decision**: 私たちが下した具体的かつ能動的な決定（「〜を採用する」「〜を禁止する」）。
- **Consequences**: この決定によって何が改善され、同時に**どのようなトレードオフ・負担・制約（負の影響）を背負うことになったか**。

### 2. 運用の3大原則
1. **コードとの同居（Co-location）**: ソースコードと同じ Git リポジトリ内にコミットし、コードレビューと同時に ADR のレビューを行う[^nygard-adr]。
2. **追記専用（Append-only / Immutability）**: 一度承認された過去の ADR は書き換えない。「当時の文脈における正しい判断」として履歴を保存する[^nygard-adr]。
3. **改定は Supersede（新 ADR で上書き）**: 方針が変わり別の技術に移行する場合は、新しい ADR を発行し、古い ADR のステータスを `Superseded by ADR-XXXX` と更新して相互リンクする[^nygard-adr]。

## Example

- **典型的な例**:
  「モノリスから特定サービスを切り出すか否か」「同期 REST API ではなく非同期メッセージング（Kafka 等）を採用する理由」「ORM を使わず生 SQL ビルダーを採用した理由」など、後戻りコスト（One-way door）が高い決定に適用される。
- **発展・派生フォーマット**:
  - **MADR (Markdown Architectural Decision Records)**: Nygard の最小形式に、検討した選択肢（Options considered）や Pros/Cons の比較欄を追加した拡張仕様。
  - **RFC との連携パイプライン（Spotify 型）**: 大規模な議論は社内 [RFC Process](RFC%20Process.md) で行い、合意形成された最終決定を ADR として各リポジトリに保存する運用。

## Properties and limits

- **成立条件**:
  - チームが「Consequences（背負った代償・制約）」を隠さず率直に書く心理的安全性と文化があること。
  - Git PR を通じたピアレビューが日常化していること。
- **限界と適用限界**:
  - **議論（ブレインストーミング）の場としては機能しない**: ADR は「決定した結果と文脈」を保存するスナップショットであるため、複数の関係者と代替案をゼロから議論する目的には [RFC Process](RFC%20Process.md) や [Google Design Doc](../30%20Technologies/Google%20Design%20Doc.md) が適する。
  - **件数増加に伴う検索性低下**: リポジトリ内の ADR が数十〜数百件に増えると、全体の依存関係や最新の有効なルールを把握しにくくなる（`adr-tools` などの CLI 支援やインデックス管理が必要）。

## Relations

- 対をなす事前合意概念 (Concept):
  - [RFC Process](RFC%20Process.md) — 事前提案・合意形成（RFC）と、事後記録・永続化（ADR）は、意思決定ライフサイクルの両輪を担う。
- 関連する具体的提案技術 (Technology):
  - [Google Design Doc](../30%20Technologies/Google%20Design%20Doc.md) — 実装前に広範なステークホルダーと議論するための先行設計書。
  - [PR-FAQ](../30%20Technologies/PR-FAQ.md) — 顧客価値から逆算するプロダクト提案フォーマット。
  - [Rust RFC](../30%20Technologies/Rust%20RFC.md) — OSS における事前合意形成の具現化。

## Open questions

- マイクロサービス環境において、リポジトリを跨ぐ横断的な ADR（全社共通の決定事項）をどのように発見・同期・管理すべきか。

## References

[^nygard-adr]: Michael Nygard (2011-11-15), [Documenting Architecture Decisions](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions) — Cognitect Blog. ADR フォーマット（Title, Status, Context, Decision, Consequences）および追記専用・コード同居運用の原典。
