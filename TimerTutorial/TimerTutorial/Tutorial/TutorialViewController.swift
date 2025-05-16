//
//  TutorialViewController.swift
//  ScratchBook
//
//  Created by Maria Clara Albuquerque Moura on 08/04/25.
//

import UIKit

class TutorialViewController: UIViewController {
    
    private let tutorialView = TutorialView()
    private var step = 0
    private var timer: Timer?
    private var secondsRemaining = 10
    
    override func loadView() {
        view = tutorialView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startMinuteCycle()
    }
    
    func updateStep(to step: Int) {
        let imageNames = ["heart.fill", "sparkles", "moon.stars.fill"]
        if step < imageNames.count {
            tutorialView.imageView.image = UIImage(systemName: imageNames[step])
        }
        tutorialView.stepLabel.text = "\(min(step + 1, 3))/3"
        
    }
    
    func updateTimerLabel(secondsRemaining: Int) {
        tutorialView.timerLabel.text = String(format: "%02d:%02d", secondsRemaining / 60, secondsRemaining % 60)
        let progressValue = 1.0 - Float(secondsRemaining) / 10.0
        tutorialView.progressView.setProgress(progressValue, animated: true)
    }
    
    private func startMinuteCycle() {
        guard step < 3 else {
            return
        }
        updateStep(to: step)
        secondsRemaining = 10
        updateTimerLabel(secondsRemaining: secondsRemaining)
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.tick()
        }
    }
    
    private func tick() {
        secondsRemaining -= 1
        updateTimerLabel(secondsRemaining: secondsRemaining)
        
        if secondsRemaining <= 0 {
            timer?.invalidate()
            
            if step < 2 {
                step += 1
                startMinuteCycle()
            } else {
                step += 1
                updateStep(to: 2)
                updateTimerLabel(secondsRemaining: 0)
            }
        }
    }
}

#Preview{
    TutorialViewController()
}
