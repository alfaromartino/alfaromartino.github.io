function compute_profit2(price)
    compute_quantity = @~ quantity.(price)
    compute_revenue  = @~ revenue.(compute_quantity, price)
    compute_cost     = @~ cost.(compute_quantity)
    
    profit.(compute_revenue, compute_cost)
end

@btime compute_profit1($price_vector);
@btime compute_profit2($price_vector);