## Commit messages

- [Conventional Commits](https://www.conventionalcommits.org): `type(scope): summary`.
- Types: `feat`, `fix`, `refactor`, `test`, `docs`, `chore`, `ci`, `build`.
- Scope is optional: the area touched. A project's CLAUDE.md may list its scopes.
- Summary: imperative, lower case, no trailing period, ≤ 72 chars.
- Body (optional, after a blank line): what and why, not how. Reference issues with `Refs #N` / `Closes #N`.
- Breaking changes: `!` after the type (`feat(api)!: …`) plus a `BREAKING CHANGE:` footer.
- PR titles follow the same format.
- No AI attribution anywhere: no `Co-Authored-By`/`Claude-Session` trailers in commits, no "Generated with Claude Code" lines in PRs or comments.
