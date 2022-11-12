//
//  LoginInteractor.swift
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
import Alamofire
import SwiftyJSON

protocol LoginBusinessLogic {
    func doSomething(request: Login.Something.Request)
    func getMask()
    func login(request: Login.Login.Request)
//    func doSomethingElse(request: Login.SomethingElse.Request)
}

protocol LoginDataStore {
    //var name: String { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []
    //var name: String = ""

    // MARK: Do something (and send response to LoginPresenter)

    func doSomething(request: Login.Something.Request) {
        worker = LoginWorker()
        worker?.doSomeWork()

        let response = Login.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
    func getMask() {
//        AF.request("http://dev-exam.l-tech.ru/api/v1/phone_masks", method: .get).responseJSON { responseJSON in
//            print(responseJSON.result)
////            presenter?.presentMask(response: response[])
//        }
        
        AF.request("http://dev-exam.l-tech.ru/api/v1/phone_masks", method: .get).responseJSON { response in
//                        print(response.request)  // original URL request
//                        print(response.response) // URL response
//                        print(response.data)     // server data
//                        print(response.result)   // result of response serialization
            
            let value = response.value
            let json = JSON(value)
            let maskValue = Login.Mask.Response(mask: json["phoneMask"].stringValue)
            self.presenter?.presentMask(response: maskValue)
        }
    }
    
    func login(request: Login.Login.Request) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        let parameters = [
            "phone": request.phone.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression),
            "password": request.password
        ]
        AF.request("http://dev-exam.l-tech.ru/api/v1/auth", method: .post, parameters: parameters, headers: headers).responseJSON { response in
//                        print(response.request)  // original URL request
//                        print(response.response) // URL response
//                        print(response.data)     // server data
//                        print(response.result)   // result of response serialization
            
            let value = response.value
            let json = JSON(value)
            let success = Login.Login.Response(success: json["success"].boolValue)
            self.presenter?.presentLoginResponse(response: success)
//            self.presenter?.presentMask(response: maskValue)
        }
    }
//
//    func doSomethingElse(request: Login.SomethingElse.Request) {
//        worker = LoginWorker()
//        worker?.doSomeOtherWork()
//
//        let response = Login.SomethingElse.Response()
//        presenter?.presentSomethingElse(response: response)
//    }
}
