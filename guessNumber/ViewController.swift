//
//  ViewController.swift
//  guestNumber
//
//  Created by Shun-Ching, Chou on 2018/10/25.
//  Copyright © 2018 Shun-Ching, Chou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var answer = 0
    var life = 10
    var upperBound = 100
    var lowerBound = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initGame()
    }
    
    func initGame() {
        messageLabel.text = "請在範圍內猜一個數字"
        lowerBound = 1
        upperBound = 100
        rangeLabel.text = "\(lowerBound)~\(upperBound)"
        answer = Int.random(in: 1...100)
        life = 10
        lifeLabel.text = "你還有10次機會"
        sendButton.isEnabled = true
    }
    
    func gameOver(win: Bool){
        if win {
            messageLabel.text = "恭喜你答對了！"
        } else {
            messageLabel.text = "Oops！再重新玩一次吧！"
        }
        rangeLabel.text = "正確解答：\(answer)"
        sendButton.isEnabled = false
    }
    
    func updateLifeLabel() {
        life = life - 1
        lifeLabel.text = "剩下\(life)次機會"
        if life == 0 {
            gameOver(win: false)
        }
    }

    @IBAction func sendButton(_ sender: UIButton) {
        if let guestNumber = Int(numberTextField.text!) {
            if (guestNumber >= lowerBound) && (guestNumber <= upperBound){
                if guestNumber == answer {
                    gameOver(win: true)
                } else if answer > guestNumber {
                    rangeLabel.text = "\(guestNumber)~\(upperBound)"
                    lowerBound = guestNumber
                } else {
                    rangeLabel.text = "\(lowerBound)~\(guestNumber)"
                    upperBound = guestNumber
                }
                updateLifeLabel()
            }
        }
        numberTextField.text = ""
    }
    
    @IBAction func restartButton(_ sender: UIButton) {
        initGame()
    }
}

