//
//  ViewController.swift
//  RockSissorsPaper
//
//  Created by Soo Jang on 2022/08/03.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var statusTitle: UILabel!
    
    @IBOutlet weak var userPick: UIImageView!
    
    @IBOutlet weak var computerPick: UIImageView!
    
    @IBOutlet weak var userStatus: UILabel!
    
    @IBOutlet weak var computerStatus: UILabel!
    
    let rspImage = ["rock" : UIImage(named: "rock")!, "scissors" : UIImage(named: "scissors")!, "paper" : UIImage(named: "paper")!]
    let readyImage = UIImage(named: "ready")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userPick.image = readyImage
        userStatus.text = ""
        computerStatus.text = ""
    }

//    @IBAction func selectRock(_ sender: UIButton) {
//        userPick.image = rspImage["rock"]
//        userStatus.text = "Rock"
//    }
//
//    @IBAction func selectScissors(_ sender: UIButton) {
//        userPick.image = rspImage["scissors"]
//        userStatus.text = "Scissors"
//    }
//
//    @IBAction func selectPaper(_ sender: UIButton) {
//        userPick.image = rspImage["paper"]
//        userStatus.text = "Paper"
//    }
    
    @IBAction func rspButtonTapped(_ sender: UIButton) {
        let choice = sender.currentTitle!
        userStatus.text = choice
        switch choice {
        case "Rock":
            userPick.image = rspImage["rock"]
        case "Scissors":
            userPick.image = rspImage["scissors"]
        case "Paper":
            userPick.image = rspImage["paper"]
        default:
            break
        }
    }
    
    
    @IBAction func resetGame(_ sender: UIButton) {
        computerPick.image = readyImage
        userPick.image = readyImage
        statusTitle.text = "You have to select"
        userStatus.text = ""
        computerStatus.text = ""
    }
    
    
    
    @IBAction func selectPick(_ sender: UIButton) {
        guard userPick.image != UIImage(named: "ready") else { return }
        randomRSP()
        winOrLoose()
    }
    
    func randomRSP() {
        computerPick.image = rspImage.values.randomElement()
        switch computerPick.image {
        case rspImage["rock"]:
            computerStatus.text = "Rock"
        case rspImage["scissors"]:
            computerStatus.text = "Scissors"
        case rspImage["paper"]:
            computerStatus.text = "Paper"
        default:
            break
        }
    }
    
    func winOrLoose() {
        switch userPick.image {
        case let pick where pick == computerPick.image:
            statusTitle.text = "Draw"
        case rspImage["rock"] where computerPick.image == rspImage["scissors"],
            rspImage["scissors"] where computerPick.image == rspImage["paper"],
            rspImage["paper"] where computerPick.image == rspImage["rock"]:
            statusTitle.text = "Win"
        default:
            statusTitle.text = "loose"
        }
    }
}

