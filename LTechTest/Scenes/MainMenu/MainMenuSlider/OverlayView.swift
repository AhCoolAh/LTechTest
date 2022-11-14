//
//  OverlayView.swift
//  LTechTest
//
//  Created by Pavel21 on 14.11.2022.
//

import UIKit

protocol SortTypeDelegate {
    func sortType(viewModel: MainMenu.Sort.Sort)
}

class OverlayView: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
//    @IBOutlet weak var slideIdicator: UIView!
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var subscribeButton: UIView!
    @IBOutlet weak var slideIndicator: UIView!
    @IBOutlet weak var dateSortCheckImageView: UIImageView!
    @IBOutlet weak var defaultSortCheckImageView: UIImageView!
    
    var isSortedByDate = false
    var delegate: SortTypeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        slideIndicator.roundCorners(.allCorners, radius: 2.5)
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    func setupUI() {
        if isSortedByDate {
            defaultSortCheckImageView.isHidden = true
        } else {
            dateSortCheckImageView.isHidden = true
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    @IBAction func crossButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func dateSortButtonHandle(_ sender: Any) {
        let viewModel = MainMenu.Sort.Sort(isSortedByDate: true)
        delegate?.sortType(viewModel: viewModel)
        self.dismiss(animated: true, completion: nil)

    }
    
    @IBAction func defaultSortButtonHandle(_ sender: Any) {
        let viewModel = MainMenu.Sort.Sort(isSortedByDate: false)
        delegate?.sortType(viewModel: viewModel)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
