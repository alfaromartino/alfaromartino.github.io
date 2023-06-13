#= using DataFrames

function previous_folder(path; nr_prev=1) 
    aux = ntuple(x->"..", nr_prev)
    abspath(joinpath("$(path)", aux...))
end

folder = joinpath(previous_folder(@__DIR__), "PAGES")
cd(folder)

function capture_text(file)
    file        = open(file, "r")
    content     = read(file, String)
    expression  = r"PAGEsection_name = \"(?<group>.*)\""
    xx          = match(expression, content)
    return xx[:group]
end


list_files = readdir(folder) |> x -> x[startswith.(x, r"^\d")] #we keep those files that start with a number
PAGEtitles = capture_text.(list_files)
=#