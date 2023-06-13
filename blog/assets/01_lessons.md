
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

This acts as a showcase of how to work with the different commands in Franklin's template. 

Suppose there's only one file to be executed in Julia, called `world_map.jl`. This file should already be adapted for the use of the page, by including code regions. This means that we should split the code by writing every part as the following.



\Fcode{open}{
```julia
###code <name of the code chunk> (((

<all the content to be copied>

###)))
```
}

For example, if we give the name `region01` to a code chunk, this should start with `###code region1 (((`, and then place `###)))` at the end of the code chunk. 

This Julia file should be placed at `ponderingBarks\\PAGES\\calculations\\00_lessons`. Additionally, we need to place in that folder a file
similar to `execute_codeSplitGather.jl` (it can have any name), where we need to specify:

\Fcode{open}{
```julia
#name of PAGE in Franklin 
page_folder = "00_lessons"

#location of julia file
filejl      = "$(folderBlog.rough)\\$(page_folder)\\world_map.jl"
```
}


We need to run `execute_codeSplitGather.jl`. This captures the code and output, and places it in the assets of the page. Given that everything is in assets, we can use in Franklin the shortcut  `./code/region01` to call it `region01`. Furthermore, we'll be able to call the Julia code at any place in the document by `input{julia}{./code/region01}` and the output by `output{./code/region01}`. Notice there's no need to indicate that the output is in the Julia language, but it's needed for the code.




\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Bullets"}

To use bullets, use this template.

@@itemNoSpace
* \textbf{Goal}: To draw simple heatmaps of world maps In Julia, to represent country statistics. The approach allows you to handle all the data and statistics with DataFrames in Julia, and then calls `ggplot` from R to provide the heatmap. I also provide a cleaned dataset for map coordinates, where countries are identified by ISO codes. This circumvents some inconsistencies with the datasets provided by R.

* \textbf{Relevance of the Note}: I was looking for a way to draw heatmaps in world maps in Julia. However, the existing packages are overkill for this purpose: they have way more functionalities than needed for simple uses, requiring investing too much time for just simple cases. Based on it, I provide a simple approach if your aim is to
    * represent country statistics on a world map through a heatmap, and
    * use Julia's DataFrames to handle the data.
@@


Representing each country's share of the world income, the \textbf{final outcome} would be as follows

    \justimg{auto}{370px}{/assets/PAGES/04_maps/graphs/file_graph01.svg}


So we need `ggplot` and \kbd{Ctrl+Enter} to run the code.

\end{section}


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Code"}

From now on, we'll suppose that each portion of code is called `region1`, `region2`, etc. Recall that both the codes and outputs can be called by the path `./code/region1` and `./output/region1`, respectively.

Simple code, open or closed: `\code{open}{\input{julia}{./code/region3}}`, which automatically adds the title Code.

\Fcode{open}{\input{julia}{./code/region3}}

And, moreover `\Fcode{open}{Title you choose}{\input{julia}{./code/region3}}`, with the title you choose. 

\Fblue{open}{Title you choose}{\input{julia}{./code/region3}}

We can do exactly the same with the outputs.
\Foutput{open}{\output{./code/region2}}

And similarly, we can choose the title.
\Fgreen{open}{Title you choose}{\output{./code/region3}}

It's easy to define the same with other colors if needed. 

We can also combine both code and output, and choose between making them separate or one next to the other. In case they're separated:

\Fcode{open}{\input{julia}{./code/region3}}
\Foutput{open}{\output{./code/region3}}

If we want them together:

\Fcode{open}{\input{julia}{./code/region3}}
\FoutputBelow{open}{\output{./code/region3}}

Allowing us to use a code and output with user-defined titles

\Fblue{open}{This is some Code}{\input{julia}{./code/region3}}
\FgreenBelow{open}{This is some Output}{\output{./code/region3}}

\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Code Without Using a File"}

You can still add code directly into the document, without the need of writing it in a file. To add a copy button and have a specific layout, you can use all the functions above. 

\Fcode{open}{
```julia
x = 2
y = 3

x + y
```
}


\FMoutput{open}{
\mixline{dff}{\output{./code/region3}}
\replline{x = [1,2,3]}{3-element Vector{Int64}:
 1
 2
 3}
\mixline{dff}{\output{./code/region3}}}

I checked that the layout holds irrespective of the order of the mixlines. It uses `~~~\juliarepl~~~` to insert the `julia>` prompt in green.

\end{section}

<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "TO DO"}

Add output as a pic. 
\end{section}
<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "Modal Code"}

We have multiple possibilities when it comes to adding code in a modal. They depend on whether we include both code and output, and what kind of output (the same output for each code tab, one or multiples output)

The 1st option is having multiple codes, but no output. Notice that codes have a different number of lines, and JS will take care of the height of the modal. Notice that `input` is separated by one line, otherwise the code will be wrongly displayed.

\hideTabs{open}{}{    
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_01"> ad </button>
    <button class="tablink" data-id="tab_02"> ddd </button>
</div><div data-id="tab_01" class="tabcontent active">}

\input{julia}{./code/region5}

\html{</div><div data-id="tab_02" class="tabcontent">}

\input{julia}{./code/region7}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}

The 2nd option is to have multiple codes and one output. This arises when we want to compare several methods to obtain the same result. The procedure is the same and just requires adding the output next to the modal—the margin-bottom of `hide_tab` has been adjusted for this to happen. 

\hideTabs{open}{}{    
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_11"> ad </button>
    <button class="tablink" data-id="tab_12"> ddd </button>
</div><div data-id="tab_11" class="tabcontent active">}

\input{julia}{./code/region5}

\html{</div><div data-id="tab_12" class="tabcontent">}

\input{julia}{./code/region7}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}
\FoutputBelow{open}{\output{./code/region3}}

The 3rd option refers to no code and multiple outputs. 


\hideTabsOutput{open}{}{
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper_output">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_21"> ad </button>
    <button class="tablink" data-id="tab_22"> ddd </button>
</div><div data-id="tab_21" class="tabcontent active">}

\output{./code/region5}

\html{</div><div data-id="tab_22" class="tabcontent">}

\output{./code/region3}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}


The 4th option is the most tricky one. It arises when we want a modal with multiple codes exhibiting different results.

\end{section}



<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "APPROACH FOR OUTPUTS"}

Suppose we want to combine modals and the multiple approaches for showing outputs. The following are methods that take into account the differences in the number of lines of the code.

This seems it'll become the way we'll implement everything related to outputs. 


\hideTabsOutput{open}{}{
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper_output">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_41"> ad </button>
    <button class="tablink" data-id="tab_42"> ddd </button>
</div><div data-id="tab_41" class="tabcontent active">}

\FmodalOutput{
\mixline{dff}{\output{./code/region3}}
\replline{x = [1,2,3]}{3-element Vector{Int64}:
 1
 2
 3}
\mixline{dff}{\output{./code/region3}}
}

\html{</div><div data-id="tab_42" class="tabcontent">}

\FmodalOutput{
\mixline{dff}{\output{./code/region3}}
\replline{x = [1,2,3]}{3-element Vector{Int64}:
 1
 2
 3}
\mixline{dff}{\output{./code/region3}}
}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}

\end{section}


<!-- =====================================================================================================
                                                    SECTION
========================================================================================================== -->
\begin{section}{title= "modals with new approach"}

This option is multiple codes and the same output. We can use any method, because `FoutputBelow` accepts directly `output` or `mixline` and `replline`.

\hideTabs{open}{}{    
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_51"> ad </button>
    <button class="tablink" data-id="tab_52"> ddd </button>
</div><div data-id="tab_51" class="tabcontent active">}

\input{julia}{./code/region5}

\html{</div><div data-id="tab_52" class="tabcontent">}

\input{julia}{./code/region7}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}
\FoutputBelow{open}{\FmodalOutput{
\mixline{dff}{\output{./code/region3}}
}}

\replline{x = [1,2,3]}{3-element Vector{Int64}:
 1
 2
 3}
\mixline{dff}{\output{./code/region3}}






\hideTabs{open}{}{    
<!-- #region -->
<!-- ================================ HORIZONTAL CODE ==============================  -->
\html{
<div class="tab_wrapper_mixed">
 <div class="tab_code_links">
    <button class="tablink first_tab active" data-id="tab_61"> ad </button>
    <button class="tablink" data-id="tab_62"> ddd </button>
</div><div data-id="tab_61" class="tabcontent active">}

\html{<div style="height:390px;">}\input{julia}{./code/region5} \html{</div>}
\html{<div class="mixed_container">}\FmodalOutputA{\mixline{dff}{\output{./code/region3}}} \html{</div>}

\html{</div><div data-id="tab_62" class="tabcontent">}

\html{<div style="height:390px;">}\input{julia}{./code/region7} \html{</div>}
\html{<div class="mixed_container">}\FmodalOutputA{\mixline{dff}{\output{./code/region3}}} \html{</div>}

\html{</div></div>}
<!-- end HORIZONTAL CODE ==============================  -->
<!-- #endregion -->
}




\end{section}


