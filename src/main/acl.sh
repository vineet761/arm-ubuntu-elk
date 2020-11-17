#!/bin/bash

setfacl -d -m group:ServiceFabricAdministrators:rw- /var/lib/sfcerts && setfacl -m group:ServiceFabricAdministrators:rw- /var/lib/sfcerts
