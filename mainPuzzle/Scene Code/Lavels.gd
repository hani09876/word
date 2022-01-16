extends Node2D
export(ButtonGroup) var group
var lavel 


func _ready():
	StoreData.getdata()
	lavel =int(StoreData.lavel.last.lavel)
	$ribbon/Label.text = str(lavel)
	$ribbon/Label2.text = "$"+ str(StoreData.lavel.last.score)
	for i in group.get_buttons():
		i.connect("pressed", self, "onpressed")

func onpressed():
	var click = int(group.get_pressed_button().get_child(0).text)
	
	if click > lavel:
		$AudioStreamPlayer.stream = preload("res://Sounds/wrong.wav")
		$AudioStreamPlayer.play()
		$popup/AnimationPlayer.play("popUp")
		$popup.visible = true
	elif lavel == click:
		get_tree().change_scene("res://Scene/Game.tscn")
		StoreData.current = 1 #for last lavel activeted
	else:
		var sub = click * 5
		StoreData.current = 2 
		StoreData.lavel.now.lavel = click
		StoreData.lavel.now.sub = sub
		StoreData.save()
		get_tree().change_scene("res://Scene/Game.tscn")
		


func _on_Button_pressed():
	$popup/AnimationPlayer.play_backwards("Sceneepop")

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		get_tree().quit()
