extends Node2D



func _on_KillPlane_body_entered(body):
	$Player.position.x = 50
	$Player.position.y = 200


func _on_Player_coin_collected():
	$CanvasLayer/CoinCount/Label.text = str($Player.numcoins)
