//
//  CellBuilder.swift
//
//
//  Created by ahmed suliman on 16/12/2024.
//

import SwiftUI

@resultBuilder
public struct CellBuilder {
    public static func buildBlock<T: CellConfigurable>(_ component: @escaping (T) -> Void) -> some View {
        TableViewCellWrapper(configure: component)
    }

    public static func buildBlock<T: CellConfigurable>(_ components: ((T) -> Void)...) -> some View {
        ForEach(components.indices, id: \.self) { index in
            let component = components[index]
            TableViewCellWrapper(configure: component)
        }
    }

    public static func buildEither<T: CellConfigurable>(first component: @escaping (T) -> Void) -> some View {
        TableViewCellWrapper(configure: component)
    }

    public static func buildEither<T: CellConfigurable>(second component: @escaping (T) -> Void) -> some View {
        TableViewCellWrapper(configure: component)
    }

    public static func buildOptional<T: CellConfigurable>(_ component: ((T) -> Void)?) -> some View {
        let component = component ?? {_ in}
        return TableViewCellWrapper(configure: component)
    }
}



#Preview {
    struct TestView: View {
        var body: some View {
            List {
                label()
                labels()
            }
        }

        @CellBuilder
        func label() -> some View {
            LabelTableViewCell { cell in
                cell.label.text = "SwiftUI View"
            }
        }

        @CellBuilder
        func labels() -> some View {
            LabelTableViewCell { cell in
                cell.label.text = "first"
            }
            LabelTableViewCell { cell in
                cell.label.text = "second"
            }
            LabelTableViewCell { cell in
                cell.label.text = "third"
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

    func setup() {
        self.backgroundColor = .red
        // Set the text for the label
        label.text = "jbhkndcdxeeclm njxndjn kcdnkn \n njncjdnc \n djcnjcnd \n jncjdncjdnc \n cjdnjdnc\n jncjdncjdnc \n cjdnjdnc"
    }
}

    return TestView()
}
