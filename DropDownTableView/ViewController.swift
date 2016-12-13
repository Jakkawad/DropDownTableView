//
//  ViewController.swift
//  DropDownTableView
//
//  Created by Jakkawad Chaiplee on 12/13/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit

struct FoodType {
    var sectionName: String!
    var sectionValue: [String]!
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var dropDownDictionary = ["Animal": ["Cat", "Dog", "Ant"], "Drink": ["Corona", "Budweiser", "Jack Daniels"], "Fruit": ["Apple", "Mango", "Strawberry", "Blueberry", "Pear", "Orange", "Watermelon"], "Food": ["Twister Combo", "Mozzarella Chicken", "Mathafi Combo", "French Chicken Taf"]]
    
    var foodTypeArray = [FoodType]()
    var selectedSection: Int!
    var foodType: String = ""
    
    var showMore: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showMore == false {
            return 1
        } else if showMore == true {
            var numberOfRow = foodTypeArray[section].sectionValue.count
            numberOfRow = numberOfRow + 1
            if section == selectedSection {
                return numberOfRow
            } else {
                return 1
            }
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if showMore == true {
            if indexPath.row == 0 {
                let cell0 = tableView.dequeueReusableCell(withIdentifier: "tableCell0")
                cell0?.textLabel?.text = foodTypeArray[indexPath.section].sectionName
                return cell0!
            } else {
                let cell1 = tableView.dequeueReusableCell(withIdentifier: "tableCell1") as? DropDownTableViewCell
                cell1?.lblText?.text = foodTypeArray[selectedSection].sectionValue[indexPath.row - 1]
                return cell1!
            }
        } else {
            let cell0 = tableView.dequeueReusableCell(withIdentifier: "tableCell0")
            cell0?.textLabel?.text = foodTypeArray[indexPath.section].sectionName
            return cell0!
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        if showMore == true {
            print("True")
            if indexPath.row == 0 {
                showMore = false
                tableView.reloadSections(NSIndexSet(index: indexPath.section) as IndexSet, with: UITableViewRowAnimation.fade)
            }
        } else if showMore == false {
            print("False")
            showMore = true
            tableView.reloadSections(NSIndexSet(index: indexPath.section) as IndexSet, with: UITableViewRowAnimation.fade)
        } else {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = .none
        
        for (key, value) in  dropDownDictionary {
            foodTypeArray.append(FoodType(sectionName: key, sectionValue: value))
        }
        
        // Do any additional setup after loading the view.
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
