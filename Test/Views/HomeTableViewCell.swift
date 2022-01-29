//
//  HomeTableViewCell.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-26.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    func setupCell(using dummyData: String) {
        self.textLabel?.text = dummyData
        self.textLabel?.textAlignment = .center
    }
}
