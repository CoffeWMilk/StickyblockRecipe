minetest.register_craft({
		output = "mesecons_stickyblocks:sticky_block_all",
		recipe = {
			{"default:steel_ingot", "default:wood", "default:steel_ingot"},
			{"default:wood", "mesecons_materials:glue", "default:wood"},
			{"default:steel_ingot", "default:wood", "default:steel_ingot"},
		}
})


local mese_list = {
	"mesecons_stickyblocks:sticky_block_all"
}

for mesecount = 1, #mese_list do
	minetest.override_item(mese_list[mesecount], {
		on_place = function(itemstack, placer, pointed_thing)
			local can_mess = minetest.check_player_privs(placer.get_player_name(placer), {ban=true})
			if not can_mess then
				minetest.chat_send_player(placer:get_player_name(), "You're not allowed to use this.")
				return
			end
			return minetest.item_place(itemstack, placer, pointed_thing)
		end	
	})
end
