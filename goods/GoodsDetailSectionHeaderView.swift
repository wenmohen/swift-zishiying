//
//  GoodsDetailSectionHeaderView.swift
//  iFoodMacau-Delivery
//
//  Created by nhl on 2017/10/11.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import UIKit

class GoodsDetailSectionHeaderView: UIView {
    @IBOutlet weak var goodsPriceLabel: UILabel!//价格信息
    
    @IBOutlet weak var discountButton: UIButton!//折扣信息
    
    @IBOutlet weak var addShopCartButton: UIButton!//加入购物车按钮
    
    @IBOutlet weak var subtractButton: UIButton!//减
    
    @IBOutlet weak var addButton: UIButton!//加
    
    @IBOutlet weak var buyNumLabel: UILabel!//购买数量
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
  */
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        _initPriceLabel()
        
    }
 

    func _initPriceLabel()  {

        //定义富文本即有格式的字符串
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        
        //折扣后的价
        let currentPriceString : NSAttributedString = NSAttributedString(string: "￥9.9 ", attributes: [ NSAttributedStringKey.backgroundColor : UIColor.clear,NSAttributedStringKey.foregroundColor : UIColor.red, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20.0)])
        
        //原价 给价格加上中划线
        let oldPriceStr =  "￥24.9"
        let oldPriceString: NSMutableAttributedString = NSMutableAttributedString(string: oldPriceStr, attributes: [NSAttributedStringKey.foregroundColor : UIColor.lightGray, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12.0)])
           oldPriceString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: NSNumber(value: 1), range: NSMakeRange(1, oldPriceStr.count-1))
        
        attributedStrM.append(currentPriceString)
        attributedStrM.append(oldPriceString)
        
        goodsPriceLabel.attributedText = attributedStrM
        
    }

}
