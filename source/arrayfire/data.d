module arrayfire.data;

import arrayfire.defines;

extern ( C ){

  /+
    \param[out] arr is the generated array of given type
    \param[in] val is the value of each element in the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension
    \param[in] type is the type of array to generate

    \ingroup data_func_constant
  +/
  af_err af_constant(af_array *arr, const double val, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    \param[out] arr is the generated array of type \ref c32 or \ref c64
    \param[in] realpart is the real value of each element in the generated array
    \param[in] imag is the imaginary value of each element in the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension
    \param[in] type is the type of array to generate

    \ingroup data_func_constant
  +/

  af_err af_constant_complex(af_array *arr, const double realpart, const double imag, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    \param[out] arr is the generated array of type \ref s64
    \param[in] val is a complex value of each element in the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension

    \ingroup data_func_constant
  +/

  af_err af_constant_long (af_array *arr, const  int val, const uint ndims, const dim_t * dims);

  /+
    \param[out] arr is the generated array of type \ref u64
    \param[in] val is a complex value of each element in the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension

    \ingroup data_func_constant
  +/

  af_err af_constant_ulong(af_array *arr, const uint val, const uint ndims, const dim_t * dims);
  /+
    @}
  +/

  /+
    \param[out] output is the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension
    \param[in] seq_dim is dimension along which [0, dim[seq_dim] - 1] is generated
    \param[in] type is the type of array to generate

    \ingroup data_func_range
  +/
  af_err af_range(af_array *output, const uint ndims, const dim_t * dims, const int seq_dim, const af_dtype type);

  /+
    \param[out] output is the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension
    \param[in] t_ndims is size of tile array \p tdims
    \param[in] tdims is array containing the number of repetitions of the unit dimensions
    \param[in] type is the type of array to generate

    \ingroup data_func_iota
  +/
  af_err af_iota(af_array *output, const uint ndims, const dim_t * dims, const uint t_ndims, const dim_t * tdims, const af_dtype type);


  /+
    \param[out] output is the generated array
    \param[in] ndims is size of dimension array \p dims
    \param[in] dims is the array containing sizes of the dimension
    \param[in] type is the type of array to generate

    \ingroup data_func_identity
  +/
  af_err af_identity(af_array *output, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    \param[out] output is the array created from the input array \p input
    \param[in] input is the input array which is the diagonal
    \param[in] num is the diagonal index

    \ingroup data_func_diag
  +/
  af_err af_diag_create(af_array *output, const af_array input, const int num);

  /+
    \param[out] output is the \p num -th diagonal of \p input
    \param[in] input is the input matrix
    \param[in] num is the diagonal index

    \ingroup data_func_diag
  +/
  af_err af_diag_extract(af_array *output, const af_array input, const int num);

  /+
    \brief Join 2 arrays along \p dim

    \param[out] output is the generated array
    \param[in] dim is the dimension along which join occurs
    \param[in] first is the first input array
    \param[in] second is the second input array

    \ingroup manip_func_join
  +/
  af_err af_join(af_array *output, const int dim, const af_array first, const af_array second);

  /+
    \brief Join many arrays along \p dim

    Current limit is set to 10 arrays.

    \param[out] output is the generated array
    \param[in] dim is the dimension along which join occurs
    \param[in] n_arrays number of arrays to join
    \param[in] inputs is an array of af_arrays containing handles to the arrays to be joined

    \ingroup manip_func_join
  +/
  af_err af_join_many(af_array *output, const int dim, const uint n_arrays, const af_array *inputs);

  /+
    \param[out] output is the generated array
    \param[in] input is the input matrix
    \param[in] x is the number of times \p input is tiled along first dimension
    \param[in] y is the number of times \p input is tiled along second dimension
    \param[in] z is the number of times \p input is tiled along third dimension
    \param[in] w is the number of times \p input is tiled along fourth dimension

    \ingroup manip_func_tile
  +/
  af_err af_tile(af_array *output, const af_array input, const uint x, const uint y, const uint z, const uint w);

  /+
    \param[out] output is the reordered array
    \param[in] input is the input matrix
    \param[in] x specifies which dimension should be first
    \param[in] y specifies which dimension should be second
    \param[in] z specifies which dimension should be third
    \param[in] w specifies which dimension should be fourth

    \ingroup manip_func_reorder
  +/
  af_err af_reorder(af_array *output, const af_array input, const uint x, const uint y, const uint z, const uint w);
  /+
    \param[in] output is the shifted array
    \param[in] input is the input array
    \param[in] x specifies the shift along first dimension
    \param[in] y specifies the shift along second dimension
    \param[in] z specifies the shift along third dimension
    \param[in] w specifies the shift along fourth dimension

    \ingroup manip_func_shift
  +/
  af_err af_shift(af_array *output, const af_array input, const int x, const int y, const int z, const int w);

  /+
    \param[out] output is the modded array
    \param[in] input is the input array
    \param[in] ndims is the number of dimensions
    \param[in] dims is the array containing the new dimensions

    \ingroup manip_func_moddims
  +/
  af_err af_moddims(af_array *output, const af_array input, const uint ndims, const dim_t * dims);

  /+
    \param[out] output is the flat array
    \param[in] input is the input array

    \ingroup manip_func_flat
  +/
  af_err af_flat(af_array *output, const af_array input);

  /+
    \param[out] output is the flipped array
    \param[in] input is the input array
    \param[in] dim is the dimensions to flip the array

    \ingroup manip_func_flip
  +/
  af_err af_flip(af_array *output, const af_array input, const uint dim);

  /+
    \param[out] output is the lower traingle matrix
    \param[in] input is the input matrix
    \param[in] is_unit_diag is a boolean parameter specifying if the diagonal elements should be 1

    \ingroup data_func_lower
  +/
  af_err af_lower(af_array *output, const af_array input, bool is_unit_diag);

  /+
    \param[out] output is the upper triangle matrix
    \param[in] input is the input matrix
    \param[in] is_unit_diag is a boolean parameter specifying if the diagonal elements should be 1

    \ingroup data_func_upper
  +/
  af_err af_upper(af_array *output, const af_array input, bool is_unit_diag);
  /+
    @}
  +/

  //#if AF_API_VERSION >= 31
  /+
    \param[out] output is the outputput containing elements of \p a when \p cond is true else elements from \p b
    \param[in]  cond is the conditional array
    \param[in]  a is the array containing elements from the true part of the condition
    \param[in]  b is the array containing elements from the false part of the condition

    \ingroup data_func_select
  +/
  af_err af_select(af_array *output, const af_array cond, const af_array a, const af_array b);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[out] output is the outputput containing elements of \p a when \p cond is true else elements from \p b
    \param[in]  cond is the conditional array
    \param[in]  a is the array containing elements from the true part of the condition
    \param[in]  b is a scalar assigned to \p output when \p cond is false

    \ingroup data_func_select
  +/
  af_err af_select_scalar_r(af_array *output, const af_array cond, const af_array a, const double b);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[out] output is the outputput containing elements of \p a when \p cond is true else elements from \p b
    \param[in]  cond is the conditional array
    \param[in]  a is a scalar assigned to \p output when \p cond is true
    \param[in]  b is the array containing elements from the false part of the condition

    \ingroup data_func_select
  +/
  af_err af_select_scalar_l(af_array *output, const af_array cond, const double a, const af_array b);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[inoutput]  a is the input array
    \param[in]  cond is the conditional array.
    \param[in]  b is the replacement array.

    \note Values of \p a are replaced with corresponding values of \p b, when \p cond is false.

    \ingroup data_func_replace
  +/
  af_err af_replace(af_array a, const af_array cond, const af_array b);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[inoutput]  a is the input array
    \param[in]  cond is the conditional array.
    \param[in]  b is the replacement array.

    \note Values of \p a are replaced with corresponding values of \p b, when \p cond is false.

    \ingroup data_func_replace
  +/
  af_err af_replace_scalar(af_array a, const af_array cond, const double b);
  //#endif

}
