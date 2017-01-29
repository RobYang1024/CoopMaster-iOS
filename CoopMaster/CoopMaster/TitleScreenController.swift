//
//  TitleScreenController.swift
//  CoopMaster
//
//  Created by Eric Lei on 1/28/17.
//  Copyright © 2017 Eric Lei. All rights reserved.
//

import UIKit

class TitleScreenController: UIViewController {
    static var numberOfEggs : [Int]!
    static var date : [String]!
    static var feed : [Int]!
    static var humidity : [Int]!
    static var temperature : [Int]!
    static var water : [Int]!
    
    override func viewDidLoad() {
        UserDefaults.standard.set(TitleScreenController.date, forKey: "date")
        UserDefaults.standard.set(TitleScreenController.numberOfEggs, forKey: "numberOfEggs")
        UserDefaults.standard.set(TitleScreenController.feed, forKey: "feed")
        UserDefaults.standard.set(TitleScreenController.humidity, forKey: "humidity")
        UserDefaults.standard.set(TitleScreenController.temperature, forKey: "temperature")
        UserDefaults.standard.set(TitleScreenController.water, forKey: "water")
        UserDefaults.standard.synchronize()
        
        super.viewDidLoad()
        self.title = "Coop Master"
        view.backgroundColor = .white
        
        let EggCounterButton = UIButton(frame: CGRect(x: self.view.frame.width*(0.5-1/6), y: self.view.frame.height*(0.6), width: self.view.frame.width/3, height: self.view.frame.height/3))
        EggCounterButton.setTitle("Coop Master", for: .normal)
        EggCounterButton.setTitleColor(.blue, for: .normal)
        EggCounterButton.addTarget(self, action: #selector(pushEggCounterController), for: .touchUpInside)
        view.addSubview(EggCounterButton)
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "ChickenLogo")
        logoImageView.frame = CGRect(x: view.frame.width*0.1, y: view.frame.height*0.2, width: view.frame.width*0.8, height: view.frame.width*0.8)
        view.addSubview(logoImageView)
        
    }
    
    func pushEggCounterController()
    {
        let eggCounterController = EggCounterController()
        navigationController?.pushViewController(eggCounterController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
