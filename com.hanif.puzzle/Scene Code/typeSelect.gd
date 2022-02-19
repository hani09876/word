extends Node2D


func _ready():
	$Tween.interpolate_property($easy , "rect_position:x", 0, 200, .5, Tween.TRANS_QUAD)
	$Tween.interpolate_property($hard ,"rect_scale", null, Vector2(1,1), 1, Tween.TRANS_BACK, Tween.EASE_OUT)
	$Tween.start()
	$AudioStreamPlayer.stream = preload("res://Sounds/mixkit-baby-toy-music-box-lullaby-700.wav")
	$AudioStreamPlayer.play()

func _on_easy_pressed():
	StoreData.save()
	get_tree().change_scene("res://Scene/easyLavel.tscn")


func _on_hard_pressed():
	get_tree().change_scene("res://Scene/hardLavel.tscn")
	

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().quit()

#$Tween.interpolate_property($easy , "rect_position:x", 0, 200, .5, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
#	$Tween.interpolate_property($hard ,"rect_scale", null, Vector2(1,1), 1, Tween.TRANS_BACK, Tween.EASE_OUT)


