//
//  ViewController.swift
//  CoopMaster
//
//  Created by Robert Yang on 1/28/17.
//  Copyright © 2017 Robert Yang. All rights reserved.
//

import UIKit
import SwiftChart

class ViewController: UIViewController {

    var dateArray: [Date]!
    var dateStringArray: [String]!
    var dateSubtractedFloatArray: [Float]!
    var dateFloatArray: [Float]!
    var eggCountArray: [Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        //Lei will give me this
        dateStringArray = [String]()
        dateStringArray.append("2017/01/27")
        dateStringArray.append("2017/01/28")
        dateStringArray.append("2017/01/29")
        dateStringArray.append("2017/01/30")
        dateStringArray.append("2017/01/31")
        dateStringArray.append("2017/02/01")
        
        dateArray = [Date]()
        //Append Date objects from dateStringArray to dateArray
        for dateString in dateStringArray{
            dateArray.append(formatter.date(from:dateString)!)
        }
        
        //What to subtract from each Date value such that the smallest date is assigned the origin (x=0) value
        let secondsToSubtract = leastSecondsSince1970()
        
        let chart = Chart(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height*0.1, width: view.frame.width*0.8, height: view.frame.height*0.8))
        //let series = ChartSeries([0, 6.5, 2, 8, 4.1, 7, -3.1, 10, 8])
        //let point1 = (x: 5.0, y: 9.0)
        //let point2 = (x: 6.0, y: 8.0)
        //let point3 = (x: 3.0, y: 14.0)
        var array1: Array<(x: Double, y: Double)> = Array()
        for dateObject in dateArray{
            let secondsSinceFirstDay = dateObject.timeIntervalSince1970-secondsToSubtract
            array1.append((x: secondsSinceFirstDay, y: Double(Int(arc4random_uniform(50)))))
        }
        let series = ChartSeries(data: array1)
        
        //Keeping an array of number of seconds since 1970 for use in the xLabels and the formatter
        dateSubtractedFloatArray = [Float]()
        dateFloatArray = [Float]()
        for dateDate in dateArray{
            let secondsSince1970 = Float(dateDate.timeIntervalSince1970)
            let floatSecondsToSubtract = Float(secondsToSubtract)
            dateSubtractedFloatArray.append(secondsSince1970-floatSecondsToSubtract)
            dateFloatArray.append(Float(secondsSince1970))
        }
        
        chart.xLabels = dateSubtractedFloatArray
        chart.xLabelsFormatter = { self.convertSubtractedSince1970ToDateString(subtractedSecondsSince1970: $1) }
        
        //TODO: Implement y labels
        
        chart.add(series)
        
        view.addSubview(chart)
    }
    
    
    //This converts subtracted since 1970 by leastSecondsSince1970() Float values into the appropriate date String. This is for the xLabelsFormatter field of the chart.
    func convertSubtractedSince1970ToDateString(subtractedSecondsSince1970: Float) -> String{
        let date = NSDate(timeIntervalSince1970: Double(subtractedSecondsSince1970)+leastSecondsSince1970())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let dateString = dateFormatter.string(from: date as Date)
        return dateString
    }
    
    //This is such that the earliest date is placed at x pixels = 0 for the chart view
    func leastSecondsSince1970() -> Double {
        let secondsToReturn = dateArray[0].timeIntervalSince1970
        return secondsToReturn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

