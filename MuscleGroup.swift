//
//  MuscleGroup.swift
//  Workout Logger
//
//  Created by Caleb Ras on 2/24/22.
//

import Foundation


// Class containing exercises for a muscle group (push, pull, and legs)
class MuscleGroup {
    
    // Memeber Variables
    var name: String
    var exerciseGroups: Array<ExerciseGroup>
    
    init (name: String, exerciseGroups: Array<ExerciseGroup>) {
        self.name = name
        self.exerciseGroups = exerciseGroups
    }   // init
    
    
    // Print exercise options to the screen
    func displayExercises() {
        
        // Header (name)
        print("\n\n\t\t\(self.name) Exercises: ")
        
        // Loop through muscle groups
        var count = 1
        for group in exerciseGroups {
            count = group.display(count: count)
        }
        
    }   // displayExercises
    
    
    // Displays exercise history to screen
    func displaySets(inputNum: Int) {
        
        // Loops through the group to find an exercise
        var count = 0
        for group in exerciseGroups {
            count = group.findExercise(count: count, inputNum: inputNum)
            
            // If found, display exercise 
            if count == inputNum {
                group.displayExercise()
                break
            }
        }
        
    }   // displaySets
    
    // Add an exercise to a an exercise group
    func addExercise(muscle: String, exercise: String) {
        
        // Loops through exercises
        for group in exerciseGroups {
            
            // Add to the correct group
            if group.get_muscle() == muscle {
                group.addExercise(exercise: exercise)
            }
        }
        
    }   // addExercise
    
    
    // Delete an exercise from exercise group
    func deleteExercise(inputNum: Int) {
        
        // Loops through exercises
        var count = 0
        for group in exerciseGroups {
            count = group.findExercise(count: count, inputNum: inputNum)
            
            // If found, delete exercise
            if count == inputNum {
                group.deleteCurrentExercise()
                break
            }
        }
        
    }   // deleteExercis
    
    
}   // MuscleGroup
