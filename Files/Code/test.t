var testpic : int := Pic.FileNew("0.jpg")
var newtestpic : int := Pic.Scale(testpic, 10,10)
loop
delay(1000)
Pic.Draw(newtestpic, 20,20, picCopy)
delay(1000)
end loop
