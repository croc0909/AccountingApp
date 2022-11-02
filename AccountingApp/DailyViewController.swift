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
    
    // 取得年/月
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    //月份陣列
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    //計算當月天數
    var numberOfDaysInThisMonth:Int{
        let dateComponents = DateComponents(year: currentYear ,month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        let range = Calendar.current.range(of: .day, in: .month,for: date)
        return range?.count ?? 0
    }
    
    //計算當月第一天是星期幾
    var whatDayIsIt:Int{
        let dateComponents = DateComponents(year: currentYear ,month: currentMonth)
        let date = Calendar.current.date(from: dateComponents)!
        return Calendar.current.component(.weekday, from: date)
    }
    
    //計算要從星期幾開
    var howManyItemsShouldIAdd:Int{
        return whatDayIsIt - 1
    }
    
    var today:Int{
        let date = Date()
        let day = Calendar.current.component(.day, from: date)
        return day
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setUpCalendar()
        // Do any additional setup after loading the view.
    }
    
    func setCollectionView(){
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
    }

    func setUpCalendar(){
        print("currentYear \(currentYear) currentMonth \(currentMonth)")
        timeLabel.text = "\(currentYear) \(months[currentMonth - 1])"
        calendarCollectionView.reloadData()
        print(whatDayIsIt)
    }
    
    @IBAction func lastMonthAction(_ sender: Any) {
        currentMonth -= 1
        if currentMonth == 0{
                currentMonth = 12
                currentYear -= 1
        }
        setUpCalendar()
    }
    
    @IBAction func nextMonthAction(_ sender: Any) {
        currentMonth += 1
        if currentMonth == 13{
                currentMonth = 1
                currentYear += 1
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

extension DailyViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //cell 左右間隔變成0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //cell 上下間隔變成0
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize{

        let width = collectionView.frame.width / 7
        return CGSize(width: width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfDaysInThisMonth + howManyItemsShouldIAdd
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:DailyCollectionViewCell.reuseIdentifier , for: indexPath) as! DailyCollectionViewCell
        //cell.dateButton.tag = indexPath.row + 1 - howManyItemsShouldIAdd
        
        if let dateLabel = cell.contentView.subviews[0] as? UILabel{
            if indexPath.row < howManyItemsShouldIAdd{
                dateLabel.text = ""
            }else{
                if(indexPath.row + 1 - howManyItemsShouldIAdd == today){
                    dateLabel.text = "Today"
                }else{
                    dateLabel.text = "\(indexPath.row + 1 - howManyItemsShouldIAdd)"
                }
                cell.dateButton.tag = indexPath.row + 1 - howManyItemsShouldIAdd
            }
        }
        
        return cell
    }
}
