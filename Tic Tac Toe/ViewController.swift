//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Athena on 2/27/18.
//  Copyright © 2018 Sheena Elveus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var activePlayer = 1 //1 - nought, 2 - cross
    var gameState = [0,0,0,0,0,0,0,0,0] //0=empty, 1 - nought, 2 - cross
    let winningCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8,], [2,4,6]]
    var activeGame = true
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var playAgainBtn: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        //print("Button Pressed")
        print((sender as AnyObject).tag)
        
        let activePosition = (sender as AnyObject).tag - 1
        print(activePosition)
        
        //empty spot chosen
        if gameState[activePosition] == 0 && activeGame  {
            
            //set position to the active player at the time
            gameState[activePosition] = activePlayer
            
            //change image on button
            if activePlayer == 1{
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            }else{
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
        }
        
        //check if there's a winner
        for combo in winningCombos{
            if gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]]{
                
                //winner found
                activeGame = false;
                
                print( "winner \(gameState[combo[0]])" )
                announceWinner( winner: gameState[combo[0]] )
            }
        }
    }

    @IBAction func playAgainBtnPressed(_ sender: Any) {
        activeGame = true
        activePlayer = 1
        gameState = [0,0,0,0,0,0,0,0,0]
        //var button: UIButton
        
        for i in 1..<10{
            if let button = (view.viewWithTag(i) as? UIButton) {
                button.setImage(nil, for: [])
            }
        }
        
        winnerLabel.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y)
        
        playAgainBtn.isHidden = true
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x-500, y: playAgainBtn.center.y)
        
    }
    
    @objc func announceWinner( winner: Int ){
        
        if winner == 1{
            winnerLabel.text = "Noughts Has Won!!"
            
        }else{
            winnerLabel.text = "Crosses Has Won!!"
        }
        
        winnerLabel.isHidden = false
        playAgainBtn.isHidden = false
        
        UIView.animate(withDuration: 1){
            self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x+500, y: self.winnerLabel.center.y)
            
            self.playAgainBtn.center = CGPoint(x: self.playAgainBtn.center.x+500, y: self.playAgainBtn.center.y)
        }


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y)
        
        playAgainBtn.isHidden = true
        playAgainBtn.center = CGPoint(x: playAgainBtn.center.x-500, y: playAgainBtn.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

