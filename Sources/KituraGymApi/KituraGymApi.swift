import Kitura

public class App {

    public let router = Router()

    public init() {

        let gymController = GymController()
        let coachController = CoachController()
        let activitiesController = ActivityController()
        router.all(middleware: BodyParser())
        router.all("gyms", middleware: gymController.router)
        router.all("coaches", middleware: coachController.router)
        router.all("activities", middleware: activitiesController.router)
    }
}
