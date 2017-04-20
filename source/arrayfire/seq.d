module arrayfire.seq;

import arrayfire.defines;

extern ( C ){

  struct af_seq {
    /// Start position of the sequence
    double begin;

    /// End position of the sequence (inclusive)
    double end;

    /// Step size between sequence values
    double step;
  }

  af_seq af_make_seq(double begin, double end, double step);

}
