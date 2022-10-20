#=
/**
 * @author Norbert Jaśniewicz
 */
=#

f(x :: Float64) :: Float64 = ((x ^ 2.0 + 1.0))^(0.5) - 1.0
g(x :: Float64) :: Float64 = x^2.0 / (((x ^ 2.0 + 1.0))^(0.5) + 1.0)

function main()
    println("i,x (in 8 pow -i),f(x),g(x)")
    for i in 1:20
        temp :: Float64 = 8.0^(-i)
        println("$i,$(8.0^(-i)),$(f(temp)),$(g(temp))")
    end
end

main()
