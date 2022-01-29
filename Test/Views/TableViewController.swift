//
//  TableViewController.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-26.
//

import UIKit

class DummyDatas {
    // - NOTE: Imagine these are our dummy datas from webservice call
    // note that i made the samles as optional "?" because datas can be nil !
    static let arraySamples: [String]? = ["Exolore", "Best places to rent", "Best offers", "Recommendation", "Support", "Travelers", "Accomodations", "Restaurants", "Coffe shops", "cool plac A", "cool plac B", "cool plac C"]
}


// MARK: - For better organisation, we leave all delegates and implementations in further docs .. you should follow the same steps ..
class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    /// for cleaner calls..
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}


// MARK: - WE DO IMPLEMENTATIONS IN SEPERATE EXTENSIONS :
// MARK: - UItableView Delegate + DataSource :
extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // make sure there are data, otherwise, return only one cell to put the empty cell
        guard let unwrappedData = DummyDatas.arraySamples else { return 1 }
        
        // returns the number of objects in the unwrapped data if it's not empty
        // we gonna return only one cell if there is no data (isEmpty)
        return unwrappedData.isEmpty ? 1 : unwrappedData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            //make sure u have data !!
            let unwrappedData = DummyDatas.arraySamples,
            // always use .count .. using static numbers is just for test !!
            indexPath.row < unwrappedData.count,
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.reuseIdentifier, for: indexPath) as? HomeTableViewCell
        else { return UITableViewCell() }
        
        /// it's easier to pass the object to the cell by a function :
        cell.setupCell(using: unwrappedData[indexPath.row])
        
        return cell
    }
    
    // MARK: - These functions can be triggered by UITableView Delegate, let's check them !
    
    // TODO: didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let unwrappedData = DummyDatas.arraySamples,
            indexPath.row < unwrappedData.count 
        else { return }
        
        // constructing a simple native alert
        let simpleiOSAlert = UIAlertController(title: "Alert", message: "You selected item : \(unwrappedData[indexPath.row])", preferredStyle: .alert)
        
        // adding a dismiss action to the alert
        simpleiOSAlert.addAction(.init(title: "Return", style: .cancel, handler: { _ in
            simpleiOSAlert.dismiss(animated: true, completion: nil)
        }))
        
        // present that alert onClick (didSelectRowAt)
        self.present(simpleiOSAlert, animated: true)
    }
}
 
    
   

