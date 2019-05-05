//
//  FoodieHomeViewController.swift
//  Foodie
//
//  Created by Julian A. Fordyce on 5/4/19.
//  Copyright © 2019 Glas Labs. All rights reserved.
//

import UIKit

class FoodieHomeViewController: UIViewController { //UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeController.fetchRecipes { (error, [Recipe]?) in
            
        }
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return UICollectionViewCell
//
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    var recipeController = RecipeController()
    

}
