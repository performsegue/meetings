//
//  MeetingDetailsViewController.swift
//  Meetings
//
//  Created by Bharath  Raj kumar on 10/02/19.
//  Copyright © 2019 Bharath Raj Kumar. All rights reserved.
//

import UIKit

class MeetingDetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    var meeting: Meeting?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = meeting?.title
        addressLabel.text = meeting?.Address
        startTimeLabel.text = meeting?.startTime
        endTimeLabel.text = meeting?.endTime
    }
    

}
