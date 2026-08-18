# base image
FROM archlinux:latest AS final

# load in main build/system files
COPY system_files /
COPY build_files /build/

# run main build scripts
RUN --mount=type=tmpfs,dst=/tmp \
    bash /build/00-base.sh && \
    bash /build/01-packages.sh && \
    bash /build/02-systemd.sh && \
    bash /build/03-extras.sh && \
    bash /build/04-finalize.sh

# lint bootc image, don't remove
RUN bootc container lint

# rechunk image
FROM quay.io/coreos/chunkah AS chunkah
ARG CHUNKAH_CONFIG_STR=""
RUN --mount=from=final,src=/,target=/chunkah,ro \
    --mount=type=bind,target=/run/src,rw \
        chunkah build --skip-special-files > /run/src/out.ociarchive

# finalize
FROM oci-archive:out.ociarchive
ENTRYPOINT ["git"]
