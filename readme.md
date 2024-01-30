





# Springboot-Demos

- demotjwa.sh
  > Pulls the Tanzu Java Web App Spring Boot 2.7 project.  Upgrades it to Spring Boot v3.2.2, builds normally and as native image.  Produces Table to compare startup speed and memory utilization.

- demonative.sh
  > Pulls the "Hello Spring" Spring Boot 2.6 project.  Upgrades it to Spring Boot v3.2.2, builds normally and as native image.  Produces Table to compare startup speed and memory utilization.

- demonative.sh
  > Pulls the Tanzu Java Web App Spring Boot 2.7 project.  Upgrades it to Spring Boot v3.2.2, builds normally.  Produces Table to compare startup speed and memory utilization.  Faster.

- buildimage.sh
  > builds container image with necessary dependencies to run demo scripts within.  




# OpenRewrite Spring Boot Upgrade Example

## Prerequisites
- [SDKMan](https://sdkman.io/install)
  > i.e. `curl -s "https://get.sdkman.io" | bash`
- [Httpie](https://httpie.io/) needs to be in the path
  > i.e. `brew install httpie`
- bc, pv, zip, unzip, gcc, zlib1g-dev
  > i.e. `sudo apt install bc, pv, zip, unzip, gcc, zlib1g-dev -y`
- [Vendir](https://carvel.dev/vendir/)
  > i.e. `brew tap carvel-dev/carvel && brew install vendir`

## Quick Start
```bash
./demonative.sh
```

## Attributions
- [Demo Magic](https://github.com/paxtonhare/demo-magic) is pulled via `vendir sync`
- Forked from [DaShaun Carter's OpenRewrite Spring Boot Upgrade Example](https://github.com/dashaun/openrewrite-spring-boot-upgrade-example)
