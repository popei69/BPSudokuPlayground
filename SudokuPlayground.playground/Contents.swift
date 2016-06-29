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


func showGrid(grid: [Array<Int>]) -> Void {
    
    print(" --------------- Start ----------------")
    
    for row in grid {
        
        var fullRow = " | "
        for number in row {
            
            fullRow += " \(number) |"
        }
        
        print(fullRow)
        print(" --------------------------------------")
    }
    
    print(" ---------------- Stop ----------------")
}

func isNumberInGridColumn(grid:[Array<Int>], column:Int, valueToSearch:Int) -> Bool {
    
    if grid.count == 0 {
        return false
    }
    
    for row in grid {
        
        if row.count == 0 || column >= row.count {
            return false
        }
        
        if row[column] == valueToSearch {
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

func findEmptyLocation(grid:[Array<Int>]) -> (row: Int, column: Int) {
    
    for row in 0 ..< grid.count {
        
        for column in 0 ..< grid[row].count {
            
            if grid[row][column] == 0 {
                return (row, column)
            }
        }
    }
    
    return (-1, -1)
}

//showGrid(sudoku_1)


