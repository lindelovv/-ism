package main

import ism "src"
import "lib:sigil"

main :: proc() { /* سيجيل */
    world := sigil.init_world({
        ism.glfw,
        ism.vulkan,
        ism.miniaudio,
        ism.jolt,
        ism.scene,
    })
    run(world)
}

run :: proc(world: ^sigil.world_t) {
    for fn in sigil.query(world, ism.init) { fn(world) }
    main_loop: for !world.request_exit { for fn in sigil.query(world, ism.tick) { fn(world) } free_all(context.temp_allocator) }
    #reverse for fn in sigil.query(world, ism.exit) { fn(world) }
}
