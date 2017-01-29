//
//  EggCounterController.swift
//  CoopMaster
//
//  Created by Eric Lei on 1/28/17.
//  Copyright © 2017 Eric Lei. All rights reserved.
//

import UIKit

class EggCounterController: UIViewController, UIPickerViewDelegate {
    
    let insertNumberField = UITextField()
    let dateField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Egg Tracker"
        view.backgroundColor = .white
        
        let dateLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 20))
        dateLabel.text = "Enter date:"
        dateLabel.textColor = .black
        dateLabel.center.x = self.view.center.x
        dateLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(dateLabel)
        
        let dateval = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let result = formatter.string(from: dateval)
        dateField.keyboardType = .numberPad
        dateField.placeholder = result
        dateField.layer.borderWidth = 1
        dateField.frame = CGRect(x: 0, y: 150, width: 200, height: 20)
        dateField.center.x = self.view.center.x
        dateField.isUserInteractionEnabled = true
        dateField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(dateField)
        
        let eggLabel = UILabel(frame: CGRect(x: 0, y: 200, width: 200, height: 20))
        eggLabel.text = "Enter # of eggs:"
        eggLabel.textColor = .black
        eggLabel.center.x = self.view.center.x
        eggLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(eggLabel)
        
        insertNumberField.keyboardType = .numberPad
        insertNumberField.placeholder = "Enter number of eggs"
        insertNumberField.layer.borderWidth = 1
        insertNumberField.frame = CGRect(x: 0, y: 250, width: 200, height: 20)
        insertNumberField.center.x = self.view.center.x
        insertNumberField.isUserInteractionEnabled = true
        insertNumberField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(insertNumberField)

        
        let enterButton = UIButton(frame: CGRect(x: 0, y: 300, width: 200, height: 20))
        enterButton.setTitleColor(.blue, for: .normal)
        enterButton.center.x = self.view.center.x
        enterButton.setTitle("Enter", for: .normal)
        enterButton.addTarget(self, action: #selector(pushInfoController), for: .touchUpInside)
        view.addSubview(enterButton)
        
        
        
        // Do any additional setup after loading the view.
    }

    func getDateIndex(dateArray: [String], newDate: String) -> Int {
        
    }
    
    func pushInfoController()
    {
        let defaults = UserDefaults.standard
        var date = defaults.stringArray(forKey: "date") ?? [String]()
        var numberOfEggs = defaults.array(forKey: "numberOfEggs") as? [Int] ?? [Int]()
        
        if (dateField.text!.isEmpty)
        {
            let dateval = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            let result = formatter.string(from: dateval)
            //let resultInt:Int? = Int(result)
            
            date.append(result)
        }
        else
        {
            date.append(dateField.text!)
        }
        
        
        let pushInfoController = PushInfoController()
        let a:Int? = Int(insertNumberField.text!)
        numberOfEggs.append(a!)
        
        UserDefaults.standard.set(date, forKey: "date")
        UserDefaults.standard.set(numberOfEggs, forKey: "numberOfEggs")
        UserDefaults.standard.synchronize()
    
        navigationController?.pushViewController(pushInfoController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
