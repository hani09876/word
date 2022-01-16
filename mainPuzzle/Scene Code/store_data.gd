extends Node
const FILE_NAME = "user://game-data.json"
var current = 2 #1 for last lavel activated
var lavel = {
	"last": {"score": 500,"lavel": 1,"sub" : 1,"wallpaper": "b"}, #for the higher lavel unlocked
	"now": {"lavel": 1,"sub" : 1,}}


func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(lavel))
	file.close()

func getdata():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		lavel = parse_json(file.get_as_text())
		file.close()
		
