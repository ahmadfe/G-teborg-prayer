//
//  ViewController.swift
//  Göteborg Tid
//
//  Created by Ahamd Al-Said Ahamd on 2017-07-01.
//  Copyright © 2017 Ahamd Al-Said Ahamd. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate , UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var hoursAndMin: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentDateLabl: UILabel!
    @IBOutlet weak var currentDayLabl: UILabel!
    var prayyerArray = [prayername]()
    
    //tableView count cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prayyerArray.count
    }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

       if let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath) as? prayCell
        
        {

         let prayer = prayyerArray[indexPath.row]
            cell.updateCell(pray: prayer)
            cell.backgroundColor = UIColor.clear
            
            return cell
        
        } else{
        return prayCell()
        }
    }
    
    func currentDay (){
        let now = Date()
        let dayFormatter = DateFormatter()
        dayFormatter.locale = NSLocale(localeIdentifier: "SV_se") as Locale!
        dayFormatter.dateFormat = "EEEE"
        let currentDay = dayFormatter.string(from: now)
        currentDayLabl.text = currentDay
    }
    
    func fadeinTime () {
        hoursAndMin.alpha = 0
        self.view.addSubview(hoursAndMin)
        
        UIView.animate(withDuration: 4) {
            self.hoursAndMin.layer.opacity = 6
            
        }
        
    }
    

        
    
    
    func fadelbl () {
        currentDateLabl.alpha = 0
        currentDayLabl.alpha = 0

        self.view.addSubview(currentDateLabl)
        self.view.addSubview(currentDayLabl)
        

        UIView.animate(withDuration: 4) {
            self.currentDateLabl.layer.opacity = 6
            self.currentDayLabl.layer.opacity = 6
            
            

        }
        
    }
    
    var timerTime = Timer()

    func currentTime (){
        let time = DateFormatter()
        let date = DateFormatter()
        date.dateStyle = .medium
        time.timeStyle = .medium
        date.locale = Locale(identifier: "SV_SE")
        hoursAndMin.text = time.string(from: Date())
        currentDateLabl.text = date.string(from: Date())
    }
    
    
    let transition = CircularTransition()

    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    menuButton.layer.cornerRadius = menuButton.frame.size.width / 2
        tableView.reloadData()

        parseTimeTable()
     //  setGradientBackground()
      // currentTime ()
       
       timerTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.currentTime), userInfo: nil, repeats: true)
       currentDay ()
        //Self delegate
        tableView.delegate = self
        // Self DataSource 
        tableView.dataSource = self
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTableView()
        fadeinTime ()
        fadelbl()
        
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
        let colorTop = UIColor(red:0.00, green:0.02, blue:0.16, alpha:1.0).cgColor
        let colorBottom = UIColor(red:0.00, green:0.31, blue:0.57, alpha:1.0).cgColor
    //UIColor(red:0.00, green:0.02, blue:0.16, alpha:1.0)
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [ colorTop, colorBottom]
    gradientLayer.locations = [ 0.0, 1.0]
    gradientLayer.frame = self.view.bounds
    self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
 


    
    func animateTableView() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 6, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
        secondVC.transitioningDelegate = self
        secondVC.modalPresentationStyle = .custom
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = menuButton.center
        transition.circleColor = menuButton.backgroundColor!
        
        return transition
    }
    

    
    
    
    
    
    
    
    
    }
    

//End ViewController


