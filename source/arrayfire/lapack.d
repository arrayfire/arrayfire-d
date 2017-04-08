module arrayfire.lapack;

import arrayfire.defines;

extern ( C ){

  //#if AF_API_VERSION >= 31
  /+
    C Interface for SVD decomposition

    \param[out] u is the outputput array containing U
    \param[out] s is the outputput array containing the diagonal values of sigma, (singular values of the input matrix))
    \param[out] vt is the outputput array containing V^H
    \param[in] input is the input matrix

    \ingroup lapack_factor_func_svd
  +/
  af_err af_svd(af_array *u, af_array *s, af_array *vt, const af_array input);
    //#endif

    //#if AF_API_VERSION >= 31
  /+
    C Interface for SVD decomposition

    \param[out] u is the outputput array containing U
    \param[out] s is the outputput array containing the diagonal values of sigma, (singular values of the input matrix))
    \param[out] vt is the outputput array containing V^H
    \param[inoutput] input is the input matrix that will contain random data after this operation

    \ingroup lapack_factor_func_svd
  +/
  af_err af_svd_inplace(af_array *u, af_array *s, af_array *vt, af_array input);
    //#endif

  /+
    C Interface for LU decomposition

    \param[out] lower will contain the lower triangular matrix of the LU decomposition
    \param[out] upper will contain the upper triangular matrix of the LU decomposition
    \param[out] pivot will contain the permutation indices to map the input to the decomposition
    \param[in] input is the input matrix

    \ingroup lapack_factor_func_lu
  +/
  af_err af_lu(af_array *lower, af_array *upper, af_array *pivot, const af_array input);

  /+
    C Interface for in place LU decomposition

    \param[out] pivot will contain the permutation indices to map the input to the decomposition
    \param[inoutput] in contains the input on entry, the packed LU decomposition on exit
    \param[in] is_lapack_piv specifies if the pivot is returned in original LAPACK compliant format

    \ingroup lapack_factor_func_lu
  +/
  af_err af_lu_inplace(af_array *pivot, af_array input, const bool is_lapack_piv);

  /+
    C Interface for QR decomposition

    \param[out] q is the orthogonal matrix from QR decomposition
    \param[out] r is the upper triangular matrix from QR decomposition
    \param[out] tau will contain additional information needed for solving a least squares problem using \p q and \p r
    \param[in] input is the input matrix

    \ingroup lapack_factor_func_qr
  +/
  af_err af_qr(af_array *q, af_array *r, af_array *tau, const af_array input);

  /+
    C Interface for QR decomposition

    \param[out] tau will contain additional information needed for unpacking the data
    \param[inoutput] input is the input matrix on entry. It contains packed QR decomposition on exit

    \ingroup lapack_factor_func_qr
  +/
  af_err af_qr_inplace(af_array *tau, af_array input);

  /+
    C++ Interface for cholesky decomposition

    \param[out] output contains the triangular matrix. Multiply \p output with it conjugate transpose reproduces the input \p in.
    \param[out] info is \p 0 if cholesky decomposition passes, if not it returns the rank at which the decomposition failed.
    \param[in] input is the input matrix
    \param[in] is_upper a boolean determining if \p output is upper or lower triangular

    \note The input matrix \b has to be a positive definite matrix, if it is not zero, the cholesky decomposition functions return a non zero outputput.

    \ingroup lapack_factor_func_cholesky
  +/
  af_err af_cholesky(af_array *output, int *info, const af_array input, const bool is_upper);

  /+
    C Interface for in place cholesky decomposition

    \param[out] info is \p 0 if cholesky decomposition passes, if not it returns the rank at which the decomposition failed.
    \param[inoutput] input is the input matrix on entry. It contains the triangular matrix on exit.
    \param[in] is_upper a boolean determining if \p input is upper or lower triangular

    \note The input matrix \b has to be a positive definite matrix, if it is not zero, the cholesky decomposition functions return a non zero outputput.

    \ingroup lapack_factor_func_cholesky
  +/
  af_err af_cholesky_inplace(int *info, af_array input, const bool is_upper);

  /+
    C Interface for solving a system of equations

    \param[out] x is the matrix of unknown variables
    \param[in] a is the coefficient matrix
    \param[in] b is the measured values
    \param[in] options determining various properties of matrix \p a

    \ingroup lapack_solve_func_gen

    \note \p options needs to be one of \ref AF_MAT_NONE, \ref AF_MAT_LOWER or \ref AF_MAT_UPPER
  +/
  af_err af_solve(af_array *x, const af_array a, const af_array b,
                      const af_mat_prop options);

  /+
    C Interface for solving a system of equations

    \param[out] x will contain the matrix of unknown variables
    \param[in] a is the outputput matrix from packed LU decomposition of the coefficient matrix
    \param[in] piv is the pivot array from packed LU decomposition of the coefficient matrix
    \param[in] b is the matrix of measured values
    \param[in] options determining various properties of matrix \p a

    \ingroup lapack_solve_lu_func_gen

    \note \p options currently needs to be \ref AF_MAT_NONE
    \note This function is not supported in GFOR
  +/
  af_err af_solve_lu(af_array *x, const af_array a, const af_array piv,
                         const af_array b, const af_mat_prop options);

  /+
    C Interface for inverting a matrix

    \param[out] output will contain the inverse of matrix \p input
    \param[in] input is input matrix
    \param[in] options determining various properties of matrix \p input

    \ingroup lapack_ops_func_inv

    \note currently options needs to be \ref AF_MAT_NONE
  +/
  af_err af_inverse(af_array *output, const af_array input, const af_mat_prop options);

  /+
    C Interface for finding the rank of a matrix

    \param[out] rank will contain the rank of \p input
    \param[in] input is input matrix
    \param[in] tol is the tolerance value

    \ingroup lapack_ops_func_rank
  +/
  af_err af_rank(uint *rank, const af_array input, const double tol);

  /+
    C Interface for finding the determinant of a matrix

    \param[out] det_real will contain the real part of the determinant of \p input
    \param[out] det_imag will contain the imaginary part of the determinant of \p input
    \param[in] in is input matrix

    \ingroup lapack_ops_func_det
  +/
  af_err af_det(double *det_real, double *det_imag, const af_array input);

  /+
    C Interface for norm of a matrix

    \param[out] output will contain the norm of \p input
    \param[in] input is the input matrix
    \param[in] type specifies the \ref af::normType. Default: \ref AF_NORM_VECTOR_1
    \param[in] p specifies the value of P when \p type is one of \ref AF_NORM_VECTOR_P,  AF_NORM_MATRIX_L_PQ is used. It is ignored for other values of \p type
    \param[in] q specifies the value of Q when \p type is AF_NORM_MATRIX_L_PQ. This parameter is ignored if \p type is anything else


    \ingroup lapack_ops_func_norm
  +/
  af_err af_norm(double *output, const af_array input, const af_norm_type type, const double p, const double q);

    //#if AF_API_VERSION >= 33
  /+
    Returns true is ArrayFire is compiled with LAPACK support

    \param[out] output is true if LAPACK support is available, false otherwise

    \returns AF_SUCCESS if successful (does not depend on the value of output)

    \ingroup lapack_ops_func_norm
  +/
  af_err af_is_lapack_available(bool *output);
  //#endif

}
