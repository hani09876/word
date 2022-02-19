extends Node
const FILE_NAME = "user://game-data.json"
var star = 0
var now = 1 # for last activated lavel 
var lavel = {
	"now": {"lavel": 1,"sub" : 1,},
	"score" : 100,
	"activated" : {"easy" : 1, "hard" : 1}
	}


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
		
