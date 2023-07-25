//
//  ArticleViewCell.swift
//  NYIOS
//
//  Created by muhammad sijjeel on 26/07/2023.
//

import SwiftUI

struct ArticleViewCell: View {
    // MARK: Properties
    var title: String
    var author: String
    var date: String

    // MARK: Body
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 5)

            Text(author)
                .font(.caption)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            Text(date)
                .font(.caption2)
                .fontWeight(.light)
                .frame(maxWidth: .infinity, alignment: .trailing)
        } // :VStack
    }
}

// MARK: Preview
struct ArticleViewCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleViewCell(
            title: "Take Home Test",
            author: "Sijjeel",
            date: "26-7-2023"
        )
    }
}
