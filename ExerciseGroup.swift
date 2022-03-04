//
//  Exercise.swift
//  Workout Logger
//
//  Created by Caleb Ras on 2/24/22.
//

import Foundation


// Class containing a group of exercises for a single muscle
class ExerciseGroup {
    
    // Member Variables
    let muscle: String
    var exercises: Array<Exercise> = []
    var currentExercise: Exercise
    
    init(muscle: String, exercises: Array<String>) {
        self.muscle = muscle
        for name in exercises {
            self.exercises.append(Exercise(name: name))
        }
        self.currentExercise = self.exercises[0]
    }   // init
    
    
    // Returns muscle name
    func get_muscle() -> String {
        return muscle
    }   // get_muscle
    
    
    // Saves the data in current exercise to the array
    func save() {
        for i in 0...exercises.count - 1 {
            if exercises[i].name == currentExercise.name {
                exercises[i] = currentExercise
                break
            }
        }
    }   // save
    
    
    // Finds an exercise baseed input and sets it to currentExercise
    func findExercise(count: Int, inputNum: Int) -> Int {
        var count = count
    
        for i in exercises {
            count += 1
            if count == inputNum {      // found
                currentExercise = i
                break
            }
        }
        
        return count 
    }   // findExercise
    
        
    // Prints muscle and exercises with a number to the screen
    func display(count: Int) -> Int {
        var count = count
        print(muscle)
        
        // Loops and prints exercises if there exercises
        if exercises.count > 0 {
            for i in exercises {
                print("\t\(count). \(i.name)")
                count += 1
            }
        }
        // Prints error statment
        else {
            print("\t No exercises to display")
        }
        
        return count
    }   //display
    
    
    // Runs the option menu on a loop
    func runMenuOption(optionNum: Int) {
        
        // Handle user input for options
        switch optionNum {
                
        // Add sets
        case 1:
            print("\nInput sets:")
            let sets = getInputStr()
            let setsArray = self.strToArry(line: sets)
            addDay(sets: setsArray)
                
        // Undo
        case 2:
            deleteLastDay()
                
        // Return to exercises
        case 0:
            break
                
        default:
            print("Error: \(optionNum) is not a valid input")
        }
        
    }   // runMenuOption
    
    
    // Displays the sets of an exercise
    func displaySets(exercise: Exercise) {
        
        // Loops through days, first level of array
        for day in exercise.days {
            
            // Loops through sets, second level of array
            var sets = ""
            for weight in day {
                sets += String(weight)      // convert num to string
                sets += " "                 // add formating
            }
            
            print("\t\(sets)")          // day of sets print
        }
        
    }   // displaySets
    
    
    // Displays stored set history of a single exercise
    func displayExercise() {
    
        // Runs the option menu
        var inputNum = -1
        while inputNum != 0 {
            
            // Header (name)
            print("\n\n\(self.currentExercise.name): ")
                
            // Error Messgae for no data
            if currentExercise.days[0] == [0, 0, 0] {
                print("\tNo data to display ")
            }
            // Display sets
            else {
                displaySets(exercise: currentExercise)
            }
            
            print("\nOptions: \n\t1. Add sets \n\t2. Undo \n\t0. Return to exercises")     // menu
            
            inputNum = getInputInt()
            runMenuOption(optionNum: inputNum)  // handle options
        }
        
    }   // displayExercise
    
    
    // Adds exercise to list
    func addExercise(exercise: String) {
        
        // Checks if exercise is already in class
        for i in exercises {
            if i.name == exercise {
                print("Error: exercise '\(exercise)' already exist")
                return
            }
        }
        
        exercises.append(Exercise(name: exercise))
        
    }   // addExercise
    
    
    // Converts a string to an array
    func strToArry(line: String) -> Array<Int> {
        let arrayStr = line.split(separator: " ")
        var arrayInt: Array<Int>
        arrayInt = []
        
        for i in arrayStr {
            if let i = Int(i){
                arrayInt.append(i)
            }
        }

        return arrayInt
    }   // strToArry
    
    
    // Add a day of sets
    func addDay(sets: Array<Int>) {
        
        // If there is no saved save over default
        if currentExercise.days[0] == [0, 0, 0] {
            currentExercise.days[0] = sets
        }
        else {
            currentExercise.days.append(sets)
        }
        
        save()
        
    }   // addDay
    
    
    // Deletes a day of sets
    func deleteLastDay() {
        let lastElement = currentExercise.days.count - 1
        
        // If there is data in exercise
        if lastElement > 0  {
            currentExercise.days.remove(at: lastElement)
            save()
        }
        
        // If only 1 set, make it default [0, 0, 0
        else if lastElement == 0 && currentExercise.days[0] != [0, 0, 0] {
            currentExercise.days[0] = [0, 0, 0]
            save()
        }

        else {
            print("\nThere are no elements to delete")
        }
        
    }   // deleteLastDay
    
    
    // Deletes current exercise from exercises
    func deleteCurrentExercise() {
        
        // Finds the exercise to delete in exercises
        for i in 0...exercises.count {
            
            // Found current exercise in exercises
            if exercises[i].name == currentExercise.name {
                exercises.remove(at: i)
                    
                // Reset currentExercise if there are items in list
                if exercises.count > 0 {
                    currentExercise = exercises[0]
                }
                    
                break
            }
        }
        
    }   //deleteCurrentExercise
    

}   // Exercise Group
