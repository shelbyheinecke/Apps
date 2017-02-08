//
//  ViewController.swift
//  Silly Song
//
//  Created by Shelby Heinecke on 2/8/17.
//  Copyright © 2017 Shelby Heinecke. All rights reserved.
//

import UIKit


func shortNameFromName(name: String) -> String {
    let lowerCaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let firstVowel = lowerCaseName.rangeOfCharacter(from: vowelSet)
    let start = name.index((firstVowel?.upperBound)!, offsetBy: -1)
    let end = name.endIndex
    return name[start..<end]
    
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String{
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    let lyrics2 = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
    return lyrics2
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            lyricsView.text = lyrics
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

}
