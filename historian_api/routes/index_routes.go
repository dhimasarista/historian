package routes

import (
	"historian_api/controllers"

	"github.com/gofiber/fiber/v2"
)

func IndexRoutes(app *fiber.App) {
	app.Get("/", controllers.IndexControllers)
}
