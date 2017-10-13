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
    
    var dataPicArr :Array<Any> = []  //图片数组

    var collectionViewDataSource:[String]?
    
    let cellNumOfEachLine:Int = 3  //每一行显示的图片数量
    
    var tapCell:((_ images:[UIImage],_ index:Int) -> ())?//评论图片点击事件
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    //评论数
    func _loadCommentPicData(picArr:NSArray) {
        dataPicArr = picArr as! [Any]
        collectionViewDataSource = picArr as? [String]
        _initCollectionViewUI()
        commentPicCollectionView.reloadData()//刷新页面数据，不写图片加载会出现混乱
    }
    
    //设置collectionView
    func _initCollectionViewUI(){
        
        commentPicCollectionView.delegate=self
        commentPicCollectionView.dataSource=self
        commentPicCollectionViewFlowLayout.minimumLineSpacing=8
        commentPicCollectionViewFlowLayout.minimumInteritemSpacing=10
        commentPicCollectionView.showsHorizontalScrollIndicator=false
        commentPicCollectionView.showsVerticalScrollIndicator=false
    commentPicCollectionViewFlowLayout.itemSize=CGSize(width:commentPicCollectionView.frame.width/CGFloat(cellNumOfEachLine)-10,height:commentPicCollectionView.frame.width/CGFloat(cellNumOfEachLine)-10)
        
        //计算图片部分的CollectionView的高度
        var Num:Int = dataPicArr.count/cellNumOfEachLine
        Num =  dataPicArr.count % cellNumOfEachLine > 0 ? Num+1 :Num
        commentPicCollecViewHeightConstraint.constant =  CGFloat(Num) * commentPicCollectionViewFlowLayout.itemSize.height + commentPicCollectionViewFlowLayout.minimumLineSpacing*CGFloat(Num-1)+10
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GoodsCommentListPicCollectCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GoodsCommentListPicCollectCellID", for: indexPath) as! GoodsCommentListPicCollectCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let images = self.getCollectionViewImages() else { return }
        tapCell?(images,indexPath.item)
    }
}

extension GoodsCommentListTableViewCell{
    func getCollectionViewImages() -> [UIImage]? {
        var result = [UIImage]()
        let itemsNumber = commentPicCollectionView.numberOfItems(inSection: 0)
        guard let dataSource = collectionViewDataSource, itemsNumber > 0, itemsNumber == dataSource.count else { return nil }
        for item in 0...itemsNumber - 1 {
            guard let cell = commentPicCollectionView.cellForItem(at: IndexPath.init(item: item, section: 0)) as? GoodsCommentListPicCollectCell, let image = cell.commentPicImageView.image else { continue }
            result.append(image)
        }
        return result.count > 0 ? result : nil
    }
}

