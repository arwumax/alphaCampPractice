//
//  FirstViewController.swift
//  alphaCampApp
//
//  Created by WuKwok Ho on 25/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    //allCourse() -> 呼叫init 下的所有內容
    var courses: allCourse = allCourse()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Fix empty space above first cell
        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tableView 要加
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //tableView 要加
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.arrayCourse.count
    }
    
    //tableView 要加, 將資料同cell 做配對。例如：第一項資料對第一個roll
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CourseTableViewCell
        
        
        cell.imageViewCover.image = UIImage(named: courses.arrayCourse[indexPath.row].coverImageName!)
        cell.labelTitle.text = courses.arrayCourse[indexPath.row].courseName
        cell.labelCourseDate.text = courses.arrayCourse[indexPath.row].courseDate
        cell.textViewDetail.text = courses.arrayCourse[indexPath.row].courseDetail
        
        cell.buttonMore.tag = indexPath.row
        cell.buttonMore.addTarget(self, action: #selector(FirstViewController.goDetail(_:)), forControlEvents: .TouchUpInside)
        
        return cell
        
        
    }
    
    func goDetail(button: UIButton) {
    performSegueWithIdentifier("show detail", sender: button)
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let button = sender as! UIButton
        let destVC = segue.destinationViewController as! detailView
        destVC.courseIndex = button.tag
        print(button.tag)
    }
}




