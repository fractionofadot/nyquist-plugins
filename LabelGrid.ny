$nyquist plug-in
$version 1
$type generate
$preview linear
$preview selection
$name (_ "Label Grid")
$debugbutton true
$action (_ "Generating label grid ...")
$author (_ "Robert Parker")
$release 1.0
$copyright (_ "GNU General Public License v2.0 or later")

$control bpm (_ "Tempo (beats per minute)") float "" 116.0 20.0 300.0
$control beats (_ "Beats per bar") int "" 4 1 12
$control bars (_ "Number of bars") int "" 32 1 100
$control sub (_ "Beat subdivisions") int "" 0 0 8

(case sub (0 (setf sub 1)))

(setf interval (/ 60.00 bpm sub))
(setf total (mult beats bars sub))

(setq labels (list (list 0.0 "")))

(setf i 0.00)
(loop 
	(setf i (sum i 1.00))
	(setf value (mult i interval))
	(setq labels (append labels (list (list value ""))))
	(when (> i total) (return labels))
)


