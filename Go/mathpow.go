package main

import (
	"fmt"
	"math"
)

func pow(alt, us, sonuc float64) float64 {
	if v := math.Pow(alt, us); v < sonuc {
		return v
	} else {
		fmt.Printf("%g >= %g\n", v, sonuc)
	}
	return sonuc
}

func main() {
	fmt.Println(
		pow(2, 5, 10),
		pow(3, 3, 20),
	)
}
