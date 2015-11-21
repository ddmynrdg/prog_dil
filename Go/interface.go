package main

import "fmt"
import "math"

type geometry interface {
	area() float64
	perim() float64
}

type rect struct {
	width, height float64
}
type circle struct {
	radius float64
}

func (rct rect) area() float64 {
	return rct.width * rct.height
}
func (rct rect) perim() float64 {
	return 2*rct.width + 2*rct.height
}

func (crcl circle) area() float64 {
	return math.Pi * crcl.radius * crcl.radius
}
func (crcl circle) perim() float64 {
	return 2 * math.Pi * crcl.radius
}

func measure(geo geometry) {
	fmt.Println(geo)
	fmt.Println(geo.area())
	fmt.Println(geo.perim())
}

func main() {
	rct := rect{width: 6, height: 8}
	crcl := circle{radius: 3}

	measure(rct)
	measure(crcl)
}
