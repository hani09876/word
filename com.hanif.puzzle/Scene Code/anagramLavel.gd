extends Node2D
export(ButtonGroup) var group
var lavel 
var count = 0



func _ready():
	$AudioStreamPlayer.stream = preload("res://Sounds/mixkit-fairy-arcade-sparkle-866.wav")
	$AudioStreamPlayer.play()
	StoreData.getdata()
	lavel =int(StoreData.lavel.activated.easy)
	$ribbon/Label.text = str(lavel)
	$ribbon/Label2.text = "$"+ str(StoreData.lavel.score)
	animate()
	for i in group.get_buttons():
		i.connect("pressed", self, "onpressed")
		if count <lavel:
			i.icon = preload("res://images/logo/lavel.png")
			count = count +1
	

func onpressed():
	var click = int(group.get_pressed_button().get_child(0).text)
	if click > lavel:
		$AudioStreamPlayer.stream = preload("res://Sounds/wrong.wav")
		$AudioStreamPlayer.play()
		$Tween.interpolate_property($popup, "scale", Vector2(0,0), Vector2.ONE,1, Tween.TRANS_BOUNCE)
		$Tween.start()
		

	elif lavel == click:
		StoreData.now = 1 #for last lavel activeted
		get_tree().change_scene("res://Scene/easy.tscn")

	else:
		var sub = click * 3
		StoreData.now = 2 #play from activated labels
		StoreData.lavel.now.lavel = click
		StoreData.lavel.now.sub = sub
		StoreData.save()
		get_tree().change_scene("res://Scene/easy.tscn")
		


func _on_Button_pressed():
	$Tween.interpolate_property($popup, "scale", Vector2.ONE, Vector2(0,0),1, Tween.TRANS_ELASTIC)
	$Tween.start()


func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().change_scene("res://Scene/modeSelect.tscn")


func animate():
	for b in $GridContainer.get_children():
		$Tween.interpolate_property(b, "rect_scale",Vector2(0, 0), Vector2.ONE,1,Tween.TRANS_ELASTIC)
		$Tween.start()
