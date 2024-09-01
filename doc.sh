#!/bin/sh
set -ex
rustup toolchain install nightly --component rust-src
sysroot=$(rustc +nightly --print sysroot)
RUSTDOCFLAGS='-Z unstable-options
    --document-private-items
    --document-hidden-items
    --show-type-layout
    --enable-index-page
    ' \
    cargo +nightly doc --manifest-path "$sysroot/lib/rustlib/src/rust/library/Cargo.toml" --target-dir target
