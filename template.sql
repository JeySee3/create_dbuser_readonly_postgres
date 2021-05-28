DO
$do$
BEGIN
        IF NOT EXISTS(SELECT rolname FROM pg_roles WHERE rolname='User_Read') THEN
                CREATE USER User_Read WITH ENCRYPTED PASSWORD 'STRONG_PASSWORD';
                GRANT USAGE ON SCHEMA SchemaName to User_Read;
                ALTER DEFAULT PRIVILEGES IN SCHEMA SchemaName GRANT SELECT ON TABLES TO User_Read;

                GRANT CONNECT ON DATABASE DatabaseSource to User_Read;

        --      \c DatabaseSource

                ALTER DEFAULT PRIVILEGES IN SCHEMA SchemaName GRANT ALL ON TABLES TO User_Read;
                GRANT USAGE ON SCHEMA SchemaName to User_Read;
                GRANT SELECT ON ALL SEQUENCES IN SCHEMA SchemaName TO User_Read;
                GRANT SELECT ON ALL TABLES IN SCHEMA SchemaName TO User_Read;
                ALTER DATABASE DatabaseSource SET search_path TO SchemaName;
        ELSE
                RAISE NOTICE 'USER User_Read already exists.';
        end if;
end;
$do$
