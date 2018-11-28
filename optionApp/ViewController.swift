import UIKit
import GameplayKit
import AVFoundation

struct Qna{
    var question:String
    var answer:[String]
    var correctAnwer:Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myQuestion: UILabel!
    @IBOutlet weak var myQuestionNumber: UILabel!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet var selectedButton: [UIButton]!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var mynextButton: UIButton!
    
    @IBOutlet weak var restartbutton: UIButton!
    
    @IBOutlet weak var firstImage: UILabel!
    
    @IBOutlet weak var tangImage: UIImageView!
 
    
    var topicNumber = 0
    var correctAnswerNumber = 0
    var score = 0
    var warningNumber = 0
    
    var questionArray = [Qna(question: "1+1=?", answer: ["1. 1","3. 2","2. 3","4. 4"], correctAnwer: 3),Qna(question: "15+23=?", answer: ["1. 48","3. 63","2. 52","4. 38"], correctAnwer: 4),Qna(question: "18*17=?", answer: ["1. 306","3. 296","2. 316","4. 326"], correctAnwer: 1),Qna(question: "19*15=?", answer: ["1. 285","3. 295","2. 275","4. 305"], correctAnwer: 1),Qna(question: "792/18=?", answer: ["1. 42","3. 46","2. 44","4. 48"], correctAnwer: 2),Qna(question: "80-60=?", answer: ["1. 10","3. 20","2. 30","4. 40"], correctAnwer: 3),Qna(question: "873-529=?", answer: ["1. 334","3. 344","2. 354","4. 364"], correctAnwer: 3),Qna(question: "99*17=?", answer: ["1. 1583","3. 1483","2. 1683","4. 1633"], correctAnwer: 2),Qna(question: "241+255=?", answer: ["1. 486","3. 476","2. 506","4. 496"], correctAnwer: 4),Qna(question: "19*19=?", answer: ["1. 361","3. 351","2. 371","4. 341"], correctAnwer: 1)]
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {

        myQuestion.isHidden = false
        mynextButton.setTitle("next", for: .normal)
        myQuestion.text = questionArray[warningNumber].question
        correctAnswerNumber = questionArray[warningNumber].correctAnwer
   
        for i in 0 ..< selectedButton.count{
selectedButton[i].setTitle(questionArray[warningNumber].answer[i], for: .normal)
        }
        
        warningNumber += 1
        topicNumber += 1
        myQuestionNumber.text = "第\(topicNumber)題"
        
        button1.isHidden = false
        button2.isHidden = false
        button3.isHidden = false
        button4.isHidden = false
        myQuestionNumber.isHidden = false
        firstImage.isHidden = true
    }
    
    
    
    @IBAction func selectedButton1(_ sender: UIButton) {
        
        if correctAnswerNumber == 1{
            score += 10
            myScore.text = "分數： \(score)"
            button2.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
        }
        if warningNumber == 10{
            warningNumber = 0
            warning()
        }
    }
    
    
    @IBAction func selectedButton2(_ sender: UIButton) {
        
        if correctAnswerNumber == 2{
            score += 10
            myScore.text = "分數： \(score)"
            button1.isHidden = true
            button3.isHidden = true
            button4.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
            
        }
        if warningNumber == 10{
            warningNumber = 0
            warning()
        }
       
    }
    
    @IBAction func selectedButton3(_ sender: UIButton) {
        if correctAnswerNumber == 3{
            score += 10
            myScore.text = "分數： \(score)"
            button1.isHidden = true
            button2.isHidden = true
            button4.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
        }
        if warningNumber == 10{
            warningNumber = 0
            warning()
        }
        
    }
    
    @IBAction func selectedButton4(_ sender: UIButton) {
        if correctAnswerNumber == 4{
            score += 10
            myScore.text = "分數： \(score)"
            button1.isHidden = true
            button2.isHidden = true
            button3.isHidden = true
        }else{
            score -= 10
            myScore.text = "分數： \(score)"
            
        }
        if warningNumber == 10{
            warningNumber = 0
            warning()
        }
    }
    
    
    func reStart(){
        
        myQuestion.isHidden = true
        myQuestionNumber.isHidden = true
        firstImage.isHidden = false
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        topicNumber = 0
        score = 0
        myScore.text = "分數： ---"
        
        
    }
    
    func warning () {
        var myScore = ""
        if  score <= 40{
            myScore = "沒救了"
        }else if score == 100 {
            myScore = "厲害"
        }else if score <= 90 && score > 40 {
            myScore = "尚可"
        }
        let alert =  UIAlertController(title: myScore, message: "\(score)分", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "重新開始", style: .default, handler:{ UIAlertAction in  self.reStart()})
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionArray.shuffle()
        
        button1.isHidden = true
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        

    }


}

