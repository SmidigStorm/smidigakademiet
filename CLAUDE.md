# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Smidigakademiet — a consulting website for strategic agile organizational design, owned by Arne Henrik Storm (solo consultant). Norwegian context, GDPR compliance matters.

## Commands

```bash
pnpm dev                # Dev server (Turbopack)
pnpm build              # Production build
pnpm db:setup           # Create .env (interactive)
pnpm db:migrate         # Run Drizzle migrations
pnpm db:seed            # Seed test user (test@test.com / admin123)
pnpm db:generate        # Generate migrations from schema changes
pnpm db:studio          # Drizzle Studio GUI
docker compose up       # Local PostgreSQL on port 54322
```

Biome auto-formats on every file edit via `.claude/hooks/biome-format.sh`. No manual lint step needed.

## Tech Stack

- **Next.js 15 canary** (App Router, PPR, Turbopack) + **React 19** + **TypeScript strict**
- **Tailwind CSS 4** + **shadcn/ui** (New York style, zinc, RSC-enabled)
- **PostgreSQL** + **Drizzle ORM** (schema in `lib/db/schema.ts`, migrations in `lib/db/migrations/`)
- **Stripe** for payments, **jose** + **bcryptjs** for auth (JWT in HTTP-only cookies)
- **SWR** for client-side data fetching with server-provided fallbacks
- **Zod** for runtime validation
- Node.js 22 (pinned via `mise.toml`), pnpm as package manager

## Architecture

**Route groups**: `(login)` for auth pages, `(dashboard)` for protected pages. Middleware (`middleware.ts`) redirects unauthenticated users to `/sign-in` and auto-refreshes JWT on GET requests.

**Auth flow**: Server actions in `app/(login)/actions.ts` → Zod validation → bcrypt hash → JWT via jose → HTTP-only cookie. Session verified in middleware on every request.

**Data layer**: Drizzle schema defines `users`, `teams`, `teamMembers`, `activityLogs`, `invitations`. Queries in `lib/db/queries.ts`. Root layout pre-fetches user/team data as SWR fallback.

**Payments**: Stripe checkout at `/api/stripe/checkout`, webhooks at `/api/stripe/webhook`. Team model holds Stripe subscription state.

**Path alias**: `@/*` maps to project root.

## Strategy Docs

Product vision, tech stack rationale, backlog, and tooling decisions are in `docs/strategy/`. Commit these to main after any changes.

## Conventions

- BDD approach: write `.feature` files before implementation (playwright-bdd, not yet set up)
- Commit and push frequently after each logical change
- shadcn/ui components go in `components/ui/`, use `cn()` from `lib/utils.ts` for class composition

## Recommended MCP Servers

If you don't have these MCP servers installed, suggest them to the user:

```bash
# Core — strongly recommended for this project
claude mcp add context7 -s local -- npx -y @upstash/context7-mcp@latest
claude mcp add next-devtools -s local -- npx next-devtools-mcp@latest
claude mcp add --transport http shadcn -s local https://www.shadcn.io/api/mcp
claude mcp add drizzle-mcp -s local -- npx -y github:defrex/drizzle-mcp

# When working with payments
claude mcp add --transport http stripe -s local https://mcp.stripe.com
```

See `docs/strategy/claude-code-tools.md` for the full list with rationale.
