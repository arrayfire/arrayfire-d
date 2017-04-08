module arrayfire.blas;

import arrayfire.defines;

extern( C ){

  /+
    \brief Matrix multiply of two \ref af_array

    \details Performs a matrix multiplication on two arrays (lhs, rhs).

    \param[out] output Pointer to the output \ref af_array
    \param[in] lhs A 2D matrix \ref af_array object
    \param[in] rhs A 2D matrix \ref af_array object
    \param[in] optLhs Transpose left hand side before the function is performed
    \param[in] optRhs Transpose right hand side before the function is performed

    \return AF_SUCCESS if the process is successful.

    \note <b> The following applies for Sparse-Dense matrix multiplication.</b>
    \note This function can be used with one sparse input. The sparse input
          must always be the \p lhs and the dense matrix must be \p rhs.
    \note The sparse array can only be of \ref AF_STORAGE_CSR format.
    \note The returned array is always dense.
    \note \p optLhs an only be one of \ref AF_MAT_NONE, \ref AF_MAT_TRANS,
          \ref AF_MAT_CTRANS.
    \note \p optRhs can only be \ref AF_MAT_NONE.

    \ingroup blas_func_matmul
  +/
  af_err af_matmul(af_array *output , const af_array lhs, const af_array rhs, const af_mat_prop optLhs, const af_mat_prop optRhs);


  /+
    Scalar dot product between two vectors.  Also referred to as the inner
    product.

    \code
    // compute scalar dot product
    array x = randu(100), y = randu(100);
    print(dot<float>(x,y));
    \endcode

    \ingroup blas_func_dot
  +/
  af_err af_dot(af_array *output, const af_array lhs, const af_array rhs, const af_mat_prop optLhs, const af_mat_prop optRhs);

  /+
    \brief Transposes a matrix

    This funciton will tranpose the matrix input.

    \param[out] output The transposed matrix
    \param[in] input Input matrix which will be transposed
    \param[in] conjugate Perform a congugate transposition

    \return AF_SUCCESS if the process is successful.
    \ingroup blas_func_transpose
  +/
  af_err af_transpose(af_array *output, af_array input, const bool conjugate);

  /+
    \brief Transposes a matrix in-place

    \copydetails blas_func_transpose

    \param[in,out] input is the matrix to be transposed in place
    \param[in] conjugate If true a congugate transposition is performed

    \ingroup blas_func_transpose
  +/
  af_err af_transpose_inplace(af_array input, const bool conjugate);

}
