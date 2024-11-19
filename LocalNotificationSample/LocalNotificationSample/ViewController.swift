//
//  ViewController.swift
//  LocalNotificationSample
//
//  Created by Mantosh Kumar on 19/11/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer?
    var countdown = 10 // Timer duration in seconds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        scheduleLocalNotification(after: countdown)
    }
    
    // Start the countdown timer
    func startTimer() {
        timerLabel.text = "Time left: \(countdown) seconds"
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.countdown > 0 {
                self.countdown -= 1
                self.timerLabel.text = "Time left: \(self.countdown) seconds"
            } else {
                self.timer?.invalidate()
                self.timer = nil
                self.timerLabel.text = "Time's up!"
            }
        }
    }
    
    // Schedule a local notification
    func scheduleLocalNotification(after seconds: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Timer Complete"
        content.body = "Your countdown has finished!"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(seconds), repeats: false)
        
        let request = UNNotificationRequest(identifier: "TimerNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            } else {
                print("Notification scheduled.")
            }
        }
    }
}

