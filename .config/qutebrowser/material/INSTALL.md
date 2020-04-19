### [qutebrowser](https://www.qutebrowser.org/)

#### Activating theme

- Find your *[qutebrowser configuration directory](https://www.qutebrowser.org/doc/help/configuring.html#configpy)* (see e.g. `:version` in qutebrowser). This folder should be located at the "config" location listed on qute://version, which is typically ~/.config/qutebrowser/ on Linux, ~/.qutebrowser/ on macOS, and %APPDATA%/qutebrowser/config/ on Windows.
- Move the repository folder to `dracula` inside the configuration directory.
- In your [qutebrowser config.py file](https://www.qutebrowser.org/doc/help/configuring.html#configpy), include the following:

```python
import material.draw

# Load existing settings made via :set
config.load_autoconfig()

material.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})
```
