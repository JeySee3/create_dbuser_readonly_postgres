# Create dbuser readonly postgres

Set value like './create_Read_Only_User.sh -u USER_NAME -p PASSWORD'

### You can set ENV for you database in create_Read_Only_User.sh

#############ENV#################

 + PasswordPG=password
 + UserRootDB=postgres
 + DATABASE=postgres
 + SchemaName=public
 + HOSTDB=localhost

# Create dbuser with rules(SELECT_INSERT_DELETE) for database postgres

Set value like './create_SELECT_INSERT_DELETE_User.sh -u USER_NAME -p PASSWORD'
