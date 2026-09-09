---
aliases:
  - Python Enhancement Proposals
  - Python Enhancement Proposal
---
# PEP

## Summary

Python 言語仕様、標準ライブラリ、CPython リファレンス実装、開発プロセス、ガバナンスに対する新機能や重要な変更を提案・議論・合意形成するための公式設計文書（Design document）および仕様策定プロセス[^pep1]。[RFC Process](../20%20Concepts/RFC%20Process.md) の OSS 言語における代表的な実践例の一つ。

## Motivation

Python コミュニティが拡大する中で、新機能の提案や言語設計の変更をメーリングリスト上の散発的な議論や突発的なパッチに委ねるのではなく、技術仕様の明確化、設計根拠（Rationale）の明文化、コミュニティの合意形成（Consensus）、および歴史的な意思決定経緯の記録を一元的に管理する仕組みが必要とされた[^pep1]。

## Goals and non-goals

- **Goals**:
  - Python コミュニティに対する新機能・仕様・プロセスの明確かつ簡潔な技術仕様と設計根拠（Rationale）の提供[^pep1]。
  - 提案者（Champion / Author）によるコミュニティ合意形成と、反対意見（Dissenting opinions）の正確な記録[^pep1]。
  - Git リポジトリで管理される文書を通じた、恒久的な意思決定アーカイブの保持[^pep1]。
  - ガバナンス組織（Steering Council / PEP-Delegate）による客観的な採否判断の枠組み提供[^pep1][^pep13]。
- **Non-goals**:
  - 日常的なバグ修正や小規模なリファクタリングの形式化（通常の Issue / PR で対応）[^pep1]。
  - すべてのコミュニティメンバーによる完全な合意・全会一致（反対意見を記録した上で Steering Council が最終判断を下す）[^pep1]。

## User-level explanation

PEP の提案と閲覧は、文書の種別（PEP Types）とステータス（Lifecycle）を軸に理解される[^pep1]。

### 3つの PEP 種別 (PEP Types)
1. **Standards Track**: 言語仕様、標準ライブラリ、CPython 実装の変更や新機能、相互運用標準の提案[^pep1]。
2. **Informational**: Python の設計課題、一般的なガイドラインや情報をコミュニティに提供する文書（推奨・合意を必ずしも意味せず、従う義務はない）[^pep1]。
3. **Process**: 開発プロセス、ツール、ガバナンス、PEP 自体の運用ルール（PEP 1 自身や PEP 13 など）を定める文書。利用者は遵守が求められる[^pep1]。

### 必須構成要素 (Sections)
標準的な PEP（reStructuredText または Markdown）は、ヘッダ部（Author, Status, Type 等）に続き、以下の構造を持つ[^pep1]:
- **Abstract**: 提案の技術的要約。
- **Motivation**: 解決したい課題とユースケース。
- **Rationale**: 設計判断の理由、検討された代替設計と不採用理由。
- **Specification**: 実装者・利用者が理解できる詳細仕様。
- **Backwards Compatibility**: 後方互換性の影響と移行方針。
- **Security Implications**: セキュリティへの影響。
- **How to Teach This**: ドキュメントや教育への影響。
- **Reference Implementation**: 参照実装やプロトタイプ。
- **Rejected Ideas**: 検討されたが不採用となったアイデア。
- **Open Issues**: 残る未解決事項。

## Developer-level explanation

PEP の運用ワークフローは、アイデアの事前検証から最終採否・実装まで段階的に進行する[^pep1]:

1. **アイデアの事前スクリーニング (Idea phase)**:
   いきなり PEP を執筆するのではなく、Python Discourse（Ideas カテゴリ等）で事前議論を行い、既出の却下案でないか、コミュニティ全体に有益かを検証する[^pep1]。
2. **Sponsor の確保とドラフト提出**:
   コア開発者以外の著者は、コア開発者や PEP エディタなどの「スポンサー（Sponsor）」を見つけて助言を受け、`python/peps` リポジトリに PR として提出する[^pep1]。
3. **査読と議論 (Discussion & Iteration)**:
   PEP 番号が付与され、Discourse で公開議論を重ねながらドラフトを改訂する。著者は反対意見（Dissenting opinions）も PEP 本文に記録する義務を負う[^pep1]。
4. **判定 (Resolution)**:
   Steering Council（または指名された PEP-Delegate）が、合意形成状況と技術的妥当性を精査し、`Accepted` または `Rejected` を下す[^pep1][^pep13]。
5. **ライフサイクル管理**:
   `Draft` → `Accepted` → （実装完了）→ `Final`。あるいは `Rejected`、`Deferred`、`Withdrawn`、将来の PEP による `Superseded` など明確なステータス遷移を持つ[^pep1]。

## Design rationale

- **Author（Champion）による責任制**: アイデアの提出だけでなく、コミュニティ内の議論を導き、合意を形成し、反対意見をまとめる全責任を単一の推進者（または共著者チーム）に持たせることで、無責任なアイデア放置を防ぐ[^pep1]。
- **BDFL から Steering Council への移行**: 当初は Guido van Rossum（BDFL）単独の承認権限だったが、コミュニティ成熟と Guido の退任に伴い、選挙で選出される 5 名の Steering Council 体制（PEP 13）へ制度化された[^pep13]。権限の分散と民主的ガバナンスが PEP 採否の基盤となっている。
- **Rejected Ideas / Rationale の明文化**: 「なぜこの文法・API が採用されなかったのか」を記録することで、数年ごとに同じアイデアが再燃してコミュニティの議論リソースを浪費するのを防ぐ[^pep1]。
- **Backwards Compatibility の独立義務付け**: Python 2 から 3 への移行で生じたコミュニティ分断の反省と互換性ポリシーに基づき、既存コードに対する破壊的影響、重大度、非推奨化警告の期間、移行パスの事前検討を独立セクションとして必須化している[^pep1][^pep12]。

## Trade-offs and limitations

- **利点**:
  - 言語の長期的な設計一貫性（Zen of Python の原則維持）が守られる。
  - 過去四半世紀にわたる Python の進化の歴史と技術的文脈が、番号付きアーカイブとして完全に残っている。
  - 既存エコシステムへの後方互換性破壊や移行コストが事前に厳格に精査される。
- **費用・限界**:
  - PEP 成立までの議論コストとハードルが非常に高く、特に外部コントリビューターにとってはコア開発者スポンサーの獲得や長文ドラフトの作成が参入障壁となる。
  - コミュニティ規模が大きいため、Discourse での議論が過熱・長期化しやすい。
  - **提案自体の欠点に対する自己批判の弱まり**: [Rust RFC](Rust%20RFC.md) のように「なぜこの提案を採用すべきでないか（Why should we not do this?）」を強制する独立した Drawbacks セクションがなく、`Rejected Ideas`（他案の却下）や `Rationale` による正当化が中心となるため、提案そのものの副作用や言語複雑化への批判的検証が著者の主観に委ねられやすい。

## Alternatives

- **メーリングリスト / GitHub PR のみでの運用**:
  事前の重厚な文書化を行わず、Issue と PR で直接変更を議論する方式。小規模 OSS では迅速だが、Python 規模の言語では長期的一貫性の維持が困難。
- **他言語の RFC 方式**:
  - [Rust RFC](Rust%20RFC.md): 独立した `Drawbacks`（採用すべきでない理由）の記述を義務付け、提案者に自己批判を強く求める方式。一方で後方互換性の独立セクションは持たず、言語全体の Edition 機構や 1.0 安定性保証に依存する。また GitHub PR 上で直接 FCP（Final Comment Period）を回し、Subteams と Nightly feature gate を密結合させている。

## Prior art

- **IETF RFC**: 文書シリーズによって標準と意思決定をオープンに蓄積する形式の起源。
- **Tcl TIPs (Tcl Improvement Proposals)**: PEP とほぼ同時期（2000年）に提唱された言語機能拡張プロセス。

## Mental model

「Python に新しい法律を制定するための**法案提出・公開公聴会・議会（Steering Council）採決システム**。成立した法案（PEP）は永久に官報（peps.python.org）に保存される」。

## Open questions

- Discourse での議論規模の肥大化に伴う、コア開発者や Steering Council のレビュー負荷（Review fatigue）の軽減策。
- Typing Council（PEP 729）のように、専門領域ごとの権限委譲が今後どこまで進むか。

## References

[^pep1]: [PEP 1 – PEP Purpose and Guidelines](https://peps.python.org/pep-0001/) — B. Warsaw, J. Hylton, D. Goodger, A. Coghlan (2000–). PEP の目的、種別（Standards Track, Informational, Process）、ワークフロー、構成要件の正本。確認日: 2026-09-09.
[^pep12]: [PEP 12 – Sample reStructuredText PEP Template](https://peps.python.org/pep-0012/) — PEP 公式テンプレート。Backwards Compatibility セクションの必須要件および記述項目を確認。確認日: 2026-09-09.
[^pep13]: [PEP 13 – Python Language Governance](https://peps.python.org/pep-0013/) — Steering Council による Python 言語ガバナンスモデルの規定。PEP の最終決定権限の所在を確認。確認日: 2026-09-09.
