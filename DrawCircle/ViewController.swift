//
//  ViewController.swift
//  DrawCircle
//
//  Created by SHUVO on 9/11/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusBtn: UIButton!
    
    var circleView = [UIView]()
    var diameter: CGFloat = 0.0
    var counter: Int = 0
    let positions = [[(0,0)],
                     [(0,100), (0,-100)],
                     [(80,100), (-80,0), (80,-100)],
                     [(80,100), (-80,100), (80,-100), (-80,-100)]
                    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        diameter = min(self.view.frame.size.width, self.view.frame.size.height) * 0.6;
        
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal,toItem:self.plusBtn, attribute: NSLayoutAttribute.top, multiplier: 1, constant:-10)
        let right = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal,toItem:self.plusBtn, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant:10)
        let width = NSLayoutConstraint(item: self.plusBtn, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:45)
        let height = NSLayoutConstraint(item: self.plusBtn, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:50)
        NSLayoutConstraint.activate([top , right ,width , height])
        
        self.view.addSubview(plusBtn)
    }
    
    
    @IBAction func buttonTapped(_ sender: AnyObject) {
        
        if (counter < 4) {
            drawCircle()
            setupConstraints()
            counter += 1
        }
        
    }
    
    func drawCircle() {
        
        print("counter \(counter)")
        if (counter > 0) {
            diameter *= 0.85
            for i in 0..<counter {
                circleView[i].removeFromSuperview()
            }
        }
        
        for i in 0..<counter+1 {
            circleView.append(UIView())
            circleView[i].frame = CGRect(x :0, 
                                         y :0,
                                         width :diameter, height :diameter);
            circleView[i].layer.cornerRadius = diameter / 2;
            circleView[i].clipsToBounds = true
            circleView[i].layer.borderColor = UIColor.blue.cgColor
            circleView[i].layer.borderWidth = 1.0
            self.view.addSubview(circleView[i])
        }
        
    }
    
    func setupConstraints() {
        
        for j in 0..<positions[counter].count {
            
            self.circleView[j].translatesAutoresizingMaskIntoConstraints = false
            
            let centerX = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal,toItem: self.circleView[j], attribute: NSLayoutAttribute.centerX, multiplier: 1, constant:CGFloat(positions[counter][j].0))
            let centerY = NSLayoutConstraint(item: self.view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal,toItem: self.circleView[j], attribute: NSLayoutAttribute.centerY, multiplier: 1, constant:CGFloat(positions[counter][j].1))
            let squareWidth = NSLayoutConstraint(item: self.circleView[j], attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:diameter)
            let squareHeight = NSLayoutConstraint(item: self.circleView[j], attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant:diameter)
            
            NSLayoutConstraint.activate([centerX , centerY ,squareWidth , squareHeight])
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


