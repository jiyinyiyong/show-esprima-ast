
require("calabash").do "watch and compile",
  "pkill -f doodle"
  "coffee -o src -cmw coffee/"
  "doodle src/ index.html log:yes"