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
    
    @IBOutlet weak var GoodsNavView: UIView!//自定制导航栏
    
    @IBOutlet weak var goodsDetailNavTitleLabel: UILabel!//自制导航栏标题
    
    @IBOutlet weak var GoodsDetailHeightConstraint: NSLayoutConstraint!//导航栏高度
    
    @IBOutlet weak var goodsDetailNavTopConstraint: NSLayoutConstraint!//导航栏距离顶部高度

    @IBOutlet weak var tableviewTopConstrints: NSLayoutConstraint!
    
    let imageHeight:CGFloat =   768 / (1200/IPhone_SCREEN_WIDTH) // 768 * 1200  * 375
    var bgImageV:UIImageView = UIImageView()
    var origialFrame:CGRect = CGRect()
    
    let goodsPicImageView=UIImageView()
    let goodsNameLabel=UILabel()
    let goodsMonthSalesLabel = UILabel()
    var commentArr:NSArray = NSArray()
    var picArr:NSArray=NSArray()
   
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
        
        picArr=[["1-1","1-2"],["2-1","","","",""],["","",""],["","","","","","","",""],["","","","","","","",""]]
    }
    
    //tableView
    func _initTableView() {
        
        
        //顶部商品大图、名称、月售
        goodsPicImageView.frame = CGRect(x: 0, y: 0, width: IPhone_SCREEN_WIDTH, height: imageHeight)
        goodsPicImageView.image = #imageLiteral(resourceName: "user_table_header_background")
        bgImageV = goodsPicImageView
        origialFrame = goodsPicImageView.frame
        view.addSubview(goodsPicImageView)
        view.bringSubview(toFront: GoodsNavView)

        goodsNameLabel.frame = CGRect(x:12,y:goodsPicImageView.frame.maxY,width:IPhone_SCREEN_WIDTH-24,height:35)
        goodsNameLabel.text="农家小炒肉"
        goodsNameLabel.font=UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(goodsNameLabel)

        goodsMonthSalesLabel.frame = CGRect(x:goodsNameLabel.frame.minX,y:goodsNameLabel.frame.maxY,width:IPhone_SCREEN_WIDTH-24,height:20)
        goodsMonthSalesLabel.text="月售 223"
        goodsMonthSalesLabel.textColor=UIColor(red: 153/225, green: 153/225, blue: 153/225, alpha: 1)
        goodsMonthSalesLabel.font=UIFont.boldSystemFont(ofSize: 12)
        view.addSubview(goodsMonthSalesLabel)
        
        let headView = UIView(frame: CGRect(x: 0, y: 0, width: IPhone_SCREEN_WIDTH, height: goodsMonthSalesLabel.frame.maxY - CGFloat(IPhone_StatusBarHeight)))
        headView.backgroundColor = UIColor.clear
        goodsDeatailTableView.tableHeaderView = headView
        
        
        
        goodsDeatailTableView.delegate = self
        goodsDeatailTableView.dataSource = self
        
       
        
        
    }
    
    //加载导航栏
    func _initNav(){
        changeNavigationBar(barTitle: nil, colorAlpha: 1)
        GoodsDetailHeightConstraint.constant=CGFloat(IPhone_NavHeight)
        goodsDetailNavTopConstraint.constant = CGFloat(44-IPhone_NavHeight)
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
   //导航栏左按妞关闭点击事件
    @IBAction func ClickGoodsDetailCloseNavLeftBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 1, animations: {
            self.view.frame=CGRect(x:self.view.center.x,y:self.view.center.y,width:0,height:0)
            let vc:ViewController = (self.parent as? ViewController)!
            vc.isNavHidden = (self.parent?.navigationController?.isNavigationBarHidden)!
            print(self.parent as Any)
            self.navigationController?.setNavigationBarHidden(false, animated: true)

            self.removeFromParentViewController()
            self.view.removeFromSuperview()

        })
    }
    
    //导航栏右按妞分享点击事件
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
       if (indexPath.row == 1){
        return 55
       }else{
             return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
      return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headView = UIView()
        if section == 0 {
            let goodsSectionView = Bundle.main.loadNibNamed("GoodsDetailSectionHeaderView", owner: nil, options: nil)?.first as? GoodsDetailSectionHeaderView
            headView = goodsSectionView!
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
                cell.commentContentLabel.text="第\(indexPath.row-1)行\(self.commentArr[indexPath.row-2]) )"
                cell ._loadCommentPicData(picArr: self.picArr[indexPath.row-2] as! NSArray)
            return cell

           }
    
}
}


//MARK:>>>>>>>  UIScrollViewDelegate
extension GoodsDetailViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y_offset = scrollView.contentOffset.y
        if y_offset >= imageHeight  {
            tableviewTopConstrints.constant=CGFloat(IPhone_NavHeight)-CGFloat(IPhone_StatusBarHeight)
            changeNavigationBar(barTitle: "商品详情", colorAlpha: 1)
        }else{
            tableviewTopConstrints.constant=0
            changeNavigationBar(barTitle: nil, colorAlpha: y_offset/imageHeight)
        }

        if y_offset > 0 {
            bgImageV.frame.origin.y = origialFrame.origin.y - y_offset
            goodsNameLabel.frame.origin.y = bgImageV.frame.maxY
            goodsMonthSalesLabel.frame.origin.y = goodsNameLabel.frame.maxY
        }else{
            let height = self.origialFrame.size.height - y_offset
            let width = height/768*1200// 有高度 算出 宽
            let x = origialFrame.origin.x - (width-origialFrame.size.width)/2
            let frame = CGRect(x: x, y: 0, width: width, height: height)
            bgImageV.frame = frame
            goodsNameLabel.frame.origin.y = bgImageV.frame.maxY
            goodsMonthSalesLabel.frame.origin.y = goodsNameLabel.frame.maxY
        }
        print(origialFrame.size.height)
    }

    
    //导航栏
    func changeNavigationBar(barTitle:String?,colorAlpha:CGFloat) -> () {
        self.GoodsNavView.backgroundColor=UIColor(red: 63/225, green: 129/225, blue: 103/225, alpha: colorAlpha)//将得到
        goodsDetailNavTitleLabel.text=barTitle
        
    }
    

   
}
