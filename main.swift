//
//  main.swift
//  Workout Logger
//
//  Created by Caleb Ras on 2/23/22.
//

import Foundation


// Gets a number from the user
func getInputInt() -> Int {
    
    var intUserInput = -1
    let userInput = readLine()      // Get string
    
    // Unpack to int
    if let userInput = userInput {
        if let userInput = Int(userInput) {
            intUserInput = userInput
        }
    }
    
    return intUserInput
}   // getInputInt

        
// Gets a string from the user
func getInputStr() -> String {
    
    var userInputStr = ""
    let userInput = readLine()      // Get string
    
    // Unpack
    if let userInput = userInput {
        userInputStr = userInput
    }
    
    return userInputStr
}   // getInputStr


// Gets an exercise and its sets
func displayExercise(group: MuscleGroup) {
    group.displayExercises()
    print("\nSelect an exercise to view: ")
    
    let exerciseNum = getInputInt()
    group.displaySets(inputNum: exerciseNum)
}   // displayExercise


// Get muscle and exercise to add the muscle group
func addExercise(group: MuscleGroup) {
    print("Muscle name: ")
    let muscleName = getInputStr()
    
    print("Exercise name: ")
    let exerciseName = getInputStr()
    group.addExercise(muscle: muscleName, exercise: exerciseName)
}   // addExercise


// Gets an exercise to delete
func deleteExercise(group: MuscleGroup) {
    group.displayExercises()
    print("\nSelect an exercise to delete: ")
    
    let exerciseNum = getInputInt()
    group.deleteExercise(inputNum: exerciseNum)
}   // deleteExercise


// Displays option menu to the screen
func displayMenu(group: MuscleGroup) {
    print("\n\(group.name) Options: ")     // header
    print("\t1. View sets \n\t2. Add exercise \n\t3. Delete exercise \n\t0. Quit")
}   // displayMenu


// Runs the main group menu
func mainMenu(group: MuscleGroup) {
    
    // Loops to get user input
    var intUserInput = -1
    while intUserInput != 0 {       // Exit option
        group.displayExercises()
        displayMenu(group: group)
        
        // Get option num and run it
        intUserInput = getInputInt()
        if intUserInput != 0 {
            runMenuOption(group: group, optionNum: intUserInput)        // option menu
        }
    }
    
}   // runMuscleGroup


// Runs a menu option based on a num
func runMenuOption(group: MuscleGroup, optionNum: Int) {
    switch optionNum {
        
    // Display Sets
    case 1:
        displayExercise(group: group)
    // Add exercise
    case 2:
        addExercise(group: group)
    //Delete exercise
    case 3:
        deleteExercise(group: group)
    default:
        print("Error: \(optionNum) is not a valid input")
        
    }
}   // runMenuOption


// Adds push exercises to muscle group
func setGroupPush(group: MuscleGroup) -> MuscleGroup {
    group.name = "Push"
    group.exerciseGroups = [
        ExerciseGroup(muscle: "Chest", exercises: ["Bench Press", "Chest Flies"]),
        ExerciseGroup(muscle: "Triceps", exercises: ["Skull Crushers", "Weight Dips"]),
        ExerciseGroup(muscle: "Delts", exercises: ["Overhead Press", "Lateral Raises"])
    ]
    
    return group
} // setGroupPush


// Adds pull exercises to muscle group
func setGroupPull(group: MuscleGroup) -> MuscleGroup {
    group.name = "Pull"
    group.exerciseGroups = [
        ExerciseGroup(muscle: "Lats", exercises: ["Pull up", "Row "]),
        ExerciseGroup(muscle: "Traps", exercises: ["Face Pull", "Reverse Fly"]),
        ExerciseGroup(muscle: "Biecps", exercises: ["Preacher Curl", "Hammer Curl"]),
    ]
    
    return group
} // setGroupPull


// Adds pull exercises to muscle group
func setGroupLegs(group: MuscleGroup) -> MuscleGroup {
    group.name = "Legs"
    group.exerciseGroups = [
        ExerciseGroup(muscle: "Quads", exercises: ["Leg Extesion", "Hack Squat"]),
        ExerciseGroup(muscle: "Hamstrings", exercises: ["Leg Curl", "Lunges"]),
        ExerciseGroup(muscle: "Abs", exercises: ["Leg Raises", "Russian Twist"]),
    ]
    
    return group
} // setGroupLegs


// Creates a push, pull or legs muscle group depending an input num
func createMucleGroup(groupNum: Int) ->  MuscleGroup {
    
    var muscleGroup = MuscleGroup(name: "", exerciseGroups: [])

    switch groupNum {
    // Push
    case 1:
        muscleGroup = setGroupPush(group: muscleGroup)
    // Pull
    case 2:
        muscleGroup = setGroupPull(group: muscleGroup)
    // Legs
    case 3:
        muscleGroup = setGroupLegs(group: muscleGroup)
    default:
        print("Error: \(groupNum) is not a valid input")
    }
    
    return muscleGroup
}   // createMucleGroup


// Runs program
func runWorkoutLogger() {
    // Welcome message
    print("\n\nWelcome to Workout Logger!")

    var groupInputNum = -1

    // Runs workout logger
    while groupInputNum != 0 {
        print("\n\nPlease select a muscle group: \n\t1. Push \n\t2. Pull \n\t3. Legs \n\t0. Quit")  // options
        
        groupInputNum = getInputInt()
        
        if groupInputNum != 0 {
            let muscleGroup = createMucleGroup(groupNum: groupInputNum)
            mainMenu(group: muscleGroup)
        }

    }

    print("\n\nExiting...\n\n")
}


// Starts program
runWorkoutLogger()

let test = Day(sets: [255, 245, 235])
print(test.date)
