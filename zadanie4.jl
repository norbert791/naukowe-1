#=
/**
 * @author Norbert Jaśniewicz
 */
=#

#Consts
one64 :: Float64 = 1.0
two64 :: Float64 = 2.0
delta_1_2 :: Float64 = 2 ^ (-52)

#End of consts

function findNumA() #Błąd
    start :: Float64 = 1.0
    finish :: Float64 = 2.0
    bestResult :: Float64 = 2 ^ (-52)
    while (finish - start) > delta_1_2
        mid :: Float64 = (start + finish) / two64
        val :: Float64 = (one64 / mid) * mid
        if (val >= 1.0)
            start = mid
        else
            finish = mid
            bestResult = mid
        end
    end
    return bestResult
end

function minimizeA(a :: Float64)
    prev :: Float64 = a
    while one64 / a > one64
        prev = a
        a -= delta_1_2
    end

    return prev
end

function main()
    a :: Float64 = findNumA()
    if (one64 / a == delta_1_2)
        println("Błąd !")
        exit(1)
    end
    a = minimizeA(a)
    println("""Najmniejsza liczba a spełniająca warunki: $a 
               Wartość 1.0 / a wynosi $(one64 / a)""")
end

main()