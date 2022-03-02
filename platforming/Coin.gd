extends Area2D

signal collected

func _on_Coin_body_entered(body):
	queue_free()
	emit_signal('collected')
