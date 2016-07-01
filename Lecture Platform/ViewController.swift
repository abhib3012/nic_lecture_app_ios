//
//  ViewController.swift
//  Lecture Platform
//
//  Created by Abhishek Bhattacharya on 29/06/16.
//  Copyright © 2016 Abhishek Bhattacharya. All rights reserved.
//

import UIKit
import AVFoundation

var player:AVAudioPlayer = AVAudioPlayer()
var rowCounter:Int = 0;


var activeAudio:NSString = ""
var activeLecture:NSString = ""

var lectures = [Dictionary<String,String>()]

class ViewController: UIViewController, UITableViewDelegate {

//    @IBAction func back(sender: AnyObject) {
//        
//        navigationController?.popViewControllerAnimated(true)
//        
//    }
    @IBOutlet var slider: UISlider!
    @IBAction func volume(sender: AnyObject) {
        
        player.volume = slider.value;
    }
    @IBAction func pause(sender: AnyObject) {
        
        player.pause();
        
    }
    @IBAction func play(sender: AnyObject) {
        
        player.play()
        
        
        
    }
    
//    func startTimer(){
//        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateViewsWithTimer:"), userInfo: nil, repeats: true)
//    }
//    
//    func updateViewsWithTimer(theTimer: NSTimer){
//        updateViews()
//    }
//    
//    func updateViews(){
//        trackTime.text = player.getCurrentTimeAsString()
//        if let progress = player.getProgress() {
//            progressBar.progress = progress
//        }
//    }
//    
//    func getProgress()->Float{
//        var theCurrentTime = 0.0
//        var theCurrentDuration = 0.0
//        if let currentTime = player.currentTime, duration = player?.duration {
//            theCurrentTime = currentTime
//            theCurrentDuration = duration
//        }
//        return Float(theCurrentTime / theCurrentDuration)
//    }
//    
//    func getCurrentTimeAsString() -> String {
//        var seconds = 0
//        var minutes = 0
//        if let time = player.currentTime {
//            seconds = Int(time) % 60
//            minutes = (Int(time) / 60) % 60
//        }
//        return String(format: "%0.2d:%0.2d",minutes,seconds)
//    }
//    
//}

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(rowCounter)
        print(activeLecture)
        // Do any additional setup after loading the view, typically from a nib.
        if let pdf = NSBundle.mainBundle().URLForResource(activeLecture as String, withExtension: "pdf", subdirectory: nil, localization: nil)  {
            let req = NSURLRequest(URL: pdf)
            let webView = UIWebView(frame: CGRectMake(10,100,self.view.frame.size.width-20,self.view.frame.size.height-220))
            webView.loadRequest(req)
            self.view.addSubview(webView)
        }
        
        do {
            
            let audioPath = NSBundle.mainBundle().pathForResource(activeAudio as String, ofType: "mp3")!
            let url = NSURL(fileURLWithPath: audioPath)
            
            
            try player = AVAudioPlayer(contentsOfURL: url)
            
            
        } catch {
            
            // Error code
            
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        
        cell.textLabel?.text = lectures[indexPath.row]["name"]
        
        return cell
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    
    


    }
}

