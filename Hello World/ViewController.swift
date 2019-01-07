//
//  ViewController.swift
//  Hello World
//
//  Created by Its on 2019/1/7.
//  Copyright © 2019 Itc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UILabel Test
        let label=UILabel(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        label.text="Hello Git!,I am yangwenjiang ,My wife is wangxi"
        label.backgroundColor=UIColor.red
        label.font=UIFont.systemFont(ofSize: 23)
        label.textColor=UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines=0
        label.lineBreakMode=NSLineBreakMode.byTruncatingMiddle
        
        self.view.addSubview(label)
        
        //UIButton
        let button=UIButton(type: UIButton.ButtonType.custom)
        button.frame=CGRect(x: 40, y: 170, width: 120, height: 120)
        button.backgroundColor=UIColor.blue
        //button.setBackgroundImage(UIImage(named:"ic_launcher"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "ic_launcher"), for: UIControl.State.normal)
        button.setTitle("点我一下", for: UIControl.State.normal)
        var edgeInsets=UIEdgeInsets()
        edgeInsets.top=CGFloat(0)
        edgeInsets.bottom=CGFloat(0)
        edgeInsets.left=CGFloat(0)
        edgeInsets.right=CGFloat(0)
        button.contentEdgeInsets=edgeInsets
        button.imageEdgeInsets=edgeInsets
        button.titleEdgeInsets=edgeInsets
        button.addTarget(self, action: #selector(changeColor), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
    }
    
    @objc func changeColor(){
        self.view.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
    }


}

