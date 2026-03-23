(load-extension "./ts_sdl2")
(sdl2-init)

(load "event-handling.scm")

(define running #t)

;; Just quit handler (window close works)
(add-event-handler sdl2-quit
    (lambda (event)
        (set! running #f)
        #f))

(let*
    (
        (window (sdl2-create-window))
        (renderer (sdl2-create-renderer window))
    )

    (define (clear-screen)
        (sdl2-set-render-draw-color renderer 0 0 0 sdl2-alpha-opaque)
        (sdl2-render-clear renderer)
        (sdl2-render-present renderer))

    (clear-screen)
    (sdl2-set-render-draw-color renderer 255 255 255 sdl2-alpha-opaque)
    (sdl2-render-draw-point renderer 8 8)
    (sdl2-render-present renderer))

    (do ()
        ((not running))
        (let ((event (sdl2-poll-event)))
            (if (not (eq? event #f))
                (handle-event event)))
    )

    (sdl2-destroy-renderer renderer)
    (sdl2-destroy-window window)
)
