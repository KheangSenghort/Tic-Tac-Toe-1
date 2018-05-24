//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by SREEHARI K.V on 23/05/18.
//  Copyright © 2018 SREEHARI K.V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activeplayer = 1 //cross
    var gamestate = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,4,8],[0,4,8],[2,4,6]]
    var isgameactive = true
    var count = 0
    var flag = 0
    @IBOutlet weak var whowon: UILabel!
    
    
    
    @IBAction func action(_ sender: AnyObject) {
        
        if(gamestate[sender.tag-1] == 0 && isgameactive == true)
        {
            gamestate[sender.tag-1] = activeplayer
            if(activeplayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activeplayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControlState())
                activeplayer = 1
            }
            count = count+1
        }
        if(flag == 0 && count == 9)
        {
            whowon.text = " DRAW"
        }
        for i in winningcombinations
        {
            if(isgameactive == true && gamestate[i[0]] != 0 && gamestate[i[0]] == gamestate[i[1]] && gamestate[i[1]] == gamestate[i[2]])
            {
                if(activeplayer == 2){
                    //print("cross win")
                    isgameactive = false
                    whowon.text = " CROSS WON"
                    flag = 1
                    
                }
                if(activeplayer == 1){
                    //print("Nought win")
                    isgameactive = false
                    whowon.text = " NOUGHT WON"
                    flag = 1
                }
            }
        }
        
    }
    
    @IBAction func playagain(_ sender: UIView) {
        isgameactive = true
        gamestate = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        whowon.text = " "
        for j in 1...9
        {
            let button = view.viewWithTag(j) as! UIButton
            button.setImage(nil, for:UIControlState())
        }
        flag = 0
        count = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

