//
//  Menu.swift
//  Project1.1
//
//  Created by Mychal Smith on 9/24/20.
//  Copyright © 2020 Mychal Smith. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var TextView: UIView!
    
    @IBOutlet weak var FutureLabel: UILabel!
    
    @IBOutlet weak var GradientBackground: UIView!
    
    @IBOutlet weak var MenuLabel: UILabel!
    
    @IBOutlet weak var StartButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gradient = CAGradientLayer( );
        
        let ButtonGradient = CAGradientLayer( );
        
        gradient.frame = view.bounds;
        
        ButtonGradient.frame.size = StartButton.frame.size;
        
        gradient.colors = [ UIColor(red: 252/255, green: 238/255, blue: 33/255, alpha: 1).cgColor, UIColor( red: 248/255, green: 108/255, blue: 71/255, alpha: 1 ).cgColor ]
        
        ButtonGradient.colors = [ UIColor(red: 0/255, green: 49/255, blue: 64/255, alpha: 1).cgColor, UIColor( red: 0/255, green: 0/255, blue: 0/255, alpha: 1 ).cgColor ]
        
        ButtonGradient.startPoint = CGPoint( x: 0.0, y:1.0 );
        
        ButtonGradient.endPoint = CGPoint( x: 1.0, y: 1.0 );
        
        gradient.shouldRasterize = true;
        
        GradientBackground.layer.addSublayer( gradient );
        
        StartButton.layer.cornerRadius = 20;
        
        StartButton.layer.addSublayer( ButtonGradient );
        
        ButtonGradient.cornerRadius = 20;
        
        self.view.addSubview( StartButton );
        
        self.view.addSubview( MenuLabel );
        
        self.view.addSubview( FutureLabel );
    
    }
//
//    override var shouldAutorotate: Bool {
//
//        return false
//
//    }
    
    
    @IBAction func FutureEvents(_ sender: UIButton) {
        
        if FutureLabel.text! == "" {
            
            FutureLabel.text = "Future Content Coming Soon";
            
        }
        
        else {
            
            FutureLabel.text = "";
            
        }
        
    }
    
}

