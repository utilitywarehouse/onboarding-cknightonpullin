package main

import (
	"log"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
)

var (
	//counter for metrics
	counter = promauto.NewCounter(prometheus.CounterOpts{
		Name: "requests_count",
		Help: "A counter of the number of total requests received",
	})
)

func main() {
	app := fiber.New()

	//send timestamp
	app.Get("/", func(c *fiber.Ctx) error {
		err := c.SendString(timeStamp())

		if err != nil {
			log.Fatal(err)
		}

		//increment metric counter
		counter.Inc()

		return nil
	})

	log.Fatal(app.Listen(":8001"))
}

// return timestamp - test written for this
func timeStamp() string {
	return time.Now().String()
}
