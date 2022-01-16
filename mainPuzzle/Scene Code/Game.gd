extends Node2D
var list = ['stop','hello', 'name', 'what', 'your', 'mom', 'good', 'love' , 'like', 'want', 'more', 'join', 'often', 'seat', 'talk', 'heavy', 'page', 'live', 'huge', 'rock', 'blood', 'early', 'news', 'make', 'task', 'party', 'store', 'shoot', 'site', 'truth', 'onto', 'under', 'body', 'love', 'check', 'close', 'size', 'walk', 'might', 'true', 'seem', 'guess', 'small', 'item', 'major', 'yard', 'mean', 'image', 'need', 'could', 'table', 'along', 'fight', 'shake', 'throw', 'miss', 'home', 'them', 'study', 'light', 'trade', 'data', 'thing', 'list', 'other', 'feel', 'same', 'share', 'black', 'must', 'space', 'where', 'five', 'wall', 'have', 'call', 'skill', 'chair', 'even', 'foot', 'stuff', 'coach', 'sure', 'human', 'teach', 'agree', 'enter', 'plant', 'film', 'apply', 'dark', 'start', 'floor', 'treat', 'field', 'north', 'reach', 'raise', 'down', 'main', 'wife', 'find', 'poor', 'upon', 'late', 'good', 'look', 'time', 'green', 'wrong', 'break', 'take', 'front', 'room', 'leave', 'west', 'when', 'every', 'power', 'seven', 'from', 'view', 'stay', 'occur', 'music', 'since', 'very', 'loss', 'come', 'week', 'name', 'trip', 'open', 'some', 'also', 'unit', 'girl', 'book', 'while', 'piece', 'nice', 'door', 'most', 'pick', 'dead', 'past', 'four', 'laugh', 'later', 'beat', 'group', 'care', 'help', 'local', 'deal', 'tough', 'fast', 'least', 'level', 'yeah', 'above', 'story', 'none', 'only', 'then', 'like', 'city', 'owner', 'would', 'drive', 'event', 'watch', 'learn', 'grow', 'wear', 'these', 'wind', 'scene', 'bill', 'those', 'side', 'thank', 'cover', 'else', 'many', 'over', 'land', 'spend', 'role', 'baby', 'movie', 'fine', 'heat', 'push', 'exist', 'build', 'seek', 'what', 'third', 'near', 'paper', 'much', 'woman', 'world', 'stand', 'final', 'model', 'sing', 'range', 'sell', 'will', 'hear', 'sound', 'after', 'last', 'media', 'fish', 'thus', 'write', 'idea', 'keep', 'sport', 'read', 'draw', 'less', 'again', 'firm', 'cell', 'peace', 'shot', 'fill', 'case', 'area', 'star', 'goal', 'want', 'phone', 'death', 'whose', 'hang', 'away', 'plan', 'adult', 'focus', 'soon', 'cold', 'year', 'real', 'pull', 'drug', 'begin', 'sense', 'fear', 'cost', 'water', 'order', 'save', 'form', 'rule', 'until', 'rich', 'bank', 'hold', 'ever', 'kill', 'game', 'that', 'road', 'money', 'civil', 'short', 'large', 'night', 'clear', 'young', 'month', 'play', 'serve', 'south', 'board', 'total', 'point', 'still', 'vote', 'race', 'legal', 'rate', 'think', 'move', 'pain', 'fail', 'tree', 'admit', 'speak', 'food', 'class', 'able', 'hope', 'each', 'test', 'note', 'force', 'dream', 'worry', 'heart', 'your', 'risk', 'enjoy', 'hard', 'they', 'alone', 'part', 'card', 'sign', 'carry', 'give', 'which', 'quite', 'blue', 'fund', 'style', 'color', 'than', 'hand', 'happy', 'know', 'allow', 'state', 'sort', 'prove', 'about', 'face', 'drop', 'left', 'offer', 'turn', 'agent', 'child', 'edge', 'value', 'wait', 'rise', 'song', 'fire', 'ball', 'next', 'never', 'there', 'well', 'team', 'eight', 'wish', 'fact', 'skin', 'ready', 'white', 'claim', 'right', 'head', 'term', 'their', 'hour', 'once', 'pass', 'visit', 'voice', 'step', 'kind', 'argue', 'best', 'lose', 'radio', 'three', 'with', 'cause', 'smile', 'place', 'easy', 'high', 'half', 'tend', 'hair', 'deep', 'mouth', 'such', 'issue', 'both', 'rest', 'tell', 'safe', 'score', 'glass', 'maybe', 'free', 'full', 'here', 'life', 'this', 'whole', 'back', 'stock', 'price', 'just', 'first', 'fall', 'into', 'lead', 'bring', 'word', 'send', 'house', 'staff', 'town', 'catch', 'work', 'hotel', 'long', 'great', 'among', 'type', 'mind', 'stage', 'east', 'show', 'whom', 'meet', 'crime', 'born', 'court', 'avoid', 'ahead', 'trial', 'wide', 'today', 'more', 'line', 'base']

onready var timer = get_node("Timer")
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





func _ready():
	StoreData.getdata()
	var paper =load("res://images/wallpaper/" + str(StoreData.lavel.last.wallpaper) + ".jpg")
	mode = StoreData.current
	$wallpaper.texture = paper
	score = StoreData.lavel.last.score
	if mode == 1:
		lavel = int(StoreData.lavel.last.lavel)
		sublavel = int(StoreData.lavel.last.sub)
	else:
		lavel = int(StoreData.lavel.now.lavel)
		sublavel = int(StoreData.lavel.now.sub)
	getstart()
	for i in group.get_buttons():
		i.connect("pressed", self, "onPressed")
	


func getstart():
	count = 0
	$ribbon/points.text = str(score)
	$ribbon/Label.text = str(lavel)
	$GridContainer/a/a.text = ""
	$GridContainer/b/b.text = ""
	$GridContainer/c/c.text = ""
	$GridContainer/d/d.text = ""
	$GridContainer/e/e.text = ""

	getword()
	timer.start()
	
func _on_Timer_timeout():
	$TextureProgress.value+=.5
	if $TextureProgress.value == 130:
		timer.stop()

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
	elif len(words) == 2:
		$GridContainer/d.visible = false
		$GridContainer/e.visible = false
		$GridContainer/c.visible = false
		$b3.visible = false
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


func _on_next_lavel_pressed():
	$popup/AnimationPlayer.play_backwards("popUp")
	if icon == "right" :
		$AudioStreamPlayer.stream = preload("res://Sounds/point.wav")
		$AudioStreamPlayer.play()
		$Sprite.visible = false
		if mode == 2:
			if nextlavel < 5:
				nextlavel = nextlavel + 1
				sublavel = sublavel + 1
				getstart()
			elif nextlavel == 5:
				get_tree().change_scene("res://Scene/Lavels.tscn")
		elif mode ==1:
			if nextlavel == 5:
				StoreData.lavel.last.lavel = lavel + 1
				StoreData.lavel.last.sub = sublavel + 1
				StoreData.save()
				get_tree().change_scene("res://Scene/Lavels.tscn")
			elif nextlavel <5 :
				sublavel = sublavel + 1
				nextlavel = nextlavel + 1
				getstart()
	else:
		$AudioStreamPlayer.stream = preload("res://Sounds/tap.wav")
		$AudioStreamPlayer.play()
		reload()
	







func onPressed():
	$AudioStreamPlayer.stream = preload("res://Sounds/tap.wav")
	$AudioStreamPlayer.play()
	var tap = group.get_pressed_button().get_child(0).text
	count +=1
	if count == 1:
		$GridContainer/a/a.text = tap
	elif count == 2:
		$GridContainer/b/b.text = tap
	elif count == 3:
		$GridContainer/c/c.text = tap
	elif count==4:
		$GridContainer/d/d.text = tap
	else:
		$GridContainer/e/e.text = tap
	if count == wordLength:
		check()




func check():
	var check = $GridContainer/a/a.text + $GridContainer/b/b.text+ $GridContainer/c/c.text+$GridContainer/d/d.text+ $GridContainer/e/e.text
	if check == words:
		$AudioStreamPlayer.stream = preload("res://Sounds/win.wav")
		$AudioStreamPlayer.play()
		popup()
		if $TextureProgress.value == 100:
			score = score + 50
		else:
			score = score + 100
		$ribbon/points.text = str(score)
		StoreData.lavel.last.score = score
		StoreData.save()
	else:
		$AudioStreamPlayer.stream = preload("res://Sounds/wrong.wav")
		$AudioStreamPlayer.play()
		errorPop()




func reload():
	$TextureProgress.value = 0
	count = 0
	_on_Timer_timeout()
	getstart()
	
func popup():
	$popup/nextlavel.icon = load("res://images/logo/right-arrow.png")
	$popup/AnimationPlayer.play("popUp")
	$popup.visible = true
	$Sprite/AnimationPlayer.play("starmove")
	$Sprite.visible = true
	$popup/RichTextLabel.visible = true
	$popup/idea.visible = false
	$popup/RichTextLabel.bbcode_text = "[wave amp=50 freq=2][center] You win "
	icon = "right"


func errorPop():
	$popup/nextlavel.icon = load("res://images/logo/reload.png")
	$popup/RichTextLabel.bbcode_text = "[wave amp=50 freq=2][center] You Lose "
	$popup/AnimationPlayer.play("popUp")
	$popup/RichTextLabel.visible = true
	$popup/idea.visible = false
	$popup.visible = true
	icon = "reload"


func _on_wallBtn_pressed():
	if mode == 1:
		StoreData.lavel.last.lavel = lavel
		StoreData.lavel.last.sub = sublavel
	StoreData.lavel.last.score  = score
	StoreData.save()
	get_tree().change_scene("res://Scene/SElect Walpaper.tscn")
	


func _on_idea_pressed():
	$AudioStreamPlayer.stream = preload("res://Sounds/show.wav")
	$AudioStreamPlayer.play()
	$popup/AnimationPlayer.play("Sceneepop")
	$popup.visible = true
	$popup/RichTextLabel.visible = false
	$popup/idea.visible = true
	$popup/nextlavel.icon = load("res://images/logo/right-arrow.png")
	$popup/idea.bbcode_text = "[wave amp = 300 freq = 2][center] %s" %words
	icon = "right"
	if score > 50:
		score = score - 100
	else:
		score = score + 100


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		if mode == 1:
			StoreData.lavel.last.lavel = lavel
			StoreData.lavel.last.sub = sublavel
		StoreData.lavel.last.score  = score
		StoreData.save()
		get_tree().change_scene("res://Scene/Lavels.tscn")
