//
//  SliderCollectionViewCell.swift
//  Test
//
//  Created by Mohamed Ali BELHADJ on 2022-01-20.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: SliderCollectionViewCell.self)
    
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    func setup(_ slide: Slide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
