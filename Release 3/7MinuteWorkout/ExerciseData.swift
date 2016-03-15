//
//  Good Day Music Catalog and images
//
//
//  Created by James Avakian on 2/09/16.
//  Copyright © 2016 Optical Automation, All rights reserved.
//

import Foundation
import UIKit

class ExerciseData{
    
    var exercises: [Exercise]
    var image: [UIImage] = [
        UIImage(named: "GoodDayMusic.png")!,
        UIImage(named: "guitars.png")!,
        UIImage(named: "bass.png")!,
        UIImage(named: "drums.png")!,
        UIImage(named: "proaudio.png")!,
        UIImage(named: "recording.png")!,
         UIImage(named: "GoodDayMusic.png")!,
    ]
    
    init() {
        exercises = []
        
        let pause = Exercise(title: "Visit The Good Day Music Dot Com Website", image: image[0])
        
        let ex1 = Exercise(title: "Electric Guitars, Fender, Gibson, Squier, Epiphone, Guitar Effects, Amps, and More", image: image[1])
        exercises.append(ex1)
        exercises.append(pause)
        
        let ex2 = Exercise(title: "Bass Guitars, Fender, Gibson, Ibanez, Squier, Warwick, Effects, Amps, and More ", image: image[2])
        exercises.append(ex2)
        exercises.append(pause)
        
        let ex3 = Exercise(title: "Drums, Ludwig, Roland, Alesis, Gretsch, Paiste, Zildjian, Sabian, Sticks, Percussion, and More", image: image[3])
        exercises.append(ex3)
        exercises.append(pause)
        
        let ex4 = Exercise(title: "Pro Audio, Loudspeakers, Microphones, MXR, Electro Voice, Shure, ProTools, Amps, and more", image: image[4])
        exercises.append(ex4)
        exercises.append(pause)
        
        let ex5 = Exercise(title: "Recording, Tape Machines, Microphones, Interfaces, Mixers, Software, and More", image: image[5])
        exercises.append(ex5)
        exercises.append(pause)
        
        
     //   let finish = Exercise(title: "You are Done", image: image[6])
     //   exercises.append(finish)

        
    }
    
    func getExercises() -> [Exercise]{
        return exercises
    }
    
    
}