def iterative_upcase(str)
    str.chars.inject("") do |upcased_str, char|
        upcased_str << char.upcase
    end
end

def recursive_upcase(str)
    return str.upcase if str.length <= 1
    str[0].upcase + recursive_upcase(str[1..-1])
end

def iterative_reverse(str)
    reverse_str = []
    word = str.split("")
    word.each do |char|
        reverse_str.unshift(char)
    end
    reverse_str.join("")
end

def recursive_reverse(str)
    return str[0] if str.length <= 1
    str[-1] + recursive_reverse(str[0...-1])
end


def quick_sort(arr)
    return arr if arr.length <= 1
    pivot = [arr.first]
    left_side = arr[1..-1].select { |el| el < arr.first }
    right_side = arr[1..-1].select { |el| el >= arr.first }
    quick_sort(left_side) + pivot + quick_sort(right_side)
end

def factorial(n)
    return 1 if n == 0
    n * factorial(n-1)
end

def sum_to(n)
    return nil if n < 0
    return 0 if n == 0
    n + sum_to(n-1)
end

def add_numbers(arr)
    return nil if arr.length == 0
    return arr[0] if arr.length <= 1
    arr[0] + add_numbers(arr.drop(1))
end

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1
    (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.length == 0
    flavors[0] == favorite || ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(str)
    return "" if str.length == 0
    str[-1] + reverse(str[0...-1])
end

def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n-1)
end

def exp_2(b, n)
    return 1 if n == 0
    return b if n == 1

    half = exp_2(b, n/2)

    if n.even?
        half * half
    else
        b * half * half
    end
end

def bsearch(arr, num)
    return nil if arr.empty?
    
    probe_idx = arr.length / 2
    case num <=> arr[probe_idx]
    when -1
        bsearch(arr.take(probe_idx), num)
    when 0
        return probe_idx
    when 1
        sub_answer = bsearch(arr.drop(probe_idx + 1), num)
        sub_answer.nil? ? nil : (probe_idx + 1) + sub_answer
    end
end

def permutations(arr)
    return [arr] if arr.length == 0
    first = arr.shift
    perms = permutations(arr)
    total_perms = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            total_perms << perm[0...i] + [first] + perm[i..-1]
        end
    end
    total_perms
end

def greed_change(amount, coins = [25, 10, 5, 1])
    change = []
    first_coin = coins.first
    count = amount / first_coin
    count.times { change << first_coin }
    amount -= count * first_coin
    if amount > 0
        change += greed_change(amount, coins.drop(1))
    end
    change
end


def make_change(amount, coins = [25, 10, 5, 1])
    return [] if amount == 0
    return nil if coins.none? { |coin| coin <= amount }

    best_change = nil
    coins.each_with_index do |coin, index|
        next if coin > amount
        
        remainder = amount - coin
        best_remainder = make_change(remainder, coins.drop(index))

        next if best_remainder.nil?
        this_change = [coin] + best_remainder
        
        if best_change.nil? || (this_change.count < best_change.count)
            best_change = this_change
        end
  end

  best_change
end

make_change(14, [10, 9, 7, 1])

#####################################################################

def arr_contain(num, arr)
    return false if arr.empty?
    arr[0] == num || arr_contain(num, arr.drop(1))
end

def arr_count(num, arr)
    return 0 if arr.empty?
    count = 0
    if arr.first == num
        count += 1
    end
    count += arr_count(num, arr.drop(1))
end

def arr_adjacent(num = 12, arr)
    return false if arr.length <= 1
    return true if arr[0] + arr[1] == num
    arr_adjacent(num, arr.drop(1))
end

def arr_sorted(arr)
    return true if arr.length <= 1
    arr[0] <= arr[1] && arr_sorted(arr.drop(1))
end

def reverse_2(str)
    return str if str.length <= 1
    new_str = str[-1] + reverse_2(str[0...-1])
end

p reverse_2("yessir")
