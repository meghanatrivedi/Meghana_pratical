//
//  DetailCell.swift
//  Meghana_pratical
//
//  Created by Meghna on 12/08/21.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var Before_view: UIView!
    @IBOutlet weak var Before_lbl: UILabel!
    @IBOutlet weak var Before_img: UIImageView!
    
    
    
    @IBOutlet weak var After_view: UIView!
    
    @IBOutlet weak var After_lbl: UILabel!
    @IBOutlet weak var After_img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sizeToFit()
        layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
