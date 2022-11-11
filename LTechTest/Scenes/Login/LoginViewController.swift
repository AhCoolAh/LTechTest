//
//  LoginViewController.swift
//  LTechTest
//
//  Created by Pavel21 on 08.11.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginDisplayLogic: AnyObject
{
    func displaySomething(viewModel: Login.Something.ViewModel)
//    func displaySomethingElse(viewModel: Login.SomethingElse.ViewModel)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?

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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
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
        setupView()
        doSomething()
        passwordTextField.delegate = self
        phoneTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
//        doSomethingElse()
    }
    
    //MARK: - receive events from UI
    
    //@IBOutlet weak var nameTextField: UITextField!
//
//    @IBAction func someButtonTapped(_ sender: Any) {
//
//    }
//
//    @IBAction func otherButtonTapped(_ sender: Any) {
//
//    }
    
    // MARK: - request data from LoginInteractor

    func doSomething() {
        let request = Login.Something.Request()
        interactor?.doSomething(request: request)
    }
//
//    func doSomethingElse() {
//        let request = Login.SomethingElse.Request()
//        interactor?.doSomethingElse(request: request)
//    }

    // MARK: - display view model from LoginPresenter

    func displaySomething(viewModel: Login.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
//
//    func displaySomethingElse(viewModel: Login.SomethingElse.ViewModel) {
//        // do sometingElse with viewModel
//    }


    // MARK: - Login

//@IBOutlet weak var emailTextField: UITextField!
//@IBOutlet weak var passwordTextField: UITextField!
//@IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var loginFormStackView: UIStackView!
    @IBOutlet weak var stackViewTopLabel: UILabel!
    @IBOutlet weak var stackViewPhoneLabel: UILabel!
    @IBOutlet weak var stackViewPhoneContainer: UIView!
    @IBOutlet weak var stackViewPasswordLabel: UILabel!
    @IBOutlet weak var stackViewPasswordContainer: UIView!
    @IBOutlet weak var stackViewErrorLabel: UILabel!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var eyeButton: UIButton!
    
    var password: String = ""
    var copy: String = ""
    var isEyeClosed = false
    
    var passwordText = String()
    
    var hashPassword = String()
    
    var bottomButtonConstraint = NSLayoutConstraint()
    @IBOutlet weak var nextButton: UIButton!
    
    func setupView() {
        loginFormStackView.setCustomSpacing(24.0, after: stackViewTopLabel)
        loginFormStackView.setCustomSpacing(8.0, after: stackViewPhoneLabel)
        loginFormStackView.setCustomSpacing(24.0, after: stackViewPhoneContainer)
        loginFormStackView.setCustomSpacing(8.0, after: stackViewPasswordLabel)
        loginFormStackView.setCustomSpacing(4.0, after: stackViewPasswordContainer)
        
        stackViewPhoneContainer.layer.cornerRadius = 14
        stackViewPhoneContainer.layer.borderWidth = 1.5
        stackViewPhoneContainer.layer.borderColor = UIColor(named: "extralightGrayColor")?.cgColor
        
        stackViewPasswordContainer.layer.cornerRadius = 14
        stackViewPasswordContainer.layer.borderWidth = 1.5
        stackViewPasswordContainer.layer.borderColor = UIColor(named: "extralightGrayColor")?.cgColor
        
        stackViewErrorLabel.isHidden = true
        
        bottomButtonConstraint = nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        bottomButtonConstraint.isActive = true
        
        nextButton.layer.cornerRadius = 13
        nextButton.backgroundColor = UIColor(named: "blueDisabledColor")

//        nextButton.setTitleColor(UIColor(named: "whiteColor"), fo)
//        nextButton.setTitleShadowColor(UIColor(named: "whiteColor"), for: .disabled)
//        nextButton.text = "chupa"
//        nextButton.setBackgroundColor(color: AppSettings.UI.grayLightNewColor, forState: .disabled)
        nextButton.isEnabled = true

    }
    
    @IBAction func eyeButtonTapped(_ sender: Any) {
        
        if(!isEyeClosed) {
            isEyeClosed = true
            eyeButton.setImage(UIImage(named: "eyeCrossedIconLogin")!, for: .normal)
            togglePassword()
        } else {
            isEyeClosed = false
            eyeButton.setImage(UIImage(named: "eyeIconLogin")!, for: .normal)
            togglePassword()
        }
    }
    
    func togglePassword() {
        if(!isEyeClosed){
            passwordTextField.text = passwordText
        } else {
            passwordTextField.text = hashPassword
        }
//        nextButton.backgroundColor = UIColor(named: "blueColor")
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.bottomButtonConstraint.constant = -16 - keyboardSize.height
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        self.bottomButtonConstraint.constant = -16
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

    if textField == passwordTextField {

        hashPassword = ""
        let newChar = string.first
        let offsetToUpdate = passwordText.index(passwordText.startIndex, offsetBy: range.location)

        if string == "" {
            passwordText.remove(at: offsetToUpdate)
            return true
        }
        else { passwordText.insert(newChar!, at: offsetToUpdate) }

        for _ in passwordText {  hashPassword += "*" }
        
        togglePassword()
        return false
    }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
        {

            textField.resignFirstResponder()
            return true
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == phoneTextField {
            stackViewPhoneContainer.layer.borderColor = UIColor(named: "grayColor")?.cgColor
        } else {
            stackViewPasswordContainer.layer.borderColor = UIColor(named: "grayColor")?.cgColor
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == phoneTextField {
            stackViewPhoneContainer.layer.borderColor = UIColor(named: "extralightGrayColor")?.cgColor
        } else {
            stackViewPasswordContainer.layer.borderColor = UIColor(named: "extralightGrayColor")?.cgColor
        }
    }
    
//@IBAction func loginButtonTapped(_ sender: Any)
//{
//  login()
//}

//func login()
//{
//  let email = emailTextField.text ?? ""
//  let password = passwordTextField.text ?? ""
//  let request = Welcome.Login.Request(email: email, password: password)
//  interactor?.login(request: request)
//}

//func displayLogin(viewModel: Welcome.Login.ViewModel)
//{
//  if viewModel.success {
//    showGreeting(greeting: viewModel.greeting)
//    // router?.routeToHome(segue: nil)
//  } else {
//    showErrors()
//  }
//}

//func showGreeting(greeting: String)
//{
//  messageLabel.text = greeting
//}

//func showErrors()
//{
//  messageLabel.text = "Your email/password didn't match"
//}
}
