
+++
PAGEsection_name = "Simple World Heatmaps in Julia"
hascode = true
hasmath = true
#showall = true
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


<!-- \Fcode{open}{
```julia:./code/file_code01
x = 2
y = 3

@show log(y)
```
}\Foutput{open}{\textoutput{./code/file_code01}} -->

<!-- =====================================================================================================
                                                        SECTION 
========================================================================================================== -->
\begin{section}{title= "Summary"}

@@itemNoSpace
* \textbf{Goal}: To draw simple heatmaps of world maps In Julia, to represent country statistics. The approach allows you to handle all the data and statistics with DataFrames in Julia, and then calls `ggplot` from R to provide the heatmap. I also provide a cleaned dataset for map coordinates, where countries are identified by ISO codes. This circumvents some inconsistencies with the datasets provided by R.

* \textbf{Relevance of the Note}: I was looking for a way to draw heatmaps in world maps in Julia. However, the existing packages are overkill for this purpose: they have way more functionalities than needed for simple uses, requiring investing too much time for just simple cases. Based on it, I provide a simple approach if your aim is to
    * represent country statistics on a world map through a heatmap, and
    * use Julia's DataFrames to handle the data.
@@


Representing each country's share of the world income, the \textbf{final outcome} would be as follows
\justimg{auto}{370px}{/PAGES/assets/03_maps/file_graph01.svg}

So we need `ggplot` and \kbd{Ctrl+Enter} to run the code.

\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Working with our DataFrame in Julia"}


\subtitle{The Packages}

s
\Fcode{open}{Loading Packages}{
\input{julia}{/assets/PAGES/04_maps/code/region1}
}

Recall that any code we write between `R"""` and `"""` is interpreted as R code. We can use this to load the `ggplot2` package in R, which we will use to draw the heatmap. We also load the `DataFrames` package in Julia, which we will use to handle the data. Finally, we load the `CSV` package in Julia, which we will use to read the data from a CSV file.


\html{<h3>The (Fake) Data</h3>}
We create some fake data to represent the share of income of each country in the world. 

\Fcode{closed}{Code to Create Fake Data}{
\input{julia}{./code/region2}
}

\FgreenCode{open}{Output}{
\output{./code/region2}
}

\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Adding Map Coordinates to the Data"}
We create some fake data to represent the share of income of each country in the world. We create some fake data to represent the share of income of each country in the world. We create some fake data to represent the share of income of each country in the world. 


\Fcode{closed}{Merging Datasets}{
\input{julia}{./code/region3}
}


\FgreenCode{open}{Output}{
\output{./code/region3}
}

So now we can compare it with
\Fcode{open}{Sending Data to R}{
\input{julia}{./code/region4}
}

And Finally

\Fcode{open}{Sending Data to R}{
\input{julia}{./code/region7}
}


\modal{hola}{this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that }




\end{section}


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Eye Candy"}

\remark{hola hola hola this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that }
this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 


\warning{hola hola hola this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that }
this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 






\end{section}


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "new"}
this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 

<!-- \newcommand{\Fouthtml}[1]{~~~<pre><code class="language-julia" style="text-indent:-0.55em;margin:auto;padding-bottom:1em">~~~#1~~~</code></pre>~~~} -->

\hideTabs{open}{}{
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_31"> ad </button>
    <button class="tablink" data-id="tab_32"> ddd </button>
</div><div data-id="tab_31" class="tabcontent active">}

\input{julia}{./code/region7}

\FoutputModal{open}{\output{./code/region5}}

\html{</div><div data-id="tab_32" class="tabcontent">}

\FEouthtml{\input{julia}{./code/region5.jl}}{<br>
<br>
<br>
<br>
<br>
<br>
<br>}{-2.78em}

\FoutputModal{open}{\output{./code/region3}}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}

this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 





\end{section}


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "asd"}

this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 

\Fcode{open}{Code to Create Fake Data}{
\input{julia}{./code/region2}
}
\FoutputInline{open}{\output{./code/region2}}


this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 

\end{section}


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "vvv"}

this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 
this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that this is that 

\hideTabs{open}{}{
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_101"> ad </button>
    <button class="tablink" data-id="tab_102"> ddd </button>
</div><div data-id="tab_101" class="tabcontent active">}

\input{julia}{./code/region7}

\FoutputModal{open}{\output{./code/region5}
\html{
<br>
<br>
<br>
<br>
<br>
<br>
}     }

\html{</div><div data-id="tab_102" class="tabcontent">}

\FEouthtml{\input{julia}{./code/region5.jl}}{<br>
<br>
<br>
<br>
<br>
<br>
<br>}{-2.78em}

\FoutputModal{open}{\output{./code/region3}}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}

asdfs
\hideTabs{open}{}{    
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_301"> ad </button>
    <button class="tablink" data-id="tab_302"> ddd </button>
</div><div data-id="tab_301" class="tabcontent active">}

\input{julia}{./code/region5}

\html{</div><div data-id="tab_302" class="tabcontent">}

\input{julia}{./code/region7}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}


fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 
fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 
fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 
fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 

fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 
fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 
fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd fsd 





\end{section}