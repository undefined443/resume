# Résumé

A mordern fork of [billryan/resume](https://github.com/billryan/resume)

## Features

- Font Awesome 7 support

## Usage

1. Clone the project.

   ```
   git clone https://github.com/undefined443/resume.git --branch main --single-branch --depth 1
   ```

2. Install Font Awesome 7 macro.

   ```sh
   tlmgr install fontawesome7
   ```

3. If you need to compile resume-zh_CN, install the Noto CJK fonts.

   ```sh
   brew install --cask font-noto-serif-cjk-sc font-noto-sans-cjk-sc  # macOS
   sudo apt install fonts-noto-cjk  # Debian
   ```

4. Compile the project.

   ```sh
   latexmk
   ```
