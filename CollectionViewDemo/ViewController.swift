//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by lokizero00 on 2017/9/12.
//  Copyright © 2017年 lokizero00. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //屏幕的宽和高
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载UICollectionView
        loadCollectionView()
    }
    
    func loadCollectionView(){
        //定义collectionView的布局类型，流布局
        let layout = UICollectionViewFlowLayout()
        //设置cell的大小
        layout.itemSize = CGSize(width: width/2, height: height/3)
        //滑动方向 默认方向是垂直
        layout.scrollDirection = .vertical
        //每个Item之间最小的间距
        layout.minimumInteritemSpacing = 0
        //每行之间最小的间距
        layout.minimumLineSpacing = 0
        //定义一个UICollectionView
        let collectionView = UICollectionView(frame: CGRect(x: 0,y: 0,width: width,height: height), collectionViewLayout: layout)
        //设置collectionView的背景颜色
        collectionView.backgroundColor = UIColor.white
        
        //设置collectionView的代理和数据源
        collectionView.delegate = self
        collectionView.dataSource = self
        //CollectionViewCell的注册
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        //header的注册
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
        
        self.view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    // #MARK: --UICollectionViewDataSource的代理方法
    /**
     - 该方法是可选方法，默认为1
     - returns: CollectionView中section的个数
     */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /**
     - returns: Section中Item的个数
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    /**
     - returns: 绘制collectionView的cell
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "\(indexPath.row + 2).png")
        cell.label.text = "美景\(indexPath.row + 1)"
        
        return cell
    }
    
    /**
     - returns: 返回headview或者footview
     */
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headView", for: indexPath)
        headView.backgroundColor = UIColor.white
        
        return headView
    }
    
    // #MARK: --UICollectionViewDelegate的代理方法
    /**
     Description:当点击某个Item之后的回应
     */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("(\(indexPath.section),\(indexPath.row))")
    }
    
    //#MARK: --UICollectionViewDelegateFlowLayout的代理方法
    /**
     - returns: header的大小
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: width, height: 17)
    }
    /**
     Description:可以定制不同的item
     
     - returns: item的大小
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if  indexPath.row % 2 == 1{
            return CGSize(width: width/2, height: height/3)
        }
        else{
            return CGSize(width: width/2, height: height/2)
        }
    }



}

