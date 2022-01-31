// Copyright (c) 2022 Mel Aguoth All rights reserved.
//
// Created By: Mel Aguoth
// Date: January 31, 2022
// This generates, authenticates, and displays 3 by 3 magic squares.

// Import modules.
import Foundation

func printMagicSquare(outputSquare: [Int]) {

  // Format and display the magic squares.
  print("\n" + "*****")
  for counter in 0..<outputSquare.count {
    if counter == 3 || counter == 6 {
      print("\n" + "\(outputSquare[counter])", terminator: " ")
    } else {
      print("\(outputSquare[counter])", terminator: " ")
    }
  }
  print("\n" + "*****")
}

func magicCheck(intArray: [Int]) -> Bool {
  // If the array isn't a valid 9 element array, return false.
  if intArray.count != 9 {
    return false
  }

  // If the array has repeating numbers, return false.
  for outerCounter in 0..<intArray.count {
    for innerCounter in 0..<intArray.count {
      if outerCounter == innerCounter {
        continue
      } else if intArray[outerCounter] == intArray[innerCounter] {
        return false
      }
    }
  }

  // If the horizontal sums aren't 15, return false.
  for horizontalCounter in stride(from: 0, to: 6, by: 3) where intArray[horizontalCounter]
  + intArray[horizontalCounter + 1] + intArray[horizontalCounter + 2] != 15 {
      return false
    }

  // If the vertical sums aren't 15, return false.
  for verticalCounter in 0..<intArray.count / 3 where intArray[verticalCounter]
  + intArray[verticalCounter + 3] + intArray[verticalCounter + 6] != 15 {
    return false
  }

  // If the main diagonal sums aren't 15, return false.
  if intArray[0] + intArray[4] + intArray[8] != 15 || intArray[2] + intArray[4] + intArray[6] != 15 {
    return false
  }

  // If the array is a magic square, return true.
  else {
    return true
  }
}

func magicSquares(magicSquareArray: [Int], extraArray: [Int], wizardNum: Int) {

  // Declare constants.
  let tempMagicNum: Int = wizardNum

  // Declare variables.
  var tempMagicArray: [Int] = magicSquareArray
  var tempEmptyArray: [Int] = extraArray

  // Generate a magic square.
  for magicCounter in 0..<tempMagicArray.count where tempEmptyArray[magicCounter] == 0 {
    tempEmptyArray[magicCounter] = 1
    tempMagicArray[magicCounter] = tempMagicNum + 1

    // Recurse until the magic square array is full.
    if tempMagicNum < tempMagicArray.count - 1 {
      magicSquares(magicSquareArray: tempMagicArray, extraArray: tempEmptyArray, wizardNum: tempMagicNum + 1)
    }

    /* When full, check if the magic square array is a genuine magic square,
     * and if so, print it to the user. */
    else if magicCheck(intArray: tempMagicArray) {
      printMagicSquare(outputSquare: tempMagicArray)
    }

    // Reset the extra array.
    tempEmptyArray[magicCounter] = 0
  }
}

// Declare the lists.
let numArray: [Int] = Array(repeating: 0, count: 9)
let freeSpaceArray: [Int] = Array(repeating: 0, count: numArray.count)

// Introduce the program.
print("This program displays all possible magic squares with a magic order of 3."
    + " In other words, it shows all the 3 by 3 magic squares whose vertical, horizontal,"
    + " and main diagonal sums add to 15.")

// Call magicSquares.
print("\n" + "Here are all the possible order 3 magic squares: ")
magicSquares(magicSquareArray: numArray, extraArray: freeSpaceArray, wizardNum: 0)
