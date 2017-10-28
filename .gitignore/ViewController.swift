//
//  ViewController.swift
//  timer1
//

//  Copyright © 2017 sota. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    var timer: Timer?
    var currentSeconds = 0
    @IBOutlet weak var label: UILabel!
    @IBAction func fiveMinButtonTapped(_ sender: UIButton) {
        start(seconds: 300)
    }
    @IBAction func threeMinButtonTapped(_ sender: UIButton) {
        start(seconds: 180)
    }
    @IBAction func tenSecButtonTapped(_ sender: UIButton) {
        start(seconds: 10)
    }
    
    func start(seconds: Int) {
        currentSeconds = seconds
        label.text = "残り\(currentSeconds)秒"
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                    target: self,
                                    selector: #selector(ViewController.update),
                                    userInfo: nil,
                                    repeats: true)
    }
    @objc func update(){
        currentSeconds -= 1
        label.text = "残り\(currentSeconds)秒"
        if(currentSeconds == 0) {
            timer?.invalidate()
            let soundId: SystemSoundID = 1008
            AudioServicesPlayAlertSound(soundId)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

