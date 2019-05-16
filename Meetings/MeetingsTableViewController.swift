//
//  MeetingsTableViewController.swift
//  Meetings
//
//  Created by Bharath  Raj kumar on 10/02/19.
//  Copyright © 2019 Bharath Raj Kumar. All rights reserved.
//

import UIKit
import FirebaseFirestore





class MeetingsTableViewController: UITableViewController {

    var meetings = [Meeting]()
    var database: Firestore?
    lazy var MeetingsReference = database?.collection("meetings")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = Firestore.firestore()
        getMeetings()
    }
    
    func getMeetings()
    {
        MeetingsReference?.addSnapshotListener { (snapshot,err) in
            
            print(err ?? "No error")
            
      
            
            guard let documents = snapshot?.documents else { return }
            var meetings = [Meeting]()
            for document in documents
            {
                guard
                let title = document.data()["title"] as? String,
                let address = document.data()["address"] as? String,
                let startTime = document.data()["startTime"] as? String,
                let endTime = document.data()["endTime"] as? String
                else { return }
                
                let meeting = Meeting.init(title: title, Address: address, startTime: startTime, endTime: endTime)
                meetings.append(meeting)
            }
            self.meetings = meetings
            self.tableView.reloadData()
        }
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meetings.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meetingCell", for: indexPath)
        let meetingCell = cell as? MeetingTableViewCell
        
        meetingCell?.populate(with: meetings[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.frame.origin.y = 10
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meeting = meetings[indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "showDetails", sender: meeting)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let meetingDetailsVC = segue.destination as? MeetingDetailsViewController, let meeting = sender as? Meeting
        {
            meetingDetailsVC.meeting = meeting
        }
    }
}
