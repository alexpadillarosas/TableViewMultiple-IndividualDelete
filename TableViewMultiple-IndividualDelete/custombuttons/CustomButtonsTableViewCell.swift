//
//  CustomButtonsTableViewCell.swift
//  TableViewWithStepper
//
//  Created by alex on 28/4/2025.
//

import UIKit

class CustomButtonsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var decreaseQtyButton: UIButton!
    @IBOutlet weak var increaseQtyButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
