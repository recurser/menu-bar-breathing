// Source: https://stackoverflow.com/a/53123144

import Foundation
import Cocoa

class StatusBarIconAnimationUtils: NSObject {
    private var currentFrame = 0
    private var animTimer : Timer
    private var statusBarItem: NSStatusItem!
    private var frameCount : Int!

    init(statusBarItem: NSStatusItem!) {
        self.animTimer = Timer.init()
        self.statusBarItem = statusBarItem
        self.frameCount = 11
        super.init()
    }

    func startAnimating() {
        stopAnimating()
        currentFrame = 0
        animTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(self.updateImage(_:)), userInfo: nil, repeats: true)
    }

    func stopAnimating() {
        animTimer.invalidate()
        setImage(frameCount: 0)
    }

    @objc private func updateImage(_ timer: Timer?) {
        setImage(frameCount: currentFrame)
        currentFrame += 1
        if currentFrame % frameCount == 0 {
            currentFrame = 0
        }
    }

    private func setImage(frameCount: Int) {
        DispatchQueue.main.async {
            var title: String = ""
            if (frameCount <= 3) {
                title = "↑ \(frameCount + 1)"
            } else if (frameCount == 4) {
                title = "↑ &"
            } else if (frameCount <= 9) {
                title = "↓ \((frameCount % 5) + 1)"
            } else if (frameCount == 10) {
                title = "↓ &"
            }
            
            self.statusBarItem.button?.title = title
        }
    }
}
