# materialess.css

I use a custom theme based on **material**. It is more minimalist and compact—perfect not only for taking notes but also for personal blogs. However, honestly, I don't think it is designed for documentation.

Install [material](https://squidfunk.github.io/mkdocs-material/):

```sh
(env) pip install mkdocs-material
```

Modify `mkdocs.yml` and add the following:

```yml
theme: 
  name: material

extra_css:
  - theme/materialess.css

markdown_extensions:
  - pymdownx.superfences
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
```

Create a folder named `/theme` and copy the `materialess.css` theme there.

![materialess-mkdocs](https://github.com/naoyi/dots/tree/main/mkdocs/screenshots/materialess-mkdocs.png)