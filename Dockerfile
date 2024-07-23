# Build Image
ARG RUST_IMAGE_TAG=1.79
FROM --platform=linux/amd64 rust:${RUST_IMAGE_TAG} as builder
ARG SOLANA_CLI=v1.18.16
# Install Solana CLI
RUN curl -sSfL "https://release.solana.com/${SOLANA_CLI}/install" | sh
# Make sure Solana PATH is added to environment
ENV PATH="/root/.local/share/solana/install/active_release/bin:${PATH}"

# Usage image to build
FROM --platform=linux/amd64 builder
COPY . .
CMD ["cargo", "build-sbf"]
