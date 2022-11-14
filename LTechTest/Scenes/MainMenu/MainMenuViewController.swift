//
//  MainMenuViewController.swift
//  LTechTest
//
//  Created by Pavel21 on 12.11.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SDWebImage

protocol MainMenuDisplayLogic: AnyObject
{
    func displaySomething(viewModel: MainMenu.Something.ViewModel)
    func displayLoadedData(array: [MainMenu.CellData.CellData])
    func displaySortedData(array: [MainMenu.CellData.CellData])
//    func displaySomethingElse(viewModel: MainMenu.SomethingElse.ViewModel)
}

class MainMenuViewController: UIViewController, MainMenuDisplayLogic {
    var interactor: MainMenuBusinessLogic?
    var router: (NSObjectProtocol & MainMenuRoutingLogic & MainMenuDataPassing)?

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .fullScreen
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .fullScreen
        setup()
    }

    // MARK: - Setup Clean Code Design Pattern 

    private func setup() {
        let viewController = self
        let interactor = MainMenuInteractor()
        let presenter = MainMenuPresenter()
        let router = MainMenuRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        print("Toggle")
        loadData()
        
//        print("_____________\(KeychainService.shared.phone)+\(KeychainService.shared.pass)")
//        doSomethingElse()
    }
    
    // MARK: - request data from MainMenuInteractor

    func doSomething() {
        let request = MainMenu.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func loadData() {
        print("----------Load data")
        interactor?.loadData()
    }
    
    func sortData(array: [MainMenu.CellData.CellData]) {
        let sort = MainMenu.Sort.Sort(isSortedByDate: isSortedByDate)
        interactor?.sortData(array: array, sort: sort)
    }
//
//    func doSomethingElse() {
//        let request = MainMenu.SomethingElse.Request()
//        interactor?.doSomethingElse(request: request)
//    }

    // MARK: - display view model from MainMenuPresenter

    func displaySomething(viewModel: MainMenu.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
    
    func displayLoadedData(array: [MainMenu.CellData.CellData]) {
//        items.removeAll()
//        for element in array {
//            items.append(element)
//        }
        sortData(array: array)
        
//        tableView.reloadData()
    }
    
    func displaySortedData(array: [MainMenu.CellData.CellData]) {
        items.removeAll()
        for element in array {
            items.append(element)
        }
        tableView.reloadData()
        refreshContent()
    }

    
    
    // MARK: - Main Menu elements and events from UI
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortLabel: UILabel!
    var items = [MainMenu.CellData.CellData]()
    var isSortedByDate = false
    var isRefreshedByButton = false
    
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        isRefreshedByButton = true
        loadData()
    }
    
    @IBAction func sortButtonTapped(_ sender: Any) {
        let slideVC = OverlayView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        slideVC.isSortedByDate = isSortedByDate
        slideVC.delegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    func refreshContent() {
        guard isRefreshedByButton == false else {
            isRefreshedByButton = false
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 180) {
            self.loadData()
        }
    }
    
}


// MARK: - UITableViewDataSource
extension MainMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellId", for: indexPath) as! MainMenuCell
        let item = items[indexPath.row]
        cell.cellTitle.text = item.title
        cell.cellText.text = item.text
        cell.cellDate.text = item.stringDate
        cell.cellImage.sd_setImage(with: URL(string: "http://dev-exam.l-tech.ru/"+item.image), completed: nil)
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
        
     }

     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         
         return 121
         
     }
}

// MARK: - UITableViewDelegate
extension MainMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       
//        let item = items[indexPath.row - 1]
//        selectedItem = item
//        AnalyticsService.marketQRCatalogItem(id: "\(item.id)")
//        let vc = BLMarketplaceEventDetailVC()
//        vc.item = selectedItem
//
//        vc.modalPresentationStyle = .custom
//        present(vc, animated: true, completion: nil)
        
        let item = items[indexPath.row]
        
        let vc = UIStoryboard(name: "MainMenuDetailViewController", bundle: nil).instantiateInitialViewController() as! MainMenuDetailNewsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.item = item
//        vc.modalTransitionStyle = .crossDisso
//        vc.transitioningDelegate = self
//        vc.isSortedByDate = isSortedByDate
//        vc.delegate = self
//        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        
        
        
    }
}

extension MainMenuViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension MainMenuViewController: SortTypeDelegate {
    
    func sortType(viewModel: MainMenu.Sort.Sort) {
        self.isSortedByDate = viewModel.isSortedByDate
        if self.isSortedByDate {
            sortLabel.text = "По дате"
        } else {
            sortLabel.text = "По умолчанию"
        }
        sortData(array: items)
    }
}


