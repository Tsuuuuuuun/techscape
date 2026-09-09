---
aliases:
  - Rust Request for Comments
---
# Rust RFC

## Summary

Rust プロジェクトにおいて、言語仕様、標準ライブラリ、ツールチェーン（Cargo 等）、コンパイラ内部、またはプロジェクト運営方針に対する重要または破壊的な変更（substantial changes）を提案・議論・合意形成するための、[RFC Process](../20%20Concepts/RFC%20Process.md) に基づく公開仕様策定プロセスおよび文書テンプレート[^template]。

## Motivation

分散したオープンソースコミュニティにおいて言語やエコシステムを進化させる際、思いつきの実装や単なる PR では長期的な一貫性や保守性が損なわれやすい。変更の必要性をユーザーが直面している具体的な課題に根ざして説明し、具体的な利用シナリオ、実装仕様、代替案、トレードオフを事前に広く議論・合意するための仕組みとして導入された[^template]。

## Goals and non-goals

- **Goals**:
  - 変更の動機（Motivation）とユースケースを事前に明確化する[^template]。
  - 「教育・メンタルモデル（Guide-level）」と「実装詳細（Reference-level）」を分離して記述し、利用者影響と実装可能性の両面を精査する[^template]。
  - 提案のデメリット（Drawbacks）や代替案（Alternatives）を設計空間の中で比較検討させる[^template]。
  - 議論段階で解決すべき点と、安定化（stabilization）までに解決すべき未解決事項（Unresolved questions）を区別して管理する[^template]。
- **Non-goals**:
  - 小規模なバグ修正や内部リファクタリングなど、ユーザー体験や外部仕様に実質的な影響を与えない変更の形式化（通常の PR で対応）。
  - RFC 提出時点で細部の実装まで完全に固定すること（未解決事項を許容し、Nightly 実装やコミュニティ議論を経て洗練させる）[^template]。

## User-level explanation

Rust RFC を執筆・閲覧する際は、公式テンプレート（`0000-template.md`）の以下の主要セクションを通して提案内容を理解する[^template]:

1. **Summary**: 機能の要約（1段落程度）。
2. **Motivation**: ユーザーが抱えている課題・背景と、それを解決する具体的なユースケース。
3. **Guide-level explanation**: 新機能がすでに Rust に存在すると仮定し、別の Rust プログラマに教える形式で書く説明。新しい概念、具体例、メンタルモデル、コードの可読性・保守性への影響を扱う。
4. **Reference-level explanation**: 技術的・実装者向けの詳細仕様。他機能との相互作用、実装方針、エッジケースの挙動。
5. **Drawbacks**: この変更を採用すべきでない理由やデメリット。
6. **Rationale and alternatives**: なぜこの設計が最善なのか、検討された他の設計案と不採用の理由、何もしない場合の影響。
7. **Prior art**: 他言語や他コミュニティでの先行事例、関連論文、成功・失敗の教訓。
8. **Unresolved questions**: RFC マージ前、あるいは機能安定化（stabilization）までに解決すべき論点、および今回スコープ外とする関連課題。
9. **Future possibilities**: 今回の RFC を踏まえた将来的な拡張性や発展的アイデア。

## Developer-level explanation

RFC プロセスは GitHub 上のプルリクエストと Issue を連携させて進行する[^template]:

1. **RFC PR の提出**: 提案者はテンプレートに沿ってドラフトを作成し、`rust-lang/rfcs` リポジトリに PR を作成する[^template]。
2. **レビューと合意形成**: サブチーム（Lang, Libs, Compiler 等）およびコミュニティ全体で議論し、FCP（Final Comment Period）を経て受理（merge）またはクローズされる。
3. **Tracking Issue と Nightly 実装**: 受理された RFC は `rust-lang/rust` リポジトリに Tracking Issue が立てられ、Nightly チャンネルでフィーチャーフラグ（feature gate）付きで実験的実装が行われる[^template]。
4. **安定化（Stabilization）**: 実装のフィードバックや Unresolved questions の解消が完了した段階で、安定版（Stable）へ昇格する。

## Design rationale

- **Guide-level と Reference-level の分離**: 「使う側の直感・学びやすさ」と「作る側の厳密さ」を意図的に切り離すことで、理論上正しくても人間にとって扱いにくい設計や、逆に教育しやすいが実装上破綻する設計を早期に検出する[^template]。
- **Drawbacks と Rationale and alternatives の義務付け**: 提案者に自己批判と代替案の比較を強制することで、機能の過剰追加（feature creep）を防ぎ、トレードオフを納得した上で選択させる[^template]。
- **先行事例（Prior art）の調査推進**: 他言語（Haskell, C++, Swift 等）の知見を取り入れ、既知の失敗パターンを回避する[^template]。

## Trade-offs and limitations

- **利点**:
  - 「なぜこの設計になったのか」という文脈と意思決定の記録が半永久的に残る。
  - 実装前に多角的なフィードバックを得ることで、破壊的変更のリスクを低減できる。
- **費用・限界**:
  - 合意形成までに多大な時間と議論コストを要する。
  - RFC が受理されても、実装者リソースが確保できず放置される（tracking issue が長期滞留する）ケースがある。
  - **後方互換性・移行議論の構造的欠落**: テンプレートに [PEP](PEP.md) のような独立した「Backwards Compatibility」セクションが存在しない。破壊的変更は言語全体の Edition 機構や 1.0 安定性保証に委ねられているため、型推論の曖昧化や構文競合といった既存エコシステムへの微細な影響や移行パスの精査が、提案者の自発性に依存しやすい。

## Alternatives

- **[PEP](PEP.md) (Python Enhancement Proposals)**:
  後方互換性（Backwards Compatibility）を必須独立項目として厳格に審査する一方、提案自体の不採用理由（Drawbacks）を直接書かせる独立節は持たず、他案の却下理由（Rejected Ideas）の記録に重きを置く。

## Mental model

「機能の実装コードを書く前に、**製品説明書（Guide）**・**設計仕様書（Reference）**・**ボツ案比較表（Alternatives）** をすべて 1 つの企画書にまとめ、全員でピアレビューにかける仕組み」。

## References

[^template]: [rust-lang/rfcs 0000-template.md](https://github.com/rust-lang/rfcs/blob/master/0000-template.md) — Rust RFC の公式テンプレート。セクション構成（Motivation, Guide/Reference-level explanation, Drawbacks, Rationale and alternatives, Prior art, Unresolved questions, Future possibilities）およびプロセスの枠組みを確認。確認日: 2026-09-08。
