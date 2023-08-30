package preempt

import "testing"

func A()
func B()
func C()

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
