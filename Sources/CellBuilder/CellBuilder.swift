//
//  CellBuilder.swift
//
//
//  Created by ahmed suliman on 16/12/2024.
//

import SwiftUI

@available(iOS 14.0, *)
@resultBuilder
public struct CellBuilder {
    public static func buildBlock<T: CellConfigurable>(_ component: @escaping (T) -> Void) -> some View {
        DynamicCellWrapper(configure: component)
    }

    public static func buildBlock<T: CellConfigurable>(_ components: ((T) -> Void)...) -> some View {
        ForEach(components.indices, id: \.self) { index in
            let component = components[index]
            DynamicCellWrapper(configure: component)
        }
    }

    public static func buildEither<T: CellConfigurable>(first component: @escaping (T) -> Void) -> some View {
        DynamicCellWrapper(configure: component)
    }

    public static func buildEither<T: CellConfigurable>(second component: @escaping (T) -> Void) -> some View {
        DynamicCellWrapper(configure: component)
    }

    public static func buildOptional<T: CellConfigurable>(_ component: ((T) -> Void)?) -> some View {
        let component = component ?? {_ in}
        return DynamicCellWrapper(configure: component)
    }
}


@available(iOS 14.0, *)
#Preview {
    struct TestView: View {
        var body: some View {
            List {
                labelView()
                tableViewCell()
                collectionViewCell()
                tableViewCells()
                collectionViewCells()
            }
        }

        @CellBuilder
        func labelView() -> some View {
            LabelView { view in
                view.label.text = "SwiftUI View UIView"
            }
        }

        @CellBuilder
        func tableViewCell() -> some View {
            LabelTableViewCell { cell in
                cell.label.text = "SwiftUI View TableViewCell"
            }
        }

        @CellBuilder
        func collectionViewCell() -> some View {
            LabelCollectionViewCell { cell in
                cell.label.text = "SwiftUI View CollectionViewCell"
            }
        }

        @CellBuilder
        func tableViewCells() -> some View {
            LabelTableViewCell { cell in
                cell.label.text = "first TableViewCell"
            }
            LabelTableViewCell { cell in
                cell.label.text = "second TableViewCell"
            }
            LabelTableViewCell { cell in
                cell.label.text = "third TableViewCell"
            }
        }

        @CellBuilder
        func collectionViewCells() -> some View {
            LabelCollectionViewCell { cell in
                cell.label.text = "first CollectionViewCell"
            }
            LabelCollectionViewCell { cell in
                cell.label.text = "second CollectionViewCell"
            }
            LabelCollectionViewCell { cell in
                cell.label.text = "third CollectionViewCell"
            }
        }
    }

    class LabelTableViewCell: UITableViewCell {
        lazy var label = addLabel()

        func addLabel() -> UILabel {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            contentView.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class LabelCollectionViewCell: UICollectionViewCell {
        lazy var label = addLabel()

        func addLabel() -> UILabel {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class LabelView: UIView {
        lazy var label = addLabel()

        func addLabel() -> UILabel {
            let label = UILabel()
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(label)
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
            ])
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    return TestView()
}
