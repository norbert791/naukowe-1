#=
/**
 * @author Norbert Jaśniewicz
 */
=#

using Printf

function machEps(type)
    one :: type = 1.0
    machEps :: type = one
    div :: type = 2.0
    machEpsCopy = -1.0
    while one + machEps > one
        machEpsCopy = machEps
        machEps /= div
    end
    return machEpsCopy
end

function findEta(type)
    zero :: type = 0.0
    eta :: type = 1.0
    div :: type = 2.0
    etaCopy = -1.0
    while eta > zero
        etaCopy = eta
        eta /= div
    end
    return etaCopy
end

function main()
    myEps16 = machEps(Float16)
    myEps32 = machEps(Float32)
    myEps64 = machEps(Float64)
    eps16 = eps(Float16)
    eps32 = eps(Float32)
    eps64 = eps(Float64)

    myEta16 = findEta(Float16)
    myEta32 = findEta(Float32)
    myEta64 = findEta(Float64)

    eta16, eta32, eta64 =  nextfloat(Float16(0.0)), nextfloat(Float32(0.0)), nextfloat(Float64(0.0))

    println(""""Type   | MyValue  | Julia value | C value
               Float16 | $myEps16 | $eps16 | N/A
               Float32 | $myEps32 | $eps32 | 1.1920929E-07
               Float64 | $myEps64 | $eps64 | 2.220446E-16""")
    
    println("Type (with printf) | MyValue| Julia value | C value")
    @printf("Float16 printf %.36E | %.36E | N/A \n", myEps16, eps16)
    @printf("Float32 printf %.36E | %.36E | 1.192092895507812500000000000000000000E-07 \n", myEps32, eps32)
    @printf("Float64 printf %.36E | %.36E | 2.220446049250313080847263336181640625E-16 \n", myEps64, eps64)
    
    println(""""Type   | MyValue  | Julia value"
               Float16 | $eta16 | $eta16
               Float32 | $eta32 | $eta32
               Float64 | $eta64 | $eta64""")
end

main()
