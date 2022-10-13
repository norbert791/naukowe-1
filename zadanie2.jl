#=
/**
 * @author Norbert Jaśniewicz
 */
=#

#=
function machEpsExpr(type)
    three :: type = 3.0
    four :: type = 4.0
    one :: type = 1.0
    return three * (four / three - one) - one
end
=#

function machEpsExpr(type)
    three :: type = 3.0
    four :: type = 4.0
    one :: type = 1.0
    resut :: type = 0

    println("""Type == $type
            -------------------------------------""")
    result = four / three
    println("4 / 3 == $result")
    println("In binary: $(bitstring(result))\n")
    result -= one
    println("4 / 3 - 1 == $result")
    println("In binary: $(bitstring(result))\n")
    result *= three
    println("3 * (4 / 3 - 1) == $result")
    println("In binary: $(bitstring(result))\n")
    result -= one
    println("3 * (4 / 3 - 1) - 1 == $result")
    println("In binary: $(bitstring(result))\n")
    println("-------------------------------------")
    return result
end

function main()
    eps16 = machEpsExpr(Float16)
    eps32 = machEpsExpr(Float32)
    eps64 = machEpsExpr(Float64)
    println("""Type | Value
               Float16 | $eps16
               Float32 | $eps32
               Float64 | $eps64""")
end

main()
