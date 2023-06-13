using DataFrames, BenchmarkTools,  LoopVectorization, FastBroadcast, LazyArrays, Distributions, Random, BrowseTables, Formatting, Statistics
#using FoldsCUDA, CUDA, FLoops, ThreadsX, 
browse(x) = open_html_table(x)

# for benchmarking
ref(x) = (Ref(x))[]

# to test a non-linear function
#foo(x, y) = x / y * 100 + (x^2 + y^2) / y + log(x) + y * exp(x)
foo(x) = exp(-10 + x^0.2)

#Setting the seed for reproducibility
Random.seed!(123)        

nr_countries  = 200
nr_industries = 450
nr_products   = 5_300
nr_years      = 20

values_random(nr_products, nr_countries) = [rand(Pareto(log(4, 5)), nr_products) for _ in 1:nr_countries]

function generate_yearly_data(year, nr_products, nr_countries)
    revenue = values_random(nr_products, nr_countries)
    dff     = DataFrame(country=1:nr_countries, values = revenue)
    dff     = flatten(dff,2)

    dff.product = repeat(1:nr_products, outer = nr_countries) 
    dff.year .= year
    return dff
end


function generate_data(nr_years, nr_products, nr_countries)    
    dff = generate_yearly_data(2000, nr_industries, nr_countries)
    for year in 2001:nr_years-1+2001
        append!(dff, generate_yearly_data(year, nr_products, nr_countries)) 
    end   

    return dff
end

#nr_countries * nr_products * nr_years   == 21_200_000
#nr_countries * nr_industries * nr_years == 1 800 000

dff = generate_data(nr_years, nr_products, nr_countries)




##############################################################################
#                               COMPARISONS
##############################################################################

foo(x) = exp(-10 + x^0.2)

dfg = groupby(dff,[:country,:year])
aa = transform(dfg,:values => baseline => :shares)
sort!(aa,:shares)

function baseline(x)
    tempo = sum(foo.(x))                     # 1 allocation, from `foo.(x)`
    [foo(x[i]) / tempo for i in eachindex(x)]     # 1 allocation, from [...]`
end


function using_gen(x)
    gen = sum(foo(x[i]) for i in eachindex(x))
    [foo(x[i]) / gen for i in eachindex(x)]
end

function lazy(x)
    tempo = sum(@~ foo.(x))    
    foo.(x) ./ tempo 
end

function lazy2(x)
    tempo = sum(@~ foo.(x))
    LazyArray(@~ foo.(x) ./ tempo)    
end


function lazy3(x)
    tempo = sum(@.. foo.(x))
    @.. foo(x) / tempo
end

function lazy3(x)
    output = copy(x)    
    @turbo @. output = foo(output) / sum(foo(output))
end


println("comparison with lazy")

function repeat_calculations(foo,dff)
    dfg = groupby(dff,[:country,:year])
    transform(dfg,:values => foo => :shares)
end

@btime repeat_calculations($baseline,ref($dff));
@btime repeat_calculations($using_gen,ref($dff));
@btime repeat_calculations($lazy,ref($dff));
@btime repeat_calculations($lazy2,ref($dff));
@btime repeat_calculations($lazy3,ref($dff));


baseline(x) = [foo(x[i]) / sum(foo(x[i]))  for i in eachindex(x)]


@btime repeat_calculations($baseline,ref($dff));
@btime repeat_calculations($lazy3,ref($dff));

x = dff.values

function repeat_calculations(foo,x)
    g = foo
    [g(x) for _ in 1:100]
end

@btime repeat_calculations($baseline,ref($x));
@btime repeat_calculations($using_gen,ref($x));
@btime repeat_calculations($lazy,ref($x));
@btime repeat_calculations($lazy2,ref($x));