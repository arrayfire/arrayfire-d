module arrayfire_d.array;

import arrayfire_d.defines;

extern( C ){

  /+
    \ingroup construct_mat
    @{
  +/

  /+
    Create an \ref af_array handle initialized with user defined data

    This function will create an \ref af_array handle from the memory provided in \p data

    \param[out]  arr The pointer to the returned object.
    \param[in]   data The data which will be loaded into the array
    \param[in]   ndims The number of dimensions read from the \p dims parameter
    \param[in]   dims A C pointer with \p ndims elements. Each value represents the size of that dimension
    \param[in]   type The type of the \ref af_array object

    \returns \ref AF_SUCCESS if the operation was a success
  +/
  af_err af_create_array(af_array *arr, const void * data, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    Create af_array handle

    \param[out]  arr The pointer to the retured object.
    \param[in]   ndims The number of dimensions read from the \p dims parameter
    \param[in]   dims A C pointer with \p ndims elements. Each value represents the size of that dimension
    \param[in]   type The type of the \ref af_array object

    \returns \ref AF_SUCCESS if the operation was a success
  +/
  af_err af_create_handle(af_array *arr, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    @}
  +/

  /+
    \ingroup method_mat
    @{

    Deep copy an array to another
  +/
  af_err af_copy_array(af_array *arr, const af_array input);

  /+
    Copy data from a C pointer (host/device) to an existing array.
  +/
  af_err af_write_array(af_array arr, const void *data, const size_t bytes, af_source src);

  /+
    Copy data from an af_array to a C pointer.

    Needs to used in conjunction with the two functions above
  +/
  af_err af_get_data_ptr(void *data, const af_array arr);

  /+
    \brief Reduce the reference count of the \ref af_array
  +/
  af_err af_release_array(af_array arr);

  /+
    Increments an \ref af_array reference count
  +/
  af_err af_retain_array(af_array *output, const af_array input);

    //#if AF_API_VERSION >= 31
  /+
    \ingroup method_mat
    @{

    Get the use count of `af_array`
  +/
  af_err af_get_data_ref_count(int *use_count, const af_array input);
    //#endif


  /+
    Evaluate any expressions in the Array
  +/
  af_err af_eval(af_array input);

  /+
    @}
  +/


    //#if AF_API_VERSION >= 34
  /+
    Evaluate multiple arrays together
  +/
  af_err af_eval_multiple(const int num, af_array *arrays);
  /+
    @}
  +/
    //#endif

    //#if AF_API_VERSION >= 34
  /+
    Turn the manual eval flag on or off
  +/
  af_err af_set_manual_eval_flag(bool flag);
  /+
    @}
  +/
    //#endif

    //#if AF_API_VERSION >= 34
  /+
    Get the manual eval flag
  +/
  af_err af_get_manual_eval_flag(bool *flag);
  /+
    @}
  +/
    //#endif

  /+
    \ingroup method_mat
    @{
  +/
  /+
    \brief Gets the number of elements in an array.

    \param[out] elems is the output that contains number of elements of \p arr
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_get_elements(dim_t *elems, const af_array arr);

  /+
    \brief Gets the type of an array.

    \param[out] type is the output that contains the type of \p arr
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_get_type(af_dtype *type, const af_array arr);

  /+
    \brief Gets the dimseions of an array.

    \param[out] d0 is the output that contains the size of first dimension of \p arr
    \param[out] d1 is the output that contains the size of second dimension of \p arr
    \param[out] d2 is the output that contains the size of third dimension of \p arr
    \param[out] d3 is the output that contains the size of fourth dimension of \p arr
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_get_dims(dim_t *d0, dim_t *d1, dim_t *d2, dim_t *d3, const af_array arr);

  /+
    \brief Gets the number of dimensions of an array.

    \param[out] result is the output that contains the number of dims of \p arr
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_get_numdims(uint *result, const af_array arr);

  /+
    \brief Check if an array is empty.

    \param[out] result is true if elements of arr is 0, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_empty        (bool *result, const af_array arr);

  /+
    \brief Check if an array is scalar, ie. single element.

    \param[out] result is true if elements of arr is 1, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_scalar       (bool *result, const af_array arr);

  /+
    \brief Check if an array is row vector.

    \param[out] result is true if arr has dims [1 x 1 1], false otherwise
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_row          (bool *result, const af_array arr);

  /+
    \brief Check if an array is a column vector

    \param[out] result is true if arr has dims [x 1 1 1], false otherwise
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_column       (bool *result, const af_array arr);

  /+
    \brief Check if an array is a vector

    A vector is any array that has exactly 1 dimension not equal to 1.

    \param[out] result is true if arr is a vector, false otherwise
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_vector       (bool *result, const af_array arr);

  /+
    \brief Check if an array is complex type

    \param[out] result is true if arr is of type \ref c32 or \ref c64, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_complex      (bool *result, const af_array arr);

  /+
    \brief Check if an array is real type

    This is mutually exclusive to \ref af_is_complex

    \param[out] result is true if arr is NOT of type \ref c32 or \ref c64, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_real         (bool *result, const af_array arr);

  /+
    \brief Check if an array is double precision type

    \param[out] result is true if arr is of type \ref f64 or \ref c64, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_double       (bool *result, const af_array arr);

  /+
    \brief Check if an array is single precision type

    \param[out] result is true if arr is of type \ref f32 or \ref c32, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_single       (bool *result, const af_array arr);

  /+
    \brief Check if an array is real floating point type

    \param[out] result is true if arr is of type \ref f32 or \ref f64, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_realfloating (bool *result, const af_array arr);

  /+
    \brief Check if an array is floating precision type

    This is a combination of \ref af_is_realfloating and \ref af_is_complex

    \param[out] result is true if arr is of type \ref f32, \ref f64, \ref c32 or \ref c64, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_floating     (bool *result, const af_array arr);

  /+
    \brief Check if an array is integer type

    \param[out] result is true if arr is of integer types, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_integer      (bool *result, const af_array arr);

  /+
    \brief Check if an array is bool type

    \param[out] result is true if arr is of \ref b8 type, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_bool         (bool *result, const af_array arr);

    //#if AF_API_VERSION >= 34
  /+
    \brief Check if an array is sparse

    \param[out] result is true if arr is sparse, otherwise false
    \param[in] arr is the input array

    \returns error codes
  +/
  af_err af_is_sparse       (bool *result, const af_array arr);

}
