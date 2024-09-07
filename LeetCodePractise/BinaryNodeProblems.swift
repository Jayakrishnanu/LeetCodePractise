//
//  BinaryNodeProblems.swift
//  LeetCodePractise
//
//  Created by Jayakrishnan u on 9/7/24.
//

import Foundation

public class BinaryNodeProblems {
    public typealias TreeNode = BinaryNode<Int>
    
    // Leet: 100 Easy
    public func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if let p = p, let q = q {
            return p.value == q.value && isSameTree(p.leftChild, q.leftChild) && isSameTree(p.rightChild, q.rightChild)
        } else {
            return p == nil && q == nil
        }
    }
    
    // Leet: 101 Easy
    
    public func isSymmetric(_ root: TreeNode?) -> Bool {
        
        return isSymmetricTree(root?.leftChild, root?.rightChild)
        func isSymmetricTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if let p = p, let q = q {
                return p.value == q.value && isSymmetricTree(p.leftChild, q.rightChild) && isSymmetricTree(p.rightChild, q.leftChild)
            } else {
                return p == nil && q == nil
            }
        }
    }
    
    // Leet: 102 Medium
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        var queue: [TreeNode?] = root != nil ? [root] : []
        var parentCount = root != nil ? 1 : 0
        var childCount = 0
        var array: [Int] = []
        var index = 0
        
        while parentCount > 0 {
            if let node = queue[index] {
                if node.leftChild != nil {
                    queue.append(node.leftChild)
                    childCount += 1
                }
                if node.rightChild != nil {
                    queue.append(node.rightChild)
                    childCount += 1
                }
                array.append(node.value)
                if array.count == parentCount {
                    res.append(array)
                    array = []
                    parentCount = childCount
                    childCount = 0
                }
            }
        }
        return res
    }
    
    // Leet: 103 Medium
    
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var ans: [[Int]] = []
        func dfs(_ node: TreeNode?, _ level: Int, ans: inout [[Int]]) {
            guard let node = node else { return }
            if ans.count <= level { ans.append([Int]()) }
            if level % 2 == 0 {
                ans[level].append(node.value)
            } else {
                ans[level].insert(node.value, at: 0)
            }
            dfs(node.leftChild, level + 1, ans: &ans)
            dfs(node.rightChild, level + 1, ans: &ans)
        }
        dfs(root, 0, ans: &ans)
        return ans
    }
    
    // Leet: 104 Easy
    public func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return 1 + max(maxDepth(root.leftChild), maxDepth(root.rightChild))
    }
    
    // Leet: 105 Medium
    public func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else { return nil }
        let totalCount = preorder.count
        let root = TreeNode(value: preorder[0])
        var rootIndex = -1
        for (i, val) in inorder.enumerated() {
            if val == root.value {
                rootIndex = i
                break
            }
        }
        
        var leftIndex = rootIndex
        root.leftChild = buildTree(Array(preorder[1..<1 + leftIndex]), Array(inorder[0..<leftIndex + 1]))
        root.rightChild = buildTree(Array(preorder[1 + leftIndex..<totalCount]), Array(inorder[1 + leftIndex..<totalCount]))
        return root
    }
    
    // Leet: 112 Medium
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        if targetSum == 0 && root.leftChild != nil && root.rightChild != nil {
            return true
        }
        return hasPathSum(root.leftChild, targetSum - root.value) || hasPathSum(root.rightChild, targetSum - root.value)
    }
    
    // Leet: 114 Medium
    
    public func flatten(_ root: TreeNode?) {
        var tail: TreeNode?
        preOrder(root)
        
        func preOrder(_ root: TreeNode?) {
            guard let root = root else { return }
            let leftChild = root.leftChild
            let rightChild = root.rightChild
            
            if tail == nil {
                tail = root
            } else {
                tail?.rightChild = root
            }
            tail?.leftChild = nil
            tail = root
            preOrder(leftChild)
            preOrder(rightChild)
        }
    }
    
    // Leet: 129 Medium
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return sumNode(root, 0)
        func sumNode(_ root: TreeNode?, _ sum: Int) -> Int {
            guard let root = root else { return 0 }
            if root.leftChild == nil || root.rightChild == nil {
                return 10 * sum + root.value
            }
            return sumNode(root.leftChild, 10 * sum + root.value) + sumNode(root.rightChild, 10 * sum + root.value)
        }
    }
    
    // Leet: 199 Medium
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var list: [Int] = []
        func helper(_ root: TreeNode?, _ list: inout[Int], _ depth: Int) {
            guard let root = root else { return }
            if list.count == depth {
                list.append(root.value)
            }
            helper(root.rightChild, &list, depth + 1)
            helper(root.leftChild, &list, depth + 1)
        }
        helper(root, &list, 0)
        return list
    }
    
    // Leet: 222 Easy
    
    func countNodes(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        return 1 + countNodes(root?.leftChild) + countNodes(root?.rightChild)
        
    }
    
    // Leet: 226 Easy
    public func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        (root.leftChild, root.rightChild) = (root.rightChild, root.leftChild)
        _ = invertTree(root.leftChild)
        _ = invertTree(root.rightChild)
        return root
    }
    
    // Leet: 236 Medium
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p, let q else { return nil }
        if root.value == p.value || root.value == q.value {
            return root
        }
        let leftNode = lowestCommonAncestor(root.leftChild, p, q)
        let rightNode = lowestCommonAncestor(root.rightChild, p, q)
        
        if leftNode == nil && rightNode != nil {
            return rightNode
        } else if leftNode != nil && rightNode == nil {
            return leftNode
        } else if leftNode == nil && rightNode == nil  {
            return root
        } else {
            return nil
        }
    }
    
    // Leet: 637 Medium
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        var result = [Double]()
        guard let root = root else { return result }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            var sum = 0.0
            var count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                sum += Double(node.value)
                if let leftChild = node.leftChild {
                    queue.append(leftChild)
                }
                
                if let rightChild = node.rightChild {
                    queue.append(rightChild)
                }
            }
            result.append(sum / Double(count))
        }
        return result
    }
    
    // Leet: 530 Easy
    
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var difference = Int.max
        var previousNodeValue: Int?
        
        func inOrderTraversal(_ node: TreeNode?) {
            guard let currentNode = node else {
                return
            }
            inOrderTraversal(currentNode.leftChild)
            if let value = previousNodeValue {
                difference = min(difference, abs(currentNode.value - value))
            }
            previousNodeValue = currentNode.value
            inOrderTraversal(currentNode.rightChild)
        }
        inOrderTraversal(root)
        return difference
    }
    
}
