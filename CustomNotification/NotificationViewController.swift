//
//  NotificationViewController.swift
//  CustomNotification
//
//  Created by Ashish Kumar Mourya on 30/01/18.
//  Copyright © 2018 Ashish Kumar Mourya. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet var label: UILabel?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func didReceive(_ notification: UNNotification) {
        
        guard let attachment =  notification.request.content.attachments.first  else {
            return
        }
        
        if attachment.url.startAccessingSecurityScopedResource(){
          
            let imageData = try? Data.init(contentsOf: attachment.url)
            if let img = imageData {
                imageView.image = UIImage(data: img)
            }
            
          
        }
        
        
        
    }

}
