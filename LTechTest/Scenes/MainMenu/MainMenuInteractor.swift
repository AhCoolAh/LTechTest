//
//  MainMenuInteractor.swift
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

protocol MainMenuBusinessLogic {
    func doSomething(request: MainMenu.Something.Request)
//    func doSomethingElse(request: MainMenu.SomethingElse.Request)
}

protocol MainMenuDataStore {
    //var name: String { get set }
}

class MainMenuInteractor: MainMenuBusinessLogic, MainMenuDataStore {
    var presenter: MainMenuPresentationLogic?
    var worker: MainMenuWorker?
    //var name: String = ""

    // MARK: Do something (and send response to MainMenuPresenter)

    func doSomething(request: MainMenu.Something.Request) {
        worker = MainMenuWorker()
        worker?.doSomeWork()

        let response = MainMenu.Something.Response()
        presenter?.presentSomething(response: response)
    }
//
//    func doSomethingElse(request: MainMenu.SomethingElse.Request) {
//        worker = MainMenuWorker()
//        worker?.doSomeOtherWork()
//
//        let response = MainMenu.SomethingElse.Response()
//        presenter?.presentSomethingElse(response: response)
//    }
}
