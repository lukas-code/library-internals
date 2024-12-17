#!/bin/sh
set -ex
rustup toolchain install nightly --component rust-src
sysroot=$(rustc +nightly --print sysroot)
version=$(rustc +nightly --version | cut -d ' ' -f 2- | tr ' ' '\t')
RUSTFLAGS="
    -Z force-unstable-if-unmarked
" \
RUSTDOCFLAGS="
    -Z unstable-options
    -Z force-unstable-if-unmarked
    --document-private-items
    --document-hidden-items
    --show-type-layout
    --enable-index-page
    --default-theme ayu
    --crate-version ${version}
    " \
    cargo +nightly doc \
        --manifest-path "$sysroot/lib/rustlib/src/rust/library/Cargo.toml" \
        --target-dir target \
        --workspace
