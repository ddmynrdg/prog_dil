package main

import "fmt"

type customers struct {
	name string
	phoneNum int
 }
func main() {
	
	fmt.Println(customers{name: "Didem Yanardağ", phoneNum: 5443246258})
	fmt.Println(customers{name: "Gül Yalçın"})
	fmt.Println(customers{name: "Ali Can", phoneNum: 5055055005})
	
	str := customers{name: "Pınar Fırat", phoneNum: 5456578698}
	fmt.Println(str.name)
	
	strP := &str
	fmt.Println(strP.phoneNum)

	strP.phoneNum = 5476562465
	fmt.Println(strP.phoneNum)
