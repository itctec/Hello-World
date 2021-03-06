//
//  ViewController.swift
//  Hello World
//
//  Created by Its on 2019/1/7.
//  Copyright © 2019 Itc. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    
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
        
        //UIProgressView
        let progressView=UIProgressView(frame: CGRect(x: 10, y: 320, width: 350, height: 30))
        progressView.progressTintColor=UIColor.red
        progressView.trackTintColor=UIColor.green
        self.view.addSubview(progressView)
        progressView.progress=0.2
        
        //UIStepper
        let stepper=UIStepper()
        stepper.center=CGPoint(x: 55, y: 370)
        stepper.isContinuous=true
        stepper.autorepeat=true
        stepper.wraps=true
        stepper.minimumValue=1
        stepper.maximumValue=10
        stepper.stepValue=1
        stepper.tintColor=UIColor.blue
        stepper.addTarget(self, action: #selector(click), for: UIControl.Event.valueChanged)
//        stepper.setDecrementImage(UIImage(named: "ic_launcher")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), for: UIControl.State.normal)
        self.view.addSubview(stepper)
        
        //UIPickerView
        let picker=UIPickerView(frame: CGRect(x: 10, y: 390, width: 350, height: 150))
        picker.delegate=self
        picker.dataSource=self
        self.view.addSubview(picker)
        
        //CALayer
        let btn=UIButton(type:UIButton.ButtonType.custom)
        btn.setTitle("跳转按钮", for: UIControl.State.normal)
        btn.frame=CGRect(x: 10, y: 550, width: 100, height: 30)
        btn.backgroundColor=UIColor.red
        btn.layer.masksToBounds=true
        btn.layer.cornerRadius=10
        //btn.layer.borderColor=UIColor.green.cgColor
        //btn.layer.borderWidth=1
        btn.layer.shadowColor=UIColor.gray.cgColor
        btn.layer.shadowOffset=CGSize(width: 10, height: 10)
        btn.layer.shadowOpacity=1
        self.view.addSubview(btn)
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
    
    @objc func click(stepper:UIStepper){
        print(stepper.value)
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

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)分区\(row)行数据"
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 160
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(component)分区\(row)行")
    }
    
    
    //UIAlertController
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let alertView=UIAlertController(title: "标题", message:"警告内容", preferredStyle: UIAlertController.Style.alert)
        let alertView=UIAlertController(title: "标题", message:"警告内容", preferredStyle: UIAlertController.Style.actionSheet)
        let action=UIAlertAction(title: "按钮", style: UIAlertAction.Style.default, handler: {(UIAlertAction) -> Void in
            print("Click")
        })
        let action2=UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: {(UIAlertAction) ->
            Void in
            print("取消")
        })
        let action3=UIAlertAction(title: "注意", style: UIAlertAction.Style.destructive, handler: {(UIAlertAction) -> Void in
            print("注意")
        })
        alertView.addAction(action)
        alertView.addAction(action2)
        alertView.addAction(action3)
//        alertView.addTextField{(textField2) in
//            textField2.placeholder="place"
//        }
        self.present(alertView,animated: true,completion: nil)
    }

}

