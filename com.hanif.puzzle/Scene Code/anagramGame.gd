extends Node2D
var list =['abed', 'bade', 'bead', 'abet', 'beat', 'beta', 'abut', 'tabu', 'tuba', 'acme', 'came', 'mace', 'acre', 'care', 'race','amen', 'mane', 'mean', 'name', 'anew', 'wane', 'wean', 'arts', 'rats', 'star', 'tars', 'arcs', 'cars', 'scar', 'pass', 'saps', 'spas', 'awls', 'laws', 'slaw', 'bard', 'brad', 'drab', 'bats', 'stab', 'tabs', 'brag', 'garb', 'grab', 'code', 'coed', 'deco', 'dale', 'deal', 'lade', 'lead', 'dare', 'dear', 'read', 'demo', 'dome', 'mode', 'does', 'dose', 'odes', 'dues', 'sued', 'used', 'ears', 'eras', 'sear', 'elan', 'lane', 'lean','eons', 'nose', 'ones', 'flow', 'fowl', 'wolf','guns', 'snug', 'sung', 'goer', 'gore', 'ogre', 'gory', 'gyro', 'orgy', 'gust', 'guts', 'tugs', 'hare', 'hear', 'rhea', 'hoes', 'hose', 'shoe', 'hops', 'posh', 'shop', 'inks', 'sink', 'skin', 'ires', 'rise', 'sire', 'kale', 'lake', 'leak', 'lair', 'liar', 'rail', 'lame', 'male', 'meal', 'last', 'salt', 'slat', 'late', 'tale', 'teal', 'leap', 'pale', 'peal','list', 'silt', 'slit', 'lips', 'lisp', 'slip', 'loop', 'polo', 'pool', 'lots', 'lost', 'slot', 'mast', 'mats', 'tams', 'mate', 'meat', 'tame','mesa', 'same', 'seam', 'nape', 'neap', 'pane', 'naps', 'pans', 'snap', 'nets', 'nest', 'sent','nope', 'open','pone', 'opts', 'post', 'pots', 'stop', 'tops', 'owns', 'snow', 'sown', 'pars', 'raps','spar', 'part', 'rapt', 'trap', 'past', 'pats', 'spat', 'taps', 'paws', 'swap', 'wasp', 'pest', 'pets', 'step', 'raps', 'rasp', 'spar', 'rite', 'tier', 'tire', 'stew', 'wets', 'wets', 'stow', 'tows', 'twos', 'sway', 'ways', 'yaws']
var lavel = 1
var score = 000
var sublavel = 0
var words
export(ButtonGroup) var group
var count = 0
var nextlavel = 0
var now
var star = 0



func _ready():
	$AudioStreamPlayer.stream = preload("res://Sounds/mixkit-fairy-arcade-sparkle-866.wav")
	$AudioStreamPlayer.play()
	animate()
	StoreData.getdata()
	now = StoreData.now
	score = StoreData.lavel.score
	if now == 1:
		lavel = int(StoreData.lavel.activated.easy)
		sublavel = lavel * 3
	else:
		lavel = int(StoreData.lavel.now.lavel)
		sublavel = lavel * 3
	getstart()
	for i in group.get_buttons():
		i.connect("pressed", self, "onPressed")
	


func getstart():
	count = 0
	$ribbon/points.text = str(score)
	$ribbon/Label.text = str(lavel)
	getword()

func getword():
	words = list[sublavel]
	var array = []
	for ch in words:
		array.append(ch)
		array.shuffle()
	$b1/l1.text = array[0]
	$b2/l2.text = array[1]
	$b3/l3.text = array[2]
	$b4/l4.text = array[3]



func onPressed():
	$AudioStreamPlayer.stream = preload("res://Sounds/tap.wav")
	$AudioStreamPlayer.play()
	var tap = group.get_pressed_button().get_child(0).text
	count +=1
	match count:
		1:$GridContainer/a/a.text = tap
		2:$GridContainer/b/b.text = tap
		3:$GridContainer/c/c.text = tap
		5:$GridContainer2/a/a.text = tap
		6:$GridContainer2/b/b.text = tap
		7:$GridContainer2/c/c.text = tap
		9:$GridContainer3/a/a.text = tap
		10:$GridContainer3/b/b.text = tap
		11:$GridContainer3/c/c.text = tap
		12:
			$GridContainer3/c2/c.text = tap
			var word  =$GridContainer3/a/a.text +$GridContainer3/b/b.text + $GridContainer3/c/c.text+ $GridContainer3/c2/c.text
			check(word, 3)
		4:
			$GridContainer/c2/c.text = tap
			var word  =$GridContainer/a/a.text +$GridContainer/b/b.text + $GridContainer/c/c.text+ $GridContainer/c2/c.text
			check(word, 1)
		8:
			$GridContainer2/c2/c.text = tap
			var word  =$GridContainer2/a/a.text +$GridContainer2/b/b.text + $GridContainer2/c/c.text+ $GridContainer2/c2/c.text
			check(word, 2)



func check(word,grid):
	if word in list:
		$AudioStreamPlayer.stream = preload("res://Sounds/win.wav")
		$AudioStreamPlayer.play()
		score = score + 150
		$ribbon/points.text = str(score)
		StoreData.lavel.score = score
		StoreData.save()
		star = star + 1
		match grid:
			1: popup($Ribbon)
			2:popup($Ribbon2)
			3:popup($Ribbon3)
	else:
		$AudioStreamPlayer.stream = preload("res://Sounds/wrong.wav")
		$AudioStreamPlayer.play()
		score = score - 200
		$ribbon/points.text = str(score)
	if grid == 3:
		StoreData.star = star
		StoreData.lavel.activated.easy = lavel + 1
		StoreData.save()
		yield(get_tree().create_timer(2),"timeout")
		get_tree().change_scene("res://Scene/win.tscn")
		


func _on_idea_pressed():
	score = score - 150
	popup($popup)
	$popup/RichTextLabel.bbcode_text = "[wave amp=50 freq=2] %s " %words
	$ribbon/points.text = str(score)
	



func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		StoreData.lavel.score =score
		StoreData.save()
		get_tree().change_scene("res://Scene/easyLavel.tscn")


func _on_nextlavel_pressed():
	popdown($popup)



func popup(b):
	$Tween.interpolate_property(b, "scale", Vector2(0,0), Vector2.ONE, 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()

func popdown(b):
	$Tween.interpolate_property(b, "scale",  Vector2.ONE, Vector2(0,0), 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()


func animate():
	$Tween.interpolate_property($b1,"rect_position:x", 0, 57, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b2,"rect_position:x", 0, 178, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b3,"rect_position:y", 0, 627, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.interpolate_property($b4,"rect_position:x", 0, 296, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$Tween.start()
