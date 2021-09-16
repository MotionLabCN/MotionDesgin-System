//
//  LocalNotificationBootcamp.swift
//  MotionDesgin
//
//  Created by 梁泽 on 2021/9/14.
//

import SwiftUI

import UserNotifications
import CoreLocation
class NotificationManager {
    static let shared = NotificationManager() //Singleton
    
    func requestAuthorization()  {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error = error {
                print("error: \(error)")
            } else {
                print("success")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "this is noti title"
        content.subtitle = "this is subtitle"
        content.sound = .default
        content.badge = 1
        
        /* UNNotificationTrigger 三种
         1. time
         2. calendar
         3. location
         */
        // time
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 61, repeats: true)
        
        // calendar
//        var dateComponents = DateComponents()
//        dateComponents.hour = 20
//        dateComponents.minute = 26
//        dateComponents.weekday = 1
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // location
        let regio = CLCircularRegion(center: .init(latitude: 0, longitude: 0), radius: 1000, identifier: UUID().uuidString)
        regio.notifyOnExit = true
        regio.notifyOnEntry = true
        
        let trigger = UNLocationNotificationTrigger(region: regio, repeats: true)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}


struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing: 40.0) {
            Button("request permission!") {
                NotificationManager.shared.requestAuthorization()
            }
            
            Button("scheduleNotification!") {
                NotificationManager.shared.scheduleNotification()
            }
            
            Button("cancelNotification!") {
                NotificationManager.shared.cancelNotification()
            }
            
            
            
        }
        .onAppear {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
}

struct LocalNotificationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotificationBootcamp()
    }
}
