//
//  ViewController.swift
//  quizapp
//
//  Created by Student on 10/05/23.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){}
    
    //declaring variables
    var arrayOquestions = [[String]]()
    var arrayOarrayOquestions = [[[String]]]()
    var tempquestion = [String]()
    //new question set
    @IBOutlet weak var nameForQuestion: UILabel!
    //main menu
    @IBOutlet weak var makeNewQuestionButton: UIButton!
    //new question set
    @IBOutlet weak var enterNameQuestionButton: UIButton!
    @IBOutlet weak var enterNameQuestionTxt: UITextField!
    //question answer adding
    @IBOutlet weak var addQuestionLabel: UILabel!
    @IBOutlet weak var addQuestionTxt: UITextField!
    @IBOutlet weak var addAnswerLabel: UILabel!
    @IBOutlet weak var addAnswerTxt: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var addFinishButton: UIButton!
    //main menu
    @IBOutlet weak var attemptExistingButton: UIButton!
    //Select question set
    @IBOutlet weak var questionSetList: UILabel!
    
    @IBOutlet weak var selectSetBtn: UIButton!
    @IBOutlet weak var selectSetTxt: UITextField!
    //  Remove question set (main menu)
    @IBOutlet weak var removeQuestionSet: UIButton!
    // remove question set button
    @IBOutlet weak var removeQuestionSetBtn: UIButton!
    //UIImage view
    @IBOutlet weak var menuImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //disable everything and then enable main menu buttons
        disableEverything()
        makeNewQuestionButton.isEnabled=true
        attemptExistingButton.isEnabled=true
        removeQuestionSet.isEnabled=true
        attemptExistingButton.isHidden=false
        makeNewQuestionButton.isHidden=false
        removeQuestionSet.isHidden=false
        menuImage.isHidden=false
        //disabling everything
    }
    func disableEverything(){
        menuImage.isHidden=true
        
        removeQuestionSetBtn.isEnabled=false
        removeQuestionSetBtn.isHidden=true
        
        removeQuestionSet.isEnabled=false
        removeQuestionSet.isHidden=true
        
        selectSetTxt.isEnabled=false
        selectSetTxt.isHidden=true
        
        selectSetBtn.isEnabled=false
        selectSetBtn.isHidden=true
        
        questionSetList.isEnabled=false
        questionSetList.isHidden=true
        
        makeNewQuestionButton.isEnabled=false
        makeNewQuestionButton.isHidden=true
        
        nameForQuestion.isEnabled=false
        nameForQuestion.isHidden=true
        
        enterNameQuestionButton.isEnabled=false
        enterNameQuestionButton.isHidden=true
        
        enterNameQuestionTxt.isEnabled=false
        enterNameQuestionTxt.isHidden=true
        
        addQuestionLabel.isEnabled=false
        addQuestionLabel.isHidden=true
        
        addQuestionTxt.isEnabled=false
        addQuestionTxt.isHidden=true
        
        addAnswerLabel.isEnabled=false
        addAnswerLabel.isHidden=true
        
        addAnswerTxt.isEnabled=false
        addAnswerTxt.isHidden=true
        
        addButton.isEnabled=false
        addButton.isHidden=true
        
        addFinishButton.isEnabled=false
        addFinishButton.isHidden=true
        
        attemptExistingButton.isEnabled=false
        attemptExistingButton.isHidden=true
    }
    
    @IBAction func makeNewQuestionSet(_ sender: Any) {
        disableEverything()
        print("arrayOarrayOquestions when make new question is pressed",arrayOarrayOquestions)
        print("arrayOquestions when make new question is pressed",arrayOquestions)
        enterNameQuestionTxt.isEnabled=true
        enterNameQuestionTxt.isHidden=false
        nameForQuestion.isEnabled=true
        nameForQuestion.isHidden=false
        enterNameQuestionButton.isEnabled=true
        enterNameQuestionButton.isHidden=false
    }
    
    @IBAction func enterQuestionSetName(_ sender: Any) {
        if(enterNameQuestionTxt.text==""){
            let uialert = UIAlertController(title: "Error", message: "Enter non null name", preferredStyle: UIAlertController.Style.alert)
                  uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
               self.present(uialert, animated: true, completion: nil)
        }
        else{var condi=true
            for questionset in arrayOarrayOquestions{
                if enterNameQuestionTxt.text == questionset[0][0]{
                    condi = false
                    let uialert = UIAlertController(title: "Error", message: "Name already used, enter a new name", preferredStyle: UIAlertController.Style.alert)
                          uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                       self.present(uialert, animated: true, completion: nil)
                }
            }
            if condi {
            //adding question set name to arrayOquestions
        tempquestion.append(enterNameQuestionTxt.text ?? "")
        tempquestion.append("0")
        arrayOquestions.removeAll()
        arrayOquestions.append(tempquestion)
        enterNameQuestionTxt.text=""
        print(arrayOquestions)
        //disabling everything then enabling for question answer adding
        disableEverything()
        addQuestionLabel.isEnabled=true
        addQuestionLabel.isHidden=false
        addQuestionTxt.isEnabled=true
        addQuestionTxt.isHidden=false
        addAnswerLabel.isEnabled=true
        addAnswerLabel.isHidden=false
        addAnswerTxt.isEnabled=true
        addAnswerTxt.isHidden=false
        addButton.isEnabled=true
        addButton.isHidden=false
        addFinishButton.isEnabled=true
            addFinishButton.isHidden=false
            nameForQuestion.text="Name for new question set"
            }}
        
    }
    
    @IBAction func addQuestionAnswerBtn(_ sender: Any) {
        if(addQuestionTxt.text == "" || addAnswerTxt.text == ""){}
        else{
        tempquestion.removeAll()
        tempquestion.append(addQuestionTxt.text ?? "")
        tempquestion.append(addAnswerTxt.text ?? "")
        arrayOquestions.append(tempquestion)
        print(arrayOquestions)
        addQuestionTxt.text=""
        addAnswerTxt.text=""
        }
        }
    
    @IBAction func finishAddingQuestionsBtn(_ sender: Any) {
        //adding question set to database then clearing temp set
        if(arrayOquestions.count==1){}else{
        arrayOarrayOquestions.append(arrayOquestions)
        arrayOquestions.removeAll()
        print(arrayOarrayOquestions)
        //disabling all then enabling only main menu items
            disableEverything()
            makeNewQuestionButton.isEnabled=true
            attemptExistingButton.isEnabled=true
            removeQuestionSet.isEnabled=true
            attemptExistingButton.isHidden=false
            makeNewQuestionButton.isHidden=false
            removeQuestionSet.isHidden=false
            menuImage.isHidden=false
        tempquestion.removeAll()
        }
    }
    
    
    @IBAction func attemptExistingSetBtn(_ sender: Any) {
        if(arrayOarrayOquestions.isEmpty){let uialert = UIAlertController(title: "Error", message: "No question sets saved", preferredStyle: UIAlertController.Style.alert)
            uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
         self.present(uialert, animated: true, completion: nil)}else{
        disableEverything()
        questionSetList.isEnabled=true
        questionSetList.isHidden=false
        selectSetTxt.isEnabled=true
        selectSetTxt.isHidden=false
        selectSetTxt.text=""
        selectSetBtn.isEnabled=true
        selectSetBtn.isHidden=false
        questionSetList.text=""
            var temptext = "Select question set to attempt\n"
            questionSetList.text!+=temptext
        var count = 1
        for questionset in arrayOarrayOquestions{
            temptext=String(count)+". "+String(questionset[0][0])+"\n"
            questionSetList.text!+=temptext
            count+=1
        }
        }
    }
    @IBAction func startButton(_ sender: Any) {
        
        for questionset in arrayOarrayOquestions{
            if selectSetTxt.text == questionset[0][0]{
                
                arrayOquestions = questionset
                break
            }
        }
    }
    
    @IBAction func removeQuestionSetMain(_ sender: Any) {
        if(arrayOarrayOquestions.isEmpty){
            let uialert = UIAlertController(title: "Error", message: "No question sets saved", preferredStyle: UIAlertController.Style.alert)
                  uialert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
               self.present(uialert, animated: true, completion: nil)
        }else{
        disableEverything()
        removeQuestionSetBtn.isHidden=false
        removeQuestionSetBtn.isEnabled=true
        
        selectSetTxt.isHidden=false
        selectSetTxt.isEnabled=true
        
        questionSetList.isHidden=false
        questionSetList.isEnabled=true
        selectSetTxt.text=""
        questionSetList.text=""
        var temptext = "Select question set to remove\n"
        questionSetList.text!+=temptext
        var count = 1
        for questionset in arrayOarrayOquestions{
            temptext=String(count)+". "+String(questionset[0][0])+"\n"
            questionSetList.text!+=temptext
            count+=1
        }
        }
    }
    
    @IBAction func removingQuestionSet(_ sender: Any) {
        var result = false
        for questionset in arrayOarrayOquestions{
            if selectSetTxt.text == questionset[0][0]{
                result = true
                arrayOquestions = questionset
                break
            }
        }
        if(result == true){
            if arrayOarrayOquestions.contains(arrayOquestions) {
            let index = arrayOarrayOquestions.firstIndex(of: arrayOquestions)
            arrayOarrayOquestions.remove(at: index!)
            print(arrayOarrayOquestions)
        }
            disableEverything()
            makeNewQuestionButton.isEnabled=true
            attemptExistingButton.isEnabled=true
            removeQuestionSet.isEnabled=true
            attemptExistingButton.isHidden=false
            makeNewQuestionButton.isHidden=false
            removeQuestionSet.isHidden=false
            menuImage.isHidden=false
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var found = false
        for questionset1 in arrayOarrayOquestions{
        if selectSetTxt.text == questionset1[0][0]{
            found = true
        }
        }
        return found
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    if segue.destination is QuizViewController {
        disableEverything()
        makeNewQuestionButton.isEnabled=true
        attemptExistingButton.isEnabled=true
        removeQuestionSet.isEnabled=true
        attemptExistingButton.isHidden=false
        makeNewQuestionButton.isHidden=false
        removeQuestionSet.isHidden=false
        menuImage.isHidden=false
        tempquestion.removeAll()
        for questionset in arrayOarrayOquestions{
            if selectSetTxt.text == questionset[0][0]{
                
                arrayOquestions = questionset
                break
            }
        }
    let vc = segue.destination as? QuizViewController
    vc?.arrayOquestions = arrayOquestions
    vc?.navigationItem.setHidesBackButton(true, animated: true)
    }
    }
}

