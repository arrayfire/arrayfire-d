module arrayfire.complex;

import arrayfire.defines;

extern ( C ){

  struct af_cfloat{
    float realpart;
    float imag;
  }

  struct af_cdouble {
    double realpart;
    double imag;
  }
}
