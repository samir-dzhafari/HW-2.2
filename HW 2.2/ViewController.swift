//
//  ViewController.swift
//  HW 2.2
//
//  Created by Самир Джафари on 21.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var traficLightState: Int?
    
    @IBOutlet var trafficLightViews: [UIView]!

    @IBOutlet weak var traficLightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTrafficLightViews()
        traficLightButton.configuration = setupTraficLightButton(with: "Start")
    }

    @IBAction func traficLightButtonPressed(_ sender: UIButton) {
        if let state = traficLightState {
            trafficLightViews[state].alpha = 0.3
        
            traficLightState = state == 2 ? 0 : state + 1
            trafficLightViews[traficLightState!].alpha = 1
        } else {
            traficLightButton.configuration = setupTraficLightButton(with: "Next")
            traficLightState = 0
            trafficLightViews[0].alpha = 1
        }
    }
    
    private func setupTrafficLightViews() {
        for view in trafficLightViews {
            view.layer.cornerRadius = 50
            view.alpha = 0.3
        }
    }
    
    private func setupTraficLightButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        
        buttonConfiguration.title = title
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        buttonConfiguration.buttonSize = .medium
        buttonConfiguration.cornerStyle = .medium
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
        
        return buttonConfiguration
    }
}

