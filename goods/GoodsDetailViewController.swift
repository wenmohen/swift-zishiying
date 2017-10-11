//
//  GoodsDetailViewController.swift
//  iFoodMacau-Delivery
//
//  Created by nhl on 2017/10/10.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import UIKit

class GoodsDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var goodsDeatailTableView: UITableView!//整个商品详情的tableView
    
    @IBOutlet weak var goodsImageView: UIImageView!//上部商品大图片
    
    @IBOutlet weak var goodsInfoView: UIView!//商品图片下紧挨着商品名字、月售等信息
    @IBOutlet weak var GoodsNavView: UIView!//自定制导航栏
    
    @IBOutlet weak var goodsDetailNavTitleLabel: UILabel!//自制导航栏标题
    
    @IBOutlet weak var GoodsDetailHeightConstraint: NSLayoutConstraint!//导航栏高度
    
    @IBOutlet weak var goodsDetailNavTopConstraint: NSLayoutConstraint!//导航栏距离顶部高度

    @IBOutlet weak var tableviewTopConstrints: NSLayoutConstraint!
    var commentArr:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        _loadData()
        _initNav()
        _initTableView()
    }

    //加载数据
    func _loadData(){
        
        commentArr = ["超级好吃炒鸡好吃超级好吃炒鸡好吃超级好吃炒鸡好吃超级好吃炒鸡好吃超级好吃炒鸡好吃超级好吃炒鸡好吃超级好吃炒鸡好吃超级好吃炒鸡好吃超好吃","艾欧玩但是你我那位勤恳情况那位","看saDNKaeqw   家穷围棋文化我囧氰化物","今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等器让我很气人  奇热网去"," 驱蚊器无群   为   额   按时大大哥大哥ad舒服点ADGFDGDFQ刚打电话哈哈地方问题问题微微抬头热热而且瑞切尔让他去俄日十年房价开始NSNKnsKN时刻能卡死NSr是"]
    }
    
    //tableView
    func _initTableView() {
        
        goodsDeatailTableView.delegate = self
        goodsDeatailTableView.dataSource = self
        goodsDeatailTableView.estimatedRowHeight=100
        goodsDeatailTableView.rowHeight=UITableViewAutomaticDimension
        
    }
    
    //加载导航栏
    func _initNav(){
        changeNavigationBar(barTitle: nil, colorAlpha: 0)
        GoodsDetailHeightConstraint.constant=CGFloat(IPhone_NavHeight)
        goodsDetailNavTopConstraint.constant = CGFloat(44-IPhone_NavHeight)
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
   
    @IBAction func ClickGoodsDetailCloseNavLeftBtnAction(_ sender: UIButton) {
       
      
        UIView.animate(withDuration: 1, animations: {
            self.view.frame=CGRect(x:self.view.center.x,y:self.view.center.y,width:0,height:0)
//            self.parent?.navigationController?.setNavigationBarHidden(false, animated: true)
//            self.parent?.navigationController?.setNavigationBarHidden(false, animated: true)
            let vc:ViewController = (self.parent as? ViewController)!
            vc.isNavHidden = (self.parent?.navigationController?.isNavigationBarHidden)!
            print(self.parent as Any)
            self.navigationController?.setNavigationBarHidden(false, animated: true)

            self.removeFromParentViewController()
            self.view.removeFromSuperview()

        })
    }
    
    @IBAction func ClickGoodsDetailShareNavRightBtnAction(_ sender: UIButton) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK:TableView的delegate和dataSource
extension GoodsDetailViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return commentArr.count+2
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableViewAutomaticDimension
        }else if (indexPath.row == 1){
        return 50
        }else{
//        return 230
             return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        if section == 0 {
            headView.frame=CGRect(x:0,y:0,width:tableView.frame.width/2,height:50)
            headView.backgroundColor=UIColor.white

            
            let goodsSectionView = Bundle.main.loadNibNamed("GoodsDetailSectionHeaderView", owner: nil, options: nil)?.first as? GoodsDetailSectionHeaderView

            goodsSectionView?.frame = headView.frame
            goodsSectionView?.center = headView.center

            if goodsSectionView != nil {
                headView.addSubview(goodsSectionView!)
            }
            
            //底部分割线
            let lineView = UIView()
            lineView.frame=CGRect(x:0,y:headView.frame.height-0.5,width:IPhone_SCREEN_WIDTH,height:0.5)
            lineView.backgroundColor=UIColor.lightText
            headView.addSubview(lineView)
            
        }
        return headView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:GoodsInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GoodsInfoTableViewCell") as! GoodsInfoTableViewCell
            cell.goodsInfoContentLabel.text="今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等今天的套餐包含大盘鸡、炸鸡、啤酒、全鸡、鸡腿、鸭腿、鸡翅、鸡脖、鸡头、鸡爪、鸡心等"
            return cell
        }else if indexPath.row == 1 {
            let cell:GoodsCommentTitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GoodsCommentTitleTableViewCell") as! GoodsCommentTitleTableViewCell
            return cell
        }
        else{
            let cell:GoodsCommentListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GoodsCommentListTableViewCell") as! GoodsCommentListTableViewCell
            cell.commentContentLabel.text=(commentArr[indexPath.row-2] as! String)
                return cell
           }
    
}
}


//MARK:>>>>>>>  UIScrollViewDelegate
extension GoodsDetailViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y

        if y >= CGFloat(IPhone_NavHeight)  {
            tableviewTopConstrints.constant=CGFloat(IPhone_NavHeight)-CGFloat(IPhone_StatusBarHeight)
            changeNavigationBar(barTitle: "商品详情", colorAlpha: 1)
        }else{
            tableviewTopConstrints.constant=0
            changeNavigationBar(barTitle: nil, colorAlpha: y/CGFloat(IPhone_NavHeight))
        }
    }

    
    //导航栏
    func changeNavigationBar(barTitle:String?,colorAlpha:CGFloat) -> () {
        self.GoodsNavView.backgroundColor=UIColor(red: 63/225, green: 129/225, blue: 103/225, alpha: colorAlpha)//将得到
        goodsDetailNavTitleLabel.text=barTitle
        
    }
    

   
}
