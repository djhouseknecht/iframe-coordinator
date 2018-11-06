port module Host exposing (main)

import HostProgram
import Json.Decode as Decode


main =
    HostProgram.create
        { fromHost = fromHost
        , toHost = toHost
        , toClient = toClient
        }


{-| The port for messages passing from the host applicaiton to the library
This must be defined here, as ports aren't allowed in public libraries due to
the potential for naming collisions on the generated JS objects
-}
port fromHost : (Decode.Value -> msg) -> Sub msg


{-| The port for messages passing from the library to the host application
-}
port toHost : Decode.Value -> Cmd msg


{-| The port for messages passing from the library to the client application
-}
port toClient : Decode.Value -> Cmd msg