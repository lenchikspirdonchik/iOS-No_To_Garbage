//
//  CategoryOther.swift
//  iOS-No_To_Garbage
//
//  Created by Admin on 19.11.2020.
//

import SwiftUI

struct CategoryOther: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Другое")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
              
                    NavigationLink(
                        destination: AddGarbage()
                    ) {
                        OtherCategoryItem(garbage: "Выкинуть мусор")
                    }
                    
                    NavigationLink(
                        destination: AddGarbage()
                    ) {
                        OtherCategoryItem(garbage: "Статистика")
                    }
                    
                    NavigationLink(
                        destination: AddGarbage()
                    ) {
                        OtherCategoryItem(garbage: "Все мусорки города")
                    }
                    
                    
                    
                }
            }
            .frame(height: 185)
        }
    }
}



struct OtherCategoryItem: View {
    var garbage:String
    var body: some View {
        
        let photo:[String : String] = [ "Статистика" : "battery" , "Выкинуть мусор" : "goodclothes" , "Все мусорки города" : "technic"]
        
        VStack(alignment: .leading) {
            Image(photo[garbage]!)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(garbage)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


struct CategoryOther_Previews: PreviewProvider {
    static var previews: some View {
        CategoryOther()
    }
}