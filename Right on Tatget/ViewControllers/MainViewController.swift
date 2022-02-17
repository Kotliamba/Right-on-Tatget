//
//  MainViewController.swift
//  Right on Tatget
//
//  Created by Чаусов Николай on 16.02.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var stackButtons: UIStackView?
    override func viewDidLoad() {
        super.viewDidLoad()

        changeButtonStackOrientation(for: traitCollection.verticalSizeClass)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        changeButtonStackOrientation(for: newCollection.verticalSizeClass)
    }

}

extension MainViewController{
    func changeButtonStackOrientation(for verticalSizeClass: UIUserInterfaceSizeClass){
        // This function is awesome, UIUserInterfaceSizeClass is saving landscape in enum. Can use it for next times
        if verticalSizeClass == .compact{
            stackButtons?.axis = .horizontal
        } else {
            stackButtons?.axis = .vertical
        }
    }
}
