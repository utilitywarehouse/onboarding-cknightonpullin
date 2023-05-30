package main

import (
	"testing"
)

// test for currentTime(): checks if nothing is returned
func Test_TimeStamp(t *testing.T) {

	result := currentTime()
	if result == nil {
		t.Errorf("currentTime(): nothing returned")
	}
}
