//
//  MainMenuDetailNewsViewController.swift
//  LTechTest
//
//  Created by Pavel21 on 14.11.2022.
//


import UIKit
import SDWebImage


class MainMenuDetailNewsViewController: UIViewController {
    
    var item: MainMenu.CellData.CellData?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        dateLabel.text = item?.stringDate
        titleLabel.text = item?.title
        imageView.sd_setImage(with: URL(string: "http://dev-exam.l-tech.ru/"+item!.image), completed: nil)
        textLabel.text = item?.text
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
