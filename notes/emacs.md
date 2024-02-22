#### Basic commands
<C-x><C-b> - open buffer list
<C-x><C-f> - create/find file
<C-x><C-s> - save file
<C-x><C--> - decrease font size
<C-x><C-+> - increase font size

##### Cider commands
<M-x> `cider-jack-in` - open connected nrepl in emacs
<C-c><C-q> - quit running nrepl instance
<C-c><C-k> - compile current buffer
<C-c><C-d><C-d> - display doc for symbol under point
<C-c><M-n><M-n> - switch to namespace of current buffer
<C-c><C-c> - eval top level form under the point and echo
<C-c><C-v><C-v> - eval form designated by point on opening bracket
<M-x> `cider-inspect-last-result` - open buffer with contents of last eval

##### Paredit commands
<M-(> - wrap following argument in parenthesis
<C-->> - slurp following argument into current list
<C-<-> - barf final argument out of current list

