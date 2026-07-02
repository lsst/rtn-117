#!/usr/bin/env python3
"""ASCII-fold gname/sname metadata in generated authors.tex for LaTeX compatibility."""

import re
import sys
import unicodedata
from pathlib import Path


def ascii_fold(text: str) -> str:
    return unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode("ascii")


def fix_authors_tex(text: str) -> str:
  def repl(match: re.Match[str]) -> str:
    key, value = match.group(1), match.group(2)
    return f"{key}='{ascii_fold(value)}'"

  return re.sub(r"(gname|sname)='([^']*)'", repl, text)


def main() -> None:
  path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("authors.tex")
  path.write_text(fix_authors_tex(path.read_text(encoding="utf-8")), encoding="utf-8")


if __name__ == "__main__":
  main()
