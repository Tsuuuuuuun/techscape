// 40 Surveys/<slug>/main.typ にコピーして編集する。外部パッケージ不要。
#set page(paper: "a4", margin: 24mm)
#set text(font: "Hiragino Mincho ProN", lang: "ja", size: 10.5pt)
#set par(justify: true, leading: 0.75em)
#set heading(numbering: "1.")
#let title = "Survey title"
#let author = "Author"
#let updated = "YYYY-MM-DD"

#align(center)[
  #text(size: 21pt, weight: "bold")[#title]
  #v(0.5em)
  #author / #updated
]

= Abstract
対象の問い、比較の観点、得られた理解と限界を短くまとめる。以下の案内文は完成時に本文に置き換える。

= Question and scope
この Survey が答える中心の問いと読者の前提。対象に含むもの・含めないもの、調査時点・版を示す。

= Problem and background
なぜこの問題が生じるか。Issue を起点に説明する。

= Conceptual framework
比較を理解するために必要な Concept と、比較軸を導入する。

= Approaches and comparison
ノートを順に貼るのではなく、アプローチごとに説明し、同じ軸で比較する。

#table(
  columns: (1fr, 2fr, 2fr),
  inset: 6pt,
  table.header([Approach], [Strength / condition], [Cost / limitation]),
  [Approach A], [適する条件], [制約],
  [Approach B], [適する条件], [制約],
)

= Synthesis
比較から導ける主張、適用条件、例外を説明する。事実と自分の解釈を区別する。重要な主張には対応する参照番号を添える。

= Knowledge gaps
結論を左右する不足と、次に検証すべき問い。自分の未理解と分野の未解決問題を区別する。

= Conclusion
中心の問いへの回答と限界をまとめる。

= Notes used
統合に使ったノートを特定できるよう、vault 相対パスを #raw("パス") で記載する。
// 例: #raw("10 Issues/How should memory be managed.md")

= References
外部資料未確認。使用時には実際に確認した原資料に置き換える。
// 書式例（実在資料で置換）:
// - [R1] 資料名、版、該当節、確認日。URL は #link("https://...")[資料名] と記述。
