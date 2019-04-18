//
//  ViewController.swift
//
//
//  Created by  on 2018/6/28.
//  Copyright © 2018年 ZCC. All rights reserved.
//

import UIKit
@objc(SwiftViewController)
class SwiftViewController: UIViewController {
    
    private var canAutoShow : Bool = true
    private var SomePrivateClass : Int?
    internal var SomeInternalClass : Int?
    var doingFastCancel = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "heart"
        let label=UILabel.init(frame: CGRect.init(x: 70, y: UIScreen.main.bounds.size.height-50, width: 100, height: 50))
        label.text="请点击白色屏幕并且拖动试试吧～"
        label.sizeToFit()
        label.textColor=UIColor.black
        self.view.addSubview(label)
        let singleTap = UITapGestureRecognizer.init(target: self, action: #selector(singleAction))
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)
        
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressFunc))
        self.view.addGestureRecognizer(longPress)
        ///显示大的红心跳动
        self.autoShowAnimated()
        
    }
    
    func autoShowAnimated(){
        ZanAnimation.showInsistedAnimation(point: CGPoint.init(x: 200, y: 400), sizeScale: 1, baseView: self.view)
        DispatchQueue.global().async {
            while self.canAutoShow {
                Thread.sleep(forTimeInterval: 0.3)
                let  width = Double( UIScreen.main.bounds.size.width)
                let heigth = Double(UIScreen.main.bounds.size.height)
                DispatchQueue.main.async {
                    let randomPoint = CGPoint.init(x: width * drand48(), y: (heigth ) * drand48())
                    ZanAnimation.showLittleStar(point: randomPoint, sizeScale: CGFloat(1 * (drand48() * 0.6 + 0.3)), baseView: self.view)
                }
            }
        }
        DispatchQueue.global().async {
            while self.canAutoShow {
                Thread.sleep(forTimeInterval: 0.2)
                let  width = Double( UIScreen.main.bounds.size.width)
                let heigth = Double(UIScreen.main.bounds.size.height)
                DispatchQueue.main.async {
                    let randomPoint = CGPoint.init(x: width * drand48(), y: (heigth ) * drand48())
                    ZanAnimation.showLittleStar(point: randomPoint, sizeScale: CGFloat(1 * (drand48() * 0.6 + 0.3)), baseView: self.view)
                }
            }
        }
        DispatchQueue.global().async {
            while self.canAutoShow {
                Thread.sleep(forTimeInterval: 0.4)
                let  width = Double( UIScreen.main.bounds.size.width)
                let heigth = Double(UIScreen.main.bounds.size.height)
                DispatchQueue.main.async {
                    let randomPoint = CGPoint.init(x: width * drand48(), y: (heigth ) * drand48())
                    ZanAnimation.showLittleStar(point: randomPoint, sizeScale: CGFloat(1 * (drand48() * 0.6 + 0.3)), baseView: self.view)
                }
            }
        }
    }
    /// 长按手势的方法
    ///
    /// - Parameter action: 长按手势对象
    @objc func longPressFunc(action:UILongPressGestureRecognizer) {
        if action.state == UIGestureRecognizer.State.ended {
            self.doingFastCancel = false
        } else if action.state == UIGestureRecognizer.State.began {
            self.doingFastCancel = true
        }
        
        DispatchQueue.global().async() { () -> Void in
            while self.doingFastCancel {
                Thread.sleep(forTimeInterval: 0.4)
                DispatchQueue.main.async {
                    ZanAnimation.showAnimation(point: action.location(in: self.view), baseView: self.view)
                }
            }
        }
     
        
    }
    @objc func singleAction(pan: UITapGestureRecognizer) {
        self.canAutoShow = false
        ZanAnimation.showAnimation(point: pan.location(in: self.view), baseView: self.view)
        Thread.sleep(forTimeInterval: 1)
        self.autoShowAnimated()
        

    }
    @objc func doubleAction(pan: UITapGestureRecognizer) {
        
        if ZanAnimation.isContinue {
            
            ZanAnimation.showAnimation(point: pan.location(in: self.view), baseView: self.view)
            
        } else {
            
            print("我是双击:(Date.init())")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = ((touches as NSSet).anyObject() as AnyObject)     //进行类  型转化
        let point = touch.location(in: self.view)
        let pointEnd = touch.previousLocation(in: self.view)
        if (abs(pointEnd.x-point.x) > 20 || abs(pointEnd.y-point.y) > 20) {
            ZanAnimation.showAnimation(point: touch.location(in: self.view), baseView: self.view)
        }
        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = ((touches as NSSet).anyObject() as AnyObject)
//        ZanAnimation.showAnimation(point: touch.location(in: self.view), baseView: self.view)
//    }

    
}

