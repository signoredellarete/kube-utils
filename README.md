# kube-utils
Little collection of kubernetes custom commands for Linux shell (bash).

## List of binaries
> The reported software versions are related to the files in this repository, but the `install.sh` script will download and install the latest available versions for all the third party binaries.

- ns (v1.0)
- ctx (v1.0)
- apply-yaml (v1.0)
- del-yaml (v1.0)
- kubectl-neat (v2.0.3) - from [iatysk - kubectl-neat](https://github.com/itaysk/kubectl-neat)
- yq (v4.34.1) - from [mikefarah - yq](https://github.com/mikefarah/yq)

## Installation

```
git clone https://github.com/signoredellarete/kube-utils.git
cd kube-utils
bash install.sh
```

## Utilization
Each binary or script has its own help explaining how to use it.
In order to view the command help run `<command> --help`.

Ex.
```
$ ns --help
Usage:
   ns                      Returns current namespace
   ns <namespace>          Switch current namespace to <namespace>
   ns --list               List all namespaces

   ns --help               Show this help
```
