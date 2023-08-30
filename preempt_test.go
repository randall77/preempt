package preempt

import "testing"

func A()
func B()
func C()
func D()
func E()
func F()

func BenchmarkA(b *testing.B) {
	for i := 0; i < b.N; i++ {
		A()
	}
}
func BenchmarkB(b *testing.B) {
	for i := 0; i < b.N; i++ {
		B()
	}
}
func BenchmarkC(b *testing.B) {
	for i := 0; i < b.N; i++ {
		C()
	}
}
func BenchmarkD(b *testing.B) {
	for i := 0; i < b.N; i++ {
		D()
	}
}
func BenchmarkE(b *testing.B) {
	for i := 0; i < b.N; i++ {
		E()
	}
}
func BenchmarkF(b *testing.B) {
	for i := 0; i < b.N; i++ {
		F()
	}
}
