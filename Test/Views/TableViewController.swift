//
//  TableViewController.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-26.
//

import UIKit

class TableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var names = ["Exolore", "Best places to rent", "Best offers", "Recommendation", "Support"]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            indexPath.row < 5,
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        
        cell.textLabel?.text = self.names[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return cell
    }
    
}
 
    
   

