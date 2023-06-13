#= This code allows you to reproduce the code with the exact version of packages used
    at the moment of writing the note. 
   Put all files (all_code.jl, Manifest.toml, and Project.toml) in C:/code_downloaded. 
    Otherwise, it won't work. =#

Pkg.activate(joinpath("C:/", "code_downloaded"))
Pkg.instantiate() #to install the specific version of packages used in this project

using DataFrames, Distributions, Random, BenchmarkTools
using LazyArrays 
 
 ##############################################################################
#                       DATA GENERATION
############################################################################## 
 
 Random.seed!(123)        # setting the seed for reproducibility
price_vector             = 2 .* rand(1_000)

quantity(price)          = 10 - 2.1 * price
revenue(quantity, price) = quantity * price
cost(quantity)           = 1.1 * quantity
profit(revenue, cost)    = revenue - cost 
 
 function compute_profit1(price)
    compute_quantity = quantity.(price)
    compute_revenue  = revenue.(compute_quantity, price)
    compute_cost     = cost.(compute_quantity)
    
    profit.(compute_revenue, compute_cost)     
end

@btime compute_profit1($price_vector); 
 
 function compute_profit2(price)
    compute_quantity = @~ quantity.(price)
    compute_revenue  = @~ revenue.(compute_quantity, price)
    compute_cost     = @~ cost.(compute_quantity)
    
    profit.(compute_revenue, compute_cost)
end

@btime compute_profit2($price_vector); 
 
 compute_profit1(price_vector) == compute_profit2(price_vector) 
 
 ##############################################################################
#                       SIMULATIONS
############################################################################## 
 
 function simulation1(price)
    for i in 1:10_000
        sum(compute_profit1(price) .+ i/100)
    end
end

@btime simulation1($price_vector); 
 
 function simulation2(price)
    for i in 1:10_000
        sum(compute_profit2(price) .+ i/100)
    end
end

@btime simulation2($price_vector); 
 
 ############################################################################
#
#                           DATA GENERATION
#
############################################################################ 
 
 Random.seed!(123)   #setting the seed for reproducibility

nr_countries = 50
nr_years     = 20
nr_firms     = 10_000 
 
 prices_random(nr_firms, nr_countries) = [rand(Pareto(log(4, 5)), nr_firms) for _ in 1:nr_countries]

function generate_yearly_data(year, nr_firms, nr_countries)
    revenue = prices_random(nr_firms, nr_countries)
    dff     = DataFrame(country=1:nr_countries, prices = revenue)
    dff     = flatten(dff,2)

    dff.product = repeat(1:nr_firms, outer = nr_countries) 
    dff.year .= year
    return dff
end


function generate_data(nr_years, nr_firms, nr_countries)    
    dff = generate_yearly_data(2000, nr_firms, nr_countries)
    for year in 2001:nr_years-1+2001
        append!(dff, generate_yearly_data(year, nr_firms, nr_countries)) 
    end   

    return select!(dff, [:year, :country,  :product, :prices])
end

dff = generate_data(nr_years, nr_firms, nr_countries) #it generates the DataFrame 
 
 println(dff[1:5,:]) #hide 
 
 dfg = groupby(dff,[:country,:year])
to_benchmark(foo,dfg) = transform(dfg,:prices => foo => :profits)
ref(x) = (Ref(x))[] #hide 
 
 @btime to_benchmark(compute_profit1, $dfg); 
 
 @btime to_benchmark(compute_profit2, $dfg); 
 
 