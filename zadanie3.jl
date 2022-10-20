#=
/**
 * @author Norbert Jaśniewicz
 */
=#


function question1()
    start = 1
    finish = 2 ^ (52) - 1
    comp :: Float64 = 2 ^ (-52)
    
    for it in start:finish
        temp :: Float64 = 1.0
        temp2 :: Float64 = 1.0
        temp += it * comp
        temp2 += (it - 1) * comp
        if temp - temp2 != comp
            return false
        end
    end

    return true
end

function question2(b :: Float64)
    temp = bitstring(b)
    temp = parse(Int, temp, base=2)
    temp += 1
    result :: Float64 = reinterpret(Float64, temp)
    return result - b
end

function main()
    #println(question1()) #Note: this runs for a veeeeery long time
    println(question2(0.5))
    println(question2(2.0))
end

main()