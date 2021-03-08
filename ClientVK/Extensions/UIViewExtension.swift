//
//  UIViewExtension.swift
//  ClientVK
//
//  Created by DES on 08.03.2021.
//

import UIKit

extension UIView {
    
    static var nib: UINib
    {
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
    static func instantiateFromNib() -> Self?
    {
        return nib.instantiate() as? Self
    }
}

extension UINib
{
   func instantiate() -> Any?
   {
      return instantiate(withOwner: nil, options: nil).first
   }
}
