module Data exposing (..)

import Array


data : Array.Array ( String, List String )
data =
    Array.fromList <| List.map2 Tuple.pair commands results


commands =
    [ "O.ZiH<ESC>x3D$D<ESC>"
    , "x3D$D<ESC>1gqDI<ESC>"
    , "1gqDI<ESC>Zgw1V<ESC>"
    , "Zgw1V<ESC>m1kJq<ESC>"
    , "m1kJq<ESC>hVkcG<ESC>"
    , "hVkcG<ESC>Degi2<ESC>"
    , "Degi2<ESC>Rnnk2<ESC>"
    , "Rnnk2<ESC>GChOe<ESC>"
    , "GChOe<ESC>aarCu<ESC>"
    , "aarCu<ESC>EotIQ<ESC>"
    , "EotIQ<ESC>YLiAz<ESC>"
    , "YLiAz<ESC>GSV3i<ESC>"
    , "GSV3i<ESC>qGlyX<ESC>"
    , "qGlyX<ESC>fBa$.<ESC>"
    , "fBa$.<ESC>klLzz<ESC>"
    , "klLzz<ESC>kajP1<ESC>"
    , "kajP1<ESC>aaH3R<ESC>"
    , "aaH3R<ESC>Vsmip<ESC>"
    , "Vsmip<ESC>cODQL<ESC>"
    , "cODQL<ESC>gLRUH<ESC>"
    , "gLRUH<ESC>pmOOd<ESC>"
    , "pmOOd<ESC>SKcWK<ESC>"
    , "SKcWK<ESC>OIz22<ESC>"
    , "OIz22<ESC>AjTCi<ESC>"
    , "AjTCi<ESC>tkBP1<ESC>"
    , "tkBP1<ESC>ppVWu<ESC>"
    , "ppVWu<ESC>iwPzb<ESC>"
    , "iwPzb<ESC>ss3Dn<ESC>"
    , "ss3Dn<ESC>iOZsG<ESC>"
    , "iOZsG<ESC>rdePb<ESC>"
    , "rdePb<ESC>CVdjr<ESC>"
    ]


results =
    [ [ "The quick brown fox"
      , "jumped over"
      , "."
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "th"
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "G"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "2"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jnnk2ed over"
      , "the"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "thennk2y dog."
      , " The quick brown fox jumped"
      , " hOe"
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " hOearCu"
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the arCulazy dog."
      , "tIQ"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , "tIQ"
      , " The quick brown fox jumped"
      , " Azover the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " V3i"
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " V3i"
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " TjP1he quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumpjP1aH3Red over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "mip"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "mip"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , "d"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , "KcWK"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "Iz22"
      , "KcWK"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "Iz22jTCi"
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog.jTCi"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , "the lazy dog."
      , "the lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "the lazy dog."
      , "the lazy dog."
      , "wPzbthe lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "thewPzs3Dn lazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "thes3DOZsGnlazy dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "theOZsd laz y dog."
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    , [ "The quick brown fox"
      , "jumped over"
      , "Vdjr"
      , " The quick brown fox jumped"
      , " over the lazy dog."
      ]
    ]
