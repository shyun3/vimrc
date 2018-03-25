@echo off   # This line is for DOS only
ctags -R --fields=+l --langmap=c++:+.ino --exclude={node_modules,tmp}

cscope -R -b *.ino *.cpp *.h

# Alternative way of generating cscope data (do not include both the following
# and the previous cscope command!)
ack -f --cpp --follow > cscope.files
cscope -b
