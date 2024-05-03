package main

import (
	"fmt"
	"strconv"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

func main() {
	app := fiber.New()
	app.Use(cors.New())

	data := []map[string]any{
		{
			"id":   1,
			"name": "bayu setiawan",
			"age":  22,
		},
		{
			"id":   2,
			"name": "dhimas arista",
			"age":  22,
		},
	}

	app.Get("/", func(c *fiber.Ctx) error {
		return c.JSON(fiber.Map{
			"data": "Hello, World!",
		})
	})

	app.Get("/name/:id", func(c *fiber.Ctx) error {
		id := c.Params("id")
		idInt, _ := strconv.Atoi(id)
		var dataFetch map[string]any
		for i := 0; i < len(data); i++ {
			if idInt == data[i]["id"] {
				dataFetch = data[i]
				break
			} else {
				dataFetch = map[string]any{
					"id":   0,
					"name": "not found",
				}
			}
		}
		fmt.Println(dataFetch["name"])
		return c.JSON(fiber.Map{
			"data": dataFetch,
		})
	})

	app.Listen(":9999")
}
