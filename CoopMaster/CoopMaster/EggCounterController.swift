//
//  EggCounterController.swift
//  CoopMaster
//
//  Created by Eric Lei on 1/28/17.
//  Copyright © 2017 Eric Lei. All rights reserved.
//

import UIKit

class EggCounterController: UIViewController, UITextFieldDelegate {
    
    let insertNumberField = UITextField()
    let dateField = UITextField()
    let feedField = UITextField()
    let humidityField = UITextField()
    let temperatureField = UITextField()
    let waterField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tracker"
        view.backgroundColor = .white
        
        let dateLabel = UILabel(frame: CGRect(x: 0, y: 100, width: 200, height: 20))
        dateLabel.text = "Enter date: (yyyy.MM.dd)"
        dateLabel.textColor = .black
        dateLabel.center.x = self.view.center.x
        dateLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(dateLabel)
        
        let dateval = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        let result = formatter.string(from: dateval)
        dateField.keyboardType = .decimalPad
        dateField.placeholder = result
        dateField.layer.borderWidth = 1
        dateField.frame = CGRect(x: 0, y: 130, width: 200, height: 20)
        dateField.center.x = self.view.center.x
        dateField.isUserInteractionEnabled = true
        dateField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(dateField)
        
        let eggLabel = UILabel(frame: CGRect(x: 0, y: 160, width: 200, height: 20))
        eggLabel.text = "Eggs:"
        eggLabel.textColor = .black
        eggLabel.center.x = self.view.center.x
        eggLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(eggLabel)
        
        insertNumberField.keyboardType = .numberPad
        insertNumberField.placeholder = "Enter number of eggs"
        insertNumberField.layer.borderWidth = 1
        insertNumberField.frame = CGRect(x: 0, y: 190, width: 200, height: 20)
        insertNumberField.center.x = self.view.center.x
        insertNumberField.isUserInteractionEnabled = true
        insertNumberField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(insertNumberField)
        
        let feedLabel = UILabel(frame: CGRect(x: 0, y: 220, width: 200, height: 20))
        feedLabel.text = "Feed:"
        feedLabel.textColor = .black
        feedLabel.center.x = self.view.center.x
        feedLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(feedLabel)
        
        feedField.keyboardType = .numberPad
        feedField.placeholder = "Enter amount of feed"
        feedField.layer.borderWidth = 1
        feedField.frame = CGRect(x: 0, y: 250, width: 200, height: 20)
        feedField.center.x = self.view.center.x
        feedField.isUserInteractionEnabled = true
        feedField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(feedField)
        
        let tempLabel = UILabel(frame: CGRect(x: 0, y: 280, width: 200, height: 20))
        tempLabel.text = "Temperature:"
        tempLabel.textColor = .black
        tempLabel.center.x = self.view.center.x
        tempLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(tempLabel)
        
        temperatureField.keyboardType = .numberPad
        temperatureField.placeholder = "Enter temperature"
        temperatureField.layer.borderWidth = 1
        temperatureField.frame = CGRect(x: 0, y: 310, width: 200, height: 20)
        temperatureField.center.x = self.view.center.x
        temperatureField.isUserInteractionEnabled = true
        temperatureField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(temperatureField)
        
        let humLabel = UILabel(frame: CGRect(x: 0, y: 340, width: 200, height: 20))
        humLabel.text = "Humidity:"
        humLabel.textColor = .black
        humLabel.center.x = self.view.center.x
        humLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(humLabel)
        
        humidityField.keyboardType = .numberPad
        humidityField.placeholder = "Enter humidity"
        humidityField.layer.borderWidth = 1
        humidityField.frame = CGRect(x: 0, y: 370, width: 200, height: 20)
        humidityField.center.x = self.view.center.x
        humidityField.isUserInteractionEnabled = true
        humidityField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(humidityField)
        
        let waterLabel = UILabel(frame: CGRect(x: 0, y: 400, width: 200, height: 20))
        waterLabel.text = "Water:"
        waterLabel.textColor = .black
        waterLabel.center.x = self.view.center.x
        waterLabel.textAlignment = NSTextAlignment.center;
        view.addSubview(waterLabel)
        
        waterField.keyboardType = .numberPad
        waterField.placeholder = "Enter amount of water left"
        waterField.layer.borderWidth = 1
        waterField.frame = CGRect(x: 0, y: 430, width: 200, height: 20)
        waterField.center.x = self.view.center.x
        waterField.isUserInteractionEnabled = true
        waterField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(waterField)
        
        let enterButton = UIButton(frame: CGRect(x: 0, y: 460, width: 200, height: 20))
        enterButton.setTitleColor(.blue, for: .normal)
        enterButton.center.x = self.view.center.x
        enterButton.setTitle("Enter", for: .normal)
        enterButton.addTarget(self, action: #selector(viewController), for: .touchUpInside)
        view.addSubview(enterButton)
        
        let graphButton = UIButton(frame: CGRect(x: 0, y: 490, width: 200, height: 20))
        graphButton.setTitleColor(.blue, for: .normal)
        graphButton.center.x = self.view.center.x
        graphButton.setTitle("View Graph", for: .normal)
        graphButton.addTarget(self, action: #selector(viewController2), for: .touchUpInside)
        view.addSubview(graphButton)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func getDateIndex(dateArray: [String], newDate: String) -> Int {
        if (dateArray.count == 0)
        {
            return 0
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        var dateObjArray: [Date] = []
        for date: String in dateArray
        {
            let dateObj = dateFormatter.date(from: date)
            dateObjArray.append(dateObj!)
        }
        
        var dateIntArray: [Int] = []
        
        for date: Date in dateObjArray
        {
            let timeInterval = date.timeIntervalSince1970
            let myInt = Int(timeInterval)
            dateIntArray.append(myInt)
        }
        
        let dateObj = dateFormatter.date(from: newDate)
        let timeInterval = dateObj?.timeIntervalSince1970
        let myInt = Int(timeInterval!)
        for ints: Int in dateIntArray
        {
            print(ints)
        }
        print(myInt)
        print(dateIntArray[0])
        var i: Int = 0
        while (i != dateIntArray.count && myInt > dateIntArray[i])
        {
            i += 1
        }
        return i
    }
    
    func viewController2()
    {
        if ((insertNumberField.text?.isEmpty)! || (feedField.text?.isEmpty)! || (waterField.text?.isEmpty)! || (temperatureField.text?.isEmpty)! || (humidityField.text?.isEmpty)!)
        {
            // create the alert
            let alert = UIAlertController(title: "", message: "Please fill in all forms.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            navigationController?.pushViewController(ViewController(), animated: true)
        }
    }
    
    func viewController()
    {
        if ((insertNumberField.text?.isEmpty)! || (feedField.text?.isEmpty)! || (waterField.text?.isEmpty)! || (temperatureField.text?.isEmpty)! || (humidityField.text?.isEmpty)!)
        {
            // create the alert
            let alert = UIAlertController(title: "", message: "Please fill in all forms.", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        else {
            let defaults = UserDefaults.standard
            var date = defaults.stringArray(forKey: "date") ?? [String]()
            var numberOfEggs = defaults.array(forKey: "numberOfEggs") as? [Int] ?? [Int]()
            var feed = defaults.array(forKey: "feed") as? [Int] ?? [Int]()
            var humidity = defaults.array(forKey: "humidity") as? [Int] ?? [Int]()
            var temperature = defaults.array(forKey: "temperature") as? [Int] ?? [Int]()
            var water = defaults.array(forKey: "water") as? [Int] ?? [Int]()
            
            if (dateField.text!.isEmpty)
            {
                let dateval = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy.MM.dd"
                let result = formatter.string(from: dateval)
                //let resultInt:Int? = Int(result)
                
                date.append(result)
                let a:Int? = Int(insertNumberField.text!)
                let b:Int? = Int(feedField.text!)
                let c:Int? = Int(humidityField.text!)
                let d:Int? = Int(temperatureField.text!)
                let e:Int? = Int(waterField.text!)
                numberOfEggs.append(a!)
                feed.append(b!)
                humidity.append(c!)
                temperature.append(d!)
                water.append(e!)
            }
            else
            {
                let index00: Int = getDateIndex(dateArray: date, newDate: dateField.text!)
                date.insert(dateField.text!, at: index00)
                let a:Int? = Int(insertNumberField.text!)
                let b:Int? = Int(feedField.text!)
                let c:Int? = Int(humidityField.text!)
                let d:Int? = Int(temperatureField.text!)
                let e:Int? = Int(waterField.text!)
                
                print("Eggs")
                for x: Int in numberOfEggs
                {
                    print(x)
                }
                print("Feed")
                for y: Int in feed
                {
                    print(y)
                }
                
                numberOfEggs.insert(a!, at: index00)
                feed.insert(b!, at: index00)
                humidity.insert(c!, at: index00)
                temperature.insert(d!, at: index00)
                water.insert(e!, at: index00)
                
            }
            
            
            let viewController = ViewController()
            
            
            UserDefaults.standard.set(date, forKey: "date")
            UserDefaults.standard.set(numberOfEggs, forKey: "numberOfEggs")
            UserDefaults.standard.set(feed, forKey: "feed")
            UserDefaults.standard.set(humidity, forKey: "humidity")
            UserDefaults.standard.set(temperature, forKey: "temperature")
            UserDefaults.standard.set(water, forKey: "water")
            UserDefaults.standard.synchronize()
            
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
