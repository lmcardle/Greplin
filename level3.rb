numbers = [3, 4, 9, 14, 15, 19, 28, 37, 47, 50, 54, 56, 59, 61, 70, 73, 78, 81, 92, 95, 97, 99]

subsets = []
num_subsets = 0


3.upto(numbers.length - 1) do |n|
  subsets << numbers.combination(n).to_a
end

0.upto(numbers.length-4) do |n|
  subsets[n].each do |subset|
    total = subset.pop
    if subset.inject(:+) == total
      num_subsets += 1
    end
  end
end

puts num_subsets