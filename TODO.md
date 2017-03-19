# TODO
 - Allow `Tooling#make` to resolve default forgeable if a `Forge` class is provided. I.e., if I do `make forge(:user)` it would resolve to `make forge(:user).user`.
 - Allow `Tooling#make` to take block
 - Build `Tooling#create` that persists models into the database using `#save!` (Should go into blacksmith_rails)
