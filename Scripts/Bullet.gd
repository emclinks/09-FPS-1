extends Area

var speed = 15
var damage = 1
var velocity = Vector3()

func _ready():
	pass

func start(start_from):
	transform = start_from
	velocity = transform.basis.z * speed

func _physics_process(delta):
	transform.origin += velocity * delta

func _on_Timer_timeout():
	queue_free()

func _on_Bullet_body_entered(body):
	if body is StaticBody:
		queue_free()
	if body.get_parent().name == "Items":
		body.queue_free()
		queue_free()
	if body.name == "Tank":
		print(body.health)
		body.take_damage(damage)
		queue_free()
