//
//  StatisticsViewController.swift
//  quizapp
//
//  Created by Student on 10/05/23.
//

import UIKit

class StatisticsViewController: UIViewController {
    @IBOutlet weak var correctPercentage: UILabel!
    var arrayOarrayOquestions = [[[String]]]()
    var arrayOquestions = [[String]]()
    var questionNo: Int = 1
    var correctNo: Int = 1
    var correctPercent: Float = 0.0
    var correctPercentInt: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        correctPercent =  (Float(correctNo)/Float(questionNo))*100
        print(String(correctPercentage.description))
        correctPercentInt = Int(correctPercent)
        correctPercentage.text = String(correctPercentInt.description) + "%"
        // Do any additional setup after loading the view.
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
