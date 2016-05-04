//
//  PointerType.swift
//  Reflection
//
//  Created by Bradley Hilton on 5/4/16.
//  Copyright © 2016 Zewo. All rights reserved.
//

protocol PointerType : Equatable {
    associatedtype Pointee
    var pointer: UnsafePointer<Pointee> { get set }
}

extension PointerType {
    
    init<T>(pointer: UnsafePointer<T>) {
        func cast<T, U>(_ value: T) -> U {
            return unsafeBitCast(value, to: U.self)
        }
        self = cast(UnsafePointer<Pointee>(pointer))
    }
    
}

func ==<T : PointerType>(lhs: T, rhs: T) -> Bool {
    return lhs.pointer == rhs.pointer
}


