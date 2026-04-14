# AGENTS.md — AI assistant context for this repository

This file tells coding agents (e.g. Cursor) how to work **in this project**.  
Fill in the sections below; remove sections you do not need.

**Note:** This copy is listed in `.gitignore` so it stays local. To share team-wide agent guidance, use committed `.cursor/rules/` or a tracked doc and drop the ignore entry.

---

## Brief paper description

The Vera C. Rubin Observatory Legacy Survey of Space and Time (LSST) requires calibration products that provide uniform, stable, and accurate photometric and astrometric performance across the 3.2 gigapixel focal plane and throughout the 10-year survey.
This paper details the algorithms and workflows used to produce instrument calibrations and remove instrumental artifacts for Data Preview 2 (DP2)---the first end-to-end processing demonstration using on-sky data with the LSST Camera (LSSTCam).
We describe the verification, acceptance, and certification framework used to assess calibration quality and quantify residual systematics.
We show baseline metrics on calibrated science images to evaluate the robustness of the calibration and instrument signature removal (ISR) data processing pipelines for DP2.
Finally, we summarize the known limitations observed in DP2 production and outline expected algorithmic improvements for the first public LSST data release.

## Tech stack

- **Primary language / toolchain:** <!-- e.g. LaTeX (XeLaTeX / latexmk) -->
- **Key dependencies:** <!-- e.g. lsst-texmf submodule, aastex701 -->

## Build, test, and checks

```bash
# How to build the main artifact (edit to match your Makefile / workflow)
make
```

## Layout (where things live)

| Area | Purpose |
|------|---------|
| `RTN-117.tex` | Main entry |
| `body.tex`, `abstract.tex` | Content |
| `local.bib` | Bibliography |
| `figures/` | Figures |
| `lsst-texmf/` | Submodule / TeX support |

## Conventions and constraints

- Put every new sentence on a new line.
- Keep two new lines spaces between the end of a section and the start of a new one.
- Do not add any citations or bilbliography entries unless asked explicitly, or ask me for permission first.
- If a citation is likely needed somewhere, put a placeholder that looks like "(citation needed)".
- Do not remove author comments/TODOs unless asked.
- If you think I'm mistaken about any scientific claims, say so directly and explain the technical reason.
- Do not change (add or remove) scientific claims, results, or numbers without explicit instruction or confirmation.
- When proposing changes, highlight what changed (files/sections), why it changed, any open issues or TODOs.
- Use a first-person plural voice ("we").
- Define acronyms on first use, use only acronymns after.
- Use oxford comma when necessary.
- Figures should always be in .pdf format.
- All section labels begin with "\label{sec:name1}", and all nested subsections labels follow the same format, inheriting the earlier section names (e.g. "\label{sec:name1:name2:...}").
- No underscores should be in section or figure labels labels.
- Never go deeper than subsubsections.
- When you learn durable repo-specific workflow or preference information, add it to this repo's AGENTS.md under a new subsection called "Learned preferences".
- Never make changes to files when working on the `main` branch, unless I ask you to.
- Only edit text that I have staged or committed, never edit anyone else's stages or commits, unless I tell you too. If I tell you to do this, still ask me to confirm/accept before proceeding with edits. 
- Never leave empty spaces at the end of a line.

## Writing style references

- Refer to my documents in the folder "/Users/abrought/Desktop/projects/agent-context/writing-samples" for examples of my writing style.

## Links

- Github repo URL: https://github.com/lsst/rtn-117
