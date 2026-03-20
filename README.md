# slvn.skills

Claude Code plugin marketplace with a growing collection of production-grade skills.

## Install

```bash
# Add marketplace (one-time)
/plugin marketplace add SLVN_USERNAME/slvn.skills

# Browse available plugins
/plugin
```

## Available Plugins

| Plugin | Category | Description |
|--------|----------|-------------|
| `ux-product-designer` | Design | Senior UX/Product designer — user flows, heuristic audits, wireframes. Every decision backed by named principles. |
| `sales-deck-builder` | Design | Sales-focused HTML slider presentations using Tailgrids — persuasive copywriting, speaker notes, Vercel deploy. |

### Install a plugin

```bash
/plugin install ux-product-designer@slvn-skills
```

---

## ux-product-designer

Evidence-based UX design skill for Claude Code. Covers mobile, tablet, and desktop.

**Workflows:**
- Design user flows from scratch (Mermaid diagrams + screen specs)
- Audit existing interfaces (Nielsen's 10 heuristics, severity ratings)
- Generate text wireframes (element inventory, interactions, responsive rules)

**Knowledge base:** Nielsen's 10, Shneiderman's 8, Fitts's/Hick's/Miller's law, Gestalt principles, WCAG 2.1 AA, Apple HIG, Material Design 3, 10 proven flow patterns.

**Key feature:** Every recommendation includes `WHY: [Principle] — [explanation]`. No gut feelings allowed.

**Triggers on:** "design a flow", "audit this UX", "wireframe this screen", "plan navigation", "what screens do I need", "critique this interface", and similar.

---

## sales-deck-builder

Sales-focused HTML presentation skill for Claude Code. Generates persuasive slider decks deployed to Vercel.

**Workflows:**
- Build full sales decks as HTML sliders (Tailgrids components)
- Write persuasive copywriting per slide with speaker notes
- Deploy to Vercel with one command

**Key feature:** Every slide includes a speaker note block and a clear CTA structure.

**Triggers on:** "build a sales deck", "create a pitch", "make a presentation", "deploy a slider", and similar.

```bash
/plugin install sales-deck-builder@slvn-skills
```

---

## Adding New Skills

Each plugin lives in `plugins/[plugin-name]/` and follows this structure:

```
plugins/new-skill/
├── .claude-plugin/
│   └── plugin.json
└── skills/
    └── new-skill/
        ├── SKILL.md
        └── references/    # optional
```

After adding, register the plugin in `.claude-plugin/marketplace.json`.

## License

MIT
