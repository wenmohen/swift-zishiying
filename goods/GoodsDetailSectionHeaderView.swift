//
//  GoodsDetailSectionHeaderView.swift
//  iFoodMacau-Delivery
//
//  Created by nhl on 2017/10/11.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import UIKit

class GoodsDetailSectionHeaderView: UIView,PPNumberButtonDelegate {
    //购物车的代理方法
    func numberButtonResult(_ numberButton: PPNumberButton, number: String) {
        print("当前数量多少\(number)")
        if number != "0" {
            GoodsNumberButton.setImage(decreaseImage:#imageLiteral(resourceName: "off"), increaseImage:#imageLiteral(resourceName: "add"))
        }else
        {
            GoodsNumberButton.setImage(decreaseImage:#imageLiteral(resourceName: "off"), increaseImage:getImageWithColor(color: UIColor.clear))
            addShopCartButton.isHidden=false
        }
        
    }
    
    @IBOutlet weak var goodsPriceLabel: UILabel!//价格信息
    
    @IBOutlet weak var discountButton: UIButton!//折扣信息
    
    @IBOutlet weak var GoodsNumberButton: PPNumberButton!//加入购物车
    
    @IBOutlet weak var addShopCartButton: UIButton!
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        _initAddCartButton()
        _initPriceLabel()
        
    }
    
    
    //设置添加购物车button样式
    func _initAddCartButton() {
        GoodsNumberButton.decreaseHide = true
        GoodsNumberButton.setImage(decreaseImage:#imageLiteral(resourceName: "off"), increaseImage:getImageWithColor(color: UIColor.clear))
        GoodsNumberButton.delegate=self
    }
    
    /// 将颜色转换为图片
    ///
    /// - Parameter color: UIColor
    /// - Returns: UIImage
    func getImageWithColor(color:UIColor)->UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
    
    
    //价格富文本设置样式
    func _initPriceLabel()  {
        
        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        
        //折扣后的价
        let currentPriceString : NSAttributedString = NSAttributedString(string: "￥9.9 ", attributes: [ NSAttributedStringKey.backgroundColor : UIColor.clear,NSAttributedStringKey.foregroundColor : UIColor.red, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20.0)])
        
        //原价 给价格加上中划线
        let oldPriceStr =  "￥24.9"
        let oldPriceString: NSMutableAttributedString = NSMutableAttributedString(string: oldPriceStr, attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12.0)])
        oldPriceString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: NSNumber(value: 1), range: NSMakeRange(0, oldPriceStr.count))
        
        attributedStrM.append(currentPriceString)
        attributedStrM.append(oldPriceString)
        
        goodsPriceLabel.attributedText = attributedStrM
        
    }
    
    //当还没有加入购物车东西时，点击“加入购物车”
    @IBAction func ClickAddShopCartButtonAction(_ sender: UIButton) {
        addShopCartButton.isHidden=true
        GoodsNumberButton.ClickIncreaseAction()
    }
}


extension PPNumberButton{
    // MARK: - 加运算
    fileprivate func ClickIncreaseAction() {
        if (textField.text?.characters.count)! == 0 || Int(textField.text!)! < _minValue {
            textField.text = "\(_minValue - 1)"
        }
        
        let number = Int(textField.text!)! + 1;
        
        if number <= _maxValue {
            if decreaseHide && number == _minValue {
                rotationAnimationMethod()
                UIView.animate(withDuration: 0.3, animations: {[weak self] in
                    self?.decreaseBtn.alpha = 1
                    self?.decreaseBtn.frame = CGRect.init(x: 0, y: 0, width: self?.frame.height ?? 0, height: self?.frame.height ?? 0)
                    }, completion: {[weak self] (_) in
                        self?.textField.isHidden = false
                })
            }
            textField.text = "\(number)";
            //闭包回调
            NumberResultClosure?("\(number)")
            IncreaseNumberResultClosure?("\(number)")
            //delegate的回调
            delegate?.numberButtonResult(self, number: "\(number)")
            NumberResultIndoClosure?(number,true)
        } else {
            //添加抖动动画
            if shakeAnimation {shakeAnimationFunc()}
            print("已超过最大数量\(_maxValue)");
        }
        
        
    }
    
    
    // MARK: - 减运算
    fileprivate func ClickDecreaseAction() {
        if (textField.text?.characters.count)! == 0 || Int(textField.text!)! <= _minValue {
            textField.text = "\(_minValue)"
        }
        
        let number = Int(textField.text!)! - 1;
        if number >= _minValue {
            textField.text = "\(number)";
            
            //闭包回调
            NumberResultClosure?("\(number)")
            //delegate的回调
            delegate?.numberButtonResult(self, number: "\(number)")
            NumberResultIndoClosure?(number,false)
        } else {
            if decreaseHide && number < _minValue {
                textField.isHidden = true
                textField.text = "\(_minValue - 1)"
                //闭包回调
                NumberResultClosure?("\(_minValue - 1)")
                //delegate的回调
                delegate?.numberButtonResult(self, number: "\(_minValue - 1)")
                NumberResultIndoClosure?(_minValue - 1,false)
                rotationAnimationMethod()
                UIView.animate(withDuration: 0.3, animations: {[weak self] in
                    self?.decreaseBtn.alpha = 0
                    let width = self?.frame.width ?? 0
                    let height = self?.frame.height ?? 0
                    self?.decreaseBtn.frame = CGRect.init(x: width - height, y: 0, width: height, height: height)
                    }, completion: nil)
                return
            }
            //添加抖动动画
            if shakeAnimation {shakeAnimationFunc()}
            print("数量不能小于\(_minValue)");
        }
    }
    
    
    // MARK: - 旋转动画
    fileprivate func rotationAnimationMethod() -> () {
        let animation = CAKeyframeAnimation.init(keyPath: "transform.rotation")
        animation.values = [Double.pi * 2]
        animation.duration = 0.3
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        decreaseBtn.layer.add(animation, forKey: nil)
        
    }
    // MARK: - 抖动动画
    fileprivate func shakeAnimationFunc() {
        let animation = CAKeyframeAnimation.init(keyPath: "position.x")
        //获取当前View的position坐标
        let positionX = layer.position.x
        //设置抖动的范围
        animation.values = [(positionX-10),(positionX),(positionX+10)]
        //动画重复的次数
        animation.repeatCount = 3
        //动画时间
        animation.duration = 0.07
        //设置自动反转
        animation.autoreverses = true
        //将动画添加到layer
        layer.add(animation, forKey: nil)
    }
}

