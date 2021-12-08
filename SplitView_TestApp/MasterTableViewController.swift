//
//  MasterTableViewController.swift
//  SplitView_TestApp
//
//  Created by Maxim Mitin on 8.12.21.
//

import UIKit

protocol FoodSelectedDelegate: AnyObject {
    func foodSelected(food: FoodModel)
}

class MasterTableViewController: UITableViewController {
    
    var food = FoodModel.fetchFood()
    weak var delegate: FoodSelectedDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let currentfood = food[indexPath.row]
        cell.textLabel?.text = currentfood.foodName
        cell.imageView?.image = currentfood.mainImage
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentFood = food[indexPath.row]
        delegate?.foodSelected(food: currentFood)
        
        if let detailVC = delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailVC, sender: nil)
        }
    }

}
