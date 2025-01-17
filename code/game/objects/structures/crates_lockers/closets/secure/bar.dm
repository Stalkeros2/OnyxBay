/obj/structure/closet/secure_closet/bar
	name = "booze closet"
	req_access = list(access_bar)
	icon_state = "cabinetdetective_locked"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_opened = "cabinetdetective_open"
	icon_broken = "cabinetdetective_sparks"
	icon_off = "cabinetdetective_broken"
	dremovable = 0

/obj/structure/closet/secure_closet/bar/WillContain()
	return list(/obj/item/reagent_containers/food/drinks/bottle/small/beer = 10)

/obj/structure/closet/secure_closet/empty
	name = "secure closet"
	//set access in map editor
	req_access = null
	icon_state = "cabinetdetective_locked"
	icon_closed = "cabinetdetective"
	icon_locked = "cabinetdetective_locked"
	icon_opened = "cabinetdetective_open"
	icon_broken = "cabinetdetective_sparks"
	icon_off = "cabinetdetective_broken"

/obj/structure/closet/secure_closet/empty/WillContain()
	return
