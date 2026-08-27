---
title: SeaQuest 
description:  Thesis project
date: "2023-11-21T10:02:54-06:00"
jobDate: 2018-2023
work: [SeaQuest]
tags: [SeaQuest, Drell-Yan, Charmonium, E906]
thumbnail: seaquest/SeaQuest-logo.jpg 
projectUrl: https://www.phy.anl.gov/mep/drell-yan/ 
---


### Overview

SeaQuest (E906) is a fixed-target experiment at Fermilab designed to measure high-mass dimuons produced in proton–nucleon interactions. Its primary goal is to investigate the flavor asymmetry of the proton’s light antiquark sea. By comparing dimuon production on hydrogen and deuterium targets, SeaQuest probes the ratio of $\bar{d}$ to $\bar{u}$ over a broad kinematic range. These measurements extend earlier observations of sea-quark flavor asymmetry into a region of higher Bjorken‑$x$, helping clarify the origin of nonperturbative structure in the proton.

In addition to Drell–Yan production, SeaQuest collects a large sample of charmonium events. The resulting measurements of $J/\psi$ and $\psi(2S)$ production provide complementary sensitivity to gluon dynamics and quarkonium production mechanisms.



### Drell–Yan Analysis
My work on the Drell–Yan channel focused on extracting the cross-section ratio  
$$
\sigma(pd) / \left( 2 \, \sigma(pp) \right)
$$
which is directly connected to the $\bar{d}/\bar{u}$ flavor asymmetry in the proton. I performed the mass-spectrum decomposition needed to isolate the Drell–Yan signal from background contributions, using TFractionFitter-based techniques to separate dimuon sources across the full mass range. This included developing and validating the decomposition procedure, tuning fit constraints, and ensuring consistent behavior across all kinematic bins.
{{< figure src="DY_csr.png" width=500px >}}

I also contributed to Monte Carlo–related tasks, including implementing kinematic constraints in the generator and evaluating the systematic uncertainties associated with resolution smearing and model variations. These efforts supported the final extraction of the cross-section ratio over the full dataset. The results have been reported in [here]({{< ref "/publications/2023-longpaper.md" >}}) and [here]({{< ref "/publications/2025-dbar.md" >}}).



### Charmonium Analysis
Beyond the Drell–Yan channel, I worked on SeaQuest's measurement of charmonium production. This included extracting differential cross sections for both $J/\psi$ and $\psi(2S)$, performing mass-spectrum decomposition for signal separation, and validating fitting strategies across multiple kinematic regions. The analysis provides information on forward quarkonium production and helps test theoretical models such as NRQCD and color-evaporation approaches. Some results can be found [here]({{< ref "publications/2024-jpsi.md" >}}).
{{< figure src="jpsi_cs.jpg" width=500px >}}

## Summary

My SeaQuest work spans both Drell–Yan and charmonium measurements, with contributions to mass-spectrum decomposition, Monte Carlo development, uncertainty evaluation, and internal documentation. These analyses play an important role in mapping the proton’s sea-quark structure and in providing complementary insights into quarkonium production at high Bjorken‑$x$.
