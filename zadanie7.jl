#=
/**
 * @author Norbert Jaśniewicz
 */
=#

fun1(x :: Float64) :: Float64 = sin(x) + cos(3.0 * x)

fun1Prim(x :: Float64) :: Float64 = cos(x) - 3.0 * cos(3.0 * x)

aproximateDerivative(fun, x :: Float64, delta :: Float64) :: Float64 = (fun(x + delta) - fun(x)) / delta

function main()
    base :: Float64 = 2.0
    f1 :: Float64 = fun1Prim(1.0)
    println("f1(1.0) == $f1")
    println("n | h | f'(1.0) aprox. | |f'(1.0) - (f'(1.0) aprox)|")
    for n in 0:54
        h :: Float64 = base^(-n)
        f2 :: Float64 = aproximateDerivative(fun1, 1.0, h)
        delta :: Float64 = abs(f1 - f2)
        println("$n | $h | $f2 | $delta")
    end
end

main()