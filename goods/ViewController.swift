//
//  ViewController.swift
//  goods
//
//  Created by nhl on 2017/10/11.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isNavHidden:Bool = false
    {
        willSet{
            print("willSet\(isNavHidden)")
        }
        
        didSet{
            print("didSet\(isNavHidden)")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
       
        self.navigationController?.setNavigationBarHidden(false, animated: true)

    }

    @IBOutlet weak var shopCartView: UIView!
    @IBAction func ClickEnterGoodsDetailAction(_ sender: UIButton) {
        //MARK:前往菜品詳情
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let goodsDetailVC = storyboard.instantiateViewController(withIdentifier: "GoodsDetailViewControllerID") as! GoodsDetailViewController
        self.addChildViewController(goodsDetailVC)
        self.view.addSubview(goodsDetailVC.view)
        goodsDetailVC.view.frame=CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:0)
        self.view.bringSubview(toFront: shopCartView)
//        UIView.animate(withDuration: 2, animations: {
//        goodsDetailVC.view.frame=CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:IPhone_SCREEN_HEIGHT-CGFloat(IPhone_TabbarSafeBottomMargin)-44)
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
//        })

        
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        anim.toValue = 1 * M_PI
        anim.duration = 1
        anim.repeatCount = MAXFLOAT
        anim.isRemovedOnCompletion = true
        goodsDetailVC.view.layer.add(anim, forKey: nil)
        goodsDetailVC.view.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.2) {
//            goodsDetailVC.view.transform = goodsDetailVC.view.transform.rotated(by: CGFloat(M_PI))
            goodsDetailVC.view.frame=CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:IPhone_SCREEN_HEIGHT-CGFloat(IPhone_TabbarSafeBottomMargin)-44)
//            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

