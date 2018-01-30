//
//  ViewController.swift
//  NotificationApp
//
//  Created by Ashish Kumar Mourya on 30/01/18.
//  Copyright © 2018 Ashish Kumar Mourya. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound], completionHandler: {(grant,error) in
            
            if grant{
                print("Request Granted for Notification.")
                
            } else {
                print("Reject request of Notification.")
            }
            
        })
        
    }

    //MARK:- Notifiy Button Click -
    
    @IBAction func notifyButtonTabbed(_ sender: Any) {
        
        scheduleNotification(inSecond: 2, completion: { success in
            
            if success {
                print("Notification Send Successfully")
                
            } else {
                print("Notificatin not send")
            }
            
        })
        
    }
    
    
    
    
    func scheduleNotification(inSecond: TimeInterval, completion: @escaping (_ Success: Bool)->()){
        
        //Add attachment...
        let myImage = "Ashish"
        guard let imgUrl = Bundle.main.url(forResource: myImage, withExtension: "jpg") else {
            completion(false)
            return
        }


        
        
        
        var attachment: UNNotificationAttachment
        attachment = try! UNNotificationAttachment(identifier: "MyNotification", url: imgUrl, options: .none)
        
        let notify = UNMutableNotificationContent()
        notify.title = "First Notification"
        notify.subtitle = "This notification is demo purpose."
        notify.body = "The new notification is iOS version 10 only available"
        notify.attachments = [attachment]
        
        notify.categoryIdentifier = "myNotificationCategory"
        
        let notifyTrigger = UNTimeIntervalNotificationTrigger(timeInterval: inSecond, repeats: false)
        let request = UNNotificationRequest(identifier: "MyNotification", content: notify, trigger: notifyTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            
            if error != nil {
                
                print(error ?? "Error in send notification")
                completion(false)
                
            } else {
                completion(true)
            }
            
            
        })

        
        
        
        
    }
    
    
    


}

