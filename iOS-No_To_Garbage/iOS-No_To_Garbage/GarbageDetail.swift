//
//  GarbageDetail.swift
//  iOS-No_To_Garbage
//
//  Created by Admin on 18.10.2020.
//

import SwiftUI
import MapKit
import FirebaseDatabase

struct GarbageDetail: View {

    let garbage:String
    var body: some View {
        let coordinate = [CLLocationCoordinate2D(latitude: 60.013219, longitude: 30.275225)]
        let hint = ["hint 0"]
        
        let coor:[String : CLLocationCoordinate2D] = ["hint 0" : CLLocationCoordinate2D(latitude: 60.013219, longitude: 30.275225)]
        
        let photo:[String : String] = [ "Батарейки" : "battery" , "Бумага" : "paper" , "Техника" : "technic" , "Бутылки" : "kitchenbottles", "Бутылкиkи" : "bathbottles" , "Одежда в плохом состоянии" : "badclothes" , "Одежда в хорошем состоянии" : "goodclothes" , "Стеклянные банки" : "jars" , "Контейнеры" : "containers" , "Коробки" : "box"]
        
       let body = GetGarbageInfo().getInfo(path: garbage)

        ScrollView(.vertical, showsIndicators: false)  {
            MapView(coordinate: coordinate, hint: hint)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 450)
            
            CircleImage(image: Image(photo[garbage]!))
                .offset(x: 0, y: -60)
                .padding(.bottom, -80)
            
            VStack(alignment: .leading) {
        
                    Text(garbage)
                        .font(.title)
                
            
                Text("body")
                        .font(.subheadline)
                   
                
            }
            .padding()
            
            Spacer()
        }.padding(.top, -20)
    }
}

struct GarbageDetail_Previews: PreviewProvider {
    static var previews: some View {
        GarbageDetail(garbage: "Коробки")
    }
}
