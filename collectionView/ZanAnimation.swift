//
//  ZanAnimation.swift
//  SuperVolley
//
//  Created by 张崇超 on 2018/5/7.
//  Copyright © 2018年 Zebra. All rights reserved.
//

import UIKit
@objc(ZanAnimation)
class ZanAnimation: NSObject {
    
    /// 是否继续动画, 单击手势与双击冲突时使用
    static var isContinue: Bool {
        
        return !ZanAnimation.allImgVArr.isEmpty
    }
    static private let size: CGFloat = 80.0
    static private let angleArr: [CGFloat] = [CGFloat.pi / 4.0, -CGFloat.pi / 4.0, 0.0]
    static private var allImgVArr: [UIImageView] = []
    
    static func showAnimation(point: CGPoint, baseView: UIView) {
        
        let imgV = UIImageView.init(frame: CGRect.init(x: point.x - ZanAnimation.size / 2.0, y: point.y - ZanAnimation.size / 2.0, width: size*0.5, height: size*0.5))
        imgV.image = UIImage.init(named: "heart2.jpg")
        imgV.contentMode = .scaleAspectFill
        baseView.addSubview(imgV)
        ZanAnimation.allImgVArr.append(imgV)
        
        // 偏移角度
        let num = Int(arc4random_uniform(3))
        imgV.transform = CGAffineTransform.init(rotationAngle: ZanAnimation.angleArr[num])
        // 放大动画
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.duration = 0.15;
//        这个位置不知道填什么值
        animation.calculationMode = CAAnimationCalculationMode.cubic;
        animation.values = [1.3, 0.8, 1.0]
        imgV.layer.add(animation, forKey: "transform.scale")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                imgV.alpha = 0.0
                var newFrame = imgV.frame
                newFrame.origin.x -= 5.0
                newFrame.origin.y -= 45.0
                newFrame.size.height += 10.0
                newFrame.size.width += 10.0
                imgV.frame = newFrame
                
            }, completion: { _ in
                
                imgV.removeFromSuperview()
                if let index = ZanAnimation.allImgVArr.index(of: imgV) {
                    
                    ZanAnimation.allImgVArr.remove(at: index)
                }
            })
        }
    }
    static func showInsistedAnimation(point : CGPoint , sizeScale : CGFloat , baseView : UIView){
        let imgV = UIImageView.init(frame: CGRect.init(x: point.x - ZanAnimation.size / 2.0, y: point.y - ZanAnimation.size / 2.0, width: size * sizeScale, height: size*sizeScale))
        imgV.image = UIImage.init(named: "heart4.jpg")
        imgV.contentMode = .scaleAspectFill
        baseView.addSubview(imgV)
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.duration = 0.15;
        //        这个位置不知道填什么值
        animation.calculationMode = CAAnimationCalculationMode.cubic;
        animation.values = [1.3, 0.8, 1.0]
        imgV.layer.add(animation, forKey: "transform.scale")
        let animateGroup = CAAnimationGroup.init()
        let opacityAnimate = CABasicAnimation(keyPath: "opacity")
        opacityAnimate.fromValue = 0.5
        opacityAnimate.toValue = 1
        
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = nil
        scaleAnimate.toValue = 2
        
        animateGroup.animations = [scaleAnimate,opacityAnimate]
        animateGroup.duration = 0.6
        animateGroup.autoreverses = true
        animateGroup.repeatCount = Float.infinity
        animateGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        imgV.layer.add(animateGroup, forKey: "animate")
    }
    static func showLittleStar(point : CGPoint , sizeScale : CGFloat , baseView : UIView){
        let imgV = UIImageView.init(frame: CGRect.init(x: point.x - ZanAnimation.size / 2.0, y: point.y - ZanAnimation.size / 2.0, width: size*sizeScale, height: size*sizeScale))
        let i = (arc4random() % 4) + 1
        let name = String.init(format: "heart%d.jpg", i)
        imgV.image = UIImage.init(named: name)
        imgV.contentMode = .scaleAspectFill
        baseView.addSubview(imgV)
        ZanAnimation.allImgVArr.append(imgV)
        
        // 偏移角度
        let num = Int(arc4random_uniform(3))
        imgV.transform = CGAffineTransform.init(rotationAngle: ZanAnimation.angleArr[num])
        // 放大动画
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.duration = 0.15;
        //        这个位置不知道填什么值
        animation.calculationMode = CAAnimationCalculationMode.cubic;
        animation.values = [1.3, 0.8, 1.0]
        imgV.layer.add(animation, forKey: "transform.scale")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            UIView.animate(withDuration: 0.5, animations: {
                
                imgV.alpha = 0.0
                var newFrame = imgV.frame
                newFrame.origin.x -= 5.0
                newFrame.origin.y -= 45.0
                newFrame.size.height += 10.0
                newFrame.size.width += 10.0
                imgV.frame = newFrame
                
            }, completion: { _ in
                
                imgV.removeFromSuperview()
                if let index = ZanAnimation.allImgVArr.index(of: imgV) {
                    
                    ZanAnimation.allImgVArr.remove(at: index)
                }
            })
        }
    }
}
