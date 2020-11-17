#!/bin/bash
echo "This is a test" > test.txt

setfacl -d -m group:ServiceFabricAdministrators:rw- /var/lib/sfcerts

setfacl -m group:ServiceFabricAdministrators:rw- /var/lib/sfcerts
