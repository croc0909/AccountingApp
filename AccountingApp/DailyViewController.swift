//
//  DailyViewController.swift
//  AccountingApp
//
//  Created by AndyLin on 2022/10/27.
//

import UIKit

class DailyViewController: UIViewController {

    
    @IBOutlet weak var calendarCollectionView: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    
    // data
    let dailyViewDataSource = DailyViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setUpCalendar()
        // Do any additional setup after loading the view.
    }
    
    func setCollectionView(){
        calendarCollectionView.delegate = dailyViewDataSource
        calendarCollectionView.dataSource = dailyViewDataSource
    }

    func setUpCalendar(){
        print("currentYear \(dailyViewDataSource.currentYear) currentMonth \(dailyViewDataSource.currentMonth)")
        timeLabel.text = "\(dailyViewDataSource.currentYear) \(dailyViewDataSource.months[dailyViewDataSource.currentMonth - 1])"
        calendarCollectionView.reloadData()
    }
    
    @IBAction func lastMonthAction(_ sender: Any) {
        dailyViewDataSource.currentMonth -= 1
        if dailyViewDataSource.currentMonth == 0{
            dailyViewDataSource.currentMonth = 12
            dailyViewDataSource.currentYear -= 1
        }
        setUpCalendar()
    }
    
    @IBAction func nextMonthAction(_ sender: Any) {
        dailyViewDataSource.currentMonth += 1
        if dailyViewDataSource.currentMonth == 13{
            dailyViewDataSource.currentMonth = 1
            dailyViewDataSource.currentYear += 1
        }
        setUpCalendar()
    }
    
    @IBAction func dateButtonAction(_ sender: UIButton) {
        print("按鈕 \(sender.tag)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
