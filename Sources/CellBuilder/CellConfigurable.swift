//
//  CellConfigurable.swift
//  CellBuilder
//
//  Created by ahmed suliman on 17/12/2024.
//

import UIKit
import SwiftUICore

@available(iOS 14.0, *)
public protocol CellProviderProtocol {
    var identifier: String? { get }
    var bundle: Bundle? { get }
}

@available(iOS 14.0, *)
public extension CellProviderProtocol {
    var identifier: String? { nil }
    var bundle: Bundle? { nil }
}

@available(iOS 14.0, *)
public struct CellProvider: CellProviderProtocol {
    public let identifier: String?
    public let bundle: Bundle?

    public init(identifier: String?, bundle: Bundle?) {
        self.identifier = identifier
        self.bundle = bundle
    }
}

@available(iOS 14.0, *)
public protocol CellConfigurable: UIView {
    init()
    static func createCell(provider: CellProviderProtocol?) -> Self
}

@available(iOS 14.0, *)
public extension CellConfigurable {
    func callAsFunction(_ configuration: @escaping (Self) -> Void) -> (Self) -> Void {
        configuration
    }

    static func makeView(_ configuration: @escaping (Self) -> Void = { _ in }) -> some View {
        DynamicCellWrapper(configure: configuration)
    }
}

@available(iOS 14.0, *)
extension CellConfigurable {
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

    public static func createCell(provider: CellProviderProtocol?) -> Self {
        if isCellFromNib(provider: provider) {
            return loadFromNib(provider: provider)
        } else {
            return Self()
        }
    }
}

@available(iOS 14.0, *)
extension UIView: CellConfigurable { }
