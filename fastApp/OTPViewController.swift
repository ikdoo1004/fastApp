//
//  OTPViewController.swift
//  fastApp
//
//  Created by 김익두 on 11/22/24.
//

import UIKit

class OTPViewController: UIViewController {
    
    var timer: Timer?
    var countdown = 30 // Countdown time in seconds
    @IBOutlet weak var timerLabel: UILabel! // Connect this to a UILabel in your storyboard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showTextMessagePopup(sender: "Verification", message: "Your OTP is 1234")
        }
    }
    
    private func showTextMessagePopup(sender: String, message: String) {
        // create a popup view
        let popupView = UIView(frame: CGRect(x: 10, y: -100, width: view.frame.width - 20, height: 100))
        popupView.backgroundColor = .systemGray6
        popupView.layer.cornerRadius = 10
        popupView.clipsToBounds = true
        
        // Add a sender label
        let senderLabel = UILabel(frame: CGRect(x: 10, y: 10, width: popupView.frame.width - 20, height: 20))
        senderLabel.text = sender
        senderLabel.font = UIFont.boldSystemFont(ofSize: 16)
        senderLabel.textColor = .black
        popupView.addSubview(senderLabel)
        
        // Add a message label
        let messageLabel = UILabel(frame: CGRect(x: 10, y: 40, width: popupView.frame.width - 20, height: 50))
        messageLabel.text = message
        messageLabel.font = UIFont.systemFont(ofSize: 14)
        messageLabel.textColor = .darkGray
        messageLabel.numberOfLines = 2
        popupView.addSubview(messageLabel)
        
        // Add popup to the view
        view.addSubview(popupView)
        
        // Animate the popup
        UIView.animate(withDuration: 0.5, animations: {
            popupView.frame.origin.y = 40
        }) { _ in
            // Remove the popup after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                UIView.animate(withDuration: 0.5, animations: {
                    popupView.frame.origin.y = -100
                }) { _ in
                    popupView.removeFromSuperview()
                }
            }
        }
    }
    
    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    // Function called every second by the timer
    @objc func updateTimer() {
        if countdown > 0 {
            countdown -= 1
            timerLabel.text = "Resend OTP in \(countdown)s"
        } else {
            timer?.invalidate()
            timer = nil
            timerLabel.text = "Resend OTP now"
        }
    }
}
