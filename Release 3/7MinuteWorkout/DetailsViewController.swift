//
//  Good Day Music Catalog and images
//
//
//  Created by James Avakian on 2/09/16.
//  Copyright © 2016 Optical Automation, All rights reserved.
//

import UIKit
import AVFoundation

class DetailsViewController: UIViewController {
    
    var timer = NSTimer()
    var timerIsRunning = false
    var timerCount = 3
    var exerciseNumber = -1
    var soundIsOn = true
    
    
    
    
    @IBOutlet weak var soundButtonOutlet: UIButton!
    @IBAction func soundButtonAction(sender: AnyObject) {
        
        if soundIsOn {
            soundButtonOutlet.setTitle("🔇", forState: .Normal)
            soundIsOn = false
        } else {
            soundButtonOutlet.setTitle("🔊", forState: .Normal)
            soundIsOn = true
        }
        
    }
    @IBOutlet weak var exerciseNumLabel: UILabel!
    

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var pauseButtonOutlet: UIButton!
    
    @IBAction func pauseButtonAction(sender: AnyObject) {
        startStopTimer()
    }
    
    @IBOutlet weak var exerciseNameLabel: UILabel!
        
    @IBOutlet weak var timerLabel: UILabel!
    
    func startStopTimer(){
        if !timerIsRunning{
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "counting", userInfo: nil, repeats: true)
            timerIsRunning = true
            pauseButtonOutlet.setTitle("Pause", forState: .Normal)
        } else {
            timer.invalidate()
            timerIsRunning = false
            pauseButtonOutlet.setTitle("Resume", forState: .Normal)
            
        }

    }
    
    func counting(){
        timerCount--
        timerLabel.text = "\(timerCount)"
        
        if timerCount == 0{
            nextExercise()
        }
    }
    
    var theExerciseNumber = 1
    let myExerciseData = ExerciseData()
    var exercises = []
    var width = UIScreen.mainScreen().bounds.width
    var height = UIScreen.mainScreen().bounds.height
    var synthesizer = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    
    func speakText(text: String){
        if soundIsOn {
            myUtterance = AVSpeechUtterance(string: text)
            myUtterance.rate = 0.4
            synthesizer.speakUtterance(myUtterance)
        }
        
    }
    
    func nextExercise(){
        exerciseNumber++
        var exerciseText = ""
        if myExerciseData.getExercises().count > exerciseNumber{
            exerciseText = myExerciseData.getExercises()[myExerciseData.getExercises().startIndex + exerciseNumber].title
            exerciseNameLabel.text = exerciseText
            speakText(exerciseText)
        }
        
        setImage()
        
        
        if exerciseNumber % 2 == 1 {
            timerCount = 5
        } else {
            timerCount = 10
//exerciseNumLabel.text = "Exercise \(myExerciseData.getExercises().startIndex + theExerciseNumber) of 6"
            theExerciseNumber++
        }
        
        if theExerciseNumber == 8{
            startStopTimer()
        }
        
    }
    

    func setImage(){
         if myExerciseData.getExercises().count > exerciseNumber{
            let exerciseImage = myExerciseData.getExercises()[myExerciseData.getExercises().startIndex + exerciseNumber].image
            let theImageView = UIImageView(image: exerciseImage!)
            theImageView.frame = CGRectMake(mainImageView.bounds.minX, mainImageView.bounds.minY, mainImageView.bounds.width, mainImageView.bounds.height)
            self.mainImageView.addSubview(theImageView)
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        timer.invalidate()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopTimer()
        nextExercise()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
