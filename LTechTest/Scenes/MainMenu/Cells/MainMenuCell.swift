//
//  MainMenuCell.swift
//  LTechTest
//
//  Created by Pavel21 on 13.11.2022.
//

import Foundation
import UIKit

final class MainMenuCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
