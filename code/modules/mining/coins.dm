/*****************************Coin********************************/

/obj/item/coin
	icon = 'icons/obj/items.dmi'
	name = "Coin"
	icon_state = "coin"
	randpixel = 8
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	force = 0.0
	throwforce = 0.0
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	var/string_attached
	var/sides = 2

/obj/item/coin/gold
	name = "gold coin"
	icon_state = "coin_gold"

/obj/item/coin/silver
	name = "silver coin"
	icon_state = "coin_silver"

/obj/item/coin/diamond
	name = "diamond coin"
	icon_state = "coin_diamond"

/obj/item/coin/iron
	name = "iron coin"
	icon_state = "coin_iron"

/obj/item/coin/plasma
	name = "solid plasma coin"
	icon_state = "coin_plasma"

/obj/item/coin/uranium
	name = "uranium coin"
	icon_state = "coin_uranium"

/obj/item/coin/platinum
	name = "platinum coin"
	icon_state = "coin_adamantine"

/obj/item/coin/attackby(obj/item/W as obj, mob/user as mob)
	if(isCoil(W))
		var/obj/item/stack/cable_coil/CC = W
		if(string_attached)
			to_chat(user, "<span class='notice'>There already is a string attached to this coin.</span>")
			return
		if (CC.use(1))
			overlays += image('icons/obj/items.dmi',"coin_string_overlay")
			string_attached = 1
			to_chat(user, "<span class='notice'>You attach a string to the coin.</span>")
		else
			to_chat(user, "<span class='notice'>This cable coil appears to be empty.</span>")
		return
	else if(isWirecutter(W))
		if(!string_attached)
			..()
			return

		var/obj/item/stack/cable_coil/CC = new /obj/item/stack/cable_coil(user.loc)
		CC.amount = 1
		CC.update_icon()
		overlays = list()
		string_attached = null
		to_chat(user, "<span class='notice'>You detach the string from the coin.</span>")
	else ..()

/obj/item/coin/attack_self(mob/user as mob)
	var/result = rand(1, sides)
	var/comment = ""
	if(result == 1)
		comment = "tails"
	else if(result == 2)
		comment = "heads"
	user.visible_message("<span class='notice'>[user] has thrown \the [src]. It lands on [comment]! </span>", \
						 "<span class='notice'>You throw \the [src]. It lands on [comment]! </span>")
