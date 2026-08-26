# Homebrew tap

This tap distributes [Proqi](https://github.com/oborchers/proqi), the thoughtpad for humans working with coding agents.

## Install

```shell
brew install oborchers/tap/proqi
```

Homebrew may ask you to trust this third-party formula. Trust only Proqi when whole-tap trust is unnecessary:

```shell
brew trust --formula oborchers/tap/proqi
```

## Upgrade

```shell
brew update
brew upgrade --formula oborchers/tap/proqi
```

Release archives, checksums, SBOMs, and attestations are published with each [Proqi release](https://github.com/oborchers/proqi/releases).

## Release synchronization

The Proqi release workflow sends a scoped GitHub App event after publishing a stable release. This tap validates the notified tag and source commit, independently verifies every release artifact, tests the candidate formula, and commits only the exact verified formula. An explicit manual workflow dispatch remains available for recovery. The tap does not poll for releases.

## License

The tap and Proqi are available under the MIT License.
