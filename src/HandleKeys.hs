module HandleKeys where
    import TronGame
    import Graphics.Gloss
    import Graphics.Gloss.Interface.Pure.Game
    import Map
    import TronGame
    import Data
    import Control.Concurrent

    handleKeys :: Event -> (TronGame, (MVar Bool),(MVar Bool),(MVar Bool)) -> IO (TronGame,(MVar Bool),(MVar Bool),(MVar Bool))
    handleKeys (EventKey (Char 'r') _ _ _) (game, p1t,p2t,p3t) = return (initialState, p1t,p2t,p3t)
    handleKeys (EventKey (Char 'w') _ _ _) (game, p1t,p2t,p3t) = do
                                                                return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  -initialSpeed
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    },p1t,p2t,p3t )

    handleKeys (EventKey (Char 'd') _ _ _) (game, p1t,p2t,p3t) = do
                                                                return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  initialSpeed
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    },p1t,p2t,p3t )

    handleKeys (EventKey (Char 'a') _ _ _) (game, p1t,p2t,p3t) = do
                                                                    return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  -initialSpeed
                                                                    ,   p1yVel =  0
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    },p1t,p2t,p3t )

    handleKeys (EventKey (SpecialKey KeyUp) _ _ _) (game, p1t,p2t,p3t) = do
                                                                            return (Game {
                                                                                tronMap = tronMap game
                                                                            ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  -initialSpeed
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            },p1t,p2t,p3t )
        
    handleKeys (EventKey (SpecialKey KeyDown) _ _ _) (game, p1t,p2t,p3t) = do
                                                                            return (Game {
                                                                                tronMap = tronMap game
                                                                            ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  0
                                                                            ,   p2yVel =  initialSpeed
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            },p1t,p2t,p3t )
        
    handleKeys (EventKey (SpecialKey KeyLeft) _ _ _) (game, p1t,p2t,p3t) = do
                                                                            return (Game {
                                                                                tronMap = tronMap game
                                                                            ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  - initialSpeed
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            },p1t,p2t,p3t )
        
    handleKeys (EventKey (SpecialKey KeyRight) _ _ _) (game, p1t,p2t,p3t) = do
                                                                            return (Game {
                                                                                tronMap = tronMap game
                                                                            ,   mapId = mapId game
                                                                            ,   player1 = player1 game
                                                                            ,   player2 = player2 game
                                                                            ,   p1xVel =  p1xVel game
                                                                            ,   p1yVel =  p1yVel game
                                                                            ,   p2xVel =  initialSpeed
                                                                            ,   p2yVel =  0
                                                                            ,   p1Trace = p1Trace game
                                                                            ,   p2Trace = p2Trace game
                                                                            ,   p1dead = p1dead game
                                                                            ,   p2dead = p2dead game
                                                                            ,   rules = rules game
                                                                            ,   gameIsOver = gameIsOver game
                                                                            },p1t,p2t,p3t )
        
    handleKeys (EventKey (Char 's') _ _ _) (game, p1t,p2t,p3t) = do
                                                                    return (Game {
                                                                        tronMap = tronMap game
                                                                    ,   mapId = mapId game
                                                                    ,   player1 = player1 game
                                                                    ,   player2 = player2 game
                                                                    ,   p1xVel =  0
                                                                    ,   p1yVel =  initialSpeed
                                                                    ,   p2xVel =  p2xVel game
                                                                    ,   p2yVel =  p2yVel game
                                                                    ,   p1Trace = p1Trace game
                                                                    ,   p2Trace = p2Trace game
                                                                    ,   p1dead = p1dead game
                                                                    ,   p2dead = p2dead game
                                                                    ,   rules = rules game
                                                                    ,   gameIsOver = gameIsOver game
                                                                    },p1t,p2t,p3t )

    handleKeys _ (game, p1t,p2t,p3t) =return (game, p1t,p2t,p3t)