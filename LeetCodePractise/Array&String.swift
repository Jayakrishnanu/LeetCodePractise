//
//  Array&String.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/6/24.
//

import Foundation

public class ArrayAndString {
    
    public init() { }
    
    // Leet: 88 Easy
    public func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard m != 0 else { nums1 = nums2; return }
        guard n != 0 else { return }
        
        var pointerNum1 = m - 1
        var pointerNum2 = n - 1
        var pointer = m - n - 1
        while pointerNum1 != 0 || pointerNum2 != 0 || pointer != 0 {
            if nums1[pointerNum1] <= nums2[pointerNum2] {
                nums1[pointer] = nums1[pointerNum1]
                pointerNum1 -= 1
                pointer -= 1
            } else {
                nums1[pointer] = nums2[pointerNum2]
                pointerNum2 -= 1
                pointer -= 1
            }
        }
        while pointerNum2 != 0 {
            nums1[pointer] = nums2[pointerNum2]
            pointer -= 1
            pointerNum2 -= 1
        }
    }
    
    // Leet: 27 Easy
    public func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[left] == val  {
                nums.swapAt(left, right)
                right -= 1
            } else {
                left += 1
            }
        }
        return left
        
    }
    
    // Leet: 26 Easy
    public func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var i = 1
        for j in 1..<nums.count {
            if nums[j] != nums[j - 1] {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
    
    // Leet: 80 Medium
    public func removeTwoDuplicates(_ nums: inout [Int]) -> Int {
        var j = 0
        for i in 0..<nums.count {
            if i < 2 || nums[i - 2] != nums[i] {
                nums[j] = nums[i]
                j += 1
            }
        }
        return j
    }
    
    // Leet: 169 Easy
    public func majorityElement(_ nums: [Int]) -> Int {
        var votes = 0
        var major = nums[0]
        for num in nums {
            if votes == 0  {
                major = num
                votes += 1
            } else if major != num {
                votes -= 1
            } else {
                votes += 1
            }
        }
        return major
    }
    
    // Leet: 189 Medium
    
    public func rotate(_ nums: inout [Int], _ k: Int) {
        guard k != 0 else { return }
        var rotateArray: [Int] = []
        for _ in 0..<k % nums.count {
            rotateArray.append(nums.popLast()!)
        }
        nums = rotateArray.reversed() + nums
        
    }
    
    // Leet: 121 Easy
    public func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxPrice = Int.min
        for price in prices {
            if price < minPrice {
                minPrice = price
            }
            maxPrice = max(maxPrice, price - minPrice)
        }
        return maxPrice
    }
    
    // Leet: 122 Medium
    
    public func maxProfits(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        var profit = 0
        for i in 1..<prices.count {
            if prices[i - 1] < prices[i] {
                profit += prices[i] - prices[i - 1]
            }
        }
        return profit
    }
    
    // Leet 45 
    public func canJump(_ nums: [Int]) -> Bool {
        var i = 0
        var end = 0
        while i <= end {
            end = max(end, i + nums[i])
            i += 1
            if end >= nums.count - 1 { return true }
        }
        return false
    }
    
    // Leet 55
    public func jump(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var maxAr = [1]
        for i in 0..<nums.count {
            var max = 0
            for j in 0..<maxAr.count - 1 {
                let index = nums[j] + j + 1
                max = max > index ? max : index
                if index >= nums.count { return i + 1 }
            }
            maxAr.append(max)
        }
        return 0
    }
    
    // Leet 274
    public func hIndex(_ citations: [Int]) -> Int {
        let citations = citations.sorted()
        for (index, citation) in citations.enumerated().reversed() {
            if citation <= index {
                return index
            }
        }
        return citations.count
    }
    
    // Leet 238
    public func productExceptSelf(_ nums: [Int]) -> [Int] {
        let arrCount = nums.count
        var prefixAr = Array(repeating: 1, count: arrCount)
        var suffixAr = Array(repeating: 1, count: arrCount)
        var result = Array(repeating: 1, count: arrCount)
        
        for i in 1..<arrCount {
            prefixAr[i] = prefixAr[i - 1] * nums[i - 1]
        }
        
        for j in (0..<arrCount - 1).reversed() {
            suffixAr[j] = suffixAr[j + 1] * nums[j + 1]
        }
        
        for i in 0..<arrCount {
            result[i] = prefixAr[i] * suffixAr[i]
        }
        
        return result
    }
    

}
