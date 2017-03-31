//
//  ViewController.swift
//  KVO
//
//  Created by ZhanTengMr'S Zhang on 2017/3/30.
//  Copyright © 2017年 ZhanTengMr'S Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var value:Stu!
    
    private var context = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        value = Stu()
        addNoticeValue()
    }
    
    
    func addNoticeValue() {
        //observeValueForKeyPath
        self.value.addObserver(self, forKeyPath: "name", options: .New, context: &context)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if context == &self.context {
            if keyPath == "name" {
             if let newValue = change?["new"] {
                print("监听到了 name:\(newValue) 的改变")
             }
            }
        }
        else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        value.name = "120"
    }
    deinit{
    self.value.removeObserver(self, forKeyPath: "name")
    
    }
}

class Stu:NSObject {
    dynamic var name:String?
    var sex:String?
}



