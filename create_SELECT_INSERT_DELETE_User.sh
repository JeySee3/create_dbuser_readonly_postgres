#!/bin/bash

#############ENV#################

PasswordPG=bgl
UserRootDB=bgl
DATABASE=bgl
SchemaName=bgl

#############Script##############

while getopts u:p: flag
do
    case "${flag}" in
        u) USERP=${OPTARG};;
        p) PASSWORD=${OPTARG};;
    esac
done

echo USER: $USERP
echo PASSWORD: $PASSWORD

if [[ -z "$USERP" ]]; then
   echo "Value USER is empty. Set value like './create_Read_Only_User.sh -u USER_NAME -p PASSWORD'"
   exit 1
fi

if [[ -z "$PASSWORD" ]]; then
   echo "Value PASSWORD is empty. Set value like './create_Read_Only_User.sh -u USER_NAME -p PASSWORD'"
   exit 1
fi

sed -e "s/User_Read/${USERP}/g" -e "s/STRONG_PASSWORD/${PASSWORD}/g" -e "s/DatabaseSource/${DATABASE}/g" -e "s/SchemaName/${SchemaName}/g" -e "s/GRANT SELECT ON ALL TABLES/GRANT SELECT, UPDATE, DELETE ON ALL TABLES/g" ./template.sql > psql.sql
RESULT=$(PGPASSWORD=${PasswordPG} /usr/bin/psql -U ${UserRootDB} -h localhost -f psql.sql)

echo $RESULT
