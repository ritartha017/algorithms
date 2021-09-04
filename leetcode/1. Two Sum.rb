=begin
# Brute Force Method - Time O(n^2), Space O(1)

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    (0..nums.length - 1).each do |i|
        j = i + 1
        (j..nums.length - 1).each do |j|
            return [i, j] if nums[i] + nums[j] == target
        end
    end
end  
=end


# The Hash Table Solution - Time O(n), Space O(1)

# @param {Integer[]} nums
# @param {Integer} target
# @param {Integer{}} hash
# @return {Integer[]}
def two_sum(nums, target, hash = {})
    nums.each_with_index do |val, i|
    return [hash[target-val], i] if hash.has_key?(target-val)
    
    hash[val] = i
    end
end

out = two_sum([3, 2, 4], 6)

out.each do |x|
    puts "#{x} "
end  

gets