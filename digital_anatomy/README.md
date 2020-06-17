# Anatomía digital por imágenes
---
## Modalidades de imágenes médicas

 - Rayos X / X-rays
 - Tomografía computarizada / Computed Tomography (CT)
 - Resonancia Magnética / Magnetic Resonance Imaging (MRI):
  - [Introduction to MRI physics](http://fsl.fmrib.ox.ac.uk/fslcourse/physics+apps/2019/fsl_introMRI.pdf), slides by Mark Chiew
 - Ultrasonido / Ultrasound (US)
 - Tomografía por emisión de positrones / Positron Emission Tomography (PET)

Breve resumen de sus diferencias y usos: [link](https://blog.radiology.virginia.edu/different-imaging-tests-explained/)

---

## Formatos de las imágenes médicas

### El estándar DICOM

[DICOM](https://www.dicomstandard.org/) (Digital Imaging and Communications in Medicine) es el estándar aceptado para el manejo, archivo y transmisión de imágenes médicas. Este formato agrupa la información del paciente y la imágen en un solo archivo.
En algunos casos una imágen puede estar dividida en varios archivos DICOM, por ejemplo: un volumen, o imagen 3D, esta compuesto por múltiples archivos DICOM que contienen la información para cada una de las *"tajadas"* en 2D.

### Formatos de datos

 - Analyze: Imagen (.img) e información de cabecera (.hdr) en archivos separados.
 - [NIfTI](https://nifti.nimh.nih.gov/): un solo archivo (.nii) contiene toda la información.
 - ITK MetaImage (.mha/.mhd)

## Conversión entre formatos

De DICOM a NIfTI:

- **dcm2niix** función de [MRIcroGL](https://www.nitrc.org/plugins/mwiki/index.php/dcm2nii:MainPage)
- **mrconvert** función de [MRtrix3](https://mrtrix.readthedocs.io/en/latest/reference/commands/mrconvert.html)
- **fslchfiletype** función de [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Fslutils)

---

## Visualización de imágenes médicas

Existen múltiples herramientas para visualizar imágenes médicas, algunas de ellas son:
- [3D Slicer](https://www.slicer.org/)
- [Mango](http://ric.uthscsa.edu/mango/mango.html)
- **mrview** en [MRtrix3](https://mrtrix.readthedocs.io/en/latest/reference/commands/mrview.html)
- **fslview** en [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FslView)

Ver también:
[Top 25 Free Dicom Viewers for Doctors, Medical Students, and Health Professionals](https://www.postdicom.com/en/blog/top-25-free-dicom-viewers)

## Marcación y segmentación manual de imágenes

- [itk-SNAP](http://www.itksnap.org/pmwiki/pmwiki.php)

---

## Aplicaciones

 - [Imágenes cerebrales](/computational_brain_morphometry.md)
 - Corazón
 - ...

---

### Artículos extra

 - *Ethics of Artificial Intelligence in Radiology: : Summary of the
Joint European and North American Multisociety Statement* (Oct, 2019) [link](https://pubs.rsna.org/doi/10.1148/radiol.2019191586)

### Otros vínculos

 - [A Comprehensive Guide To Visualizing and Analyzing DICOM Images in Python](https://medium.com/@hengloose/a-comprehensive-starter-guide-to-visualizing-and-analyzing-dicom-images-in-python-7a8430fcb7ed)

---

##### Contributing

This section is under construction, contributions and suggestions are highly appreciated.
*[Diana Giraldo](https://github.com/diagiraldo)*
