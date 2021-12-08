//
//  DetailViewController.swift
//  SplitView_TestApp
//
//  Created by Maxim Mitin on 8.12.21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodCostLbl: UILabel!
    @IBOutlet weak var foodDescriptionField: UITextView!
    

    var foodObject : FoodModel? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func set() {
        loadViewIfNeeded()
        foodImage.image = foodObject?.mainImage
        foodNameLbl.text = foodObject?.foodName
        foodCostLbl.text = "\(foodObject?.cost ?? 0)$"
        foodDescriptionField.text = foodObject?.smallDescription
    }

}
