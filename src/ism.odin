package ism
import sigil "lib:sigil"

init :: distinct #type proc(^sigil.world_t)
tick :: distinct #type proc(^sigil.world_t)
exit :: distinct #type proc(^sigil.world_t)

