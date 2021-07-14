#!/usr/bin/ksh -x

NEW_USERS="./txt.add_new_user"

cat ${NEW_USERS} | \
while read USER PASSWORD COMMENT1 COMMENT2
do
  PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${PASSWORD})
  useradd -c "${COMMENT1} ${COMMENT2}" ${USER}
  usermod -p ${PASS} ${USER}  
#  echo '"'${COMMENT1} ${COMMENT2}'"'
done

