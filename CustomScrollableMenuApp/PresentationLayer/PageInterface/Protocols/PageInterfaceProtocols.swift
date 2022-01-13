//
//  PageInterfaceProtocols.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

protocol PageInterfaceViewInput: AnyObject {
    func setupInitialState()
}

protocol PageInterfaceViewOutput {
    func viewIsReady()
    func getTitle() -> String?
}

protocol PageInterfaceModuleInput: AnyObject {
    
}

protocol PageInterfaceInteractorInput {
    
}

protocol PageInterfaceInteractorOutput: AnyObject {
    
}

protocol PageInterfaceRouterInput {
    
}
