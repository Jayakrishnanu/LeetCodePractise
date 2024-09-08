//
//  BackTracking.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public class BackTracking {
    // Leet: 17 Medium
    public func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        var res: [String] = []
        let map: [Character: [Character]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"]
        ]
        
        func backTrack(_ path: [Character], _ input: [Character]) {
            if path.count >= digits.count { res.append(String(path)); return }
            let index = path.count
            let digits = input[index]
            var path = path
            for c in map[digits]! {
                path.append(c)
                backTrack(path, input)
            }
        }
        backTrack([], Array(digits))
        return res
    }
    
    // Leet: 39 Medium
    
    public func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res: [[Int]] = []
        var ans: [Int] = []
        func backTrack(_ remain: Int, _ start: Int, _ ans: inout [Int]) {
            guard remain >= 0 else { return }
            guard remain != 0 else { res.append(ans); return }
            for value in start..<candidates.count {
                ans.append(candidates[value])
                backTrack(remain - candidates[value], value, &ans)
                ans.remove(at: ans.count - 1)
            }
        }
        backTrack(target, 0, &ans)
        return res
    }
    
    
    // Leet: 46 Medium
    public func permuatation(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        func backTrack(_ path: [Int], _ values: [Int]) {
            for i in 0..<values.count {
                var path = path
                var values = values
                path.append(values[i])
                values.remove(at: i)
                if path.count == nums.count { res.append(path) }
                backTrack(path, values)
            }
        }
        backTrack([], nums)
        return res
    }
    
    // Leet: 77 Medium
    public func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var res: [[Int]] = []
        func backTrack(_ path: [Int], _ max: Int) {
            if path.count == k {
                res.append(path)
                return
            }
            var path = path
            if max + 1 > n { return }
            for i in max + 1...n {
                if n - i < k - path.count - 1 {
                    continue
                }
                path.append(i)
                backTrack(path, i)
                path.remove(at: path.count - 1)
            }
        }
        backTrack([], 0)
        return res
    }
}
