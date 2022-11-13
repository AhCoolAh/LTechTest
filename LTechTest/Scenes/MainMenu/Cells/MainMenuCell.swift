//
//  MainMenuCell.swift
//  LTechTest
//
//  Created by Pavel21 on 13.11.2022.
//

import Foundation
import UIKit

final class MainMenuCell: UITableViewCell {

//    @IBOutlet weak var containerView: UIView!
//    @IBOutlet weak var itemImage: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var cashbackLabel: UILabel!
//    @IBOutlet weak var marketplaceLabel: UILabel!
    
//    @IBOutlet weak var cellImage: UIImageView!
//    @IBOutlet weak var cellTitle: UILabel!
//    @IBOutlet weak var cellText: UILabel!
//    @IBOutlet weak var cellDate: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellText: UILabel!
    @IBOutlet weak var cellDate: UILabel!
    
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        itemImage.contentMode = .scaleAspectFit
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    fileprivate func setupUI() {
//        cell.cellTitle.text = item.title
//        cell.cellTitle.font = UIFont(name: "SF-Pro-Text-Semibold", size: 15)
//        cell.cellTitle.textColor = UIColor(named: "blackColor")
        
//        cellTitle.font = UIFont(name: "SF-Pro-Text-Semibold.otf", size: 15)
//        cellTitle.textColor = UIColor(named: "blackColor")
//        itemImage.layer.cornerRadius = 12
//        itemImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
//        containerView.layer.cornerRadius = 8
//        containerView.layer.masksToBounds = false
//        containerView.layer.borderWidth = 1
//        containerView.layer.borderColor = AppSettings.UI.lightNewColor.cgColor
    }
}
