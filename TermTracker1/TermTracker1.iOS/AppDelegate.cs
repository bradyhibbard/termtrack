using System;
using System.Collections.Generic;
using System.Linq;

using Foundation;
using UIKit;
using Plugin.LocalNotification;
using UserNotifications;

namespace TermTracker1.iOS
{
    [Register("AppDelegate")]
    public partial class AppDelegate : global::Xamarin.Forms.Platform.iOS.FormsApplicationDelegate
    {
        public override bool FinishedLaunching(UIApplication app, NSDictionary options)
        {
            global::Xamarin.Forms.Forms.Init();

            // Request notification permissions from the user
            UNUserNotificationCenter.Current.RequestAuthorization(
                UNAuthorizationOptions.Alert | UNAuthorizationOptions.Badge | UNAuthorizationOptions.Sound,
                (approved, err) => {
                    // Handle approval
                }
            );

            UNUserNotificationCenter.Current.Delegate = new NotificationDelegate();

            LoadApplication(new App());

            return base.FinishedLaunching(app, options);

        }

        // This is the iOS specific delegate that handles notifications
        public class NotificationDelegate : UNUserNotificationCenterDelegate
        {
            // Here you can handle the notifications
        }
    }
}
