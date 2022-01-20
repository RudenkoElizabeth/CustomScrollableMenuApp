//
//  MainInterfacePresenter.swift
//
//  Created by Rudenko Elizabeth on 12/01/2022.
//

class MainInterfacePresenter: MainInterfaceModuleInput, MainInterfaceViewOutput, MainInterfaceInteractorOutput{

    weak var view: MainInterfaceViewInput!
    var interactor: MainInterfaceInteractorInput!
    var router: MainInterfaceRouterInput!

    func viewIsReady() {
        view.setupInitialState()
        router.setupSubmodules()
    }
    
    func changeSelected(item: Int) {
        let menuItem = MainInterfaceConstants.items[item]
        router.chngePageFor(item: menuItem.type)
    }
}
