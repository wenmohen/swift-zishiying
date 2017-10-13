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

    @IBOutlet weak var imv: UIImageView!
    @IBOutlet weak var shopCartView: UIView!
    @IBAction func ClickEnterGoodsDetailAction(_ sender: UIButton) {
//        //MARK:前往菜品詳情
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let goodsDetailVC = storyboard.instantiateViewController(withIdentifier: "GoodsDetailViewControllerID") as! GoodsDetailViewController
        self.addChildViewController(goodsDetailVC)
        self.view.addSubview(goodsDetailVC.view)
        self.view.bringSubview(toFront: shopCartView)
        goodsDetailVC.view.frame=CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:IPhone_SCREEN_HEIGHT-CGFloat(IPhone_TabbarSafeBottomMargin)-44)
        
//        let datas : [String] = ["fade","moveIn","push","reveal","cube", "suckEffect", "rippleEffect", "pageCurl", "pageUnCurl", "oglFlip", "cameraIrisHollowOpen",  "cameraIrisHollowClose", "spewEffect","genieEffect","unGenieEffect","twist","tubey","swirl","charminUltra", "zoomyIn", "zoomyOut", "oglApplicationSuspend"]
        
//        let derection : [String] = [kCATransitionFromRight,kCATransitionFromLeft,kCATransitionFromTop,kCATransitionFromBottom]
        
//        let derectionStr = derection[0]
        let transitionAni = Animate.transitionAnimationWith(duration: 0.75, type: "rippleEffect", subtype: kCATransitionFromRight, startProgress: 0, endProgress: 1)
        self.view.layer.add(transitionAni, forKey:"transition")
     
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

