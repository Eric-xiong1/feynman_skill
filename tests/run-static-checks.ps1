$ErrorActionPreference = "Stop"

$ProjectRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$SkillRoot = Join-Path $ProjectRoot "feynman"
$SkillFile = Join-Path $SkillRoot "SKILL.md"

$requiredFiles = @(
  "README.md",
  "CHANGELOG.md",
  "LICENSE",
  "RELEASE_NOTES.md",
  "feynman/SKILL.md",
  "feynman/references/styles.md",
  "feynman/references/audiences.md",
  "feynman/references/personas.md",
  "feynman/references/concept-tree.md",
  "tests/manual-pressure-scenarios.md",
  "tests/trigger-matrix.md"
)

$failures = New-Object System.Collections.Generic.List[string]

foreach ($relativePath in $requiredFiles) {
  $path = Join-Path $ProjectRoot $relativePath
  if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
    $failures.Add("Missing required file: $relativePath")
  }
}

if (Test-Path -LiteralPath $SkillFile -PathType Leaf) {
  $skillText = Get-Content -Raw -Encoding UTF8 -LiteralPath $SkillFile

  if ($skillText -notmatch "(?m)^name:\s*feynman\s*$") {
    $failures.Add("SKILL.md frontmatter must contain name: feynman")
  }

  if ($skillText -notmatch "(?m)^description:\s*Use when ") {
    $failures.Add("SKILL.md description must start with 'Use when'")
  }

  foreach ($forbiddenDescription in @("asks to explain a hard concept", "needs to teach a concept to someone")) {
    if ($skillText -like "*$forbiddenDescription*") {
      $failures.Add("SKILL.md description is too broad: $forbiddenDescription")
    }
  }

  foreach ($needle in @("Default Flow", "Routing", "Output Standards", "Automatic Trigger Contract", "Confusion signals", "Plain-language signals", "Learning-mode signals", "Non-trigger boundaries", "requires both material and signal", "references/audiences.md", "references/styles.md", "references/personas.md", "references/concept-tree.md")) {
    if ($skillText -notlike "*$needle*") {
      $failures.Add("SKILL.md missing required product contract text: $needle")
    }
  }
}

$allMarkdown = Get-ChildItem -LiteralPath $ProjectRoot -Recurse -File |
  Where-Object { $_.Extension -eq ".md" } |
  Where-Object { $_.FullName -notmatch "\\docs\\plans\\" }

foreach ($file in $allMarkdown) {
  $text = Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
  foreach ($badPattern in @("\[TODO", "TODO:", "example_asset", "api_reference", "Structuring This Skill")) {
    if ($text -match [regex]::Escape($badPattern)) {
      $relative = Resolve-Path -LiteralPath $file.FullName -Relative
      $failures.Add("Template or placeholder text found in ${relative}: $badPattern")
    }
  }
}

if ($failures.Count -gt 0) {
  Write-Host "Static checks failed:" -ForegroundColor Red
  foreach ($failure in $failures) {
    Write-Host " - $failure" -ForegroundColor Red
  }
  exit 1
}

Write-Host "Static checks passed." -ForegroundColor Green
