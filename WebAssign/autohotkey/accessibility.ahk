+#-::
to_paste := Copy()
to_paste := RegExReplace(to_paste, "s)</div>.+<div.*?>", "<br />")
Paste("<label>" to_paste "</label>")
return