//
//  RepoterNameCell.swift
//  Meghana_pratical
//
//  Created by Meghna on 12/08/21.
//

import UIKit

class RepoterNameCell: UITableViewCell {

    @IBOutlet weak var Date_lbl: UILabel!
    @IBOutlet weak var Repoter_nm_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        sizeToFit()
        layoutIfNeeded()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
