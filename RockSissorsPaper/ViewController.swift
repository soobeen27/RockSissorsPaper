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
    
    let rspImage = ["rock" : UIImage(named: "rock")!, "scissors" : UIImage(named: "scissors")!, "paper" : UIImage(named: "paper")!]
    let readyImage = UIImage(named: "ready")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userPick.image = readyImage
    }

    @IBAction func selectRock(_ sender: UIButton) {
        userPick.image = rspImage["rock"]
    }

    @IBAction func selectScissors(_ sender: UIButton) {
        userPick.image = rspImage["scissors"]
    }
    
    @IBAction func selectPaper(_ sender: UIButton) {
        userPick.image = rspImage["paper"]
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        computerPick.image = readyImage
        userPick.image = readyImage
    }
    
    @IBAction func selectPick(_ sender: UIButton) {
        guard userPick.image != UIImage(named: "ready") else { return }
        computerPick.image = rspImage.values.randomElement()
        winOrLoose()
    }
    
    func winOrLoose() {
        switch userPick.image {
        case let pick where pick == computerPick.image:
            statusTitle.text = "Draw"
        case UIImage(named: "rock") where computerPick.image == UIImage(named: "scissors"),
            UIImage(named: "scissors") where computerPick.image == UIImage(named: "paper"),
            UIImage(named: "paper") where computerPick.image == UIImage(named: "rock"):
            statusTitle.text = "Win"
        default:
            statusTitle.text = "loose"
        }
    }
}

