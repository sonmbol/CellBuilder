//
//  UITableViewCell+Helper.swift
//  CellBuilder
//
//  Created by ahmed suliman on 16/12/2024.
//

import UIKit

public protocol CellProviderProtocol {
    var identifier: String? { get }
    var bundle: Bundle? { get }
}

public extension CellProviderProtocol {
    var identifier: String? { nil }
    var bundle: Bundle? { nil }
}

public struct CellProvider: CellProviderProtocol {
    public let identifier: String?
    public let bundle: Bundle?

    public init(identifier: String?, bundle: Bundle?) {
        self.identifier = identifier
        self.bundle = bundle
    }
}

public protocol CellConfigurable: UITableViewCell { }

public extension CellConfigurable {
    func callAsFunction(_ configuration: @escaping (Self) -> Void) -> (Self) -> Void {
        configuration
    }
}

extension UITableViewCell: CellConfigurable {
    private static func isCellFromNib(provider: CellProviderProtocol?) -> Bool {
        let className = provider?.identifier ?? String(describing: type(of: self))
        return provider?.bundle?.path(forResource: className, ofType: "nib") != nil
    }

    private static func loadFromNib(provider: CellProviderProtocol?) -> Self {
        let className = provider?.identifier ?? String(describing: type(of: self))
        let nib = UINib(nibName: className, bundle: provider?.bundle)
        guard let cell = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            return Self()
        }
        return cell
    }

    static func createCell(provider: CellProviderProtocol?) -> Self {
        if isCellFromNib(provider: provider) {
            return loadFromNib(provider: provider)
        } else {
            return Self()
        }
    }
}

