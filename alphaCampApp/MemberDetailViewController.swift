//
//  MemberDetailViewController.swift
//  alphaCampApp
//
//  Created by WuKwok Ho on 4/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var memberImage: UIImageView!
    
    @IBOutlet weak var memberName: UILabel!

    @IBOutlet weak var memberInfo: UILabel!
    
    let coreMember:[Member] = allMember().getCoreArray()
    let teachers:[Member] = allMember().getTeachersArray()
    let alumni:[Member] = allMember().getACGuys()
    
    var index = 0
    var showArray:[Member] = [Member]()
    
    func detailShow (){
        memberImage.image = UIImage(named: showArray[index].image!)
        memberName.text = showArray[index].name
        memberInfo.text = showArray[index].info
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.selectedSegmentIndex = 0
        showArray = coreMember
        detailShow()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            index = 0
            showArray = coreMember
            detailShow()
        case 1:
            index = 0
            showArray = teachers
            detailShow()
        case 2:
            index = 0
            showArray = alumni
            detailShow()
        default:
            break
        }
        
    }
    
    @IBAction func previousButton(sender: AnyObject) {
        photoPrevious()
    }
    @IBAction func nextButton(sender: AnyObject) {
        photoNext()
    }
    
    
    func photoNext(){
        if index+1 < showArray.count {
            index += 1
            detailShow()
        } else if index+1 == showArray.count {
            index = 0
            detailShow()
        }
    }
    
    func photoPrevious (){
        if index-1 < 0 {
            index = showArray.count - 1
            detailShow()
        } else if index-1 >= 0 {
            index -= 1
            detailShow()
        }
    }
}
