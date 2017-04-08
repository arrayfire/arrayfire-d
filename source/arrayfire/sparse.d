module arrayfire.sparse;

import arrayfire.defines;

extern ( C ) {

  //#if AF_API_VERSION >= 34
  /+
    This function converts \ref af::array of values, row indices and column
    indices into a sparse array.

    \note This function only create references of these arrays into the
    sparse data structure and does not do deep copies.

    \param[out] output \ref af::array for the sparse array
    \param[in] nRows is the number of rows in the dense matrix
    \param[in] nCols is the number of columns in the dense matrix
    \param[in] values is the \ref af_array containing the non-zero elements
    of the matrix
    \param[in] rowIdx is the row indices for the sparse array
    \param[in] colIdx is the column indices for the sparse array
    \param[in] stype is the storage format of the sparse array

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_create
  +/
  af_err af_create_sparse_array(
    af_array *output,
    const dim_t nRows, const dim_t nCols,
    const af_array values, const af_array rowIdx, const af_array colIdx,
    const af_storage stype);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    This function converts host or device arrays of values, row indices and
    column indices into a sparse array on the device.

    \note The rules for deep copy/shallow copy/reference are the same as for
    creating a regular \ref af::array.

    \param[out] output \ref af::array for the sparse array
    \param[in] nRows is the number of rows in the dense matrix
    \param[in] nCols is the number of columns in the dense matrix
    \param[in] nNZ is the number of non zero elements in the dense matrix
    \param[in] values is the host array containing the non-zero elements
    of the matrix
    \param[in] rowIdx is the row indices for the sparse array
    \param[in] colIdx is the column indices for the sparse array
    \param[in] type is the data type for the matrix
    \param[in] stype is the storage format of the sparse array
    \param[in] src is \ref afHost if inputs are host arrays and \ref afDevice
    if the arrays are device arrays.

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_create
  +/
  af_err af_create_sparse_array_from_ptr(
    af_array *output,
    const dim_t nRows, const dim_t nCols, const dim_t nNZ,
    const void * values,
    const int * rowIdx, const int * colIdx,
    const af_dtype type, const af_storage stype,
    const af_source src);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    This function converts a dense \ref af_array into a sparse array.

    \param[out] output \ref af_array for the sparse array with the given storage type
    \param[in] dense is the source dense matrix
    \param[in] stype is the storage format of the sparse array

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_create
  +/
  af_err af_create_sparse_array_from_dense(
    af_array *output, const af_array dense,
    const af_storage stype);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output \ref af_array for the sparse array with the given storage type
    \param[in] input is the source sparse matrix to be converted
    \param[in] destStorage is the storage format of the outputput sparse array

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_convert_to
  +/
  af_err af_sparse_convert_to(af_array *output, const af_array input,
    const af_storage destStorage);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output dense \ref af_array from sparse
    \param[in] sparse is the source sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_dense
  +/
  af_err af_sparse_to_dense(af_array *output, const af_array sparse);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] values stores the non-zero elements component of the sparse array
    \param[out] rowIdx stores the row indices component of the sparse array
    \param[out] colIdx stores the column indices component of the sparse array
    \param[out] stype stores the storage type of the sparse array
    \param[in] input is the input sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_info
  +/
  af_err af_sparse_get_info(af_array *values, af_array *rowIdx, af_array *colIdx, af_storage *stype,
    const af_array input);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output \ref af_array for the non-zero elements component of the sparse array
    \param[in] in is the input sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_values
  +/
  af_err af_sparse_get_values(af_array *output, const af_array input);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output \ref af_array for the row indices component of the sparse array
    \param[in] input is the input sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_row_idx
  +/
  af_err af_sparse_get_row_idx(af_array *output, const af_array input);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output \ref af_array for the column indices component of the sparse array
    \param[in] input is the input sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_col_idx
  +/
  af_err af_sparse_get_col_idx(af_array *output, const af_array input);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output the number of non-zero elements of the sparse array
    \param[in] input is the input sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_nnz
  +/
  af_err af_sparse_get_nnz(dim_t *output, const af_array input);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    \param[out] output contains \ref af_storage for the storage type of the sparse array
    \param[in] input is the input sparse matrix

    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sparse_func_storage
  +/
  af_err af_sparse_get_storage(af_storage *output, const af_array input);
  //#endif

}
