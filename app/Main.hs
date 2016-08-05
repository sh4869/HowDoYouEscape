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
  -- button <- buttonNewWithLabel (Just "test")
  widgetShowAll mainWindow
  mainGUI

setColSpacing :: TableClass self =>  (self,Int,Int) -> IO()
setColSpacing (table,row,spacing) = do 
                                      tableSetColSpacing table row spacing


setRowSpacing :: TableClass self => (self,Int,Int) -> IO()
setRowSpacing (table,row,spacing) = do
                                      tableSetRowSpacing table row spacing

zipThree :: [a] -> [b] -> [c] -> [(a,b,c)]
zipThree (x:xs) (y:ys) (z:zs) = (x,y,z) : zipThree xs ys zs
zipThree _ _ _ = []

-- params
mainWindowWidth :: Int
mainWindowWidth = 500

mainWindowHeight :: Int
mainWindowHeight = 500
