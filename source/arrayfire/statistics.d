module arrayfire.statistics;

import arrayfire.defines;

extern ( C ) {

  /+
    C Interface for mean

    \param[out] output will contain the mean of the input array along dimension \p dim
    \param[in] input is the input array
    \param[in] dim the dimension along which the mean is extracted
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_mean
  +/
  af_err af_mean(af_array *output, const af_array input, const dim_t dim);

  /+
    C Interface for mean of weighted input array

    \param[out] output will contain the mean of the input array along dimension \p dim
    \param[in] input is the input array
    \param[in] weights is used to scale input \p input before getting mean
    \param[in] dim the dimension along which the mean is extracted
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_mean
  +/
  af_err af_mean_weighted(af_array *output, const af_array input, const af_array weights, const dim_t dim);

  /+
    C Interface for variance

    \param[out] output will contain the variance of the input array along dimension \p dim
    \param[in] input is the input array
    \param[in] isbiased is boolean denoting Population variance (false) or Sample Variance (true)
    \param[in] dim the dimension along which the variance is extracted
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_var

  +/
  af_err af_var(af_array *output, const af_array input, const bool isbiased, const dim_t dim);

  /+
    C Interface for variance of weighted input array

    \param[out] output will contain the variance of the input array along dimension \p dim
    \param[in] input is the input array
    \param[in] weights is used to scale input \p input before getting variance
    \param[in] dim the dimension along which the variance is extracted
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_var

  +/
  af_err af_var_weighted(af_array *output, const af_array input, const af_array weights, const dim_t dim);

  /+
    C Interface for standard deviation

    \param[out] output will contain the standard deviation of the input array along dimension \p dim
    \param[in] input is the input array
    \param[in] dim the dimension along which the standard deviation is extracted
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_stdev

  +/
  af_err af_stdev(af_array *output, const af_array input, const dim_t dim);

  /+
    C Interface for covariance

    \param[out] output will the covariance of the input arrays
    \param[in] X is the first input array
    \param[in] Y is the second input array
    \param[in] isbiased is boolean specifying if biased estimate should be taken (default: false)
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_cov
  +/
  af_err af_cov(af_array* output, const af_array X, const af_array Y, const bool isbiased);

  /+
    C Interface for median

    \param[out] output will contain the median of the input array along dimension \p dim
    \param[in] input is the input array
    \param[in] dim the dimension along which the median is extracted
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_median
  +/
  af_err af_median(af_array* output, const af_array input, const dim_t dim);

  /+
    C Interface for mean of all elements

    \param[out] realpart will contain the real part of mean of the entire input array
    \param[out] imag will contain the imaginary part of mean of the entire input array
    \param[in] input is the input array
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_mean
  +/
  af_err af_mean_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for mean of all elements in weighted input

    \param[out] realpart will contain the real part of mean of the entire weighted input array
    \param[out] imag will contain the imaginary part of mean of the entire weighted input array
    \param[in] input is the input array
    \param[in] weights  is used to scale input \p input before getting mean
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_mean
  +/
  af_err af_mean_all_weighted(double *realpart, double *imag, const af_array input, const af_array weights);


  /+
    C Interface for variance of all elements

    \param[out] realVal will contain the real part of variance of the entire input array
    \param[out] imagVal will contain the imaginary part of variance of the entire input array
    \param[in] input is the input array
    \param[in] isbiased is boolean denoting Population variance (false) or Sample Variance (true)
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_var
  +/
  af_err af_var_all(double *realVal, double *imagVal, const af_array input, const bool isbiased);

  /+
    C Interface for variance of all elements in weighted input

    \param[out] realVal will contain the real part of variance of the entire weighted input array
    \param[out] imagVal will contain the imaginary part of variance of the entire weighted input array
    \param[in] input is the input array
    \param[in] weights  is used to scale input \p input before getting variance
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_var
  +/
  af_err af_var_all_weighted(double *realVal, double *imagVal, const af_array input, const af_array weights);

  /+
    C Interface for standard deviation of all elements

    \param[out] realpart will contain the real part of standard deviation of the entire input array
    \param[out] imag will contain the imaginary part of standard deviation of the entire input array
    \param[in] input is the input array
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_stdev
  +/
  af_err af_stdev_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for median

    \param[out] realVal will contain the real part of median of the entire input array
    \param[out] imagVal will contain the imaginary part of median of the entire input array
    \param[in] input is the input array
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup stat_func_median
  +/
  af_err af_median_all(double *realVal, double *imagVal, const af_array input);

  /+
    C Interface for correlation coefficient

    \param[out] realVal will contain the real part of correlation coefficient of the inputs
    \param[out] imagVal will contain the imaginary part of correlation coefficient of the inputs
    \param[in] X is the first input array
    \param[in] Y is the second input array
    \return     \ref AF_SUCCESS if the operation is successful,
    otherwise an appropriate error code is returned.

    \note There are many ways correlation coefficient is calculated. This algorithm returns Pearson product-moment correlation coefficient.

    \ingroup stat_func_corrcoef
  +/

  af_err af_corrcoef(double *realVal, double *imagVal, const af_array X, const af_array Y);

}
