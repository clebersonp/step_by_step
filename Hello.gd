extends Panel

const SPRITE_NAME :String = "Sprite"

var s :Sprite
var count :int = 0
var heart :int = 50

var script_name

enum WEAPON_TYPE {
	PISTOL
	BERETA
}

func _ready():
	script_name = load("ScriptName.gd").new()
	# cria um novo node e adiciona ao tree
	s = Sprite.new()
	s.set_name(SPRITE_NAME)
	self.add_child(s)
	
	# recupera o node button e conecta ao signal
	var button :Button = self.get_node("Button")
	button.connect("pressed", self, "_on_Button_pressed",  [WEAPON_TYPE.PISTOL, heart])
	

#func _process(delta):
#	print(delta)

func _on_Button_pressed(weapon_type, qtd_heart :int):
	count += 1
	var value :String = str("Clicked %d times: \nWeapon_type: %d; \nqdt_heart: %d" % [count, weapon_type, qtd_heart])
	self.get_node("Label").text = value
	
	script_name.print_something(value)
	
	# remove de maneira segura  o node e seu filhos da scene
	if has_node(SPRITE_NAME):
		print(s.get_name())
		s.queue_free()
