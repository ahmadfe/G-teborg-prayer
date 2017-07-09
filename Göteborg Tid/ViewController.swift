//
//  ViewController.swift
//  Göteborg Tid
//
//  Created by Ahamd Al-Said Ahamd on 2017-07-01.
//  Copyright © 2017 Ahamd Al-Said Ahamd. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var sek: UILabel!
    @IBOutlet weak var hoursAndMin: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentDateLabl: UILabel!
    @IBOutlet weak var currentDayLabl: UILabel!
    var prayyerArray = [prayername]()
    
    //tableView NumberOF
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prayyerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       if let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as? prayCell
        
        {
         let prayer = prayyerArray[indexPath.row]
         cell.updateCell(pray: prayer)
        return cell
        
        } else{
        return prayCell()
        }
    }
    
    func currentDate() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let currentDate = dateFormatter.string(from: now)
         currentDateLabl.text = currentDate
    
    }
    
    
    func currentDay (){
        let now = Date()
        let dayFormatter = DateFormatter()
        dayFormatter.locale = NSLocale(localeIdentifier: "SV_se") as Locale!
        dayFormatter.dateFormat = "EEEE"
        let currentDay = dayFormatter.string(from: now)
        currentDayLabl.text = currentDay
    }
    
    func fadein () {
        currentDayLabl.alpha = 0
        self.view.addSubview(currentDayLabl)
        
        UIView.animate(withDuration: 4) { 
            self.currentDayLabl.layer.opacity = 6

        }

    }
    
    func fadeinTime () {
        hoursAndMin.alpha = 0
        self.view.addSubview(hoursAndMin)
        
        UIView.animate(withDuration: 4) {
            self.hoursAndMin.layer.opacity = 6
            
        }
        
    }
    
    func fadeinSek () {
        sek.alpha = 0
        self.view.addSubview(sek)
        
        UIView.animate(withDuration: 4) {
            self.sek.layer.opacity = 6
            
        }
        
    }
    
    func fadeinDate () {
        currentDateLabl.alpha = 0
        self.view.addSubview(currentDateLabl)
        
        UIView.animate(withDuration: 4) {
            self.currentDateLabl.layer.opacity = 6
            
        }
        
    }
    
    var timerTime = Timer()

    func currentTime (){
        let now = Date()
      hoursAndMin.text = DateFormatter.localizedString(from: now, dateStyle: .none, timeStyle: .short)
        
    }
    
    var timerSek = Timer()
    func updateSek(){
    let now = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ss"
    let secoundFromday = dateFormatter.string(from: now)
    sek.text! = secoundFromday
    
    
    }

    override func viewDidLoad() {
    super.viewDidLoad()
        
        self.setGradientBackground()
       self.fadein ()
       self.fadeinSek ()
       self.currentTime ()
       self.fadeinTime ()
       self.fadeinDate ()
       timerSek = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateSek), userInfo: nil, repeats: true)
       timerTime = Timer.scheduledTimer(timeInterval: 0.60, target: self, selector: #selector(ViewController.currentTime), userInfo: nil, repeats: true)
       self.currentDay ()
       self.currentDate()
        parseTimeTable()
        //Self delegate
        tableView.delegate = self
        // Self DataSource 
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // Call Times from Csv File
    
        func parseTimeTable(){
        let path = Bundle.main.path(forResource: "TimesTable", ofType: "csv")!
        let date = Date() // now
        let cal = Calendar.current
        let day = cal.ordinality(of: .day, in: .year, for: date)
        let minusDayForDAy = day!-1
            
        
        do{
            let csv = try? CSV(contentsOfURL: path)
            let rows = csv?.rows
            for (number,row) in rows!.enumerated(){
                
                if minusDayForDAy == number {
                    
                let Fajr = row["Fajr"]!
                let Shuruq = row["Shuruq"]!
                let Dhuhur = row["Dhuhur"]!
                let Asr = row["Asr"]!
                let Maghrib = row["Maghrib"]!
                let Isha = row["Isha"]!
                let prayerTimes = prayername(Fajer: Fajr, Shuruq: Shuruq, Dhuhur: Dhuhur, Asr: Asr, Magrib: Maghrib, Isha: Isha)
                prayyerArray.append(prayerTimes)
            }// End for loop
            }
        }// End Do
        }// End Func
   

    func setGradientBackground() {
        let colorTop =  UIColor(red:0.08, green:0.12, blue:0.19, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.14, green:0.23, blue:0.33, alpha:1.0).cgColor
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [ colorTop, colorBottom]
    gradientLayer.locations = [ 0.0, 1.0]
    gradientLayer.frame = self.view.bounds
    
    self.view.layer.addSublayer(gradientLayer)
            }
 
    }
    

//End ViewController


