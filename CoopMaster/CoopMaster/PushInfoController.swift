//
//  PushInfoController.swift
//  CoopMaster
//
//  Created by Eric Lei on 1/28/17.
//  Copyright © 2017 Eric Lei. All rights reserved.
//

import UIKit

class PushInfoController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        var date = defaults.stringArray(forKey: "date") ?? [String]()
        var numberOfEggs = defaults.array(forKey: "numberOfEggs") as? [Int] ?? [Int]()
        view.backgroundColor = .white
        let Label = UILabel(frame: CGRect(x: 250, y: 250, width: 200, height: 200))
        Label.text = String(numberOfEggs[numberOfEggs.count-1])
        let Label2 = UILabel(frame: CGRect(x: 250, y: 500, width: 200, height: 200))
        Label2.text = date[date.count-1]
        view.addSubview(Label)
        view.addSubview(Label2)
        
//        for element: String in date
//        {
//            print(element)
//        }
        
        // Do any additional setup after loading the view.
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
