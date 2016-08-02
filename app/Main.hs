import Graphics.UI.Gtk

main :: IO ()
main = do
  initGUI
  window1 <- windowNew
  set window1 [windowTitle := "Hello,World!"]
  widgetShowAll window1
  mainGUI
