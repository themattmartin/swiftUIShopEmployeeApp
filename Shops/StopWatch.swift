//
//  StopWatch.swift
//  StopWatch
//
import Combine
import Foundation
import SwiftUI

class StopWatch: ObservableObject {
    @Published var didChange = PassthroughSubject<Void, Never>()

    private var sourceTimer: DispatchSourceTimer?
    private let queue = DispatchQueue(label: "stopwatch.timer")
    private var counter: Int = 0
    
    @Published var stopWatchTime = "00:00:00" {
        
        didSet {
            print("did set")
            self.update()
        }
    }

    var paused = true {
        didSet {
            self.update()
        }
    }

    var laps = [LapItem]() {
        didSet {
            self.update()
        }
    }

    private var currentLaps = [LapItem]() {
        didSet {
            self.laps = currentLaps.reversed()
        }
    }

    func start() {
        print("Start")
        self.paused = !self.paused

        guard let _ = self.sourceTimer else {
            self.startTimer()
            return
        }

        self.resumeTimer()
    }

    func pause() {
        self.paused = !self.paused
        self.sourceTimer?.suspend()
    }

    func lap() {
        if let firstLap = self.laps.first {
            let difference = self.counter - firstLap.count
            self.currentLaps.append(LapItem(count: self.counter, diff: difference))
        } else {
            self.currentLaps.append(LapItem(count: self.counter))
        }
    }

    func reset() {
        self.stopWatchTime = "00:00:00"
        self.counter = 0
        self.currentLaps = [LapItem]()
    }

    func update() {
        print("mmmm")
        self.didChange.send()
    }

    func isPaused() -> Bool {
        return self.paused
    }

    private func startTimer() {
        self.sourceTimer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.strict,
                                                          queue: self.queue)
print("First")
        self.resumeTimer()
    }

    private func resumeTimer() {
        print("now")
        
        self.sourceTimer?.setEventHandler {
            print("Here")
            self.updateTimer()
        }

        self.sourceTimer?.schedule(deadline: .now(),
                                   repeating: 0.01)
    self.sourceTimer?.resume()
    }

    private func updateTimer() {
        
        self.counter += 1

        DispatchQueue.main.async {
            print(StopWatch.convertCountToTimeString(counter: self.counter))
            
            self.stopWatchTime =  StopWatch.convertCountToTimeString(counter: self.counter)
        }
    }
}

extension StopWatch {
    struct LapItem {
        let uuid = UUID()
        let count: Int
        let stringTime: String

        init(count: Int, diff: Int = -1) {
            self.count = count

            if diff < 0 {
                self.stringTime = StopWatch.convertCountToTimeString(counter: count)
            } else {
                self.stringTime = StopWatch.convertCountToTimeString(counter: diff)
            }
        }
    }
}

extension StopWatch {
    static func convertCountToTimeString(counter: Int) -> String {
        print("converter")
        
        let millseconds = counter % 100
        let seconds = counter / 100
        let minutes = seconds / 60

        var millsecondsString = "\(millseconds)"
        var secondsString = "\(seconds)"
        var minutesString = "\(minutes)"

        if millseconds < 10 {
            millsecondsString = "0" + millsecondsString
        }

        if seconds < 10 {
            secondsString = "0" + secondsString
        }

        if minutes < 10 {
            minutesString = "0" + minutesString
        }
        
        
        return "\(minutesString):\(secondsString):\(millsecondsString)"
    }
}

