module Actions where
    import Types
    import Graphics.Gloss
    import TronGame
    import Map
    import Events


    movePlayer :: Float -> TronGame -> TronGame
    movePlayer sec game = Game {
                                    tronMap = newMap
                                ,   player1 = p1NewPos
                                ,   player2 = p2NewPos
                                ,   p1xVel  = p1xVel game
                                ,   p1yVel  = p1yVel game
                                ,   p2xVel  = p2xVel game
                                ,   p2yVel  = p2yVel game
                                ,   p1Trace = p1NewPos : (p1Trace game)
                                ,   p2Trace = p2NewPos : (p2Trace game)
                                ,   p1dead = newStatus1
                                ,   p2dead = newStatus2
                                }
                                where
                                    (x,y) = player1 game
                                    (u,v) = player2 game
                                    (p1movementX, p1movementY) =  ((x + (floor (sec * (fromIntegral (p1xVel game) )))) , (y+ (floor (sec * (fromIntegral (p1yVel game))))))
                                    (p2movementX, p2movementY) =  ((u + (floor (sec * (fromIntegral (p2xVel game) )))) , (v+ (floor (sec * (fromIntegral (p2yVel game))))))
                                    p1NewPos = if possibleMovement (p1movementX, p1movementY)  (tronMap game)
                                                        then
                                                            (p1movementX, p1movementY)
                                                        else
                                                            player1 game
                                    p2NewPos = if possibleMovement (p2movementX, p2movementY) (tronMap game)
                                                        then
                                                            (p2movementX, p2movementY)
                                                        else
                                                            player2 game
                                    newStatus1 = if possibleMovement (p1movementX, p1movementY) (tronMap game)
                                                        then
                                                            False
                                                        else
                                                            True 
                                    newStatus2 = if possibleMovement (p2movementX, p2movementY) (tronMap game)
                                                        then
                                                            False
                                                        else
                                                            True
                                    newMap = setPossiblesInPositions  (tronMap game) [(player1 game), (player2 game), p1NewPos, p2NewPos] [Nada, Nada, Player, Player]
                                    
                                            