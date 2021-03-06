#!/usr/bin/env bash
create_default_user(){
./manage.py shell<<EOD
from django.contrib.auth.models import User
try:
    User.objects.get( username='admin' )
except User.DoesNotExist as e:
    User.objects.create_superuser( 'admin', '', 'xxx12345' )
EOD
}

main(){
    ./manage.py migrate
    # create_default_user
    ./manage.py runserver 0.0.0.0:9999
}
main "$@"
