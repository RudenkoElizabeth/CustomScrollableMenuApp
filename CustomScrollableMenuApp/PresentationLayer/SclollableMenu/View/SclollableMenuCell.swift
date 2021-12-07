//
//  SclollableMenuCell.swift
//
//  Created by Elizaveta Rudenko on 22.11.2021.
//

import UIKit

class SclollableMenuCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            titleLabel.isHighlighted = isSelected
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    func setupTitleLabel(text: String, fontSize: CGFloat) {
        titleLabel.font = titleLabel.font.withSize(fontSize)
        titleLabel.text = text
    }
}
