//
//  CardView.swift
//  SwiftUICardGame
//
//  Created by Taylan Bostanci on 28.08.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var sembol:String
    @Binding var backgroundColor:Color
    
    var body: some View {
        Image(sembol).resizable().aspectRatio(1,contentMode: .fit).background(backgroundColor.opacity(0.5)).cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(sembol: Binding.constant("ufo"), backgroundColor: Binding.constant(Color.green))
    }
}
