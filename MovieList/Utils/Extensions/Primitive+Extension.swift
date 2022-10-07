//
//  Primitive+Extension.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import Foundation
import UIKit

extension Int {
    var w: CGFloat { return SizeConfig.setWidth(width: CGFloat(self)) }
    var h: CGFloat { return SizeConfig.setHeight(height: CGFloat(self)) }
    var s: CGFloat { return SizeConfig.setScale(value: CGFloat(self)) }
    var r: CGFloat { return SizeConfig.radius(r: CGFloat(self)) }
    var sp: CGFloat { return SizeConfig.setSp(fontSize: CGFloat(self)) }
    var sw: CGFloat { return SizeConfig.screenWidth * CGFloat(self) }
    var sh: CGFloat { return SizeConfig.screenHeight * CGFloat(self) }
}

extension CGFloat {
    var w: CGFloat { return SizeConfig.setWidth(width: self) }
    var h: CGFloat { return SizeConfig.setHeight(height: self) }
    var s: CGFloat { return SizeConfig.setScale(value: self) }
    var r: CGFloat { return SizeConfig.radius(r: self) }
    var sp: CGFloat { return SizeConfig.setSp(fontSize: self) }
    var sw: CGFloat { return SizeConfig.screenWidth * self }
    var sh: CGFloat { return SizeConfig.screenHeight * self }
}

extension Double {
    var w: CGFloat { return SizeConfig.setWidth(width: CGFloat(self)) }
    var h: CGFloat { return SizeConfig.setHeight(height: CGFloat(self)) }
    var s: CGFloat { return SizeConfig.setScale(value: CGFloat(self)) }
    var r: CGFloat { return SizeConfig.radius(r: CGFloat(self)) }
    var sp: CGFloat { return SizeConfig.setSp(fontSize: CGFloat(self)) }
    var sw: CGFloat { return SizeConfig.screenWidth * CGFloat(self) }
    var sh: CGFloat { return SizeConfig.screenHeight * CGFloat(self) }
}

