extends Node2D
var star

func _ready():
	star = StoreData.star
	$Tween.interpolate_property($Win, "scale", Vector2(0,0), Vector2.ONE, 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()
	$AudioStreamPlayer.stream = preload("res://Sounds/mixkit-medieval-show-fanfare-announcement-226.wav")
	$AudioStreamPlayer.play()
	$Timer.start()
	
var i = 0
func _on_Timer_timeout():
	if i != star:
		i +=1
		match i:
			1:popup($Star1)
			2:popup($Star2)
			3:popup($Star3)
	match star:
		1:$Win/Super.texture = preload("res://images/logo/bad.png")
		2:$Win/Super.texture = preload("res://images/logo/good.png")
		3:$Win/Super.texture = preload("res://images/logo/super.png")
	


func popup(b):
	$Tween.interpolate_property(b, "scale", Vector2(0,0), Vector2.ONE, 1 , Tween.TRANS_BOUNCE, Tween.EASE_IN_OUT)
	$Tween.start()
	$Timer.start()


func _on_Button_pressed():
	get_tree().change_scene("res://Scene/modeSelect.tscn")
