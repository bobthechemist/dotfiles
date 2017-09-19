"
"Provide option to change default location of pandoc
if !exists("pandoc_cmd")
  let pandoc_cmd = shellescape('e:\Programs\pandoc\pandoc.exe')
endif
"Provide pandoc options
if !exists("pandoc_opts")
  let pandoc_opts = '-f markdown --mathjax -t html  -s -o'
endif
"CSS file to use
if !exists("pandoc_css")
  let pandoc_css = shellescape($HOME.'\vimfiles\scripts\pandoc.css')
endif

" Output filename
let md2html_out = shellescape(expand("%:p:r").".html")

" The translation command
let md2html_cmd = pandoc_cmd.' '.shellescape(expand("%:p")).' -c '.pandoc_css.' '.pandoc_opts.' '.md2html_out

" Execute the conversion
call system(md2html_cmd)

" Preview the results
silent! call system('start /b '.md2html_out)


