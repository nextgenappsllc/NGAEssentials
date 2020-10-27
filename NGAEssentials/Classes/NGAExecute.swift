//
//  NGAExecute.swift
//  Pods
//
//  Created by Jose Castellanos on 5/2/17.
//
//

import Foundation

// Queue Wrapper

open class QueueWrapper {
    
    public let queue:DispatchQueue
    
    public let queueKey:DispatchSpecificKey<Any> = DispatchSpecificKey<Any>()
    
    public init(_ queue:DispatchQueue){
        self.queue = queue
    }
    
    public convenience init(label:String, qos:DispatchQoS, attributes:DispatchQueue.Attributes, autoreleaseFrequency:DispatchQueue.AutoreleaseFrequency, target:DispatchQueue?){
        self.init(DispatchQueue(label: label, qos: qos, attributes: attributes, autoreleaseFrequency: autoreleaseFrequency, target: target))
    }
    
    public convenience init(label:String){
        self.init(DispatchQueue(label: label))
    }
    
    public convenience init(){
        self.init(DispatchQueue(label: ""))
    }
    
    
    public func registerQueue(){
        queue.setSpecific(key: queueKey, value: ())
    }
    
    
    open func performOnQueue(async:Bool = true, _ b:VoidBlock?) {
        guard let b = b else {return}
        isQueue ? b() : queueExecute(async: async, b)
    }
    
    
    open var isQueue:Bool {get {return DispatchQueue.getSpecific(key: queueKey) != nil}}
    
    open func queueExecute(async:Bool = true, _ b:@escaping VoidBlock) {
        async ? queue.async(execute: b) : queue.sync(execute: b)
    }
    
    
    
}





//MARK: Thread handler

open class NGAExecute {
    
    static let queueWrapper = QueueWrapper(DispatchQueue.main)
    
    public static func performOnMainQueue(async:Bool = true, _ b:VoidBlock?) {queueWrapper.performOnQueue(async: async, b)}
    
    public static var isMainQueue:Bool {get {return queueWrapper.isQueue}}
    
    public static func performOnMainThread(async:Bool = true, _ b:VoidBlock?) {
        guard let b = b else {return}
        Thread.isMainThread ? b() : queueWrapper.queueExecute(async: async, b)
    }
    
}



