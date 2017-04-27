import Kitura
import KituraGymApi

let app = App()
Kitura.addHTTPServer(onPort: 8081, with: app.router)
Kitura.run()
