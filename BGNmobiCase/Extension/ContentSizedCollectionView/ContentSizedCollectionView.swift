//
//  ContentSizedCollectionView.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 18.04.2022.
//

import UIKit

class ContentSizedCollectionView: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

