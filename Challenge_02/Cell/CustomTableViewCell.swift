//
//  TableViewCell.swift
//  Aula08
//
//  Created by Idwall Go Dev 006 on 16/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    static let identifier = "CustomTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(carro: String) {
        nameLabel.text = carro
    }

    
}
