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
function minimize()
    result :: Float64 = one64 + delta_1_2
	while result < two64 && result * (one64/result) == one64
		result = result + delta_1_2
	end
	return result
end

function main()
    a :: Float64 = minimize()
    if (one64 / a == delta_1_2)
        println("Błąd !")
        exit(1)
    end

    println("""Najmniejsza liczba a spełniająca warunki: $a 
               Wartość 1.0 / a wynosi $(one64 / a)""")
end

main()