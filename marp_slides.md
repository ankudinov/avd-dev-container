---
marp: true
theme: default
class: invert
author: Petr Ankudinov
# size 16:9 1280px 720px
size: 16:9
paginate: true
math: mathjax
# backgroundImage: "linear-gradient(to bottom, #abbaab, #ffffff)"
# #ece9e6, #ffffff
# #8e9eab, #eef2f3
# #e6dada, #274046
# #abbaab, #ffffff
style: |
    :root {
      background: linear-gradient(to bottom, #000000, #434343);
    }
    img[alt~="custom"] {
      float: right;
    }
    .columns {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      gap: 1rem;
    }
    footer {
      font-size: 14px;
    }
    section::after {
      font-size: 14px;
    }
    img {
      background-color: transparent;
    }
    pre {
        background: linear-gradient(to top, #000000, #434343);
        background-color: transparent;
    }
---

# The 3 AVD Containers Problem

<!-- Do not add page number on this slide -->
<!--
_paginate: false
-->

```text
Three Containers - Endless Possibilities
Petr Ankudinov
                                      Jan 2024
```

![bg right:65%](img/5_4_800_36_downscaled.gif)

---

# Origins

<style scoped>section {font-size: 20px;}</style>

- Arista AVD collection can be [installed manually](https://avd.sh/en/stable/docs/installation/collection-installation.html)

  - Very feasible in many cases and not going anywhere
  - Do this at your own risk. You may encounter weird problems, especially if environment has some history

- [AVD all-in-one container](https://github.com/arista-netdevops-community/avd-all-in-one-container)

  - Was never officially documented or advertised, but quite actively used anyway. Around 60K total downloads so far.
  - Can be used as dev container (with some modifications) or standalone
  - It was never integrated with AVD CI and must be manually updated on every release
  - A lot of complexity to maintain
  - No plans to support it long term

- [Ansible Automation Platform](https://www.redhat.com/en/technologies/management/ansible)

  - Out of scope. For customers heavily relying on RedHat support and internal Ansible ecosystem

---

# AVD Dev Containers

<style scoped>section {font-size: 24px;}</style>

```text
python:3.{9-11}-slim-bullseye
│
│               <--- trigger CI on every AVD release, pre-release, merge
│
└> base         :python3.{9-11}, latest
   │
   ├> dev       :python{9-11}, latest
   └> universal :python3.{9-11}-avd-devel, python3.{9-11}-avd-v4.5.0, latest
```

- Common use cases:

  - `base` - not to be used directly, base for all other images
  - `dev` - AVD contributors and testing new features/branches. AVD collection is not pre-installed
  - `universal` - AVD collection is pre-installed, ready to use

- All containers are <u>multi-platform</u> - linux/arm64, linux/amd64
