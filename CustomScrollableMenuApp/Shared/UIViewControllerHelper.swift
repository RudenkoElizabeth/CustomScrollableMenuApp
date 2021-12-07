//
//  UIViewControllerHelper.swift
//  TestScrollApp
//
//  Created by Elizaveta Rudenko on 29.11.2021.
//

import UIKit.UIViewController

extension UIViewController {
    class func instantiateFromStoryboard(_ name: String, viewController: String? = nil) -> UIViewController {
        let viewControllerName: String = viewController != nil ? viewController! : name
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        return viewController
    }

    func addChild(viewController: UIViewController, to container: UIView) {
        viewController.view.frame = container.bounds
        viewController.willMove(toParent: self)
        container.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: self)
        viewController.view.layoutIfNeeded()
    }
}
