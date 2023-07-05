# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    nums.each_with_index do |num_1, index_1|
        temp = target - num_1
        return [index_1, nums.index(temp)] if nums.include? temp and index_1 != nums.index(temp)
    end
end
