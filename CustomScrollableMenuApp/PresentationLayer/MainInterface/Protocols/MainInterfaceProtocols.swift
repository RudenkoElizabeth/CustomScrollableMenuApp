//
//  MainInterfaceProtocols.swift
//
//  Created by Rudenko Elizabeth on 12/01/2022.
//

protocol MainInterfaceViewInput: AnyObject {

    func setupInitialState()
}

protocol MainInterfaceViewOutput {

    func viewIsReady()
}

protocol MainInterfaceModuleInput: AnyObject {

}

protocol MainInterfaceInteractorInput {

}

protocol MainInterfaceInteractorOutput: AnyObject {

}

protocol MainInterfaceRouterInput {

}
