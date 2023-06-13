#= PACKAGES THAT WE USE IN CONFIG.MD
   (THEY CAN'T BE LOADED FROM UTILS.JL) 
   
   USED FOR ALL THE FUNCTIONS WE INCLUDE IN CONFIG.MD=#

using DataFrames
using Pipe



# basic functions
remove_md(x) = replace(x, r".md$" => "")

