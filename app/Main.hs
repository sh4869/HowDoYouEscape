import Graphics.UI.Gtk

main :: IO ()
main = do
  initGUI
  mainWindow <- windowNew
  mainTable <- tableNew 9 9 True
  set mainWindow [windowTitle := "Hello,World!",
                          windowDefaultWidth := mainWindowWidth,
                          windowDefaultHeight := mainWindowHeight]
  containerAdd mainWindow mainTable
  mapM_ setColSpacing (zipThree (repeat mainTable) [0..8] (repeat 10) )
  mapM_ setRowSpacing (zipThree (repeat mainTable) [0..8] (repeat 10) )
  setUpButtons mainTable
  widgetShowAll mainWindow
  mainGUI

setUpButtons :: TableClass self => self -> IO()
setUpButtons self = do
  mapM_ createButtonforRow (zip (repeat self) [0..8])

createButtonforRow :: TableClass table => (table, Int) -> IO()
createButtonforRow (table ,a) = do
  mapM_ createButton (zipThree (repeat table) (repeat a) [0..8])

createButton :: (TableClass table) => (table,Int,Int) -> IO()
createButton (table,row,col) = do
  button <- buttonNew
  tableAttachDefaults table button row (row+1) col (col+1)

setColSpacing :: TableClass self =>  (self,Int,Int) -> IO()
setColSpacing (table,row,spacing) = do 
                                      tableSetColSpacing table row spacing


setRowSpacing :: TableClass self => (self,Int,Int) -> IO()
setRowSpacing (table,row,spacing) = do
                                      tableSetRowSpacing table row spacing


zipFour :: [a] -> [b] -> [c] -> [d] -> [(a,b,c,d)]
zipFour (a:as) (b:bs) (c:cs) (d:ds)  = (a,b,c,d) : zipFour as bs cs ds 
zipFour _ _ _ _  = []

zipThree :: [a] -> [b] -> [c] -> [(a,b,c)]
zipThree (x:xs) (y:ys) (z:zs) = (x,y,z) : zipThree xs ys zs
zipThree _ _ _ = []

-- params
mainWindowWidth :: Int
mainWindowWidth = 500

mainWindowHeight :: Int
mainWindowHeight = 500
