//
//  postRow.swift
//  one.two.tree
//
//  Created by rbwo on 2022/04/13.
//

import SwiftUI

struct postRow: View {
    
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            HStack{
                Spacer()
                Text("Title")
                    .font(.title)
                    .bold()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            
            HStack{
                Spacer()
                Text("Description")
                    .font(.title3)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
            }
            
            
        }
        
    }
}

struct postRow_Previews: PreviewProvider {
    static var previews: some View {
        postRow()
    }
}
