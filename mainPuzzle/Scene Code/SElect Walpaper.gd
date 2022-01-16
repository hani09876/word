extends Node2D
export(ButtonGroup) var group
var score
var paper
var prize



func _ready():
	StoreData.getdata()
	score = int(StoreData.lavel.last.score)
	$Label.text = "Points:" + str(score)
	for i in group.get_buttons():
		i.connect("pressed", self, "onPress")
	


func onPress():
	paper = group.get_pressed_button().name
	prize = int(group.get_pressed_button().get_child(0).text)
	if score > prize:
		$AudioStreamPlayer.stream = preload("res://Sounds/tap.wav")
		$AudioStreamPlayer.play()
		$err/AnimationPlayer.play("epop")
		$err.visible = true
		$err/Button/Label.text = "Buy"
	else:
		$err.visible = true
		$AudioStreamPlayer.stream = preload("res://Sounds/wrong.wav")
		$AudioStreamPlayer.play()
		$err/AnimationPlayer.play("epop")
		$err/Label2.text = "Earn more to Buy"
		$err/Button/Label.text = "ok"



func _on_Button_pressed():
	if $err/Button/Label.text == "Buy":
		score = score - prize
		$AudioStreamPlayer.stream = preload("res://Sounds/point.wav")
		$AudioStreamPlayer.play()
		$Label.text = "Points:" + str(score)
		StoreData.lavel.last.score = score
		StoreData.lavel.last.wallpaper = paper
		StoreData.save()
		$err/AnimationPlayer.play_backwards("epop")
	else:
		$AudioStreamPlayer.stream = preload("res://Sounds/tap.wav")
		$AudioStreamPlayer.play()
		$err/AnimationPlayer.play_backwards("epop")

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().change_scene("res://Scene/Game.tscn")

