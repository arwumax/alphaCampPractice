//
//  detailView.swift
//  alphaCampApp
//
//  Created by WuKwok Ho on 25/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class detailView: UIViewController {
    
    @IBOutlet weak var imageViewCover: UIImageView!
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var labelCourseDate: UILabel!
    
    @IBOutlet weak var textViewDetail: UITextView!
    
    var courseIndex: Int = 0
    
    var courses: allCourse = allCourse()
    
    override func viewDidLoad() {


    }
    
    override func viewWillAppear(animated: Bool) {
        self.imageViewCover.image = UIImage(named: courses.arrayCourse[courseIndex].coverImageName!)
        self.labelTitle.text = courses.arrayCourse[courseIndex].courseName
        self.labelCourseDate.text = courses.arrayCourse[courseIndex].courseDate
        self.textViewDetail.text = courses.arrayCourse[courseIndex].courseDetail
        

    }
    
    

}
