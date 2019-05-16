//
//  MeetingTableViewCell.swift
//  Meetings
//
//  Created by Bharath  Raj kumar on 10/02/19.
//  Copyright © 2019 Bharath Raj Kumar. All rights reserved.
//

import UIKit

class MeetingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    func populate(with meeting: Meeting)
    {
        titleLabel.text = meeting.title
        startTimeLabel.text = meeting.startTime
        endTimeLabel.text = meeting.endTime
    }
   
}
