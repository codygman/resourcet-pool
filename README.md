# `resourcet-pool`

![Hackage](https://img.shields.io/hackage/v/resourcet-pool)

`resource-pool` provides the `Pool` abstraction, which performs resource allocation. Independently, `resourcet` provides the `Acquire` abstraction, which also performs resource allocation, but also plugs into the `MonadResource` type class. This library provides a way of converting a `Pool` into an `Acquire`, if using `Acquire` functions is easier for your application.

This library exports a single function

```hs
poolToAcquire :: Pool a -> Acquire a
```

which pretty much does what it says on the box.
