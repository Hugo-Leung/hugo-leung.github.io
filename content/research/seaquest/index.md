---
title: SeaQuest 
description:  Thesis project
date: "2023-11-21T10:02:54-06:00"
jobDate: 2018-2023
work: [SeaQuest]
tags: [charmonium, Drell-Yan]
thumbnail: seaquest/SeaQuest-logo.jpg 
projectUrl: https://www.phy.anl.gov/mep/drell-yan/ 
---

SeaQuest is a fixed-target experiment at Fermilab that measure the dimuon production from interaction of the 120 GeV proton beam on various targets.

My main work at SeaQuest is to extract the $\sigma_{pd}/2\sigma_{pp}$ Drell-Yan cross section ratio from the entire dataset.
The cross section ratio is particular useful in probing the light sea-quark asymmetry in the proton. At the leading-order,
the Drell-Yan process involves the annihilation of a quark and antiquark from the two colliding hadrons. 
{{< figure src="/images/DY.svg" width=500px >}}
The leading-order cross section is given by
$$ \frac{d\sigma_{DY}}{dx_{1}x_{2}} = \frac{4\pi\alpha^2}{9sx_{1}x_{2}} \sum_{q}e_{q}^{2} \left[f_{q/A}(x_{1})f_{\bar{q}/B}(x_{2})+f_{\bar{q}/A}(x_{1})f_{q/B}(x_{2})\right]$$
With a forward spectrometer, the acceptance dedicates that $x_{1}$ is usually larger than $x_{2}$, hence the $\sigma_{pd}/2\sigma_{pp}$ cross section ratio can be approximated as
$$ \frac{\sigma_{pd}}{2\sigma_{pp}}\approx \frac{1}{2}\left(1+\frac{\bar{d}(x_{2})}{\bar{u}(x_{2})}\right) $$
One major challenge in the analysis is separating the Drell-Yan signal from the combinatorial background, for which I have implemented a new mass spectrum decomposition procedure using TFractionFitter. The results using this mass spectrum decomposition have been reported in [here]({{< ref "/publications/2023-longpaper.md" >}}).

I have also worked on the extracting the charmonium production cross section from $p+p$ and $p+d$ interaction.
Unlike the Drell-Yan process which is mostly sensitive to the quark and antiquarks distributions, the charmonium production is also sensitive to the gluon distribution. At leading-order processes such as quark-antiquark annihilation and gluon fusion will contribute to charmonium production.
{{< figure src="/images/ccbar.svg" width=800px >}}
The same mass spectrum decomposition procedure is also used in the charmonium analysis.
Some preliminary results can be found [here]({{< ref "publications/2022-dis.md" >}}).
