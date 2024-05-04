package controllers

import "github.com/gofiber/fiber/v2"

func IndexControllers(c *fiber.Ctx) error {
	return c.JSON(fiber.Map{
		"data": "Hello, World!",
	})
}
