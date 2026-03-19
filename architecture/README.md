# Architecture Diagrams

This directory contains auto-generated architecture diagrams for the MLOps multi-account Terraform infrastructure.

## Generated Files

- **architecture-diagram.md** - Mermaid diagram in markdown format (best for GitHub)
- **architecture-diagram.mmd** - Raw Mermaid syntax for editing
- **architecture-diagram.png** - Portable Network Graphics (raster)
- **architecture-diagram.svg** - Scalable Vector Graphics (with embedded icons)
- **architecture-diagram.jpg** - JPEG image (for presentations)

## How It Works

These diagrams are automatically generated from your Terraform code using the [auto-arch-diagram](https://github.com/suryakumaran2611/auto-arch-diagram) action on every PR that modifies `.tf` files.

### Workflow
1. Push a PR with Terraform changes
2. The workflow analyzes the infrastructure code
3. Generates visual architecture diagrams
4. Posts diagrams as PR comments
5. Automatically commits updated diagrams to this folder

## Viewing Diagrams

### On GitHub
The Mermaid diagram renders automatically in:
- Pull request comments
- This README.md file

### Locally
- **PNG**: Open with any image viewer
- **SVG**: Open in browser (best quality, includes professional icons)
- **JPG**: Open with any image viewer

## Interpreting the Diagrams

The diagrams show:
- **Nodes**: AWS/Azure/GCP cloud resources
- **Colors**: Grouped by resource category (Network, Compute, Storage, etc.)
- **Edges**: Dependencies and connections between resources
- **Layout**: Organized by lanes for better readability

## Customization

To customize diagram generation, edit `.github/workflows/auto-architecture-diagram.yml`:

```yaml
with:
  direction: LR              # Left-Right (or TB for top-bottom)
  image_formats: png,svg,jpg # Comma-separated formats
  iac_root: base-infrastructure/terraform  # Root terraform directory
```

## Troubleshooting

If diagrams aren't generating:
1. Check workflow logs: Actions → Auto Architecture Diagram → Latest run
2. Ensure `.tf` files are in the specified `iac_root` directory
3. Verify Graphviz dependencies are installed in the workflow

## More Information

- [auto-arch-diagram Documentation](https://github.com/suryakumaran2611/auto-arch-diagram)
- [Mermaid Diagram Syntax](https://mermaid.js.org/)
