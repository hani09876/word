extends Node2D
var list = ['stop','hello','book','cook','lion','take','make','Moon','table', 'name', 'what', 'your', 'mom', 'good', 'love' , 'like', 'want', 'more', 'join', 'often', 'seat', 'talk', 'heavy', 'page', 'live', 'huge', 'rock', 'blood', 'early', 'news', 'make', 'task', 'party', 'store', 'shoot', 'site', 'truth', 'onto', 'under', 'body', 'love', 'check', 'close', 'size', 'walk', 'might', 'true', 'seem', 'guess', 'small', 'item', 'major', 'yard', 'mean', 'image', 'need', 'could', 'table', 'along', 'fight', 'shake', 'throw', 'miss', 'home', 'them', 'study', 'light', 'trade', 'data', 'thing', 'list', 'other', 'feel', 'same', 'share', 'black', 'must', 'space', 'where', 'five', 'wall', 'have', 'call', 'skill', 'chair', 'even', 'foot', 'stuff', 'coach', 'sure', 'human', 'teach', 'agree', 'enter', 'plant', 'film', 'apply', 'dark', 'start', 'floor', 'treat', 'field', 'north', 'reach', 'raise', 'down', 'main', 'wife', 'find', 'poor', 'upon', 'late', 'good', 'look', 'time', 'green', 'wrong', 'break', 'take', 'front', 'room', 'leave', 'west', 'when', 'every', 'power', 'seven', 'from', 'view', 'stay', 'occur', 'music', 'since', 'very', 'loss', 'come', 'week', 'name', 'trip', 'open', 'some', 'also', 'unit', 'girl', 'book', 'while', 'piece', 'nice', 'door', 'most', 'pick', 'dead', 'past', 'four', 'laugh', 'later', 'beat', 'group', 'care', 'help', 'local', 'deal', 'tough', 'fast', 'least', 'level', 'yeah', 'above', 'story', 'none', 'only', 'then', 'like', 'city', 'owner', 'would', 'drive', 'event', 'watch', 'learn', 'grow', 'wear', 'these', 'wind', 'scene', 'bill', 'those', 'side', 'thank', 'cover', 'else', 'many', 'over', 'land', 'spend', 'role', 'baby', 'movie', 'fine', 'heat', 'push', 'exist', 'build', 'seek', 'what', 'third', 'near', 'paper', 'much', 'woman', 'world', 'stand', 'final', 'model', 'sing', 'range', 'sell', 'will', 'hear', 'sound', 'after', 'last', 'media', 'fish', 'thus', 'write', 'idea', 'keep', 'sport', 'read', 'draw', 'less', 'again', 'firm', 'cell', 'peace', 'shot', 'fill', 'case', 'area', 'star', 'goal', 'want', 'phone', 'death', 'whose', 'hang', 'away', 'plan', 'adult', 'focus', 'soon', 'cold', 'year', 'real', 'pull', 'drug', 'begin', 'sense', 'fear', 'cost', 'water', 'order', 'save', 'form', 'rule', 'until', 'rich', 'bank', 'hold', 'ever', 'kill', 'game', 'that', 'road', 'money', 'civil', 'short', 'large', 'night', 'clear', 'young', 'month', 'play', 'serve', 'south', 'board', 'total', 'point', 'still', 'vote', 'race', 'legal', 'rate', 'think', 'move', 'pain', 'fail', 'tree', 'admit', 'speak', 'food', 'class', 'able', 'hope', 'each', 'test', 'note', 'force', 'dream', 'worry', 'heart', 'your', 'risk', 'enjoy', 'hard', 'they', 'alone', 'part', 'card', 'sign', 'carry', 'give', 'which', 'quite', 'blue', 'fund', 'style', 'color', 'than', 'hand', 'happy', 'know', 'allow', 'state', 'sort', 'prove', 'about', 'face', 'drop', 'left', 'offer', 'turn', 'agent', 'child', 'edge', 'value', 'wait', 'rise', 'song', 'fire', 'ball', 'next', 'never', 'there', 'well', 'team', 'eight', 'wish', 'fact', 'skin', 'ready', 'white', 'claim', 'right', 'head', 'term', 'their', 'hour', 'once', 'pass', 'visit', 'voice', 'step', 'kind', 'argue', 'best', 'lose', 'radio', 'three', 'with', 'cause', 'smile', 'place', 'easy', 'high', 'half', 'tend', 'hair', 'deep', 'mouth', 'such', 'issue', 'both', 'rest', 'tell', 'safe', 'score', 'glass', 'maybe', 'free', 'full', 'here', 'life', 'this', 'whole', 'back', 'stock', 'price', 'just', 'first', 'fall', 'into', 'lead', 'bring', 'word', 'send', 'house', 'staff', 'town', 'catch', 'work', 'hotel', 'long', 'great', 'among', 'type', 'mind', 'stage', 'east', 'show', 'whom', 'meet', 'crime', 'born', 'court', 'avoid', 'ahead', 'trial', 'wide', 'today', 'more', 'line', 'base']

var lavel = 4
var score = 000
var sublavel = 0
var wallpaper = "b"
var words
export(ButtonGroup) var group
var count = 0
var wordLength 
var icon =""
var nextlavel = 0
var mode
var star = 0




func _ready():
	$AudioStreamPlayer.stream = preload("res://Sounds/mixkit-fairy-arcade-sparkle-866.wav")
	$AudioStreamPlayer.play()
	StoreData.getdata()
	mode = StoreData.now
	score = StoreData.lavel.score
	if mode == 1:
		lavel = int(StoreData.lavel.activated.hard)
		sublavel = lavel * 9
	else:
		lavel = int(StoreData.lavel.now.lavel)
		sublavel = lavel * 9
	getstart()
	for i in group.get_buttons():
		i.connect("pressed", self, "onPressed")
	


func getstart():
	nextlavel = nextlavel + 1
	count = 0
	$ribbon/points.text = str(score)
	$ribbon/Label.text = str(lavel)
	$GridContainer/a/a.text = ""
	$GridContainer/b/b.text = ""
	$GridContainer/c/c.text = ""
	$GridContainer/d/d.text = ""
	$GridContainer/e/e.text = ""
	getword()


func getword():
	words = list[sublavel]
	wordLength = len(words)
	$GridContainer/d.visible = true
	$GridContainer/e.visible = true
	$GridContainer/c.visible = true
	$b3.visible = true
	$b4.visible = true
	$b5.visible = true
	if len(words) == 4:
		$GridContainer/e.visible = false
		$b4.visible = false
	elif len(words) == 3:
		$GridContainer/d.visible = false
		$GridContainer/e.visible = false
		$b4.visible = false
		$b5.visible = false
	bAlphabet()



func bAlphabet():
	var array = []
	for ch in words:
		array.append(ch)
		array.shuffle()
	$b1/l1.text = array[0]
	$b2/l2.text = array[1]
	$b3/l3.text = array[2]
	if len(array) == 4:
		$b5/l5.text = array[3]
	elif len(array) == 5:
		$b4/l4.text = array[3]
		$b5/l5.text = array[4]
	animate()



func onPressed():
	$AudioStreamPlayer.stream = preload("res://Sounds/tap.wav")
	$AudioStreamPlayer.play()
	var tap = group.get_pressed_button().get_child(0).text
	count +=1
	match count:
		1:$GridContainer/a/a.text = tap
		2:$GridContainer/b/b.text = tap
		3:$GridContainer/c/c.text = tap
		4:$GridContainer/d/d.text = tap
		5:$GridContainer/e/e.text = tap
	
	if count == wordLength:
		check()




func check():
	var check = $GridContainer/a/a.text + $GridContainer/b/b.text+ $GridContainer/c/c.text+$GridContainer/d/d.text+ $GridContainer/e/e.text
	if check in list:
		$AudioStreamPlayer.stream = preload("res://Sounds/win.wav")
		$AudioStreamPlayer.play()
		score = score + 100
		$ribbon/points.text = str(score)
		StoreData.lavel.score = score
		StoreData.save()
		match nextlavel:
			2: popup($Ribbon)
			4:popup($Ribbon2)
			7: popup($Ribbon3)
	else:
		$AudioStreamPlayer.stream = preload("res://Sounds/wrong.wav")
		$AudioStreamPlayer.play()
	if nextlavel == 9:
		StoreData.lavel.activated.hard = lavel + 1
		StoreData.save()
		StoreData.star = star
		yield(get_tree().create_timer(3),"timeout")
		get_tree().change_scene("res://Scene/win.tscn")
	else:
		sublavel +=1
		getstart()




func _on_idea_pressed():
	$AudioStreamPlayer.stream = preload("res://Sounds/show.wav")
	$AudioStreamPlayer.play()
	$Show/Label.text = str(words)
	score = score - 300
	$ribbon/points.text = str(score)
	$Tween.interpolate_property($Show, "scale",   Vector2(0,0), Vector2.ONE, 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		StoreData.lavel.score  = score
		StoreData.save()
		get_tree().change_scene("res://Scene/hardLavel.tscn")


func animate():
	$Tween.interpolate_property($b1,"rect_position:x", 0, 129, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b2,"rect_position:x", 400, 214, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b3,"rect_position:y", 247, 840, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b4,"rect_position:x", 0, 328, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b5,"rect_position:x", 0, 368, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()





func _on_Rate_pressed():
	OS.shell_open("https://play.google.com/store/apps/details?id=com.hanif.puzzle")


func _on_close_pressed():
	$Tween.interpolate_property($Show, "scale",  Vector2.ONE, Vector2(0,0), 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()




func popup(b):
	$Tween.interpolate_property(b, "scale", Vector2(0,0), Vector2.ONE, 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()
	star = star + 1

	
