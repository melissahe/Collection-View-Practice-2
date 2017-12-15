//
//  ViewController.swift
//  Collection-Views-Practice-2
//
//  Created by C4Q on 12/15/17.
//  Copyright © 2017 Melissa He @ C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //main = the whole screen, including superview
    //bounds - the size of the object
    //we are using UIScreen instead of hard coding a specific spacing because the screen will change spacing but hard coding is not dynamic
    //refers to spacing between cells
    let cellSpacing: CGFloat = UIScreen.main.bounds.width * 0.05
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    //Your implementation of this method can return a fixed set of sizes or dynamically adjust the sizes based on the cell’s content.
    
    //set the size of the cell - should change based on whether it's horizontal scrolling or vertical scrolling
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfCells: CGFloat = 2 // the number of cells you want in a screen
        let numberOfSpaces = numberOfCells + 1 //always minus one because there are n + 1 spaces around n cells (remember the insets spacings count too)
        let width = (UIScreen.main.bounds.width - (cellSpacing * numberOfSpaces)) / numberOfCells
        let height = UIScreen.main.bounds.height * 0.25
        
        return CGSize(width: width, height: height)
    }
    
    //set the insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //can be the same as the spacing
        
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    //set the spacing between successive rows or columns of a section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellSpacing
    }
    
    //set the spacing between the items in a row or column
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellSpacing
    }
    
}
