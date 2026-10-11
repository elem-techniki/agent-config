## Java style

When writing Java:

- Streams instead of loops.
- Small, self-explanatory methods; no complex or deeply nested structures.
- Thin controllers: they only take the request and return the response. All the work happens in services.
- Use `Optional` to avoid null issues.
