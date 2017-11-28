//
//  ViewController.swift
//  postTestStopWatch
//
//  Created by abdul fatah on 10/25/17.
//  Copyright © 2017 FatahKhair. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblTime: UILabel!
    
    var totalsec:Float = 0
    var timer = Timer()
    
    var lapTimeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblTime.text = "Tap Start"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func btnStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        print("start tapped")
    }
    @IBAction func btnStop(_ sender: Any) {
        timer.invalidate()
        print("stop tapped")
        
    }
    @IBAction func btnLap(_ sender: Any) {
        lapTimeArray.append(lblTime.text!)
        tblView.reloadData()
        print("lap tapped")
    }
    //MARK: - table view methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapRecordCell")
        cell?.textLabel?.text = lapTimeArray[indexPath.row]
        return cell!
        
    }
    func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        return lapTimeArray.count
    }
    //MARK: - update timer
    @objc func updateTimer() {
        totalsec += 0.01
        let totalSecMulti100:Int = Int(totalsec*100)
        let min = Int(totalsec/60)
        let hour = Int(min/60)
        
        let minStr = (min == 0) ? "00" : "\(min)"
        let hourStr = (hour == 0) ? "00" : "\(hour)"
        let secStr = (totalsec < 9) ? "0\(Float(totalSecMulti100)/100)" : "\"(Float(totalSecMulti100)/100)"
        
        
        lblTime.text = "\(hourStr):\(minStr):\(Float(totalSecMulti100)/100)"
    }
    
    
}


