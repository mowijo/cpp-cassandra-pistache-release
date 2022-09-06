FROM mowijo/cpp-cassandra-pistache-development:v2 AS development

FROM alpine:3.16.2

RUN apk update
RUN apk --no-cache add libuv openssl zlib libstdc++

COPY --from=development /usr/local/lib/libcassandra.so.2.16.2  /usr/local/lib/
RUN (cd /usr/local/lib && ln -s libcassandra.so.2.16.2 libcassandra.so.2 )
RUN (cd /usr/local/lib && ln -s libcassandra.so.2 libcassandra.so )

COPY --from=development /usr/local/lib/libpistache.so.0.0.5.20220901 /usr/local/lib/
RUN (cd /usr/local/lib && ln -s libpistache.so.0.0.5.20220901 libpistache.so.0 )
RUN (cd /usr/local/lib && ln -s libpistache.so.0 libpistache.so )

RUN ldconfig /etc/ld.so.conf.d



#lrwxrwxrwx    1 root     root            17 Sep  6 05:19 libcassandra.so -> libcassandra.so.2
#lrwxrwxrwx    1 root     root            22 Sep  6 05:19 libcassandra.so.2 -> libcassandra.so.2.16.2
#-rwxr-xr-x    1 root     root      10456520 Sep  6 05:19 libcassandra.so.2.16.2
#-rw-r--r--    1 root     root        843696 Sep  5 17:02 libgmock.a
#-rw-r--r--    1 root     root          4428 Sep  5 17:02 libgmock_main.a
#-rw-r--r--    1 root     root       2675730 Sep  5 17:02 libgtest.a
#-rw-r--r--    1 root     root          4116 Sep  5 17:02 libgtest_main.a
#-rw-r--r--    1 root     root       2800126 Sep  6 05:36 libpistache.a
#lrwxrwxrwx    1 root     root            16 Sep  6 05:36 libpistache.so -> libpistache.so.0
#lrwxrwxrwx    1 root     root            29 Sep  6 05:36 libpistache.so.0 -> libpistache.so.0.0.5.20220901
#-rwxr-xr-x    1 root     root       1544736 Sep  6 05:36 libpistache.so.0.0.5.20220901