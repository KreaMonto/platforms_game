extends CanvasLayer

func _ready():
	$coins_label.text = str(GLOBAL.coins)

func handleCoinCollected():
	print("coin collected.")
	GLOBAL.coins += 1
	$coins_label.text = str(GLOBAL.coins)
