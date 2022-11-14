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
    
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        modalPresentationStyle = .fullScreen
//    }
    
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


//import UIKit
//
//final class MainMenuDetailNewsViewController: UIViewController {
//
////    var item: ItemEntity?
//    let menuView = UIView()
//    let menuHeight = UIScreen.main.bounds.height / 1.25
//    let imageHeight = UIScreen.main.bounds.width / 1.5 - 32.0
//    var isPresenting = false
//    let topHeight = 58.0
//
////    let crossButton: UIButton = {
////        let button = UIButton(type:.system)
////        button.setImage(UIImage(named: "close_icon")?.withRenderingMode(.alwaysTemplate), for: .normal)
////        button.tintColor = AppSettings.UI.violetNewColor
////        button.layer.cornerRadius = 5
////        button.clipsToBounds = true
////        button.translatesAutoresizingMaskIntoConstraints = false
////        return button
////    }()
////
////    let eventTitle: UILabel = {
////        let label = UILabel()
////        label.textAlignment = .center
////        label.font = UIFont.boldSystemFont(ofSize: 22.0)
////        label.textColor = AppSettings.UI.blackNewColor
////        label.numberOfLines = 0
////        return label
////    }()
//
//    let topViewContainer: UIView = {
//        let view = UIView()
//        return view
//    }
//
////    let scrollView: UIScrollView = {
////        let view = UIScrollView()
////        view.backgroundColor = AppSettings.UI.backgroundAppNewColor
////        return view
////    }()
////
////    let scrollViewContainer: UIStackView = {
////            let view = UIStackView()
////            view.axis = .vertical
////            view.translatesAutoresizingMaskIntoConstraints = false
////            return view
////        }()
////
////    let topScrollBumper: UIView = {
////        let view = UIView()
////        view.backgroundColor = AppSettings.UI.backgroundAppNewColor
////        return view
////    }()
////
////    let imageContainer: UIView = {
////        let view = UIView()
////        view.backgroundColor = AppSettings.UI.whiteNewColor
////        view.layer.cornerRadius = 14
////
////        return view
////    }()
////
////    let imageForScrollView: UIImageView = {
////        let view = UIImageView()
////        return view
////    }()
////
////    let howToCashback: UILabel = {
////        let label = UILabel()
////        label.textAlignment = .left
////        label.font = UIFont.medium(ofSize: 16.0)
////        label.textColor = AppSettings.UI.blackNewColor
////        label.numberOfLines = 0
////        label.text = "Как получить кэшбэк?"
////        return label
////    }()
////
////    let howToCashbackText: UILabel = {
////        let label = UILabel()
////        label.textAlignment = .left
////        label.font = UIFont.regular(ofSize: 14.0)
////        label.textColor = AppSettings.UI.textLight
////        label.numberOfLines = 0
////        label.text = "1. Купите товар в любом магазине на территории РФ и сохраните чек.\n\n2. Нажмите на кнопку «Сканировать чек» и наведите камеру на QR-код. Чек нужно отсканировать в течение 72 часов с момента покупки.\n\n3. Дождитесь начисления кэшбэка."
////        return label
////    }()
////
////    let eventTerms: UILabel = {
////        let label = UILabel()
////        label.textAlignment = .left
////        label.font = UIFont.medium(ofSize: 16.0)
////        label.textColor = AppSettings.UI.blackNewColor
////        label.numberOfLines = 0
////        label.text = "Условия акции"
////        return label
////    }()
////
////    let eventTermsText: UILabel = {
////        let label = UILabel()
////        label.textAlignment = .left
////        label.font = UIFont.regular(ofSize: 14.0)
////        label.textColor = AppSettings.UI.textLight
////        label.numberOfLines = 0
////        return label
////    }()
////
////    let topView: UIView = {
////        let view = UIView()
////        view.backgroundColor = AppSettings.UI.backgroundAppNewColor
////        view.layer.cornerRadius = 14.0
////        return view
////    }()
////
////    lazy var backdropView: UIView = {
////        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
////        let blurredView = UIVisualEffectView(effect: blurEffect)
////        blurredView.frame = self.view.bounds
////        blurredView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
////        return blurredView
////    }()
//
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        modalPresentationStyle = .custom
//        transitioningDelegate = self
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        topView.addSubview(crossButton)
////        topView.addSubview(eventTitle)
////
////        imageContainer.addSubview(imageForScrollView)
////
////        scrollViewContainer.addArrangedSubview(topScrollBumper)
////        scrollViewContainer.addArrangedSubview(imageContainer)
////        scrollViewContainer.addArrangedSubview(howToCashback)
////        scrollViewContainer.addArrangedSubview(howToCashbackText)
////        scrollViewContainer.addArrangedSubview(eventTerms)
////        scrollViewContainer.addArrangedSubview(eventTermsText)
////
////        scrollView.addSubview(scrollViewContainer)
////
////        menuView.addSubviews(topView, scrollView)
////
////        view.backgroundColor = .clear
////        view.addSubview(backdropView)
////        view.addSubview(menuView)
////
////        menuView.backgroundColor = AppSettings.UI.backgroundAppNewColor
////        menuView.translatesAutoresizingMaskIntoConstraints = false
////        menuView.heightAnchor.constraint(equalToConstant: menuHeight).isActive = true
////        menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
////        menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
////        menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
////        menuView.layer.cornerRadius = 14
////        menuView.layer.masksToBounds = true
////        menuView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
////
////        topView.translatesAutoresizingMaskIntoConstraints = false
////        topView.topAnchor.constraint(equalTo: menuView.topAnchor).isActive = true
////        topView.heightAnchor.constraint(equalToConstant: topHeight).isActive = true
////        topView.leadingAnchor.constraint(equalTo: menuView.leadingAnchor).isActive = true
////        topView.trailingAnchor.constraint(equalTo: menuView.trailingAnchor).isActive = true
////
////        crossButton.translatesAutoresizingMaskIntoConstraints = false
////        crossButton.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
////        crossButton.widthAnchor.constraint(equalToConstant: 20.0).isActive = true
////        crossButton.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
////        crossButton.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 21.0).isActive = true
////        crossButton.addTarget(self, action: #selector(handleCross), for: .touchUpInside)
////
////        eventTitle.translatesAutoresizingMaskIntoConstraints = false
////        eventTitle.centerXAnchor.constraint(equalTo: topView.centerXAnchor).isActive = true
////        eventTitle.centerYAnchor.constraint(equalTo: topView.centerYAnchor).isActive = true
////        eventTitle.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 62.0).isActive = true
////        eventTitle.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -62.0).isActive = true
////
////        scrollView.translatesAutoresizingMaskIntoConstraints = false
////        scrollView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
////        scrollView.bottomAnchor.constraint(equalTo: menuView.bottomAnchor).isActive = true
////        scrollView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
////        scrollView.widthAnchor.constraint(equalTo: menuView.widthAnchor).isActive = true
////
////        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
////        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
////        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
////        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
////        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
////
////        topScrollBumper.translatesAutoresizingMaskIntoConstraints = false
////        topScrollBumper.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor).isActive = true
////        topScrollBumper.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor).isActive = true
////        topScrollBumper.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor).isActive = true
////        topScrollBumper.heightAnchor.constraint(equalToConstant: 2.0).isActive = true
////
////        imageContainer.translatesAutoresizingMaskIntoConstraints = false
////        imageContainer.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 16.0).isActive = true
////        imageContainer.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -16.0).isActive = true
////        imageContainer.topAnchor.constraint(equalTo: topScrollBumper.bottomAnchor).isActive = true
////        imageContainer.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
////
////        imageForScrollView.translatesAutoresizingMaskIntoConstraints = false
////        imageForScrollView.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
////        imageForScrollView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
////        imageForScrollView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor).isActive = true
////        imageForScrollView.widthAnchor.constraint(equalTo: imageContainer.heightAnchor).isActive = true
////
////        howToCashback.translatesAutoresizingMaskIntoConstraints = false
////        howToCashback.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 16.0).isActive = true
////        howToCashback.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -16.0).isActive = true
////        howToCashback.heightAnchor.constraint(equalToConstant: 19.0).isActive = true
////
////        howToCashbackText.translatesAutoresizingMaskIntoConstraints = false
////        howToCashbackText.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 16.0).isActive = true
////        howToCashbackText.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -16.0).isActive = true
////
////        eventTerms.translatesAutoresizingMaskIntoConstraints = false
////        eventTerms.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 16.0).isActive = true
////        eventTerms.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -16.0).isActive = true
////        eventTerms.heightAnchor.constraint(equalToConstant: 19.0).isActive = true
////
////        eventTermsText.translatesAutoresizingMaskIntoConstraints = false
////        eventTermsText.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: 16.0).isActive = true
////        eventTermsText.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -16.0).isActive = true
////
////        scrollViewContainer.setCustomSpacing(18.0, after: imageContainer)
////        scrollViewContainer.setCustomSpacing(11.0, after: howToCashback)
////        scrollViewContainer.setCustomSpacing(24.0, after: howToCashbackText)
////        scrollViewContainer.setCustomSpacing(11.0, after: eventTerms)
////
////        if let item = item {
////            eventTitle.text = item.name
////            imageForScrollView.layer.cornerRadius = 14
////            imageForScrollView.clipsToBounds = true
////            imageForScrollView.sd_setImage(with: URL(string: item.itemImage?.link ?? "" ), completed: nil)
////            eventTermsText.text = item.actionterm
////        }
//    }
//
//    @objc func handleCross() {
//        dismiss(animated: true, completion: nil)
//    }
//}
