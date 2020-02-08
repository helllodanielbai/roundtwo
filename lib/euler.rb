def multiples(max)
    return 0 if max < 3
    sum = 0

    (0...max).each do |i|
        sum += i if i % 3 == 0 || i % 5 == 0
    end
    sum 
end

def fib(n)
    return 1 if n == 2
    return 1 if n == 1
    fib(n-1) + fib(n-2)
end

p fib(10)

def even_fib(num)
    sum = 0
    i = 1
    while fib(i) < num
        if fib(i).even?
            sum += fib(i)
            i += 1
        else
            i += 1
        end
    end
    sum
end

def largest_palindromic(power)
    max = 10 ** power
    count = 0
    (1...max).each do |i|
        (1...max).each do |i_2|
            if i * i_2 > count && palindromic(i, i_2)
                count = i * i_2
            end
        end
    end
    count
end

def palindromic(i, i_2)
    mult = i * i_2 
    mult_s = mult.to_s
    mult_s == mult_s.reverse
end


def smallest_multiple(range)
    count = range
    multiple = false

    while multiple == false
        if (1..range).all? { |i| count % i == 0 }
            multiple = true
        else
            count += 1
        end
    end
    count
end


p smallest_multiple(20)