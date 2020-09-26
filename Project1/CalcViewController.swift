//
//  CalcViewController.swift
//  Project1
//
//  Created by Mychal Smith on 9/16/20.
//  Copyright © 2020 Mychal Smith. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {
    
    @IBOutlet weak var CalcLabel: UILabel!
    
    var FirstNum: Int = 0;
    
    var SecondNum: Int = 0;
    
    var FirstDecimalNum: Float = 0.0;
    
    var SecondDecimalNum: Float = 0.0;
    
    var Operator = "";
    
    var DecimalFlag = false;
    
    var EquationFlag = false;
    
    var count = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func NumButtons(_ sender: UIButton) {
        
        if CalcLabel.text!.count >= 10 {
            
            return;
            
        }
        
        
        
        if EquationFlag == false && SecondDecimalNum >= 0.0 && Operator == "=" && DecimalFlag == true {
            
            if CalcLabel.text == nil {
                
                CalcLabel.text = String( "0" );
                
            }
            
            SecondDecimalNum = Float( CalcLabel.text! )!;
            
//            CalcLabel.text = "";
            
        }
        
        if FirstNum > 0 && Operator != "" && Operator != "=" || FirstDecimalNum > 0 && Operator != "" && Operator != "=" {
            
            EquationFlag = true;
            
        }
        
        if SecondNum > 0 && EquationFlag && FirstNum == 0 && FirstDecimalNum == 0 {
             
            SecondNum = Int( CalcLabel.text! )!
             
            CalcLabel.text = "";
             
            EquationFlag = false;
             
         }
             
         else if SecondDecimalNum > 0 && EquationFlag && FirstDecimalNum == 0 {
            
            SecondDecimalNum = Float( CalcLabel.text! )!
             
            CalcLabel.text = "";
             
            DecimalFlag = true;
             
            EquationFlag = false;
             
         }
//
//        else if SecondNum > 0 && !EquationFlag && FirstNum == 0 {
//
//            CalcLabel.text = "";
//
//            CalcLabel.text = String( SecondNum );
//
//            SecondNum = Int( CalcLabel.text! )!
//
//            EquationFlag = false;
//
//        }
//
//        else if SecondDecimalNum > 0 && !EquationFlag && FirstNum == 0 {
//
//            CalcLabel.text = "";
//
//            CalcLabel.text = String( SecondDecimalNum );
//
//            SecondDecimalNum = Float( CalcLabel.text! )!
//
//            DecimalFlag = true;
//
//            EquationFlag = false;
//
//        }
            
        if CalcLabel.text!.contains( "." ) {
            
            count += 1
            
            let CalcNum = CalcLabel.text! + sender.currentTitle!;
            
            CalcLabel.text = CalcNum;
            
            SecondDecimalNum = Float( CalcNum )!;
            
        }
            
        else if DecimalFlag == true {
            
            let CalcNum = CalcLabel.text! + sender.currentTitle!;
            
            CalcLabel.text = CalcNum;
            
            SecondDecimalNum = Float( CalcNum )!;
            
        }
        
        else {
            
            let CalcNum = CalcLabel.text! + sender.currentTitle!;
            
            CalcLabel.text = CalcNum;
            
            SecondNum = Int( CalcNum )!;
            
        }
        
        
    
    }
    
    func NonDecimalOperators( Op: String ) {
         
        if EquationFlag && Operator != Op || EquationFlag && Operator == Op {
            
            if Operator == "/" {
                
                FirstDecimalNum = Float( FirstNum );
                
                SecondDecimalNum = Float( SecondNum );
                
                FirstDecimalNum = FirstDecimalNum / SecondDecimalNum;
                
                CalcLabel.text = "";
                
                Operator = Op;
                
                DecimalFlag = true;
                
                EquationFlag = false;
                
            }
                
            else if Operator == "*" {
                
                FirstNum = FirstNum * SecondNum;
                
                CalcLabel.text = "";
                
                Operator = Op;
                
                EquationFlag = false;
                
            }
                
            else if Operator == "-" {
                
                if SecondNum >= FirstNum {
                    
                    SecondNum = FirstNum - SecondNum;
                    
                    FirstNum = 0;
                }
                
                else {
                    
                    FirstNum = FirstNum - SecondNum;
                    
                }
                
                CalcLabel.text = "";
                
                Operator = Op;
                
                EquationFlag = false;
                
            }
                
            else if Operator == "+" {
                
                FirstNum = FirstNum + SecondNum;
                
                CalcLabel.text = "";
                
                Operator = Op;
                
                EquationFlag = false;
                
            }
            
        }
            
        else {
            
            if Op == "/" {
                
                FirstNum = SecondNum;
                
                CalcLabel.text = "";
                
                Operator = "/";
                
            }
                
            else if Op == "*" {
                
                FirstNum = SecondNum;
                
                CalcLabel.text = "";
                
                Operator = "*";
                
            }
                
            else if Op == "-" {
                
                FirstNum = SecondNum;
                
                CalcLabel.text = "";
                
                Operator = "-";
                
            }
                
            else if Op == "+" {
                
                FirstNum = SecondNum;
                
                CalcLabel.text = "";
                
                Operator = "+";
                
            }
            
        }
        
    }
        
        func DecimalOperators( Op: String ) {
            
            count = 0;
            
            if EquationFlag && Operator != Op && Op != "." || EquationFlag && Operator == Op  && Op != "." {
                
                if Operator == "/" {
                    
                    FirstDecimalNum = FirstDecimalNum / SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = Op;
                    
                }
                    
                else if Operator == "*" {
                    
                    FirstDecimalNum = FirstDecimalNum * SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = Op;
                    
                }
                    
                else if Operator == "-" {
                    
                    if SecondDecimalNum >= FirstDecimalNum {
                        
                        SecondDecimalNum = FirstDecimalNum - SecondDecimalNum;
                        
                        FirstDecimalNum = 0;
                        
                    }
                    
                    else {
                        
                        FirstDecimalNum = FirstDecimalNum - SecondDecimalNum;
                        
                    }
                    
                    CalcLabel.text = "";
                    
                    Operator = Op;
                    
                }
                    
                else if Operator == "+" {
                    
                    FirstDecimalNum = FirstDecimalNum + SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = Op;
                    
                }
                
            }
            
            else {
                
                if Op == "/" {
                    
                    FirstDecimalNum = SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = "/";
                    
                }
                    
                else if Op == "*" {
                    
                    FirstDecimalNum = SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = "*";
                    
                }
                    
                else if Op == "-" {
                    
                    FirstDecimalNum = SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = "-";
                    
                }
                    
                else if Op == "+" {
                    
                    FirstDecimalNum = SecondDecimalNum;
                    
                    CalcLabel.text = "";
                    
                    Operator = "+";
                    
                }
                
            }
            
        }
        
        func DecEquations( Op: String ) {
            
            EquationFlag = true;
            
            if Op == "/" {
                
                if FirstNum > 0 {
                    
                    FirstDecimalNum = Float( FirstNum )
                    
                }
                
                CalcLabel.text = String( FirstDecimalNum / SecondDecimalNum );
                
                SecondDecimalNum = Float( CalcLabel.text! )!
                
                FirstNum = 0;
                
                SecondNum = 0;
                
                FirstDecimalNum = 0;
                
                
            }
                
            else if Op == "*" {
                
                CalcLabel.text = String( FirstDecimalNum * SecondDecimalNum );
                
                SecondDecimalNum = Float( CalcLabel.text! )!
                
                FirstNum = 0;
                
                SecondNum = 0;
                
                FirstDecimalNum = 0;
                
            }
                
            else if Op == "-" {
                
                CalcLabel.text = String( FirstDecimalNum - SecondDecimalNum );
                
                SecondDecimalNum = Float( CalcLabel.text! )!
                
                FirstNum = 0;
                
                SecondNum = 0;
                
                FirstDecimalNum = 0;
                
            }
                
            else if Op == "+" {
                
                CalcLabel.text = String( FirstDecimalNum + SecondDecimalNum );
                
                SecondDecimalNum = Float( CalcLabel.text! )!
                
                FirstNum = 0;
                
                SecondNum = 0;
                
                FirstDecimalNum = 0;
                
            }
            
        }
        
        func NonDecEquations( Op: String ) {
            
            if Op == "/" {
                
                FirstDecimalNum = Float( FirstNum );
                
                SecondDecimalNum = Float( SecondNum );
                
                CalcLabel.text = String( FirstDecimalNum / SecondDecimalNum );
                
                SecondDecimalNum = Float( CalcLabel.text! )!
                
                FirstNum = 0;
                
                FirstDecimalNum = 0;
                
                DecimalFlag = true;
                
                
                
            }
                
            else if Op == "*" {
                
                CalcLabel.text = String( FirstNum * SecondNum );
                
                SecondNum = Int( CalcLabel.text! )!
                
                FirstNum = 0;
                
                FirstDecimalNum = 0;
                
                SecondDecimalNum = 0;
                
                DecimalFlag = false;
                
            }
                
            else if Op == "-" {
                
                CalcLabel.text = String( FirstNum - SecondNum );
                
                SecondNum = Int( CalcLabel.text! )!
                
                FirstNum = 0;
                
                FirstDecimalNum = 0;
                
                SecondDecimalNum = 0;
                
                DecimalFlag = false;
                
            }
                
            else if Op == "+" {
                
                CalcLabel.text = String( FirstNum + SecondNum );
                
                SecondNum = Int( CalcLabel.text! )!
                
                FirstNum = 0;
                
                FirstDecimalNum = 0;
                
                SecondDecimalNum = 0;
                
                DecimalFlag = false;
                
            }
            
        }
        
        
        @IBAction func Operations(_ sender: UIButton) {
            
            if sender.currentTitle == "%" && DecimalFlag == true {
                
                SecondDecimalNum = SecondDecimalNum / 100.0;
                
                CalcLabel.text = String( format: "%.3f", SecondDecimalNum )
                
                DecimalFlag = true;
                
                SecondDecimalNum = Float( CalcLabel.text! )!;
                
                let CalcTest = Float( CalcLabel.text! )!
                
                if CalcLabel.text!.contains( ".0" ) && CalcTest < 0.0 && !CalcLabel.text!.contains( ".00" ) {
                    
                    CalcLabel.text = String( Int( SecondDecimalNum ) );
                    
                }
                
                
                
                
                
            }
            
            if sender.currentTitle == "%" && DecimalFlag == false {
                
                SecondDecimalNum = Float( SecondNum ) / 100.0;
                
                CalcLabel.text = String( format: "%.2f", SecondDecimalNum );
                
                DecimalFlag = true;
                
                SecondDecimalNum = Float( CalcLabel.text! )!;
                
                if CalcLabel.text!.contains( ".0" ) && SecondDecimalNum > 1 && !CalcLabel.text!.contains( ".00" ) {
                    
                    CalcLabel.text = String( Int( SecondDecimalNum ) );
                    
                }
                
            }
            
            if sender.currentTitle == "." {
                
                for char in CalcLabel.text! {
                    
                    if char == "." {
                        
                        count += 1;
                        
                    }
                    
                }
                
                if count >= 1 {
                    
                    return
                    
                }
                
                if CalcLabel.text!.count > 0 {
                    
                    CalcLabel.text = CalcLabel.text! + ".";
                    
                    SecondDecimalNum = Float( CalcLabel.text! )!
                    
                    SecondNum = 0
                    
                    DecimalFlag = true;
                    
                    return
                    
                }
                    
                else {
                    
                    CalcLabel.text = "0.";
                    
                    DecimalFlag = true;
                    
                }
                
            }
            
            if DecimalFlag == true {
                
                DecimalOperators( Op: sender.currentTitle! )
                
            }
                
            else if DecimalFlag == false {
                
                NonDecimalOperators( Op: sender.currentTitle! )
                
            }
            
            if DecimalFlag == true && Operator != "=" && EquationFlag == true {
                
                DecEquations( Op: Operator )
            }
                
            else if DecimalFlag == false && Operator != "=" && EquationFlag == true {
                
                NonDecEquations( Op: Operator )
                
            }
            
            if sender.currentTitle == "=" {
                
                EquationFlag = true;
                
                if DecimalFlag == true && FirstNum > 0 && EquationFlag == false {
                    
                    FirstDecimalNum = Float( FirstNum );
                    
                    DecEquations( Op: Operator )
                }
                    
                else if DecimalFlag == true && SecondNum == 0 {
                    
                    DecEquations( Op: Operator )
                }
                    
                else if DecimalFlag == false && FirstNum > 0 && SecondDecimalNum == 0 {
                    
                    NonDecEquations( Op: Operator )
                    
                }
                
                
                if EquationFlag == true && DecimalFlag {
                    
                    CalcLabel.text = String( SecondDecimalNum );
                    
                }
                
                
                if EquationFlag == true && DecimalFlag && FirstDecimalNum > 0 {
                    
                    SecondDecimalNum = FirstDecimalNum;
                    
                    FirstDecimalNum = 0;
                    
                    CalcLabel.text = String( SecondDecimalNum );
                    
                }
                
                if EquationFlag == true && DecimalFlag == false {
                    
                    CalcLabel.text = String( SecondNum );
                    
                }
                
                if EquationFlag == true && DecimalFlag == false && FirstNum > 0 {
                    
                    SecondNum = FirstNum;
                    
                    FirstNum = 0;
                    
                    CalcLabel.text = String( SecondNum );
                    
                }
                
                if CalcLabel.text!.contains( ".0" ) && !CalcLabel.text!.contains( ".00" ) {
                    
                    SecondNum = Int( SecondDecimalNum );
                    
                    CalcLabel.text = String( SecondNum );
                    
                }
                
                EquationFlag = false;
            }
                
            else if sender.currentTitle == "C" {
                
                CalcLabel.text = "";
                
                FirstNum = 0;
                
                SecondNum = 0;
                
                count = 0;
                
                Operator = "";
                
                FirstDecimalNum = 0;
                
                SecondDecimalNum = 0;
                
                DecimalFlag = false;
                
                EquationFlag = false;
            }
            
        }
}
