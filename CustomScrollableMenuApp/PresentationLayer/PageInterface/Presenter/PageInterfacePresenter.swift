//
//  PageInterfacePresenter.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

class PageInterfacePresenter: PageInterfaceModuleInput, PageInterfaceViewOutput, PageInterfaceInteractorOutput {
    
    weak var view: PageInterfaceViewInput!
    var interactor: PageInterfaceInteractorInput!
    var router: PageInterfaceRouterInput!
    var pageType: MainInterfaceConstants.PageType!
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func getTitle() -> String? {
        "Some awersome page"
    }
}
