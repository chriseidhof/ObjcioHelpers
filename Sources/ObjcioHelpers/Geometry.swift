import CoreGraphics
import SwiftUI

extension CGPoint {
    public var pretty: String {
        return "(\(Int(x)), \(Int(y)))"
    }
}

extension CGSize {
    public var pretty: String {
         return "(\(Int(width)) × \(Int(height)))"
    }
}

public protocol Vector2D {
    var fst: CGFloat { get set }
    var snd: CGFloat { get set }

    init(fst: CGFloat, snd: CGFloat)
}

public extension Vector2D {
    init<V: Vector2D>(convert other: V) {
        self.init(fst: other.fst, snd: other.snd)
    }

    static func +(lhs: Self, rhs: Self) -> Self {
        return Self(fst: lhs.fst + rhs.fst, snd: lhs.snd + rhs.snd)
    }

    static func -(lhs: Self, rhs: Self) -> Self {
        return Self(fst: lhs.fst - rhs.fst, snd: lhs.snd - rhs.snd)
    }

    static func *(lhs: Self, rhs: CGFloat) -> Self {
        return Self(fst: lhs.fst * rhs, snd: lhs.snd * rhs)
    }

    static func *(lhs: Self, rhs: Self) -> CGFloat {
        return lhs.fst * rhs.fst + lhs.snd * rhs.snd
    }
}

extension CGPoint: Vector2D {
    public init(fst: CGFloat, snd: CGFloat) {
        self.init(x: fst, y: snd)
    }

    public var fst: CGFloat {
        get { return self.x }
        set { self.x = newValue }
    }

    public var snd: CGFloat {
        get { return self.y }
        set { self.y = newValue }
    }
}

extension CGSize: Vector2D {
    public init(fst: CGFloat, snd: CGFloat) {
        self.init(width: fst, height: snd)
    }

    public var fst: CGFloat {
        get { return self.width }
        set { self.width = newValue }
    }

    public var snd: CGFloat {
        get { return self.height }
        set { self.height = newValue }
    }
}


extension CGRect {
    @available(macOS 10.15, *)
    public subscript(unitPoint: UnitPoint) -> CGPoint {
        CGPoint(
            x: minX + width * unitPoint.x,
            y: minY + height * unitPoint.y
        )
    }
}
