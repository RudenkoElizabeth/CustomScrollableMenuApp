//
//  ViewController.swift
//  TestScrollApp
//
//  Created by Elizaveta Rudenko on 28.07.2021.
//

import UIKit

class Constants {
    enum BrowsePageType: Int, CaseIterable {
        case item1, item2, item3, item4, item5, item6
    }
    static let submenuTitles: [BrowsePageType: String] = [
        .item1: "Menu item 1",
        .item2: "Menu item 2",
        .item3: "Menu item 3",
        .item4: "Menu item 4",
        .item5: "Menu item 5",
        .item6: "Menu item 6"
    ]
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    
    private var subtitleMenuView: SclollableMenuViewController?
    private var subtitleMenuModuleInput: SclollableMenuModuleInput?
    
    private var orderedViewControllers = [UIViewController]()
    private var currentIndex = 0
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupMenu()
    }
    
    func setupMenu() {
        let identifier = "SclollableMenu"
        let viewController = UIViewController.instantiateFromStoryboard(identifier) as! SclollableMenuViewController
        let submenuItems: [SclollableMenuItem] = {
            var items = [SclollableMenuItem]()
            Constants.BrowsePageType.allCases.forEach {
                let item = SclollableMenuItem(type: $0.rawValue,
                                              title: Constants.submenuTitles[$0]!)
                items.append(item)
            }
            return items
        }()
        subtitleMenuModuleInput = SclollableMenuModuleConfigurator()
            .configureModuleForViewInput(viewInput: viewController,
                                         menuItems: submenuItems,
                                         menuItemsSize: 26,
                                         moduleOutput: self)
        addChild(viewController: viewController, to: menuView)
        subtitleMenuView = viewController
    }

//    func setViewControllerFor(pageType: SubmenuBrowseConstants.BrowsePageType) {
//        let nextIndex = output.getIndexOf(page: pageType)
//        let direction: UIPageViewController.NavigationDirection = currentIndex > nextIndex ? .reverse : .forward
//        currentIndex = nextIndex
//        let viewController = orderedViewControllers[currentIndex]
//        setViewControllers([viewController],
//                           direction: direction,
//                           animated: true,
//                           completion: nil)
//    }
//
//    func addViewController(_ viewController: UIViewController) {
//        orderedViewControllers.append(viewController)
//        if orderedViewControllers.count == output.pages.count {
//            setViewControllerFor(pageType: output.pages.first!)
//        }
//    }
}

extension MainViewController: SclollableMenuModuleOutput {
    func action(item: Int) {
        print("item \(item)")
    }
}

// MARK: - UIPageViewControllerDataSource
//extension MainViewController: UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let previousIndex = viewControllerIndex - 1
//        guard previousIndex >= 0,
//            orderedViewControllers.count > previousIndex else {
//                return nil
//        }
//        currentIndex = previousIndex
//        return orderedViewControllers[currentIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
//            return nil
//        }
//        let nextIndex = viewControllerIndex + 1
//        guard orderedViewControllers.count != nextIndex,
//            orderedViewControllers.count > nextIndex
//            else {
//                return nil
//        }
//        currentIndex = nextIndex
//        return orderedViewControllers[currentIndex]
//    }
//}
//
//// MARK: - UIPageViewControllerDelegate
//extension ViewController: UIPageViewControllerDelegate {
//    func pageViewController(_ pageViewController: UIPageViewController,
//                            didFinishAnimating finished: Bool,
//                            previousViewControllers: [UIViewController],
//                            transitionCompleted completed: Bool) {
//        guard completed,
//            let currentViewController = pageViewController.viewControllers?[0],
//            let viewControllerIndex = orderedViewControllers.firstIndex(of: currentViewController) else {
//                return
//        }
//        output.changeSelected(item: viewControllerIndex)
//    }
//}
