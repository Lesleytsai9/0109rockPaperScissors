//
//  ViewController.swift
//  0108rockPaperScissors
//
//  Created by 蔡家雯 on 2020/1/8.
//  Copyright © 2020 lesley tsai. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!  //貓手image
    @IBOutlet weak var resultLabel: UILabel! //結果顯示
    @IBOutlet weak var playerLabel: UILabel! //我方出拳顯示
    @IBOutlet weak var playerScoreLabel: UILabel! //我方分數
    @IBOutlet weak var catScoreLabel: UILabel!  //貓的分數
    @IBOutlet weak var playagain: UIButton!  //控制出現消失
    @IBOutlet weak var grayView: UIView!
    
    var playerScoreNumber = 0
    var CatScoreNumber = 0
    
    let catHandImage = ["paper","rock","scissors"]
    let handsGesture = ["✌️","✊","🖐"]
    let wordsResults = ["你贏了！", "你輸了！","平手"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playagain.isHidden = true
        grayView.isHidden = true
    }
    //隨機圖片
    func picRandom(){
        catImageView.image = UIImage(named: catHandImage.randomElement()!)
    }
    //顯示結果
    func result(){
        //剪刀
         if playerLabel.text == handsGesture[0] ,catImageView.image == UIImage(named:catHandImage[0]){
            resultLabel.text = wordsResults[0]
        }else if playerLabel.text == handsGesture[0] ,catImageView.image == UIImage(named:catHandImage[1]){
            resultLabel.text = wordsResults[1]
        }else if playerLabel.text == handsGesture[0] ,catImageView.image == UIImage(named:catHandImage[2]){
            resultLabel.text = wordsResults[2]
        }
        //石頭
         else if playerLabel.text == handsGesture[1] ,catImageView.image == UIImage(named:catHandImage[0]){
            resultLabel.text = wordsResults[1]
        }else if playerLabel.text == handsGesture[1] ,catImageView.image == UIImage(named:catHandImage[1]){
            resultLabel.text = wordsResults[2]
        }else if playerLabel.text == handsGesture[1] ,catImageView.image == UIImage(named:catHandImage[2]){
            resultLabel.text = wordsResults[0]
        }//布
        else if playerLabel.text == handsGesture[2] ,catImageView.image == UIImage(named:catHandImage[0]){
            resultLabel.text = wordsResults[2]
        }else if playerLabel.text == handsGesture[2] ,catImageView.image == UIImage(named:catHandImage[1]){
            resultLabel.text = wordsResults[0]
        }else if playerLabel.text == handsGesture[2] ,catImageView.image == UIImage(named:catHandImage[2]){
            resultLabel.text = wordsResults[1]
        }
    }
    //分數
    func score(){
        if resultLabel.text == wordsResults[0]{
            playerScoreNumber = playerScoreNumber + 1
            playerScoreLabel.text = "\(playerScoreNumber)"
        }else if resultLabel.text == wordsResults[1]{
            CatScoreNumber = CatScoreNumber + 1
            catScoreLabel.text = "\(CatScoreNumber)"
        }
        //alert部分
        if playerScoreNumber == 5{
            let alertController = UIAlertController(
                title: "- Game over -",
                message: "你贏了！",
                preferredStyle: .alert)
            
            let okButton = UIAlertAction(
                title: "ok",
                style: .default,
                handler: {(action: UIAlertAction!) -> Void in})
            
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)

            playagain.isHidden = false
            grayView.isHidden = false
            
        }else if CatScoreNumber == 5 {
            let alertController = UIAlertController(
                title: "- Game over -",
                message: "你輸了！",
                preferredStyle: .alert)
            
            let okButton = UIAlertAction(
                title: "ok",
                style: .default,
                handler: {(action: UIAlertAction!) -> Void in})
            
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)

            playagain.isHidden = false
            grayView.isHidden = false
        }
    }
    
    
    

    @IBAction func scissorsBtn(_ sender: UIButton) {
        playerLabel.text = handsGesture[0]
        picRandom()
        result()
        score()
        
    }
    
    @IBAction func rockBtn(_ sender: UIButton) {
        playerLabel.text = handsGesture[1]
        picRandom()
        result()
        score()
    }
    
    @IBAction func paperBtn(_ sender: UIButton) {
        playerLabel.text = handsGesture[2]
        picRandom()
        result()
        score()
    }
    
    @IBAction func playAgainPrsBtn(_ sender: UIButton) {
        playerScoreNumber = 0
        CatScoreNumber = 0
        playerScoreLabel.text = "\(playerScoreNumber)"
        catScoreLabel.text = "\(CatScoreNumber)"
        playerLabel.text = " "
        resultLabel.text = " "
        playagain.isHidden = true
        grayView.isHidden = true
    }
}


