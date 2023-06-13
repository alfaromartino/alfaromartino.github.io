
+++
PAGEsection_name = "Tutorial for the Website"
hascode = true
hasmath = true

title = PAGEsection_name

#include("PAGES\\rough\\04_maps\\code_split_gather.jl")

#= DO NOT DELETE
sections = Pair{String,String}[]
dftoc      = globvar(:dftoc)
local_page = locvar(:fd_rpath)

[include("julia_utils\\$(file)") for file in readdir("julia_utils")]
(section_number, section_letter, section_title)  = create_sectionTitle(dftoc, local_page, section_name)
section_letter = section_letter         #Franklin doesn't recognize tuple assignation as locvars
section_number = section_number         #Franklin doesn't recognize tuple assignation as locvars

title = section_title
prev_page = get_prevpage(dftoc, local_page)
next_page = get_nextpage(dftoc, local_page) =#
+++


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "TESTING OUTPUTS"}

this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 
this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 
this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 

\subtitle{no margins or paddings - won't be used directly}

\JoutputNoFormat{x = [1,2,3]}{
3-element Vector{Int64}:
 1
 2
 3}

And 

\FoutputNoFormat{\output{./code/region3}}
\output{./code/region3}


\subtitle{with div adding paddings and margins for inline - won't be used directly}

\JoutputInline{x = [1,2,3]}{
3-element Vector{Int64}:
 1
 2
 3}
\\

\FoutputInline{\output{./code/region3}}

\subtitle{Only one form of output - with tab and title to hide}

We don't add padding-top or margin-top to the whole div, because it uses the separation between paragraphs. 

\Joutput{open}{x = [1,2,3]}{
3-element Vector{Int64}:
 1
 2
 3}

\Foutput{open}{\output{./code/region3}}


\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "MIXED OUTPUTS inline"}

this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 
this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 
this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 

\subtitle{Adding julia repl to franklin output - no format}

\MoutputNoFormat{x = [1,2,3]}{\output{./code/region3}}
\\

\subtitle{Franklin Output with Julia repl - no format}

\fout{x = [1,2,3]}{\output{./code/region3}}
\\


\subtitle{Franklin Output with Julia repl - format}

\JFout{x = [1,2,3]}{\output{./code/region3}}
\\


\subtitle{Mixed outputs}

Overall, this is how we apply it

\mouts{open}{
\fout{x = [1,2,3]}{\output{./code/region3}}\\
\Jout{x = [1,2,3]}{
3-element Vector{Int64}:
 1
 2
 3}
}

Overall, this is how we apply it


\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "CODE"}

this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 
this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 
this is to test this is to test this is to test this is to test this is to test this is to test this is to test this is to test 

```julia
x = 3
y = 4

function f(x,y)
    return x + y
end
```


\codeNoFormat{
```julia
x = 3
y = 4

function f(x,y)
    return x + y
end
```
}
\\
\codeInline{
```julia
x = 3
y = 4

function f(x,y)
    return x + y
end
```
}




\code{open}{
```julia
x = 3
y = 4

function f(x,y)
    return x + y
end
```
}


\Fcode{\input{julia}{./code/region3}}

\codeblue{open}{This is Some Code}{\input{julia}{./code/region3}}

\end{section}