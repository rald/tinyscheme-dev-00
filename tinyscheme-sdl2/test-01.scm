(load-extension "./ts_sdl2")
(sdl2-init)

(load "event-handling.scm")
(add-event-handler sdl2-quit (lambda (event) #f))

(let*

    (
        (window (sdl2-create-window))
        (renderer (sdl2-create-renderer window))
    )

    (define (clear-screen)
        (sdl2-set-render-draw-color renderer 255 255 255 sdl2-alpha-opaque)
        (sdl2-render-clear renderer))

    (sdl2-set-render-draw-color renderer 64 32 64 sdl2-alpha-opaque)

    (clear-screen)
    (sdl2-render-present renderer)

    (sdl2-destroy-texture texture)
    (sdl2-destroy-renderer renderer)
    (sdl2-destroy-window window)
)

