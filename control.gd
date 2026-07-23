extends Control

var expies: int = 0
var money: int = 0
var auto_click01: int = 0
var clicks: int = 1
var milk: bool = false


@onready var count_label: Label = $CountLabel
@onready var money_label: Label = $MoneyLabel
@onready var situation_message: Label = $SituationMessage
@onready var click_button: Button = $ClickButton
@onready var expedition_button: Button = $ExpeditionButton
@onready var hire_button01: Button = $HireButton01
@onready var milk_unlock: Button = $MilkUnlock
@onready var auto_timer01: Timer = $AutoTimer1
@onready var auto_timer02: Timer = $AutoTimer2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_update_ui()

func _update_ui() -> void:
	count_label.text = "Expies: " + str(expies)
	money_label.text = "Money: " + str(money)
	count_label_2.text = "Milkies: " + str(milkies)
	hire_button01.disabled = (money < 50)
	expedition_button.disabled = (expies < 20)
	milk_unlock.disabled = (money < 200)
	if milk == true:
		click_button_2.disabled = false
		hire_button_2.disabled = false
		expedition_button_2.disabled = false
		hire_button_2.disabled = false
	else:
		hire_button_2.disabled = true
	expedition_button_2.disabled = (milkies < 50)
	hire_button_2.disabled = (money < 50)

func _on_click_button_pressed() -> void:
	expies += clicks
	_update_ui()	

func _on_expedition_button_pressed() -> void:
	var roll: float = randf()
	if roll < 0.70:
		expies -= 10
		money += 10
	elif roll < 0.90:
		expies -= 20
		money += 10
	else:
		expies -= 20
	_update_ui()

func _on_hire_button01_pressed() -> void:
	money -= 50
	clicks += 1
	_update_ui()

func _on_milk_unlock_pressed() -> void:
	milk = true
	money -= 200
	_update_ui()

func _on_auto_timer01_timeout() -> void:
	expies += auto_click01
	_update_ui()

func _on_auto_timer02_timeout() -> void:
	milkies += auto_click02
	_update_ui()




######################################################################################
# Here starts the milky part!

var milkies: int = 0
var auto_click02: int = 0
var clicks2: int = 1


@onready var count_label_2: Label = $Control/CountLabel2
@onready var click_button_2: Button = $Control/ClickButton2
@onready var hire_button_2: Button = $Control/HireButton02
@onready var expedition_button_2: Button = $Control/ExpeditionButton2
@onready var coop_panel_button: Button = $Coop/CoopPanel
@onready var coop_container: VBoxContainer = $Coop/CoopContainer
@onready var coop_exp_1: Button = $Coop/CoopContainer/CoopExp1
@onready var coop_exp_2: Button = $Coop/CoopContainer/CoopExp2




func _on_click_button_pressed2() -> void:
	milkies += clicks2
	_update_ui()

func _on_expedition_button_pressed2() -> void:
	var roll2: float = randf()
	if roll2 < 0.70:
		milkies -= 25
		money += 30
	elif roll2 < 0.90:
		milkies -= 50
		money += 30
	else:
		milkies -= 50
	_update_ui()

func _on_hire_button01_pressed2() -> void:
	money -= 50
	clicks2 += 1
	_update_ui()

func open_coop_container() -> void:
	coop_container.visible = not coop_container.visible

func coop_exp_01() -> void:
	if milkies >= 50 and expies >= 50:
		milkies -= 50
		expies -= 50
		auto_timer01.start()
		auto_click01 += 1
		_update_ui()
	else:
		situation_message.text = "Not enough meat!!"

func coop_exp_02() -> void:
	if milkies >= 100 and expies >= 100:
		milkies -= 100
		expies -= 100
		auto_timer02.start()
		auto_click02 += 3
		_update_ui()
	else:
		situation_message.text = "Not enough meat!!" 

func coop_exp_03() -> void:
	if milkies >= 500 and expies >= 500:
		var roll3: float = randf()
		if roll3 < 0.70:
			milkies -= 300
			expies -= 300
			money += 250
			_update_ui()
		elif roll3 < 0.90:
			milkies -= 500
			expies -= 500
			money += 250
			_update_ui()
		else:
			milkies -= 500
			expies -= 500
			_update_ui()
	else:
		situation_message.text = "Not enough meat!!" 






	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
