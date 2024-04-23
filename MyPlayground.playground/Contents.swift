import UIKit

//tao mang
var mangSoNguyen = [Int]()

//noi vao end-mang
mangSoNguyen.append(10)
mangSoNguyen.append(20)

//noi them mang vao end
mangSoNguyen+=[40,80]

//xuat
print(mangSoNguyen)

for item in mangSoNguyen {
    print("\(item)")
}

for i in 0..<mangSoNguyen.count {
    print("\(i)")

}

