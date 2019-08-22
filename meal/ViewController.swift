//
//  ViewController.swift
//  meal
//
//  Created by kimgunha on 2019/08/19.
//  Copyright © 2019 kimgunha. All rights reserved.
//

import UIKit
import Foundation

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target,
                                         with: withString,
                                         options: NSString.CompareOptions.literal,
                                         range: nil)
    }

    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var today_date: UILabel!
    
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
        let today = NSDate() //현재 시각 구하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 M월 d일"
        let dateString = dateFormatter.string(from: today as Date)
        today_date.text = dateString+"🗓"
        // Do any additional setup after loading the view.
        

    }
    //MARK: Actions
    
    @IBAction func button(_ sender: UIButton) {
        label.text = "loading✈️"
        let date = Date()
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
    
    @IBAction func lunch_button(_ sender: Any) {
        label.text = "loading✈️"
        let date = Date()
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
    
    @IBAction func dinner_button(_ sender: Any) {
        label.text = "loading✈️"
        let date = Date()
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
            
        }    }
    @IBAction func goto_tomorrow(_ sender: Any) {
        
    }
    
}


