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
        
        //UISwitch
        let swi=UISwitch(frame: CGRect(x: 90, y: 90, width: 100, height: 40))
        swi.onTintColor=UIColor.green
        swi.tintColor=UIColor.blue
        swi.thumbTintColor=UIColor.orange
        swi.addTarget(self, action: #selector(changeSwiColor), for: UIControl.Event.touchUpInside)
        self.view.addSubview(swi)
        
        //UIPageControl
        let page=UIPageControl(frame: CGRect(x: 10, y: 140, width: 300, height: 60))
        page.currentPageIndicatorTintColor=UIColor.red
        page.addTarget(self, action: #selector(changeNum), for: UIPageControl.Event.valueChanged)
        page.numberOfPages=8
        self.view.addSubview(page)
        
        //UISegmentedControl
        let seg=UISegmentedControl(items: ["one","two","three! I am a special Button"])
        seg.frame=CGRect(x: 10, y: 210, width: 320, height: 30)
        seg.setImage(UIImage(named: "ic_launcher")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 1)
        seg.setContentOffset(CGSize(width: 0, height: 0), forSegmentAt: 1)
        seg.isMomentary=false
        seg.insertSegment(withTitle: "new", at: 2, animated: true)
        seg.removeSegment(at: 1, animated: true)
        seg.setTitle("replace", forSegmentAt: 1)
        //seg.setWidth(150, forSegmentAt: 2)
        seg.apportionsSegmentWidthsByContent=true
        //seg.removeAllSegments()
        self.view.addSubview(seg)
        
        //UISlider
        let slider=UISlider(frame: CGRect(x: 10, y: 250, width: 350, height: 30))
        slider.isContinuous=true
        slider.minimumValue=0
        slider.maximumValue=10
        slider.minimumTrackTintColor=UIColor.red
        slider.maximumTrackTintColor=UIColor.green
        //slider.thumbTintColor=UIColor.blue
        //slider.setThumbImage(UIImage(named: "ic_launcher"), for: UIControl.State.normal)
        slider.addTarget(self, action: #selector(changeValue), for: UIControl.Event.valueChanged)
        self.view.addSubview(slider)
        
        
        //UIActivityIndicatorView
        let indicator=UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.center=CGPoint(x: self.view.frame.width/2, y: 300)
        indicator.color=UIColor.black
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    @objc func changeColor(){
        self.view.backgroundColor=UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1)
    }
    
    @objc func changeSwiColor(swi:UISwitch){
        if swi.isOn{
            self.view.backgroundColor=UIColor.red
        }else{
            self.view.backgroundColor=UIColor.white
        }
    }
    
    @objc func changeValue(slider:UISlider){
        print(slider.value)
    }
    
    @objc func changeNum(page:UIPageControl){
        print(page.currentPage)
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

