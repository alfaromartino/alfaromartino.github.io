
+++
# BLUE
blue_color = "rgb(63,99,136)"
#backg_color_code = "rgb(0, 4, 10)"
backg_color_code = "rgb(0, 16, 41)"
backg_color_output = "rgb(0, 32, 17)"

##### LAST MODIFIED
using Dates
year_today, month_today, day_today = Dates.today() |> x-> (Dates.year(x), Dates.month(x), Dates.day(x))
last_modified = """$(Dates.monthname(month_today)) $(Dates.day(day_today)), $(year_today) """

###### FOR URL
prepath     = ""
description = """ """ #this needs to be added to the title if wanted

###### INFORMATION OF SITE
title_website = "Pondering Barks"
authors       = "Martin Alfaro"
title_site    = "$(title_website) - $(authors)" #for tab

year_lastModified = "$(year_today)"
+++



+++
# LEFT MARGIN
contentPages_topleft_space   = "200px"
indexPage_topleft_space      = "0px"

contentPages_topleft_space_mobile   = "10%"
+++



+++
# TOC - THIS IS FROM ANOTHER PAGE, ADAPT IT
subtitle_research   = "Research"
subtitle_books      = "Books & Notes"
subtitle_coding     = "Programming Tutorials"
subtitle_data       = "Data"
subtitle_blog       = "Pondering Barks"

title_research      = uppercase(subtitle_research)
title_books         = uppercase(subtitle_books)
title_coding        = uppercase(subtitle_coding)
title_data          = uppercase(subtitle_data)
title_blog          = uppercase(subtitle_blog)

pic_research        = "/assets/pics_html/desk02.jpg"
pic_books           = "/assets/pics_html/book02.jpg"
pic_coding          = "/assets/pics_html/computer01.jpg"
pic_data            = "/assets/pics_html/datacenter01.jpg"
pic_blog            = "/assets/pics_html/dog_logo_withbackground.jpg"
+++


+++
### IGNORE THIS FILE
ignore = ["PAGES/rough/"]

### IF WE WANT TO EXECUTE ALL CODE FROM HERE
#[include("julia_utils\\$(file)") for file in readdir("julia_utils")]
#PAGEiter = PAGEiter
+++



+++
# FOR HEADER
use_header        = false
add_name_header   = true
add_github_star   = false
github_repo       = "alfaromartino"

use_header_img    = true
#header_img_path  = "url(\"assets/logo_julia.png\")"
#header_img_path  = "radial-gradient(at bottom left, black, rgb(63,99,136) 85%);"
header_img_path   = "linear-gradient(to right, black, rgb(0, 0, 0) 10%, rgb(63,99,136) 77%, rgb(63,99,136));"
header_img_style  = ""
header_margin_top = "0px" 

# FOOTER
use_foot           = true

# HERO
use_hero           = false
hero_width         = "100%"
hero_margin_top    = "0px"
+++

<!-- SECTION LAYOUT
NOTE:
  - section_width:  integer number to control the default width of sections
                    you can also set it for individual sections by specifying
                    the width argument: `\begin{:section, ..., width=10}`.
-->
<!--@def section_width = 11 -->
@def section_width = ""


<!-- COLOR PALETTE
  - section_bg_color:  background color of "secondary" sections to help
                       visually separate between sections.
  - highlight_theme:    theme for the code, pick one from
                        https://highlightjs.org/static/demo/ for instance
                        "github" or "atom-one-dark" or "vs" or "github-dark-dimmed" or "vs2015"; use lower case and replace
                        spaces with `-`.  
-->
+++
# FRANKLIN DEFINED
header_color       = "rgb(63,99,136)"
link_color         = "#2669DD"
link_hover_color   = "#2669ddb2"
footer_link_color  = "cornflowerblue"

section_bg_color   = "rgba(63, 99, 136, 0.08)" 
highlight_theme    = "vs_myversion"
+++



<!-- INTERNAL DEFINITIONS
These definitions are important for the good functioning of some of the
commands that are defined and used in PkgPage.jl
-->
@def sections        = Pair{String,String}[]
@def section_counter = 1
@def showall         = false

\newcommand{\html}[1]{~~~#1~~~}

\newenvironment{center}{\html{<div style="text-align:center;">}}{\html{</div>}}
\newenvironment{justified}{\html{<div style="text-align:justified;">}}{\html{</div>}}
\newenvironment{columns}{\html{<div class="container"><div class="row">}}{\html{</div></div>}}

\newcommand{\justified}[1]{\html{<div style="text-align:justified;">}!#1\html{</div>}}













<!-- ========================================================================================================================================
                                                  USER DEFINED
================================================================================================================================================ -->
<!-- subtitles -->
\newcommand{\subtitle}[1]{\html{<h4>}#1\html{</h4>}}

<!-- =============================
     FOR LATEX CONVERSION  
================================== -->
\newcommand{\href}[2]{[#2](#1)}
\newcommand{\inputDiv}[1]{~~~<div style="margin-bottom:-20px;">~~~\input{julia}{#1}~~~</div>~~~}
\newcommand{\Tunderline}[1]{\html{<span style="text-decoration:underline">#1</span>}}
\newcommand{\textit}[1]{\html{<em>#1</em>}}
\newcommand{\textcolor}[2]{~~~  <span style="color:#1">#2</span>~~~}
\newcommand{\emph}[1]{~~~<em>#1</em>~~~}
\newcommand{\textbf}[1]{~~~<strong>#1</strong>~~~}
\newcommand{\blueit}[1]{~~~  <span style="color: rgb(83, 129, 175);">~~~\textbf{#1}~~~</span>~~~}

<!-- =============================
     FOR KEYBOARD KEYS
================================== -->
\newcommand{\winlogo}[0]{\html{<kbd style="padding: 0 0.1em;"><a href="assets/windows_logo.png"><img width="18" 
src="assets/windows_logo.png"></a></kbd>}}

\newcommand{\kbd}[1]{\html{<kbd>#1</kbd>}}


<!-- =============================
     FOR IMAGES
================================== -->
\newcommand{\gif}[3]{ \html{
    <div class="gif_drop"> <details><summary>}#1
    \html{</summary>
    <p> <img style="width:#2;height:#2;" src="#3"/>
    </p></details></div>}
  }

\newcommand{\pic}[5]{ \html{    
    <div class="svg_drop"> <details #2><summary>}#1
    \html{</summary>
    <p> <img style="width:#3;height:#4;" src="#5"/>
    </p></details></div>  }
  }

  
  \newcommand{\picGray}[5]{ \html{    
    <div class="svg_drop" style="background-color: #f6f8fa !important;"> <details #2><summary>}#1
    \html{</summary>
    <p style="background-color:#f6f8fa;"> <img style="width:#3;height:#4;" src="#5"/>
    </p></details></div>
    }
  }

\newcommand{\justimg}[3]{  ~~~<img src="#3" style="width:#1 ; height:#2; padding-bottom:1em;">~~~
}

\newcommand{\imgOutput}[2]{ \html{
    <div class="img_output"> <details open><summary>}Output
    \html{</summary>
    <p> <img style="width:#1; height:auto; max-width:100%;" src="#2"/>
    </p></details></div>}
  }


<!-- ============================ 
AUXILIARS for CODE
============================ -->
<!-- basics -->
\newcommand{\outhtml}[1]{~~~<pre><code class="language-julia" 
style="text-indent:-0.55em;margin:auto;padding-bottom:1em">~~~#1~~~</code></pre>~~~}



\newcommand{\collapsebox}[5]
  {
    \html{<div class="#5"> <details #1><summary #2>}#3
    \html{</summary>}
    \html{<p>}
    !#4
      \html{</p></details></div><br>}
  }

<!-- this should've been called hideoutput, but now I'm using that name for another command -->
\newcommand{\hideoutput}[3]{
  \collapsebox{#1}{style="margin-bottom:0px;"}{#2}{#3}{output_box}
}


\newcommand{\hidecode}[3]{
  \collapsebox{#1}{style="margin-bottom:0px;"}{#2}{#3}{code_box}
}


<!-- to hide tabs -->
\newcommand{\hideTabs}[3]{
  \collapsebox{#1}{style="margin-bottom:0px;"}{#2}{#3}{hide_tab}
}

\newcommand{\hideTabsOutput}[3]{
  \collapsebox{#1}{style="margin-bottom:0px;"}{#2}{#3}{hide_output}
}


<!-- =========================
END OF AUXILIARS FOR CODE 
========================= -->









<!--============================== 
   FOR OUTPUT in MODAL (ONLY NON-EVALUATED CODE)
============================== -->
<!-- LEGACY TO DELETE, ESPECIALLY IF WE START A NEW FILE!!!!!!-->
<!-- auxiliars -->
<!-- FOR OUTPUTS BELOW CODE in no environment-->

\newcommand{\textBelow}[1]{~~~<span style="display:block;margin-top:-2.25em;border-opacity-25;">~~~!#1~~~</span>~~~}
\newcommand{\textBelowCode}[1]{~~~ <span style="display:block;margin-top:-0.9em;border-opacity-25;">~~~!#1~~~</span>~~~}
\newcommand{\outhtmlcopied}[1]{~~~<pre><div class="plainoutput output_below">~~~#1~~~</div></pre>~~~}

\newenvironment{output_modal_copied}[3]
  { \html{<div class="output_box"> <details #1><summary style="margin-bottom:-0.2em;">}#2
    \html{</summary>}
    \html{<p>}
    \outhtmlcopied{~~~!#3~~~}}
  { \html{</p></details></div><br>}  }


\newenvironment{output_code_copied}[2]
  { \html{<div class="output_box"> <details #1><summary style="margin-bottom:-0.00em;">}Outputs
    \html{</summary>}
    \html{<p>}
    \outhtmlcopied{~~~!#2~~~}}
  {    \html{</p></details></div><br>}  }

<!-- end of auxiliars -->



\newcommand{\outputModalcopied}[2]{
  \textBelow{
    \begin{output_modal_copied}{!#1}{Outputs}{!#2}
    \end{output_modal_copied}
            }
    }

\newcommand{\outputCodeCopied}[2]{
  \textBelowCode{
    \begin{output_code_copied}{!#1}{!#2}
    \end{output_code_copied}
            }
    }
    



<!--============================== 
   FOR OUTPUT WITH img
  ============================== -->
<!-- FOR OUTPUTS IN MODAL USING IMG-->
\newenvironment{output_modal_img}[3]
  {
    \html{<div class="img_output"> <details #1><summary style="margin-bottom:0px;">}Outputs
    \html{</summary>}
    \html{<p>}
    \html{<img style="width:#2;height:#2;max-width: 100%;" src="#3"/>}}
  {
    \html{</p></details></div>}
  }

\newcommand{\textBelowImg}[1]{~~~ <span style="display:block;margin-top:-35px;border-opacity-25;">~~~!#1~~~</span>~~~}


\newcommand{\outputModalImg}[3]{
  \textBelowImg{
    \begin{output_modal_img}{!#1}{!#2}{!#3}
    \end{output_modal_img}    
            }
    }





\newcommand{\juliawhite}[1]{~~~<span style="color:rgb(12,200,30) !important;">julia&gt</span><span style="color:#DCDCDC">#1</span>~~~}



<!-- ===========================================================================

                              FUNDAMENTALS 

=========================================================================== -->
<!-- \code just due to legacy, otherwise it should be deleted -->
\newcommand{\code}[2]{\hidecode{#1}{Code}{#2}}
<!-- ===== -->


<!--  BASICS -->
\newcommand{\Fcode}[2]{\hidecode{!#1}{Code}{!#2}}

\newcommand{\Fblue}[3]{\hidecode{!#1}{!#2}{!#3}}


<!-- if we want a copy button, change !#2 by \outhtml{!#2} -->
\newcommand{\Foutput}[2]{\hideoutput{!#1}{Output}{!#2}}

<!-- if we want a copy button, change !#3 by \outhtml{!#3} -->
\newcommand{\Fgreen}[3]{\hideoutput{!#1}{!#2}{!#3}}



<!-- PUTTING OUTPUT TOGETHER WITH CODE, simple outputs only -->
\newcommand{\outputWrapperNoModal}[1]{~~~<div class="output_wrapperNoModal">~~~!#1~~~</div>~~~}

<!-- if we want a copy button, change !#2 by \outhtml{!#2} -->
\newcommand{\FoutputBelow}[2]{\outputWrapperNoModal{
  \hideoutput{!#1}{Output}{!#2}}
}

<!-- if we want a copy button, change !#3 by \outhtml{!#3} -->
\newcommand{\FgreenBelow}[3]{\outputWrapperNoModal{
  \hideoutput{!#1}{!#2}{!#3}
}}





<!-- SIMPLE INLINE VERSION with mixed outputs and hidden output
`outrepl` is needed on top of the wrapper `hideoutput` because we need to combine
the different blocks of output (ie \output{<julia region>} and plaintext with julia prompt).
We could add `outputWrapperNoModal` to stick it together with the code snippet -->
\newcommand{\juliarepl}[]{~~~<span style="color:rgb(32, 198, 121) !important; font-weight: bold;">julia&gt</span>~~~}
\newcommand{\wrapperMixedOutputs}[1]{~~~<div class="outrepl">~~~!#1~~~</div>~~~}
\newcommand{\outMixedOutputs}[1]{\wrapperMixedOutputs{~~~!#1~~~}}
\newcommand{\pre}[1]{~~~<pre>~~~!#1~~~</pre>~~~}

\newcommand{\FMoutput}[2]{\hideoutput{!#1}{Output}{\outMixedOutputs{~~~!#2~~~}}}
<!-- \newcommand{\FMoutput}[2]{\hideoutput{!#1}{Output}{!#2}} -->
\newcommand{\promptline}[2]{~~~<div class="repl_line">~~~\juliarepl !#1 \\ ~~~!#2~~~  ~~~</div>~~~}
\newcommand{\promptline}[2]{~~~<div class="repl_line">~~~\juliarepl !#1 \\ \pre{~~~!#2~~~} ~~~</div>~~~}




<!-- VERSION FOR ONLY-OUTPUT MODALS WITH MIXED OUTPUTS -->
\newcommand{\commandout}[1]{~~~<div class="commandline">!#1</div>~~~}
\newcommand{\mixline}[2]{~~~<div class="mix_line">~~~\juliarepl !#1 \commandout{~~~!#2~~~}  ~~~</div>~~~}
\newcommand{\replline}[2]{~~~<div class="repl_line">~~~\juliarepl !#1 \\ ~~~!#2~~~  ~~~</div>~~~}
\newcommand{\FmodalOutput}[1]{\outMixedOutputs{~~~!#1~~~}}


<!-- IMPLEMENTING NEW VERSION FOR ANY MODAL WITH MIXED OUTPUTS -->
\newcommand{\signOutput}[1]{~~~<div class="sign_output">~~~Output~~~</div><div class="outputmodal_container">~~~\outMixedOutputs{~~~!#1~~~} ~~~</div>~~~}
<!-- \newcommand{\FMbelow}[1]{~~~<div class="modal_outputPosition>~~~!#1~~~</div>~~~} -->
\newcommand{\FmodalOutputA}[1]{\signOutput{!#1}}
\newcommand{\mixlineA}[2]{~~~<div>~~~\juliarepl !#1 \commandout{~~~!#2~~~}  ~~~</div>~~~}














<!--============================== 
   FOR OUTPUT in MODAL (WHEN THERE'S ALREADY CODE, FOR MULTIPLE CODES + MULTIPLE OUTPUTS IN MODALS)
============================== -->

<!--  this is useful for a modal with non-evaluated code and evaluated output-->
\newcommand{\ModalOuthtml}[1]{~~~<pre><code class="language-julia" style="text-indent:-0.55em;margin:auto;padding-bottom:1em">~~~#1~~~</code></pre>~~~}
\newcommand{\FtextBelow}[1]{~~~<span style="display:block;margin-top:-2.25em;border-opacity-25;">~~~!#1~~~</span>~~~}

\newenvironment{Foutput_modal}[3]
  { \html{<div class="output_box"> <details #1><summary style="margin-bottom:-0.2em;">}#2
    \html{</summary>}
    \html{<p>}
    \ModalOuthtml{!#3}}
  { \html{</p></details></div><br>}  }

\newcommand{\FoutputModal}[2]{
  \FtextBelow{
    \begin{Foutput_modal}{!#1}{Outputs}{!#2}
    \end{Foutput_modal}
            } }

\newcommand{\FgreenModal}[3]{
  \FtextBelow{
    \begin{Foutput_modal}{!#1}{!#2}{!#3}
    \end{Foutput_modal}
            } }


<!--  too adhoc, but it fills with empty spaces code in modals-->
\newcommand{\FEforspace}[1]{~~~<pre><code style="margin:auto; text-indent:-0.55em; height:auto;">~~~!#1~~~</code></pre>~~~}
\newcommand{\FEouthtml}[3]{!#1~~~<span style="display:block; margin-top: !#3 ; border-opacity-25;">~~~\FEforspace{~~~!#2
</span>~~~}}

<!-- \newcommand{\FCforspace}[1]{~~~<pre><code style="margin:auto; text-indent:-0.55em; height:auto;">~~~!#1~~~</code></pre>~~~} -->
\newcommand{\FCouthtml}[1]{!#1~~~<span style="background-color: rgba(63, 107, 75, 0.315); display:block;">~~~}


<!--  this is useful for inline code (no modal), with code and output stuck together-->
\newcommand{\FItextBelow}[1]{~~~<span style="display:block;margin-top:-0.8em;border-opacity-25;">~~~!#1~~~</span>~~~}

\newcommand{\FoutputInline}[2]{
  \FItextBelow{
    \begin{Foutput_modal}{!#1}{Outputs}{!#2}
    \end{Foutput_modal}
            } }

\newcommand{\FgreenInline}[3]{
  \FItextBelow{
    \begin{Foutput_modal}{!#1}{!#2}{!#3}
    \end{Foutput_modal}
            } }










<!-- 
  TOOLTIPS USING LATEX
-->
\newenvironment{tooltip}[2]
 {\html{<span class="hovering_foot">}#1
   \html{<span class="h_foot_text">}#2}
   {\html{</span></span>}       }

\newcommand{\tooltip}[2]
  {\html{<span class="hovering_foot">}#1
   \html{<span class="h_foot_text">}#2
   \html{</span></span>}       }


\newcommand{\footnote}[1]
  {\html{<span class="footn supr">}[note]
   \html{<span class="footn_text">}#1
   \html{</span></span>}}





<!-- CITING -->

\newcommand{\citet}[1]{\html{<div>}[#1][]\html{</div>}}

<a href="/index.html"><img src="/assets/icons/code02.png" style="width:15%; height:auto;opacity:0.9;padding-bottom:5px;">
      Home</a>

<!-- REMARKS  as a note -->
\newcommand{\remark}[1]{
  \html{<div class=note>}
    \html{<div class=title>}
      \html{<span class="note_title" style="font-weight:500;">
      <img src="/assets/icons/exclamation.png" style="width:auto; height:30px;opacity:0.99;padding-bottom:4px; margin-left:-4px;">      
      Remark
      }\html{</span>}
    \html{</div>}
    \html{<div class=content>}
    !#1
    \html{</div>}
  \html{</div>}}

\newcommand{\optremark}[1]{
  \html{<div class=note>}
    \html{<div class=title>}
      \html{<span class="note_title" style="font-weight:500;">
      <img src="/assets/icons/exclamation.png" style="width:auto; height:30px;opacity:0.99;padding-bottom:4px; margin-left:-4px;">      
      Remark
      }\html{</span>}
    \html{</div>}
    \html{<div class=content>}
    !#1
    \html{</div>}
  \html{</div>}}

\newcommand{\warning}[1]{
  \html{<div class=warning>}
    \html{<div class=title>}
      \html{<span class="warning_title" style="font-weight:500;">
      <img src="/assets/icons/warning.png" style="width:auto; height:30px;opacity:0.99;padding-bottom:4px; margin-left:-4px;">      
      Warning!
      }\html{</span>}
    \html{</div>}
    \html{<div class=content>}
    !#1
    \html{</div>}
  \html{</div>}}

\newcommand{\definition}[1]{@@definition @@title 💡 \html{<u>} \textbf{Definition} \html{</u>} @@ @@content #1 @@ @@}





<!-- CAROUSEL 
\html{
<div id="tag1" class="carousel slide" data-ride="carousel" 
      data-interval="false" keyboard="true" interval="9999999999999999999999">
  <ol class="carousel-indicators">
    <li data-target="#tag1" data-slide-to="0" class="active"></li>
    <li data-target="#tag1" data-slide-to="1"></li>
    <li data-target="#tag1" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner d-block">
    <div class="carousel-item active">
      <img class="d-block w-10" 
      src="/assets/logo_julia.png">
    </div>
    <div class="carousel-item">
      <img class="d-block w-10" 
      src="/assets/MA2_logo.ico">
    </div>
    <div class="carousel-item">
      <img class="d-block w-10" 
      src="/assets/MA1_logo.ico">
    </div>
  </div>  
  <a class="carousel-control-prev" href="#tag1" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#tag1" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
}
-->

<!-- --------------------- 
      FOR MY MAIN WEBSITE 
 -----------------------  -->


\newcommand{\abstract}[1]
  {
    \html{<div class="papersDetails"><details closed><summary>}Abstract
    \html{</summary>}
    \html{<p>}
    !#1
      \html{</p></details></div><br>}
  }

\newcommand{\coauthor}[2]{\html{<span class="coauthor"><a href="!#2">!#1</a></span>}}



\newcommand{\modalclosed}[2]{\html{
<!-- Trigger/Open The Modal -->
<div style="text-indent:0;"> 
  <button class="modalButton" style="background-color: rgba(226, 140, 140, 0.808)   !important; color:black;">#1</button> </div>

<!-- The Modal -->
<div class="modal">

  <!-- Modal content -->
  <div class="modal-content" style="background-color: rgb(255, 214, 214) !important;">
    <div class="modal-header" style="background-color: rgba(226, 140, 140, 0.808)   !important; color:black;">
      <span class="modalClose">&times;</span>
      <h2> #1 </h2>
    </div>
    <div class="modal-body"><p>
    }#2
    \html{</p>
    </div>    
  </div>

</div>
}}






















<!-- ------------------------------------
          MODAL
--------------------------------------- -->
\newcommand{\modal}[2]{\html{
<!-- Trigger/Open The Modal -->
<div style="text-indent:0;"> <button class="modalButton">#1</button> </div>

<!-- The Modal -->
<div class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="modalClose">&times;</span>
      <h2> #1 </h2>
    </div>
    <div class="modal-body"><p>
    }#2
    \html{</p>
    </div>    
  </div>

</div>
}}

\newcommand{\modalopt}[2]{\html{
<!-- Trigger/Open The Modal -->
<div style="text-indent:0;"> <button class="modalButton">
  &nbsp<i class="fa fa-exclamation-circle" style='font-size:16px;padding-right:0.0em'></i>~~~\textbf{(OPTIONAL)}~~~ - #1</button> </div>

<!-- The Modal -->
<div class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="modalClose">&times;</span>
      <h2> #1 </h2>
    </div>
    <div class="modal-body"><p>
    }#2
    \html{</p>
    </div>    
  </div>

</div>
}}


\newcommand{\modalred}[2]{\html{
<!-- Trigger/Open The Modal -->
<div style="text-indent:0;"> 
  <button class="modalButton" style="background-color: rgba(226, 140, 140, 0.808)   !important; color:black;">#1</button> </div>

<!-- The Modal -->
<div class="modal">

  <!-- Modal content -->
  <div class="modal-content" style="background-color: rgb(255, 214, 214) !important;">
    <div class="modal-header" style="background-color: rgba(226, 140, 140, 0.808)   !important; color:black;">
      <span class="modalClose">&times;</span>
      <h2> #1 </h2>
    </div>
    <div class="modal-body"><p>
    }#2
    \html{</p>
    </div>    
  </div>

</div>
}}



\newcommand{\modalnote}[1]{\modalred{<i class="fa fa-exclamation-circle" style='font-size:16px;padding-right:0.5em;'></i>Remark}{#1}}




 <!-- STYLE OF TITLE FOR ENUMERATE  -->
\newcommand{\enum}[2]{~~~
<ol><li style="font-weight:bold" value="#1"><span style="font-weight:normal">
<span style="padding-left:0.0em;margin-bottom:-0.8em;display:block;">~~~#2~~~</span>
</span></li></ol>~~~}

<!-- STYLE OF TITLE FOR ENUMERATE  with format (bold or italic)-->
\newcommand{\enumb}[2]{~~~
<ol style="list-style-type: lower-roman;"><li style="font-weight:normal" value="#1">
<span style="padding-left:0.0em;margin-bottom:-0.8em;display:block;">~~~#2~~~
</span></li></ol>

~~~}