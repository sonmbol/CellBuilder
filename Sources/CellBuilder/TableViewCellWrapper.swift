//
//  TableViewCellWrapper.swift
//
//
//  Created by ahmed suliman on 16/12/2024.
//

import SwiftUI
import UIKit

public struct TableViewCellWrapper<UITableViewCellType: CellConfigurable>: UIViewRepresentable {
    public let configure: (UITableViewCellType) -> Void

    public init(configure: @escaping (UITableViewCellType) -> Void = { _ in }) {
        self.configure = configure
    }

    public func makeUIView(context: Context) -> ContainerView {
        let cell = UITableViewCellType.createCell(provider: (UITableViewCellType.self as? CellProviderProtocol))
        configure(cell)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()

        let containerView = ContainerView(cell: cell)
        cell.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(cell)

        NSLayoutConstraint.activate([
            cell.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
            cell.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: cell.bottomAnchor)
        ])

        containerView.setNeedsUpdateConstraints()

        return containerView
    }

    public func updateUIView(_ uiView: ContainerView, context: Context) {
        let cell = uiView.cell
        configure(cell)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        cell.frame = uiView.bounds
    }
}

public extension TableViewCellWrapper {
    final class ContainerView: UIView {
        let cell: UITableViewCellType

        init(cell: UITableViewCellType) {
            self.cell = cell
            super.init(frame: .zero)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        public override func layoutSubviews() {
            super.layoutSubviews()
            cell.frame = bounds
        }

        public override var intrinsicContentSize: CGSize {
            let targetSize = CGSize(width: frame.width, height: UIView.layoutFittingCompressedSize.height)
            let fittingSize = cell.systemLayoutSizeFitting(
                targetSize,
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )

            return fittingSize
        }
    }
}
