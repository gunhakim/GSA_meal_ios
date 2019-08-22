//
//  tomorrow.swift
//  meal
//
//  Created by kimgunha on 2019/08/20.
//  Copyright © 2019 kimgunha. All rights reserved.
//

import UIKit
import Foundation


class tomorrow: UIViewController {
    @IBOutlet weak var tomorrow_date: UILabel!

    @IBOutlet weak var label: UILabel!
    
    var cal = Calendar.current
    
    struct Sample1: Codable {
        var menu: [Sample2]
        var server_message: [String]
    }
    
    struct Sample2: Codable {
        var date: String
        var lunch: [String]
        var breakfast: [String]
        var dinner: [String]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let today = NSDate(timeIntervalSinceNow:24 * 60 * 60)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        let dateString = dateFormatter.string(from: today as Date)
        tomorrow_date.text = dateString+"🗓"
        
    }
    
    
    
    @IBAction func button_breakfast(_ sender: Any) {
        label.text = "loading✈️"
        let date = Date(timeIntervalSinceNow: 24 * 60 * 60)
        let year = cal.component(.year, from: date)
        let month = cal.component(.month, from: date)
        let day = cal.component(.day, from: date)
        
        let url = URL(string: "https://schoolmenukr.ml/api/middle/F100000096?year=\(year)&month=\(month)&date=\(day)")!
        print(url)
        var string = ""
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            
            
            let sample1 = try! JSONDecoder().decode(Sample1.self, from: data)
            let breakfast = sample1.menu[0].breakfast
            
            if breakfast.isEmpty{
                string = "no information😢"
            }
            
            for menu: String in breakfast{
                string += menu.replace(target: "&amp;", withString: "&")+"\n"
            }
            print(string)
            self.label.text = string
            self.label.numberOfLines = 0
            self.label.lineBreakMode = NSLineBreakMode.byWordWrapping
            
        }
    }
    
    
    @IBAction func button_lunch(_ sender: Any) {
        label.text = "loading✈️"
        let date = Date(timeIntervalSinceNow: 24 * 60 * 60)
        let year = cal.component(.year, from: date)
        let month = cal.component(.month, from: date)
        let day = cal.component(.day, from: date)
        
        let url = URL(string: "https://schoolmenukr.ml/api/middle/F100000096?year=\(year)&month=\(month)&date=\(day)")!
        print(url)
        var string = ""
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            
            
            let sample1 = try! JSONDecoder().decode(Sample1.self, from: data)
            let breakfast = sample1.menu[0].lunch
            
            if breakfast.isEmpty{
                string = "no information😢"
            }
            
            for menu: String in breakfast{
                string += menu.replace(target: "&amp;", withString: "&")+"\n"
            }
            print(string)
            self.label.text = string
            self.label.numberOfLines = 0
            self.label.lineBreakMode = NSLineBreakMode.byWordWrapping
            
        }
    }
    @IBAction func button_dinner(_ sender: Any) {
        label.text = "loading✈️"
        let date = Date(timeIntervalSinceNow: 24 * 60 * 60)
        let year = cal.component(.year, from: date)
        let month = cal.component(.month, from: date)
        let day = cal.component(.day, from: date)
        
        let url = URL(string: "https://schoolmenukr.ml/api/middle/F100000096?year=\(year)&month=\(month)&date=\(day)")!
        print(url)
        var string = ""
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) {(response, data, error) in
            guard let data = data else { return }
            
            
            let sample1 = try! JSONDecoder().decode(Sample1.self, from: data)
            let breakfast = sample1.menu[0].dinner
            
            if breakfast.isEmpty{
                string = "no information😢"
            }
            
            for menu: String in breakfast{
                string += menu.replace(target: "&amp;", withString: "&")+"\n"
            }
            print(string)
            self.label.text = string
            self.label.numberOfLines = 0
            self.label.lineBreakMode = NSLineBreakMode.byWordWrapping
            
        }
    }
}
