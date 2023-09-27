FROM ubuntu:22.04

# https://pkg.cloudflareclient.com/
RUN apt update && \
    apt install curl gpg socat lsb-release -y && \
    curl https://pkg.cloudflareclient.com/pubkey.gpg | \
    gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/cloudflare-client.list && \
    apt update && \
    apt install cloudflare-warp -y

COPY --chmod=755 entrypoint.sh entrypoint.sh

VOLUME ["/var/lib/cloudflare-warp"]
CMD ["./entrypoint.sh"]