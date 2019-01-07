//
//  ViewController.swift
//  Hello World
//
//  Created by Its on 2019/1/7.
//  Copyright © 2019 Itc. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //UILabel Test
        let label=UILabel(frame: CGRect(x: 10, y: 30, width: 280, height: 20))
        label.text="Hello Git!,I am yangwenjiang ,My wife is wangxi"
        label.backgroundColor=UIColor.red
        label.font=UIFont.systemFont(ofSize: 12)
        label.textColor=UIColor.white
        label.textAlignment = NSTextAlignment.center
        label.numberOfLines=0
        label.lineBreakMode=NSLineBreakMode.byTruncatingMiddle
        
        self.view.addSubview(label)
        
        //UIButton
        let button=UIButton(type: UIButton.ButtonType.custom)
        button.frame=CGRect(x: 10, y: 60, width: 70, height: 70)
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
        
        //UITextField
        let textField=UITextField(frame: CGRect(x: 90, y: 60, width: 250, height: 20))
        textField.borderStyle=UITextField.BorderStyle.roundedRect
        textField.placeholder="请输入文字"
        textField.textColor=UIColor.blue
        textField.font=UIFont.systemFont(ofSize: 12)
        textField.textAlignment=NSTextAlignment.center
        
        let imageView=UIImageView(image: UIImage(named: "ic_launcher"))
        imageView.frame=CGRect(x: 0, y: 0, width: 16, height: 16)
        textField.leftView=imageView
        textField.leftViewMode=UITextField.ViewMode.always
        textField.delegate=self
        self.view.addSubview(textField)
        
    }
    
    @objc func changeColor(){
        self.view.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
    }
    
    func textField(_ textField:UITextField,shouldChangeCharactersIn range:NSRange,replacementString string:String)-> Bool{
        if string.count>0{
            let charas:[Character]=["0","1","2","3","4","5","6","7","8","9"]
            let char=string.first!
            if !charas.contains(char){
                print("请输入数字")
                return false
            }
            
            if textField.text!.count+string.count>11{
                print("超过11位")
                return false
            }
        }
        return true
    }


}

