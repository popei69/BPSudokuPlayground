//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, Sudoku playground"

let emptySudoky = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0]]

let sudoku_1 = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]]

let sudoku_full = [
    [5, 3, 4, 6, 7, 8, 9, 1, 2],
    [6, 7, 2, 1, 9, 5, 3, 4, 8],
    [1, 9, 8, 3, 4, 2, 5, 6, 7],
    [8, 5, 9, 7, 6, 1, 4, 2, 3],
    [4, 2, 6, 8, 5, 3, 7, 9, 1],
    [7, 1, 3, 9, 2, 4, 8, 5, 6],
    [9, 6, 1, 5, 3, 7, 2, 8, 4],
    [2, 8, 7, 4, 1, 9, 6, 3, 5],
    [3, 4, 5, 2, 8, 6, 1, 7, 9]]


func printGrid(grid: [Array<Int>]) -> Void {
    
    print(" --------------- Start ----------------")
    
    for line in grid {
        
        var fullLine = " | "
        for number in line {
            
            fullLine += " \(number) |"
        }
        
        print(fullLine)
        print(" --------------------------------------")
    }
    
    print(" ---------------- Stop ----------------")
}

func isNumberInGridColumn(grid:[Array<Int>], column:Int, valueToSearch:Int) -> Bool {
    
    if grid.count == 0 {
        return false
    }
    
    for line in grid {
        
        if line.count == 0 || column >= line.count {
            return false
        }
        
        if line[column] == valueToSearch {
            return true
        }
    }
    
    return false
}

func isNumberInGridLine(grid:[Array<Int>], line:Int, valueToSearch:Int) -> Bool {
    
    if grid.count == 0 || line >= grid.count {
        return false
    }
    
    return grid[line].contains(valueToSearch)
}

func isNumberInSubGrid(grid:[Array<Int>], line:Int, column:Int, valueToSearch:Int) -> Bool {
    
    if grid.count == 0 || line >= grid.count || column >= grid[line].count {
        return false
    }
    
    let tmpLine = line - (line % 3)
    let tmpColumn = column - (column % 3)
    
    for l in tmpLine..<tmpLine + 3 {
        
        for c in tmpColumn..<tmpColumn + 3 {
            
            if grid[l][c] == valueToSearch {
                return true
            }
        }
    }
    
    return false
}

func backtrack(grid:[Array<Int>], line:Int, column: Int) -> Bool {
    
    var tmpColumn = column
    var tmpLine = line
    
    if (tmpColumn > 8) {
        tmpColumn = 0
        tmpLine += 1
        
        if (tmpLine > 8) {
            
            print("-- find solution -- out of grid --")
            printGrid(grid)
            return true
        }
    }
    
    // move to next position if value already filled
    if grid[tmpLine][tmpColumn] != 0 {
        return backtrack(grid, line: tmpLine, column: tmpColumn + 1)
    }
    
    var gridCopy = grid
    
    for tmpValue in 1..<10 {
        
        gridCopy[tmpLine][tmpColumn] = tmpValue
        
        // check for collision
        let isInline = isNumberInGridLine(grid, line: tmpLine, valueToSearch: tmpValue)
        let isIncolumn = isNumberInGridColumn(grid, column: tmpColumn, valueToSearch: tmpValue)
        let isInSubGrid = isNumberInSubGrid(grid, line: tmpLine, column: tmpColumn, valueToSearch: tmpValue)
        
        if (!isInline && !isIncolumn && !isInSubGrid) {
            gridCopy[tmpLine][tmpColumn] = tmpValue
            
            if (backtrack(gridCopy, line: tmpLine, column: tmpColumn + 1)) {
                return true
            }
        }
    }
    
    print("-- back track from \(tmpLine) \(tmpColumn) -- ")
    gridCopy[tmpLine][tmpColumn] = 0
    return false
    
}

let grid = emptySudoky

printGrid(grid)
backtrack(grid, line: 0, column: 0)
