---
aliases:
  - Working Backwards
  - 6-Pager
  - Amazon PR/FAQ
---
# PR-FAQ

## Summary

Amazon において、新製品や新機能の企画・意思決定を行う際に用いられる、顧客視点の模擬プレスリリース（Press Release）と質問回答集（FAQ）で構成された提案文書フォーマットおよび「Working Backwards（顧客からの逆算）」意思決定プロセス[^working-backwards]。

## Motivation

新規事業やプロダクト開発において、技術起点や社内都合で機能を作り始めると、完成した後に「誰も欲しがらない」「価値が伝わらない」という致命的な失敗に陥りやすい。また、スライド（PowerPoint）によるプレゼンテーションは要点を美辞麗句で誤魔化しやすく、厳密な思考や議論を阻害する。開発に着手する前に「完成した未来の顧客体験」を散文（ナラティブ）で明確に言語化し、徹底的に検証するための仕組みとして導入された[^working-backwards]。

## Goals and non-goals

- **Goals**:
  - 顧客が本当に抱えている課題と、新機能がもたらす具体的便益を開発前に証明する[^working-backwards]。
  - 曖昧さを許さない散文形式（ナラティブ）で論理の穴や非現実的な前提を炙り出す[^working-backwards]。
  - 会議の冒頭20〜30分を全員で黙読（沈黙の読書）に費やし、プレゼンスキルではなく文章自体の論理性で意思決定する[^working-backwards]。
- **Non-goals**:
  - 詳細な実装アーキテクチャやコード設計の記述（これらは必要に応じて技術設計書で別途扱う）。
  - 単なる社内向けの業務報告書の代替。

## User-level explanation

PR-FAQ は通常、最大 6 ページの散文（6-Pager）としてまとめられ、以下の3層で構成される[^working-backwards]:

1. **Press Release (1ページ)**:
   製品のリリース当日に顧客向けに発信される架空の公式発表文。
   - **見出し（Headline）**: 顧客が理解できる製品名と主要便益。
   - **副見出し（Sub-headline）**: 誰のための、何を実現する製品か。
   - **問題の要約（Problem）**: 顧客が直面している不満やペインポイント。
   - **解決策（Solution）**: 製品がどのようにその問題をエレガントに解決するか。
   - **社内リーダーの引用（Leader Quote）**: なぜ自社が情熱を持ってこれを作ったのかのビジョン。
   - **架空の顧客の感想（Customer Quote）**: 実際に使った顧客がどう喜んでいるかのリアルな声。
   - **行動喚起（Call to Action）**: どこで入手・利用開始できるか。
2. **External FAQ（外部向けFAQ: 顧客の疑問）**:
   - 利用料金・プランはどうなるか？
   - 既存サービスや他社製品との違いは何か？
   - プライバシーやデータはどう保護されるか？
3. **Internal FAQ（内部向けFAQ: 社内の厳しい現実検証）**:
   - なぜ競合他社ではなく自社がやるべきなのか？
   - 損益分岐点（ユニットエコノミクス）やインフラコストの見積もりは？
   - 技術的リスク・他チーム依存・ブロッカーは何か？
   - 失敗したときの撤退基準（Kill criteria）は何か？

## Developer-level explanation

PR-FAQ の運用ワークフローと会議文化は独特の規律を持つ[^working-backwards]:

1. **Working Backwards（逆算執筆）**:
   アイデアが出た瞬間、コードやスライドではなく、まず PR-FAQ を執筆する。1ページにまとまらない（顧客価値を簡潔に語れない）アイデアは、その時点で企画を練り直す。
2. **サイレント・リーディング（沈黙の読書）**:
   意思決定会議の場では、発表者によるプレゼンは行われない。会議開始後、全員が紙に印刷された PR-FAQ を無言で20〜30分間通読し、余白にメモや疑問を書き込む。
3. **ページ単位の質疑応答**:
   全員の通読が完了した後に初めて、1ページ目から順に論点や疑問を徹底的に詰め、経営陣・チームで採否を判断する。

## Design rationale

- **プレゼンテーション（PowerPoint）の禁止**: スライド箇条書き（Bullet points）は因果関係を隠蔽しやすく、発表者の話術に意思決定が左右される。散文（ナラティブ）を義務付けることで、論理の飛躍を強制的に排除する[^working-backwards]。
- **顧客の言葉で語る強制**: プレスリリースという形式をとることで、「内部アーキテクチャの都合」ではなく「顧客から見た価値（[Rust RFC](Rust%20RFC.md) でいう Guide-level / Mental model）」を最優先で定義させる。

## Trade-offs and limitations

- **利点**:
  - 顧客価値が曖昧な「車輪の再発明」や「自己満足の機能」を初期段階で確実に打ち切ることができる。
  - 会議前の事前準備（資料読み込み）を参加者に強制せず、会議時間内で公平かつ深い議論ができる。
- **費用・限界**:
  - 散文で説得力のある PR-FAQ を執筆するには高度な言語化能力が必要で、ドラフト作成に多大な時間を要する。
  - 技術的な実現可能性（Feasibility）の検証が Internal FAQ に依存するため、エンジニアリング視点の精査が不足すると絵に描いた餅になりやすい。

## Alternatives

- **[Google Design Doc](Google%20Design%20Doc.md)**:
  プロダクト価値ではなく、エンジニアリングアーキテクチャ、スケーラビリティ、横断的技術課題を精査する技術設計書。
- **[RFC Process](../20%20Concepts/RFC%20Process.md)**:
  分散コミュニティで仕様・プロトコル変更の合意形成を図るための公開プロセス。

## Mental model

「完成披露パーティーの挨拶文（プレスリリース）を、家を建てる前に書いてみる。顧客が拍手してくれないなら、基礎工事（コーディング）を始めてはならない」。

## References

[^working-backwards]: Colin Bryar, Bill Carr (2021), *Working Backwards: Insights, Stories, and Secrets from Inside Amazon*, St. Martin's Press — Chapter 3: "Working Backwards: The PR/FAQ and Other Tools" & Chapter 4: "Organizing: Autonomous Teams". PR/FAQ の構成、6-Pager の運用、沈黙の読書文化を確認。
