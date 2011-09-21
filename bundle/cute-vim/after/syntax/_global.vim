if !has('conceal') || &enc != 'utf-8'
    finish
endif

setlocal conceallevel=2
hi link Conceal Operator

if exists('g:genericCuteness')
    syntax match genericAsterisk "*" conceal cchar=★
endif

if !exists('g:noCuteMaths')
    syntax match mathsApproximatelyEqualTo "~=" conceal cchar=≈
    syntax match mathsNotEqualTo "!=" conceal cchar=≠
    syntax match mathsLessThanEqualTo "<=" conceal cchar=≤
    syntax match mathsMuchLessThan "<<" conceal cchar=≪
    syntax match mathsGreaterThanEqualTo ">=" conceal cchar=≥
    syntax match mathsMuchGreaterThan ">>" conceal cchar=≫

    syntax keyword mathsPi pi conceal cchar=π
    syntax keyword mathsInfinity infinity conceal cchar=∝
endif
