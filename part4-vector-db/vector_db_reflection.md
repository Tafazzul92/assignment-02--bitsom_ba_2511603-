
## Vector DB Use Case

A traditional keyword-based database search would **not** be sufficient for a law firm searching 500‑page contracts using natural language questions. Keyword search relies on exact or near‑exact word matches and cannot understand context, legal intent, or semantic meaning. For example, a lawyer asking, *“What are the termination clauses?”* may expect sections mentioning *contract end*, *expiry rights*, *breach consequences*, or *cancellation terms*. These phrases may not contain the literal keyword “termination,” causing keyword search to miss important clauses or return irrelevant results.

A vector database solves this by storing **embeddings**—numerical representations that capture meaning rather than words. When lawyers ask questions, the system converts the query into an embedding and retrieves semantically similar contract sections. This allows it to understand that “terminate,” “cancel,” “void,” and “end the agreement” are conceptually related. Vector search also works well on long, unstructured text, where keywords are inconsistent or legal language varies across documents.

Furthermore, vector databases support hybrid search (semantic + keyword), re-ranking, and contextual retrieval, enabling higher accuracy in legal research workflows. Combined with LLMs, the system can provide summaries or structured answers grounded in retrieved contract text.

Thus, a vector database is essential for accurate, context-aware, and lawyer-friendly contract search, making it far superior to traditional keyword-based systems.
