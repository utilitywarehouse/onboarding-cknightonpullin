package main

import (
	"testing"
	"time"
)

// test for timeStamp() 
func Test_TimeStamp(t *testing.T) {
	result := timeStamp()[0:9]
	expect := time.Now().String()[0:9]
	if expect != result {
		t.Errorf("timeStamp(): Date does not match.")
	}
}
