//
//  ViewController.swift
//  LocalNotificationSample
//
//  Created by Mantosh Kumar on 19/11/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = "Don't forget to check your tasks!"
        content.sound = .default
        
        // Configure the trigger (e.g., after 10 seconds)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
        
        // Create the request
        let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)
        
        // Add the notification to the center
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully.")
            }
        }
    }
    
    @IBAction func triggerNotification(_ sender: Any) {
        scheduleLocalNotification()
    }
}

