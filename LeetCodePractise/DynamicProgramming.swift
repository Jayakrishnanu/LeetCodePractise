//
//  DynamicProgramming.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public class DynamicProgramming {
    
    // Leet: 5 Medium
    func longestPalindrome(_ s: String) -> String {
        let len = s.count
        let arr = Array(s)
        if len <= 1 { return s }
        var lhs = 0
        var rhs = 0
        var dp = Array(repeating: Array(repeating: false, count: len), count: len)
        for i in 1..<len {
            for j in 0..<i where arr[i] == arr[j] || (dp[j+1][i+1] || i - j <= 2) {
                dp[j][i] = true
                if i - j > rhs - lhs {
                    lhs = j
                    rhs = i
                }
            }
        }
        return String(arr[lhs...rhs])
    }
    
    // Leet: 63 Medium
    
    public func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: obstacleGrid[0].count), count: obstacleGrid.count)
        dp[0][0] = obstacleGrid[0][0]
        for i in 0..<obstacleGrid.count {
            for j in 0..<obstacleGrid[0].count {
                if i > 0 { dp[i][j] += dp[i-1][j] }
                if j > 0 { dp[i][j] += dp[i][j-1] }
                if obstacleGrid[i][j] == 1 { dp[i][j] = 0 }
            }
        }
        return dp[obstacleGrid.count - 1][obstacleGrid[0].count - 1]
    }
    
    // Leet: 64 Medium
    public func minPathSum(_ grid: [[Int]]) -> Int {
        var dp: [[Int]] = grid
        let m = grid.count - 1
        let n = grid[0].count - 1
        
        for i in 0..<m {
            for j in 0..<n {
                var step = dp[i][j]
                if i > 0 && j == 0 {
                    step += dp[i - 1][j]
                } else if i == 0 && j > 0 {
                    step += dp[i][j - 1]
                } else if i > 0 && j > 0 {
                    step += min(dp[i][j - 1], dp[i-1][j])
                }
                dp[i][j] = step
            }
        }
        return dp[m][n]
    }
    
    
    // Leet: 72 Medium
    public func minDistance(_ words1: String, _ words2: String) -> Int {
        if words1.count == 0 { return words2.count }
        if words2.count == 0 { return words1.count }
        let row = words1.count + 1
        let col = words2.count + 1
        let arr1 = Array(words1)
        let arr2 = Array(words2)
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: col), count: row)
        for i in 0..<row {
            for j in 0..<col {
                if i == 0 {
                    dp[i][j] = j
                } else if j == 0 {
                    dp[i][j] = i
                } else if arr1[i-1] == arr2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = 1 + min(dp[i][j-1], dp[i-1][j-1], dp[i-1][j-1])
                }
            }
        }
        return dp[row-1][col-1]
    }
    
    // Leet: 97 Medium
    public func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        let arr1 = Array(s1), arr2 = Array(s2), arr3 = Array(s3)
        if arr3.count != arr1.count + arr2.count { return false }
        var dp = Array(repeating: false, count: arr2.count + 1)
        for i in 0..<arr1.count  + 1 {
            for j in 0..<arr2.count + 1 {
                if i == 0 && j == 0  {
                    dp[j] = true
                } else if i == 0 {
                    dp[j] = dp[j - 1] && arr2[j-1] == arr3[i + j - 1]
                } else if j == 0 {
                    dp[j] = dp[j] && arr1[i-1] == arr3[i + j - 1]
                } else {
                    dp[j] = (dp[j] && arr1[i - 1] == arr3[i + j - 1] || dp[j - 1] && arr2[j-1] == arr3[i + j - 1])
                }
            }
        }
        return dp[arr2.count]
    }
    
    // Leet: 70 Easy
    public func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        for i in 2...n {
            dp[i] = dp[i - 1] + dp [i - 2]
        }
        return dp[n]
    }
    
    // Leet: 120 Medium
    public func minimumTotal(_ nums: [[Int]]) -> Int {
        var dp = Array(repeating: Int.max, count: nums.count)
        var minimum = Int.max
        dp[0] = nums[0][0]
        
        for i in 0..<nums.count {
            for j in 0...i {
                let index = i - j
                let path = index > 0 ? min(dp[index], dp[index - 1]) : dp[index]
                let current = i > 0 ? nums[i][index] : 0
                dp[index] = current + path
            }
        }
        
        for p in dp {
            minimum = min(p, minimum)
        }
        return minimum
    }
    
    // Leet: 134 Medium
    public func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        let count = gas.count
        var dp = Array(repeating: Int.min, count: count)
        var loop = -1
        var i = 0
        var start = -1
        while loop < 1 {
            let index = i > 0 ? i - 1 : count - 1
            if dp[i] >= 0 && start == i { return start }
            if dp[index] >= 0 {
                dp[i] = dp[index] + gas[i] - cost[i]
            } else {
                dp[i] = gas[i] - cost[i]
                start = i
            }
            
            if dp[i] < 0 { start = i }
            i += 1
            if i == count { loop += 1 }
            i %= count
            
        }
        return -1
    }
    
    // Leet: 139 Medium
    public func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        let arr = Array(s)
        let wordSet = Set(wordDict)
        for i in 1..<arr.count {
            for j in 0..<i {
                guard dp[j], wordSet.contains(String(arr[j..<i])) else { continue }
                dp[i] = true
            }
        }
        return dp[s.count]
    }
    
    // Leet: 198 Medium
    
    public func rob(_ nums:[Int]) -> Int {
        if nums.isEmpty { return 0 }
        if nums.count < 2 { return nums[0] }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[1], dp[0])
        for i in 2..<nums.count {
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
        }
        return dp[nums.count - 1]
    }
    
    // Leet: 221 Medium
    
    public func maximalSquare(_ matrix: [[Character]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
        var maxSide = 0
        for r in 1...m {
            for c in 1...n where matrix[r-1][c-1] == "1" {
                dp[r][c] = min(dp[r-1][c], dp[r-1][c-1], dp[r][c-1]) + 1
                maxSide = max(dp[r][c], maxSide)
            }
        }
        return maxSide * maxSide
    }
    
    
    // Leet: 300 Medium
    public func lengthOfLIS(_ nums: [Int]) -> Int {
        var maximum = 1
        var dp = Array(repeating: 1, count: nums.count)
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            let item = nums[i]
            if i == nums.count - 1 {
                continue
            }
            var maxValue = 0
            for j in i + 1...nums.count - 1 {
                if item < nums[j] {
                    maxValue = max(dp[j], maxValue)
                }
            }
            dp[i] = max(maxValue + 1, 1)
            maximum = max(maximum, dp[i])
        }
        return maximum
    }
    
    // Leet: 322 Medium
    public func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var results = [Int](repeating: amount + 1, count: amount + 1)
        results[0] = 0
        for i in 1..<amount + 1 {
            for c in coins {
                if c <= i {
                    results[i] = min(results[i], results[i - c] + 1)
                }
            }
        }
        return results[amount] > amount ? -1 : results[amount]
    }
}
