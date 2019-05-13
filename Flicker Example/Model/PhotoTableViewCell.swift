//
//  PhotoTableViewCell.swift
//  Flicker Example
//
//  Created by Muhammed Karakul on 12.05.2019.
//  Copyright © 2019 Muhammed Karakul. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet var ownerProfilePicture: UIImageView!
    @IBOutlet var ownerNameLabel: UILabel!
    @IBOutlet var timeIntervalLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var photoTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
