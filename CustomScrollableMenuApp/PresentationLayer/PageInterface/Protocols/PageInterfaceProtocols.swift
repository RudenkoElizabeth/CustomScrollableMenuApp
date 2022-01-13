//
//  PageInterfaceProtocols.swift
//
//  Created by Rudenko Elizabeth on 13/01/2022.
//

protocol PageInterfaceViewInput: class {
    func setupInitialState()
}

protocol PageInterfaceViewOutput {
    func viewIsReady()
}

protocol PageInterfaceModuleInput: class {

}

protocol PageInterfaceInteractorInput {

}

protocol PageInterfaceInteractorOutput: class {

}

protocol PageInterfaceRouterInput {

}
