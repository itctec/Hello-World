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
        
        
        
    }


}

