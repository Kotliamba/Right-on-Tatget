//
//  MainViewController.swift
//  Right on Tatget
//
//  Created by Чаусов Николай on 16.02.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var stackButtons: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape{
            stackButtons.axis = .horizontal
        } else {
            stackButtons.axis = .vertical
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
