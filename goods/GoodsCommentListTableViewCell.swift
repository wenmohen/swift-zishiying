//
//  GoodsCommentListTableViewCell.swift
//  iFoodMacau-Delivery
//
//  Created by nhl on 2017/10/10.
//  Copyright © 2017年 Supernova Software. All rights reserved.
//

import UIKit

class GoodsCommentListTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   

    @IBOutlet weak var commentContentLabel: UILabel!
    
    @IBOutlet weak var commentPicCollectionView: UICollectionView!
    
    @IBOutlet weak var commentPicCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var commentPicCollecViewHeightConstraint: NSLayoutConstraint!
    
    var dataPicArr :Array<Any> = []
    
    var CellNum:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    //设置collectionView
    func _initCollectionViewUI(){
        commentPicCollectionView.delegate=self
        commentPicCollectionView.dataSource=self
        commentPicCollectionViewFlowLayout.minimumLineSpacing=8
        commentPicCollectionViewFlowLayout.minimumInteritemSpacing=10
        commentPicCollectionView.showsHorizontalScrollIndicator=false
        commentPicCollectionView.showsVerticalScrollIndicator=false
        
        commentPicCollectionView.isScrollEnabled = false
    commentPicCollectionViewFlowLayout.itemSize=CGSize(width:commentPicCollectionView.frame.width/3-10,height:commentPicCollectionView.frame.width/3-10)
        var Num:Int = dataPicArr.count/3
       
        Num =  dataPicArr.count % 3 > 0 ? Num+1 :Num
        commentPicCollecViewHeightConstraint.constant =  CGFloat(Num) * commentPicCollectionViewFlowLayout.itemSize.height + commentPicCollectionViewFlowLayout.minimumLineSpacing
      
        
    }
    //评论数
    func _loadCommentPicData(picArr:NSArray,cellNum:Int) {
        dataPicArr = picArr as! Array<Any>
        CellNum = cellNum
        _initCollectionViewUI()
        commentPicCollectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

//UICollectionView代理方法
extension  GoodsCommentListTableViewCell{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataPicArr.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GoodsCommentListPicCollectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodsCommentListPicCollectCellID", for: indexPath) as! GoodsCommentListPicCollectCell
         cell.ceshiLabel.text="\(CellNum+1)---\(indexPath.row+1)"
        return cell
    }
    
}
