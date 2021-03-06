//
//  DetailViewController.swift
//  Food
//
//  Created by Ali Emre Değirmenci on 24.02.2019.
//  Copyright © 2019 Ali Emre Değirmenci. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DetailFoodPieceTableViewCellDelegate {
  
    var detailFoodName : [String] = []
    var detailFoodPrice : [Double] = [0.0]
    var menuPieceStepper : UIStepper!
    
    
//    var selectedIndexPath: IndexPath?
    
    let foodNames = [
        "Hamburger big mac",
        "Patates",
        "Whopper",
        "Steakhouse"
    ]
    
    let foodPrices = [
       15.0, 20.0, 25.0, 30.0
    ]
    
    @IBOutlet weak var detailTableView: UITableView!
    
    //TODO:- Add to basket
    @IBAction func addBasket(_ sender: Any) {
//        if let indexPath = selectedIndexPath {
            let destinationVC = MyCartViewController()
            destinationVC.fromDetailFoodNames = foodNames
            destinationVC.fromDetailFoodPrices = foodPrices
            
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if(segue.identifier == "addToCartSegue") {
            if let addToCartVC = segue.destination as? MyCartViewController {
                
                addToCartVC.fromDetailFoodNames = foodNames
                addToCartVC.fromDetailFoodPrices = foodPrices
                
//                let selectedCell = sender as! UITableViewCell
//                let indexPath = self.detailTableView.indexPath(for: selectedCell)

//                var foodName: [String]
//                var foodPrice: [Double]
//
//                foodName = foodNames
//                foodPrice = foodPrices
//
//                addToCartVC.fromDetailFoodNames = foodName
//                addToCartVC.fromDetailFoodPrices = foodPrice

        }
       }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.reloadData()
        
//        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationItem.title = "Sipariş Detayı"
        
        let foodCell = Food(name: ["Hamburger big mac",
                                   "Patates",
                                   "Whopper",
                                   "Steakhouse"], price: [15.0, 20.0, 25.0, 30.0])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodNameCell", for: indexPath) as! DetailFoodTableViewCell
            cell.detailFoodNameLabel?.text = detailFoodName.description
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "piecePriceCell", for: indexPath) as! DetailFoodPieceTableViewCell
            cell.priceLabel?.text = "\(detailFoodPrice)₺"
            cell.delegate = self
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        selectedIndexPath = indexPath
    }
    func detailFoodPriceTableViewCellDidTapStepper(_ sender: DetailFoodPieceTableViewCell) {
        guard let tappedIndexPath = detailTableView.indexPath(for: sender) else {return}
        print("Stepper", sender, tappedIndexPath)
        
        detailFoodPrice += [15.0]
        
        print(detailFoodPrice)
        
        
    }
}



