//
//  QuizViewController.swift
//  quizapp
//
//  Created by Student on 10/05/23.
//

import UIKit

class QuizViewController: UIViewController {
    var arrayOquestions = [[String]]()
    var quiz_arrayOquestions = [[String]]()
    var questionNo: Int = 0
    var correctNo: Int = 0
    var goingNext = false
    var submitted = false
    var finished = false
    var count = 0
    @IBOutlet weak var textDisplay: UILabel!
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var result_label: UILabel!
    @IBOutlet weak var shownextTextButt: UIButton!
    @IBOutlet weak var answerText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayOquestions.removeFirst()
        print(arrayOquestions)
        quiz_arrayOquestions = arrayOquestions
        print(quiz_arrayOquestions)
        quiz_arrayOquestions.shuffle()
        print(quiz_arrayOquestions)
        textDisplay.text=quiz_arrayOquestions[0][0]
        shownextTextButt.isEnabled=true
        shownextTextButt.isHidden=false
        finishButton.isEnabled=false
        finishButton.isHidden=true
        result_label.text = ""
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func shownexttext(_ sender: Any) {
        if(answerText.text==""){}
        else{
        if(finished==false){
        if(quiz_arrayOquestions.isEmpty){
            shownextTextButt.isEnabled=false
        }else{
            if(submitted==false){
                if(quiz_arrayOquestions.isEmpty==false){
                    if(answerText.text==quiz_arrayOquestions[0][1]){
                        result_label.text = "Correct!"
                        questionNo += 1
                        correctNo += 1
                    }else{
                        result_label.text = "Wrong, correct answer was: " + quiz_arrayOquestions[0][1]
                        questionNo += 1
                    }
                    quiz_arrayOquestions.remove(at:0)
                    shownextTextButt.setTitle("Next", for: .normal)
                    submitted = true
                }
                
            }else{
                textDisplay.text=quiz_arrayOquestions[0][0]
                shownextTextButt.setTitle("Submit Answer", for: .normal)
                answerText.text  = ""
                result_label.text = ""
                submitted = false
            }
        }
        if(quiz_arrayOquestions.isEmpty){
            shownextTextButt.isEnabled=false
            shownextTextButt.isHidden = true
            finishButton.isHidden=false
            finishButton.isEnabled=true
        }
        }
        }
    }
    
  
    @IBAction func finishButtonPress(_ sender: Any) {
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    if segue.destination is StatisticsViewController {
    let vc = segue.destination as? StatisticsViewController
    vc?.arrayOquestions = arrayOquestions
    vc?.correctNo = correctNo
    vc?.questionNo = questionNo
    vc?.navigationItem.setHidesBackButton(true, animated: true)
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
