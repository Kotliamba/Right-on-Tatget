//
//  ViewController.swift
//  Right on Tatget
//
//  Created by Чаусов Николай on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var number: Int = 0
    var round: Int = 1
    var points: Int = 0
    
    override func loadView() {
        super.loadView()
        
        print("Loading view")
        /* This code will create labelView with the version of App.
         let versionLabel = UILabel(frame: CGRect(x: 30, y: 30, width: 200, height: 20))
        versionLabel.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        
        view.addSubview(versionLabel)
        */
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("View did disapear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View did Load")
        number = Int.random(in: 1...50)
        value.text = "\(number)"
    }
    @IBAction func trySlider(_ sender: UISlider) {
    }
    

    @IBAction func buttonPressed(_ sender: UIButton) {
      
        let numSlider = Int(slider.value.rounded())
        switch numSlider {
        case 0..<number: points += 50 - number + numSlider
        case number+1...50: points += 50 - numSlider + number
        case number: points += 50
        default: print("sompfingh wrong, number is \(number), slider number is \(numSlider)")
        }
        if round == 5 {
            let alert = UIAlertController(title: "Game Over", message: "You are won \(points) points", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Repeat", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            round = 1
            points = 0
        } else {
            self.round += 1
        }
        number = Int.random(in: 1...50)
        value.text = "\(number)"
        
    }
}

