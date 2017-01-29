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
    
    override func viewDidLoad() {
        UserDefaults.standard.set(TitleScreenController.date, forKey: "date")
        UserDefaults.standard.set(TitleScreenController.numberOfEggs, forKey: "numberOfEggs")
        UserDefaults.standard.synchronize()
        
        super.viewDidLoad()
        self.title = "Coop Master"
        view.backgroundColor = .white
        
        let EggCounterButton = UIButton(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height/2, width: self.view.frame.width/3, height: self.view.frame.height/3))
        EggCounterButton.setTitle("Egg Tracker", for: .normal)
        EggCounterButton.setTitleColor(.blue, for: .normal)
        EggCounterButton.addTarget(self, action: #selector(pushEggCounterController), for: .touchUpInside)
        view.addSubview(EggCounterButton)
        
        

        // Do any additional setup after loading the view.
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
