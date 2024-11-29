extends Node

var peer = ENetMultiplayerPeer.new()
@export var PORT : int = 3621
@export var PlayerScene: PackedScene


func host():
	peer.create_server(PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer server.")
		return
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(connectPlayer)
	multiplayer.peer_disconnected.connect(removePlayer)
	connectPlayer()
	start_game(true)

func join():
	var txt : String = $"Multiplayer setup/IP Line".text
	if txt == "":
		txt = "localhost"
	
	peer.create_client(txt, PORT)
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer client.")
		return
	multiplayer.multiplayer_peer = peer
	
	start_game(false)

func start_game(host : bool):
	$"Multiplayer setup".visible = false
	$"Multiplayer setup".queue_free()



func connectPlayer(id : int = 1):
	print("we got a friend! :", id)
	var player = PlayerScene.instantiate()
	player.name = str(id)
	$Players.call_deferred("add_child", player)

func removePlayer(id : int = 1):
	print("No more friend :(", id)
