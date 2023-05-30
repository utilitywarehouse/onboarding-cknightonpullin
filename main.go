package main

import (
	"log"
	"net/http"
	"time"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	counter = promauto.NewCounter(prometheus.CounterOpts{
		Name: "requests_count",
		Help: "A counter of the number of total requests received",
	})
)

func main() {

	log.Print("Listening on 8080...")

	mux := http.NewServeMux()
	//timestamp
	mux.HandleFunc("/", writeTime)
	//metrics
	go metricsServer()

	err := http.ListenAndServe(":8080", mux)
	if err != nil {
		log.Fatal(err)
	}

}

// metrics server run as go routine
func metricsServer() {
	http.Handle("/__/metrics", promhttp.Handler())
	err := http.ListenAndServe(":8081", nil)
	if err != nil {
		log.Fatal(err)
	}
}

func writeTime(writer http.ResponseWriter, request *http.Request) {

	//time in []byte format
	_, err := writer.Write(currentTime())
	if err != nil {
		log.Print(err)
	}
	//increment counter
	counter.Inc()
}

// Test returning time as it's own func
func currentTime() []byte {
	return []byte(time.Now().String())
}
