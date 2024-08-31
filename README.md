# Homebrew Formula for MPR (Multiple Pull Request) Tool

This repository contains the Homebrew Formula for the MPR tool, which allows you to create pull requests for updating a specific file or directory across multiple GitHub repositories simultaneously.

## Installation

To install MPR using this formula, run the following commands:

```bash
brew tap koriym/mpr
brew install mpr
```

## Dependencies

This formula depends on:

- [GitHub CLI (gh)](https://cli.github.com/)

The `gh` dependency will be automatically installed by Homebrew if it's not already present on your system.

## Post-Installation

After installation, make sure to authenticate GitHub CLI:

```bash
gh auth login
```

Ensure your token has the necessary scopes: `repo`, `workflow`, and `read:org`.

## Usage

After installation, you can use the `mpr` command from anywhere in your terminal:

```bash
mpr <file_or_directory_path> <commit_message> <repo1> <repo2> ...
```

Example:
```bash
mpr .github/workflows/ci.yml "Update CI workflow" owner1/repo1 owner2/repo2
```

## Updating

To update MPR to the latest version, run:

```bash
brew update
brew upgrade mpr
```

## Troubleshooting

If you encounter any issues:

1. Make sure GitHub CLI is authenticated:
   ```bash
   gh auth status
   ```

2. Verify the installation:
   ```bash
   brew info mpr
   ```

3. If problems persist, try reinstalling:
   ```bash
   brew uninstall mpr
   brew install mpr
   ```

## Maintaining the Formula

### Updating the SHA256 Hash

When a new version of MPR is released, you need to update the `sha256` hash in the formula. Here's how to do it:

1. Ensure you have the latest version of the formula:
   ```bash
   brew update
   ```

2. Edit the formula to update the version number and URL:
   ```bash
   brew edit mpr
   ```

3. After updating the version and URL, run the following command to calculate the new SHA256 hash:
   ```bash
   brew fetch mpr --build-from-source
   ```

4. Copy the new SHA256 hash from the output and update it in the formula.

5. Test the updated formula:
   ```bash
   brew install --build-from-source mpr
   brew test mpr
   ```

6. If everything works correctly, commit your changes and push them to the repository.

## Contributing

If you encounter any problems or have suggestions for improvements, please open an issue or submit a pull request in the [MPR repository](https://github.com/koriym/mpr).

## License

MPR is released under the MIT License. See the [LICENSE](https://github.com/koriym/mpr/blob/main/LICENSE) file in the main repository for more details.
