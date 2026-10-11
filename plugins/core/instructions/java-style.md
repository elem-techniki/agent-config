## Java style

When writing Java:

- Streams instead of loops.
- Small, self-explanatory methods; no complex or deeply nested structures.
- Guard clauses and early returns instead of nested `if`/`else`.
- Names: methods are verbs, booleans read as questions (`isActive`, `hasItems`), no abbreviations.
- Never use `var`; always declare the type.
- Use specific collection types (`List`, `Set`, `Map`), not `Collection` or `Iterable`.
- Use `Optional` to avoid null issues, as a return type only: not for fields, parameters or collections. Return an empty collection instead of `null` or `Optional<List<…>>`.
- Collections are mutable by default (`new ArrayList<>()`, `Collectors.toCollection(ArrayList::new)`). Use immutable ones (`List.of()`, `Set.of()`, `Map.of()`, `Stream.toList()`) only when the collection must definitely never change; if unsure, mutable.
- Constructor injection only, never `@Autowired` on fields; dependencies are `private final`.
- Thin controllers: they only take the request and return the response. All the work happens in services.
- Controllers never expose JPA entities: use DTOs at the boundary, mapped in the service or a mapper.
- Error handling: services throw domain exceptions; a `@ControllerAdvice` turns them into HTTP responses. No try/catch in controllers.
- Tests: one behaviour per test, given/when/then layout, AssertJ assertions.
