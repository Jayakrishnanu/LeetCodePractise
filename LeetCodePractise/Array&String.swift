//
//  Array&String.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/6/24.
//

import Foundation

class ArrayAndString {
    // Leet: 88 Easy
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
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
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
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
    func removeDuplicates(_ nums: inout [Int]) -> Int {
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
    
    
    
}
