// Source: https://stackoverflow.com/a/53123144

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    let statusItem = NSStatusBar.system.statusItem(withLength:25.0)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
                
        if let button = statusItem.button {
            button.title = ""
        }
        
        let iconAnimation =
            StatusBarIconAnimationUtils.init(statusBarItem: statusItem)
    
        func startAnimation() {
            iconAnimation.startAnimating()
        }

        func stopAnimating() {
            iconAnimation.stopAnimating()
        }
        
        startAnimation()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}
