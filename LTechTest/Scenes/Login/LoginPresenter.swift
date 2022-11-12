//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic {
    func presentSomething(response: Login.Something.Response)
    func presentMask(response: Login.Mask.Response)
    func presentLoginResponse(response: Login.Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?

    // MARK: Parse and calc respnse from LoginInteractor and send simple view model to LoginViewController to be displayed

    func presentSomething(response: Login.Something.Response) {
        let viewModel = Login.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
    
    func presentMask(response: Login.Mask.Response) {
        print("-----\(response)")
        let maskString = response.mask?.replacingOccurrences(of: "Х", with: "#") ?? ""
        let code:String = response.mask?.components(separatedBy: " ")[0] ?? ""

        let viewModel = Login.Mask.ViewModel(mask: maskString, code: code)
        viewController?.displayPhoneMask(viewModel: viewModel)
    }
    
    func presentLoginResponse(response: Login.Login.Response) {
        print("-----\(response.success)")
        let viewModel = Login.Login.ViewModel(success: response.success)
        viewController?.displayLoginTry(viewModel: viewModel)
    }

    
    
//    func presentLogin(response: Welcome.Login.Response)
//    {
//      let greeting = response.success ? "Hello \(response.username!)" : ""
//      let viewModel = Welcome.Login.ViewModel(success: response.success, greeting: greeting)
//      viewController?.displayLogin(viewModel: viewModel)
//    }
    
//
//    func presentSomethingElse(response: Login.SomethingElse.Response) {
//        let viewModel = Login.SomethingElse.ViewModel()
//        viewController?.displaySomethingElse(viewModel: viewModel)
//    }
}
