# Claude Code Tools — MCP Servers, Plugins & Skills

Tools to enhance Claude Code for developing Smidigakademiet.

## Install Now

MCP servers the team has decided to use.

### shadcn/ui MCP
- **URL**: https://www.shadcn.io/mcp
- **Install**: `claude mcp add --transport http shadcn https://www.shadcn.io/api/mcp`
- **What it does**: Connects Claude directly to the shadcn/ui component registry. Provides accurate TypeScript props, docs, and current working examples.
- **Why**: Accurate component generation instead of hallucinated APIs. Critical for our React 19 + shadcn stack.

### Next.js DevTools MCP (Vercel)
- **URL**: https://github.com/vercel/next-devtools-mcp
- **Install**: `claude mcp add next-devtools npx next-devtools-mcp@latest`
- **What it does**: Real-time access to the Next.js dev server — build errors, runtime errors, type errors, page routes, Server Actions inspection, and a Next.js knowledge base.
- **Why**: Claude sees actual build/runtime errors, making debugging dramatically more efficient.

### Playwright MCP (Microsoft)
- **URL**: https://github.com/microsoft/playwright-mcp
- **Install**: `claude mcp add playwright npx @anthropic-ai/playwright-mcp@latest`
- **What it does**: Browser automation via Playwright — page interaction, screenshots, accessibility snapshots, and test generation.
- **Why**: Lets Claude interact with the actual browser for testing and debugging. Complements our playwright-bdd setup.

## Recommended — High Impact

### Stripe MCP (Official)
- **URL**: https://docs.stripe.com/mcp
- **Install**: `claude mcp add --transport http stripe https://mcp.stripe.com`
- **What it does**: Stripe operations (customers, payments, products, invoices) and documentation search. Use restricted API keys.
- **Why**: Build and debug payment flows without leaving the terminal. Stripe is already in our stack.

### Context7 (Upstash)
- **URL**: https://github.com/upstash/context7
- **Install**: `claude mcp add context7 npx context7-mcp@latest`
- **What it does**: Injects up-to-date, version-specific library documentation into Claude's context. Covers a massive database of libraries.
- **Why**: Prevents hallucinated APIs. Gives Claude current docs for Next.js 15, Drizzle, Tailwind, etc.

### GitHub MCP (Official)
- **URL**: https://github.com/github/github-mcp-server
- **What it does**: Repository browsing, issue/PR management, CI/CD workflow monitoring, GitHub Actions analysis, code search.
- **Why**: Manage issues, PRs, and Actions workflows from Claude Code.

### Drizzle MCP
- **URL**: https://github.com/defrex/drizzle-mcp
- **Install**: `claude mcp add drizzle-mcp npx drizzle-mcp`
- **What it does**: Drizzle ORM operations — schema management, migration generation, raw SQL, schema introspection. Loads `.env.local` automatically.
- **Why**: Directly integrates with our Drizzle + PostgreSQL setup.

### Vercel MCP (Official)
- **URL**: https://vercel.com/docs/mcp/vercel-mcp
- **What it does**: Manage deployments, projects, environment variables, DNS records, domains, and search Vercel docs.
- **Why**: Check deployment status, analyze errors, manage env vars without the dashboard.

## Recommended — Plugins

### security-guidance
- **Install**: `/plugin install security-guidance`
- **What it does**: Pre-tool hook that warns Claude when it's about to write code with potential security vulnerabilities. Detects command injection, XSS, unsafe patterns, etc.
- **Why**: Automatic security guardrails. Important for a site handling Stripe payments.

### pr-review-toolkit
- **Install**: `/plugin install pr-review-toolkit`
- **What it does**: 6 specialized review agents for automated PR code review — bug detection, historical context, code comments.
- **Why**: Solo developer with no one else to review PRs.

## Install When Needed

### Resend MCP
- **URL**: https://github.com/resend/mcp-send-email
- **What it does**: Send emails via Resend API from Claude Code. Supports HTML, scheduling, CC/BCC.
- **When**: When building and testing email flows (class confirmations, reminders).

### Figma MCP (Official)
- **URL**: https://github.com/figma/mcp-server-guide
- **What it does**: Pull design context from Figma Dev Mode — spacing, colors, typography, layout. Outputs React + Tailwind by default.
- **When**: When translating designs to components. Requires Figma Dev or Full seat.

### Sentry MCP
- **URL**: https://docs.sentry.io/product/sentry-mcp/
- **Install**: `claude mcp add --transport http sentry https://mcp.sentry.dev/mcp`
- **What it does**: Pull issue context, trigger AI analysis, get fix recommendations from Sentry.
- **When**: After setting up Sentry for production error monitoring.

### Chrome DevTools MCP
- **URL**: https://github.com/ChromeDevTools/chrome-devtools-mcp
- **What it does**: Access Chrome DevTools from Claude — network requests, console messages, screenshots, DOM snapshots, JS evaluation.
- **When**: For deep browser debugging sessions.

### vitest-mcp
- **URL**: https://github.com/djankies/vitest-mcp
- **What it does**: AI-optimized Vitest runner with structured output, log capturing, and line-by-line coverage analysis.
- **When**: For structured test results and coverage gap analysis.

### GitMCP
- **URL**: https://gitmcp.io/
- **What it does**: Turns any GitHub repo into a documentation source. Use `gitmcp.io/{owner}/{repo}` for specific libraries.
- **When**: For accessing docs of niche libraries (Fumadocs, playwright-bdd) that Context7 might not cover.

### Firecrawl MCP
- **URL**: https://github.com/firecrawl/firecrawl-mcp-server
- **What it does**: Turns any website into clean, LLM-ready data. Handles JS rendering and anti-bot measures.
- **When**: For scraping competitor sites or extracting structured web data.

## Hooks (no install needed)

### Biome Auto-Format Hook
- **Config**: Add to `.claude/settings.json`
- **What it does**: Run `biome check --write` automatically after Claude edits TypeScript/JavaScript files. Feed lint errors back for immediate fixing.
- **Reference**: https://code.claude.com/docs/en/hooks-guide
- **Why**: No Biome MCP server exists yet. Hooks are the current best approach.

## Curated Lists for Discovery

| Resource | URL |
|----------|-----|
| awesome-mcp-servers (wong2) | https://github.com/wong2/awesome-mcp-servers |
| awesome-mcp-servers (punkpeye) | https://github.com/punkpeye/awesome-mcp-servers |
| Official MCP Server Registry | https://github.com/modelcontextprotocol/servers |
| awesome-claude-code | https://github.com/hesreallyhim/awesome-claude-code |
| SkillsMP | https://skillsmp.com/ |
