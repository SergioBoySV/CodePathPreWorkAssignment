//  ViewController.swift
//  CodePathPreWork
//  Created by Sergio Villarreal on 1/12/24.

import UIKit
import LinkPresentation


class ViewController: UIViewController
{
    let confettiEmitter = CAEmitterLayer() /* Confetti Code */
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    /* Confetti Code */
    @objc func startConfetti()
    {
        confettiEmitter.emitterPosition = CGPoint(x: view.bounds.width / 2, y: 0)
        confettiEmitter.emitterShape = .line
        confettiEmitter.emitterSize = CGSize(width: view.bounds.width, height: 1)
        confettiEmitter.renderMode = .additive
        
        let confettiCell = CAEmitterCell()
        confettiCell.birthRate = 5
        confettiCell.lifetime = 10
        confettiCell.velocity = 100
        confettiCell.velocityRange = 50
        confettiCell.emissionLongitude = .pi
        confettiCell.spin = 4
        confettiCell.spinRange = 8
//        confettiCell.contents = UIImage(systemName: "star.fill")?.cgImage
        let coolEmoji = UIImage(named: "coolEmojiImage")?.cgImage
//        confettiCell.color = UIColor.red.cgColor
        confettiCell.contents = coolEmoji
        confettiCell.scale = 0.1
        confettiCell.scaleRange = 0.05
        
        confettiEmitter.emitterCells = [confettiCell]
        
        view.layer.addSublayer(confettiEmitter)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4)
        {
            self.confettiEmitter.removeFromSuperlayer()
        }
    }
    /* Confetti Code */

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var professionLabel: UILabel!
    @IBOutlet weak var customPopupView: UIView!
    @IBOutlet weak var newAcquaintance: UILabel!
    
    func chooseRandomEntry(from array: [String]) -> String?
    {
        return array.randomElement()
    }
    
    func generatePerson(nameUILabel: UILabel, schoolUILabel: UILabel, professionUILabel: UILabel)
    {
        let firstName = chooseRandomEntry(from: firstNames)
        let lastName = chooseRandomEntry(from: lastNames)
        let fullName = "\(firstName ?? "ERROR") \(lastName ?? "ERROR")"
        let school = chooseRandomEntry(from: schools)
        let profession = chooseRandomEntry(from: professions)
        
        nameUILabel.text = fullName
        schoolUILabel.text = school
        professionUILabel.text = profession
    }

    @IBAction func IntroduceYourselfButton(_ sender: UIButton) 
    {
        startConfetti()
        newAcquaintance.text = nameLabel.text
        customPopupView.isHidden = false
    }
    
    @IBAction func nextColleagueButton(_ sender: UIButton) 
    {
        generatePerson(nameUILabel: nameLabel, schoolUILabel: schoolLabel, professionUILabel: professionLabel)
    }
    
    @IBAction func yesButton(_ sender: UIButton)
    {
        customPopupView.isHidden = true
        generatePerson(nameUILabel: nameLabel, schoolUILabel: schoolLabel, professionUILabel: professionLabel)
    }
    
    @IBAction func noButton(_ sender: UIButton) 
    {
        customPopupView.isHidden = true
    }
    
    /* Multiple View Controllers Code */
    @IBAction func switchView(_ sender: UIButton)
    {
        let secondVC = storyboard?.instantiateViewController(identifier: "originalPreworkCode") as! SecondViewController
        present(secondVC, animated: true)
    }
    /* Multiple View Controllers Code */
    
    /* Original Prework Assignment */
    @IBAction func changeBackgroundColor(_ sender: UIButton)
    {
        func changeColor() -> UIColor
        {
            let red = CGFloat.random(in: 0...1)
            let green = CGFloat.random(in: 0...1)
            let blue = CGFloat.random(in: 0...1)

            return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
        }
        
        let randomColor = changeColor()
        view.backgroundColor = randomColor
    }
    /* Original Prework Assignment */
    
    @IBAction func backToBlackColor(_ sender: UIButton)
    {
        view.backgroundColor = .black
    }
}

/* Multiple View Controllers Code */
class SecondViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    /* Opening Links Code */
    @IBAction func openMultipleViewControllersSource(_ sender: UIButton)
    {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=AiKBxiHdFYo")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func openCustomPopupSource(_ sender: UIButton)
    {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=vtSVY2RrDGM")!, options: [:], completionHandler: nil)
    }
    
    @IBAction func openOpeningLinksSource(_ sender: UIButton)
    {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=Epb_ZZBFZIs")!, options: [:], completionHandler: nil)    }
    
    @IBAction func openConfettiCodeSource(_ sender: UIButton)
    {
        UIApplication.shared.open(URL(string: "https://www.youtube.com/watch?v=YosPD7eFvcE")!, options: [:], completionHandler: nil)
    }
    /* Opening Links Code */
}
/* Multiple View Controllers Code */

/*
 Original Ideas:
    - Create a function that chooses from a list of random made up people and displays their info
    - Add a next button to see the next random person
    - Set the button to display text that says an intro was sent (maybe confetti flies across the screen)
    - Once the introduce button is pressed, set something up so that a notification is sent within 5-10 second saying that the person said hi back
 */
