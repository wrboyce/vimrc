source <sfile>:p:h/_global.vim


" this doesn't work - I'm not sure why
syntax match ppyNotIn "\<not in\>" conceal cchar=∉

syntax keyword pyOr or conceal cchar=∨
syntax keyword pyAnd and conceal cchar=∧
syntax keyword pyLambda lambda conceal cchar=λ
syntax keyword pyIn in conceal cchar=∈

