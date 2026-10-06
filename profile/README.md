# ROSE-L-ARD

![License](https://img.shields.io/badge/license-Apache%202.0-blue)
![Python](https://img.shields.io/badge/python-3.13+-blue)

A prototype processor for Analysis-Ready Data (ARD) generation from Copernicus SAR missions:

- Coregistered Single-Look Complex (CSLC)
- Geocoded Multi-Looked Phase (GMLP)

The processor implements advanced SAR processing algorithms, including:

- Model-based co-registration
- Image matching
- Enhanced Spectral Diversity (ESD)
- Split-Spectrum processing
- Multi-interferogram combination

The processor enables cloud-native SAR processing through [Xarray](https://xarray.pydata.org) and [Dask](https://dask.org).

This open-source project is funded by the [European Space Agency (ESA)](https://www.esa.int/) under the *Prototype Processor for ARD of Copernicus SAR Missions* project.

---

## Features

- CSLC generation for time-series analysis and interferometric applications
- GMLP generation for large-scale interferometric monitoring
- Cloud-native architecture based on Xarray and Dask
- Distributed processing capabilities
- Scalable SAR data management and analysis
- Support for advanced multi-temporal SAR processing workflows

---

## CSLC

Image co-registration aligns two or more images so that each pixel corresponds to the same point on the ground, potentially achieving sub-pixel accuracy. This step is fundamental for generating multidimensional image stacks and enabling advanced time-series analysis.

SAR interferometry, particularly multi-interferogram techniques such as Persistent Scatterer Interferometry (PSI), Small Baseline Subset (SBAS), and Distributed Scatterer (DS) approaches, represents one of the primary applications of co-registered images.

The consistent availability of freely accessible global acquisitions from Sentinel-1, together with upcoming missions such as NISAR and ROSE-L, offers significant opportunities to expand the adoption of advanced interferometric techniques.

To achieve this objective, it is essential to address mission-specific challenges related to SAR acquisition modes while maximizing independence from acquisition geometry. Advanced processing techniques are employed to mitigate artifacts and provide high-quality products to end users.

---

## GMLP

The Geocoded Multi-Looked Phase (GMLP) product is a multi-looked ARD product designed for large-scale interferometric applications.

The product is inspired by intermediate products commonly generated within PS/DS and SBAS processing chains before phase unwrapping (Guarnieri & Tebaldini, 2008; Ansari et al., 2017; Fornaro et al., 2015; Pepe, 2019).

GMLP is intended to simplify access to interferometric measurements, which are traditionally difficult to exploit directly. Compared to full-resolution interferograms, the product:

- Provides reduced phase noise through multi-looking
- Minimizes long-term phase drifts related to vegetation effects
- Significantly reduces storage requirements compared to a full CSLC stack

The product is initially generated in radar coordinates on a subset of the original SLC grid. This intermediate product is referred to as **CMLP** (*Co-registered Multi-Looked Complex*). After geocoding, the final product is delivered as **GMLP**.

Several approaches have been proposed in the literature for generating this type of product. The solution adopted by this processor has the following characteristics:

- Enables continuous product updates as new acquisitions become available
- Incorporates long-term phase drift correction
- Minimizes computational and I/O requirements

---

## Installation

```bash
git clone https://github.com/ROSE-L-ARD/rose-l-ard.git
cd rose-l-ard

# Installation instructions
...
```

## Test Installation

```bash
# Validation tests
...
```

---

## Contributing

The main repository is hosted on GitHub:

**https://github.com/ROSE-L-ARD**

Bug reports, feature requests, testing activities, and code contributions are highly appreciated.

### Lead Developer

- [Federico Minati](https://github.com/effeminati) – [B-Open](https://bopen.eu)

### Main Contributors

- [Francesco Vecchioli](https://github.com/) - [B-Open](https://bopen.eu)
- [Francesco DeZan](https://github.com/fdz-insar) – [DeltaPhi](https://www.delta-phi.eu/)
- [Juan M. Lopez-Sanchez](https://github.com/juanma-lopez) – [University of Alicante](https://www.ua.es/en/)
- [Paco López-Dekker](https://github.com/pakodekker) – [TU Delft](https://www.tudelft.nl/en/)

ect contributors in the GitHub repository.

---

## Acknowledgements

We gratefully acknowledge the support of the following organizations:

- **European Space Agency (ESA)** for funding the project and contributing to its technical roadmap.
- **Comisión Nacional de Actividades Espaciales (CONAE)** and **Agenzia Spaziale Italiana (ASI)** for providing L-band SAOCOM SAR data used during prototype development, analysis, and validation activities.

---

## Sponsorship

[B-Open](https://bopen.eu) is committed to maintaining the project in the long term and welcomes sponsorships to support the development of new features and capabilities.

---

## License

```text
Copyright @ 2026 B-Open Solutions S.r.l.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

---

<div align="center">

  <h3>Partners & Contributors</h3>
  <p>
    <a href="https://bopen.eu" target="_blank">
      <img alt="B-Open" src="https://github.com/user-attachments/assets/a562411b-53f9-4f8e-9133-eda0dfd3ba7c" height="45" style="margin: 0 15px;"/>
    </a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="https://www.delta-phi.eu/" target="_blank">
      <img alt="DeltaPhi" src="https://github.com/user-attachments/assets/c8c5b1f6-3c28-44d4-9927-2616c38b266d" height="45" style="margin: 0 15px;"/>
    </a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="https://www.ua.es/en/" target="_blank">
      <img alt="University of Alicante" src="https://github.com/user-attachments/assets/fa266aa7-909a-4b35-9374-441533e7366a" height="45" style="margin: 0 15px;"/>
    </a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="https://www.tudelft.nl/en/" target="_blank">
      <img alt="TU Delft" src="https://github.com/user-attachments/assets/3b50bda1-8726-4602-8be3-f833c0c38dfe" height="45" style="margin: 0 15px;"/>
    </a>
  </p>

  <h3>Space Agencies</h3>
  <p>
    <a href="https://www.esa.int/" target="_blank">
      <img alt="ESA" src="https://github.com/user-attachments/assets/29b559a8-46b8-420e-9638-d66ad5c91cdb" height="45" style="margin: 0 15px;"/>
    </a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="https://www.argentina.gob.ar/conae" target="_blank">
      <img src="https://github.com/user-attachments/assets/bf303750-ecef-43ed-b28c-661a1e9c80bf" alt="CONAE" height="55" style="margin: 0 15px;"/>
    </a>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <a href="https://www.asi.it/" target="_blank">
      <img src="https://github.com/user-attachments/assets/876c7892-5d84-4820-9b86-161ea387744d" alt="ASI" height="55" style="margin: 0 15px;"/>
    </a>
  </p>

  <br/>

</div>
