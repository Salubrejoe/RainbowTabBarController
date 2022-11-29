//
//  ViewController.swift
//  Tabs
//
//  Created by Lore P on 18/07/2022.
//

import UIKit
import CoreMotion

class RedViewController: UIViewController {

    @IBOutlet weak var accelerometerX: UILabel!
    @IBOutlet weak var accelerometerY: UILabel!
    @IBOutlet weak var accelerometerZ: UILabel!
    @IBOutlet weak var zArrow: UIImageView!
    @IBOutlet weak var xArrow: UIImageView!
    @IBOutlet weak var yArrow: UIImageView!
    
    var motion = CMMotionManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.badgeValue = "99"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarItem.badgeValue = nil
    }
    
    func accelerometer() {
        motion.accelerometerUpdateInterval = 0.7
        motion.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data {
                self.accelerometerX.text = "\(myData.acceleration.x)"
                self.accelerometerY.text = "\(myData.acceleration.y)"
                self.accelerometerZ.text = "\(myData.acceleration.z)"
                self.xArrow.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: myData.acceleration.x)
                self.yArrow.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: myData.acceleration.y)
                self.zArrow.tintColor = UIColor(red: 0, green: 0, blue: 0, alpha: myData.acceleration.z)
            }
        }
    }

}

