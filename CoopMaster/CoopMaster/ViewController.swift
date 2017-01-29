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

    var dateStringArray: [String]!
    var eggCountArray: [Int]!
    var waterCountArray: [Double]!
    var feedCountArray: [Double]!
    
    var dateArray: [Date]!
    var dateSubtractedFloatArray: [Float]!
    var dateFloatArray: [Float]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let dateStringArray = defaults.stringArray(forKey: "date") ?? [String]()
        let eggCountArray = defaults.array(forKey: "numberOfEggs") as? [Int] ?? [Int]()
        
        view.backgroundColor = .white
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        /*dateStringArray = [String]()
        dateStringArray.append("2017/01/27")
        dateStringArray.append("2017/01/28")
        dateStringArray.append("2017/01/29")
        dateStringArray.append("2017/01/30")
        dateStringArray.append("2017/01/31")
        dateStringArray.append("2017/02/01")*/
        
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
        var i = 0
        for dateObject in dateArray{
            let secondsSinceFirstDay = dateObject.timeIntervalSince1970-secondsToSubtract
            array1.append((x: secondsSinceFirstDay, y: Double(eggCountArray[i])))
            i+=1
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
        
        var yLabelEggArray = [Float]()
        let maxEggValue = eggCountArray.max()!
        for i in 0...maxEggValue {
            yLabelEggArray.append(Float(i))
        }
        chart.yLabels = yLabelEggArray
        chart.yLabelsFormatter = { String(Int($1)) }
        
        chart.add(series)
        
        view.addSubview(chart)
        
        //Labels for eggs chart
        let yAxisEggsLabel = UILabel(frame: CGRect(x: -10, y: view.frame.height*0.45+30, width: 60, height: 40))
        yAxisEggsLabel.text = "Eggs"
        yAxisEggsLabel.textAlignment = .center
        yAxisEggsLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        view.addSubview(yAxisEggsLabel)
        
        let xAxisEggsLabel = UILabel(frame: CGRect(x: view.frame.width*0.5-30, y: view.frame.height*0.9, width: 60, height: 40))
        xAxisEggsLabel.text = "Date"
        xAxisEggsLabel.textAlignment = .center
        view.addSubview(xAxisEggsLabel)
        
        /*let chart2 = Chart(frame: CGRect(x: view.frame.width*0.1, y: view.frame.height*0.5, width: view.frame.width*0.8, height: view.frame.height*0.8))
        
        chart2.xLabels = dateSubtractedFloatArray
        chart2.xLabelsFormatter = { self.convertSubtractedSince1970ToDateString(subtractedSecondsSince1970: $1) }
        
        chart2.yLabels = yLabelEggArray
        chart2.yLabelsFormatter = { String(Int($1)) }
        
        view.addSubview(chart2)*/
    }
    
    
    //This converts subtracted since 1970 by leastSecondsSince1970() Float values into the appropriate date String. This is for the xLabelsFormatter field of the chart.
    func convertSubtractedSince1970ToDateString(subtractedSecondsSince1970: Float) -> String{
        let date = NSDate(timeIntervalSince1970: Double(subtractedSecondsSince1970)+leastSecondsSince1970())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
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

