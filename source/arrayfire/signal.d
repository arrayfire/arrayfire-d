module arrayfire.signal;

import arrayfire.defines;

extern ( C ) {

  /+
    C Interface for signals interpolation on one dimensional signals

    \param[out] output is the array with interpolated values
    \param[in]  input is the input array
    \param[in]  pos array contains the interpolation locations
    \param[in]  method is the interpolation type, it can take one of the values defined by the
    enum \ref af_interp_type
    \param[in]  offGrid is the value that will set in the output array when certain index is output of bounds
    \return     \ref AF_SUCCESS if the interpolation operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_approx1
  +/
  af_err af_approx1(af_array *output, const af_array input, const af_array pos,
    const af_interp_type method, const float offGrid);

  /+
    C Interface for signals interpolation on two dimensional signals

    \param[out] output is the array with interpolated values
    \param[in]  input is the input array
    \param[in]  pos0 array contains the interpolation locations for first dimension
    \param[in]  pos1 array contains the interpolation locations for second dimension
    \param[in]  method is the interpolation type, it can take one of the values defined by the
    enum \ref af_interp_type
    \param[in]  offGrid is the value that will set in the output array when certain index is output of bounds
    \return     \ref AF_SUCCESS if the interpolation operation is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_approx2
  +/
  af_err af_approx2(af_array *output, const af_array input, const af_array pos0, const af_array pos1,
    const af_interp_type method, const float offGrid);

  /+
    C Interface for fast fourier transform on one dimensional signals

    \param[out] output is the transformed array
    \param[in]  input is the input array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  odim0 is the length of output signals - used to either truncate or pad the input signals
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_fft
  +/
  af_err af_fft(af_array *output, const af_array input, const double norm_factor, const dim_t odim0);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for fast fourier transform on one dimensional signals

    \param[inoutput]  input is the input array on entry and the output of 1D forward fourier transform at exit
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The input \p input must be a complex array

    \ingroup signal_func_fft
  +/
  af_err af_fft_inplace(af_array input, const double norm_factor);
  //#endif

  /+
    C Interface for fast fourier transform on two dimensional signals

    \param[out] output is the transformed array
    \param[in]  input is the input array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  odim0 is the length of output signals along first dimension - used to either truncate/pad the input
    \param[in]  odim1 is the length of output signals along second dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_fft2
  +/
  af_err af_fft2(af_array *output, const af_array input, const double norm_factor, const dim_t odim0, const dim_t odim1);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for fast fourier transform on two dimensional signals

    \param[inoutput]  input is the input array on entry and the output of 2D forward fourier transform on exit
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The input \p input must be a complex array

    \ingroup signal_func_fft2
  +/
  af_err af_fft2_inplace(af_array input, const double norm_factor);
  //#endif

  /+
    C Interface for fast fourier transform on three dimensional signals

    \param[out] output is the transformed array
    \param[in]  input is the input array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  odim0 is the length of output signals along first dimension - used to either truncate/pad the input
    \param[in]  odim1 is the length of output signals along second dimension - used to either truncate/pad the input
    \param[in]  odim2 is the length of output signals along third dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_fft3
  +/
  af_err af_fft3(af_array *output, const af_array input, const double norm_factor, const dim_t odim0, const dim_t odim1, const dim_t odim2);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for fast fourier transform on three dimensional signals

    \param[inoutput]  input is the input array on entry and the output of 3D forward fourier transform on exit
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The input \p must be a complex array

    \ingroup signal_func_fft3
  +/
  af_err af_fft3_inplace(af_array input, const double norm_factor);
  //#endif

  /+
    C Interface for inverse fast fourier transform on one dimensional signals

    \param[out] output is the transformed array
    \param[in]  input is the input array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  odim0 is the length of output signals - used to either truncate or pad the input signals
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_ifft
  +/
  af_err af_ifft(af_array *output, const af_array input, const double norm_factor, const dim_t odim0);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for fast fourier transform on one dimensional signals

    \param[in]  input is the input array on entry and the output of 1D inverse fourier transform at exit
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \return     \ref AF_SUCCESS if the ifft transform is successful,
    otherwise an appropriate error code is returned.

    \note The input \p input must be a complex array

    \ingroup signal_func_ifft
  +/
  af_err af_ifft_inplace(af_array input, const double norm_factor);
  //#endif

  /+
    C Interface for inverse fast fourier transform on two dimensional signals

    \param[out] output is the transformed array
    \param[in]  input is the input array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  odim0 is the length of output signals along first dimension - used to either truncate/pad the input
    \param[in]  odim1 is the length of output signals along second dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_ifft2
  +/
  af_err af_ifft2(af_array *output, const af_array input, const double norm_factor, const dim_t odim0, const dim_t odim1);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for fast fourier transform on two dimensional signals

    \param[inoutput]  input is the input array on entry and the output of 2D inverse fourier transform on exit
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \return     \ref AF_SUCCESS if the ifft transform is successful,
    otherwise an appropriate error code is returned.

    \note The input \p input must be a complex array

    \ingroup signal_func_ifft2
  +/
  af_err af_ifft2_inplace(af_array input, const double norm_factor);
  //#endif

  /+
    C Interface for inverse fast fourier transform on three dimensional signals

    \param[out] output is the transformed array
    \param[in]  input is the input array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  odim0 is the length of output signals along first dimension - used to either truncate/pad the input
    \param[in]  odim1 is the length of output signals along second dimension - used to either truncate/pad the input
    \param[in]  odim2 is the length of output signals along third dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_ifft3
  +/
  af_err af_ifft3(af_array *output, const af_array input, const double norm_factor, const dim_t odim0, const dim_t odim1, const dim_t odim2);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for fast fourier transform on three dimensional signals

    \param[inoutput]  input is the input array on entry and the output of 3D inverse fourier transform on exit
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \return     \ref AF_SUCCESS if the ifft transform is successful,
    otherwise an appropriate error code is returned.

    \note The input \p must be a complex array

    \ingroup signal_func_ifft3
  +/
  af_err af_ifft3_inplace(af_array input, const double norm_factor);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for real to complex fast fourier transform for one dimensional signals

    \param[out] output is a complex array containing the non redundant parts of \p input.
    \param[in]  in is a real array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  pad0 is the length of output signals along first dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The first dimension of the output will be of size (pad0 / 2) + 1. The remaining dimensions are unchanged.

    \ingroup signal_func_fft_r2c
  +/
  af_err af_fft_r2c (af_array *output, const af_array input, const double norm_factor, const dim_t pad0);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for real to complex fast fourier transform for two dimensional signals

    \param[out] output is a complex array containing the non redundant parts of \p input.
    \param[in]  input is a real array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  pad0 is the length of output signals along first dimension - used to either truncate/pad the input
    \param[in]  pad1 is the length of output signals along second dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The first dimension of the output will be of size (pad0 / 2) + 1. The second dimension of the output will be pad1. The remaining dimensions are unchanged.

    \ingroup signal_func_fft_r2c
  +/
  af_err af_fft2_r2c(af_array *output, const af_array input, const double norm_factor, const dim_t pad0, const dim_t pad1);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for real to complex fast fourier transform for three dimensional signals

    \param[out] output is a complex array containing the non redundant parts of \p input.
    \param[in]  input is a real array
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  pad0 is the length of output signals along first dimension - used to either truncate/pad the input
    \param[in]  pad1 is the length of output signals along second dimension - used to either truncate/pad the input
    \param[in]  pad2 is the length of output signals along third dimension - used to either truncate/pad the input
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The first dimension of the output will be of size (pad0 / 2) + 1. The second dimension of the output will be pad1. The third dimension of the output will be pad 2.

    \ingroup signal_func_fft_r2c
  +/
  af_err af_fft3_r2c(af_array *output, const af_array input, const double norm_factor, const dim_t pad0, const dim_t pad1, const dim_t pad2);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for complex to real fast fourier transform for one dimensional signals

    \param[out] output is a real array containing the output of the transform.
    \param[in]  input is a complex array containing only the non redundant parts of the signals.
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  is_odd is a flag signifying if the output should be even or odd size
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The first dimension of the output will be 2 * dim0 - 1 if is_odd is true else 2 * dim0 - 2 where dim0 is the first dimension of the input. The remaining dimensions are unchanged.

    \ingroup signal_func_fft_c2r
  +/

  af_err af_fft_c2r (af_array *output, const af_array input, const double norm_factor, const bool is_odd);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for complex to real fast fourier transform for two dimensional signals

    \param[out] output is a real array containing the output of the transform.
    \param[in]  input is a complex array containing only the non redundant parts of the signals.
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  is_odd is a flag signifying if the output should be even or odd size
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The first dimension of the output will be 2 * dim0 - 1 if is_odd is true else 2 * dim0 - 2 where dim0 is the first dimension of the input. The remaining dimensions are unchanged.

    \ingroup signal_func_fft_c2r
  +/
  af_err af_fft2_c2r(af_array *output, const af_array input, const double norm_factor, const bool is_odd);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for complex to real fast fourier transform for three dimensional signals

    \param[out] output is a real array containing the output of the transform.
    \param[in]  input is a complex array containing only the non redundant parts of the signals.
    \param[in]  norm_factor is the normalization factor with which the input is scaled before the transformation is applied
    \param[in]  is_odd is a flag signifying if the output should be even or odd size
    \return     \ref AF_SUCCESS if the fft transform is successful,
    otherwise an appropriate error code is returned.

    \note The first dimension of the output will be 2 * dim0 - 1 if is_odd is true else 2 * dim0 - 2 where dim0 is the first dimension of the input. The remaining dimensions are unchanged.

    \ingroup signal_func_fft_c2r
  +/
  af_err af_fft3_c2r(af_array *output, const af_array input, const double norm_factor, const bool is_odd);
  //#endif

  /+
    C Interface for convolution on one dimensional signals

    \param[out] output is convolved array
    \param[in]  signal is the input signal
    \param[in]  filter is the signal that shall be flipped for the convolution operation
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \param[in]  domain specifies if the convolution should be performed in frequency os spatial domain
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \note The default parameter of \p domain, \ref AF_CONV_AUTO, heuristically switches between frequency and spatial domain.

    \ingroup signal_func_convolve1
  +/
  af_err af_convolve1(af_array *output, const af_array signal, const af_array filter, const af_conv_mode mode, af_conv_domain domain);

  /+
    C Interface for convolution on two dimensional signals

    \param[out] output is convolved array
    \param[in]  signal is the input signal
    \param[in]  filter is the signal that shall be flipped for the convolution operation
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \param[in]  domain specifies if the convolution should be performed in frequency os spatial domain
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \note The default parameter of \p domain, \ref AF_CONV_AUTO, heuristically switches between frequency and spatial domain.

    \ingroup signal_func_convolve2
  +/
  af_err af_convolve2(af_array *output, const af_array signal, const af_array filter, const af_conv_mode mode, af_conv_domain domain);

  /+
    C Interface for convolution on three dimensional signals

    \param[out] output is convolved array
    \param[in]  signal is the input signal
    \param[in]  filter is the signal that shall be flipped for the convolution operation
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \param[in]  domain specifies if the convolution should be performed in frequency os spatial domain
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \note The default parameter of \p domain, \ref AF_CONV_AUTO, heuristically switches between frequency and spatial domain.

    \ingroup signal_func_convolve3
  +/
  af_err af_convolve3(af_array *output, const af_array signal, const af_array filter, const af_conv_mode mode, af_conv_domain domain);

  /+
    C Interface for separable convolution on two dimensional signals

    \param[out] output is convolved array
    \param[in]  col_filter is filter that has to be applied along the coloumns
    \param[in]  row_filter is filter that has to be applied along the rows
    \param[in]  signal is the input array
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \note Separable convolution only supports two(ONE-to-ONE and MANY-to-ONE) batch modes from the ones described
    in the detailed description section.

    \ingroup signal_func_convolve
  +/
  af_err af_convolve2_sep(af_array *output, const af_array col_filter, const af_array row_filter, const af_array signal, const af_conv_mode mode);

  /+
    C Interface for FFT-based convolution on one dimensional signals

    \param[out] output is convolved array
    \param[in]  signal is the input signal
    \param[in]  filter is the signal that shall be used for the convolution operation
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_fft_convolve1
  +/
  af_err af_fft_convolve1(af_array *output, const af_array signal, const af_array filter, const af_conv_mode mode);

  /+
    C Interface for FFT-based convolution on two dimensional signals

    \param[out] output is convolved array
    \param[in]  signal is the input signal
    \param[in]  filter is the signal that shall be used for the convolution operation
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_fft_convolve2
  +/
  af_err af_fft_convolve2(af_array *output, const af_array signal, const af_array filter, const af_conv_mode mode);

  /+
    C Interface for FFT-based convolution on three dimensional signals

    \param[out] output is convolved array
    \param[in]  signal is the input signal
    \param[in]  filter is the signal that shall be used for the convolution operation
    \param[in]  mode indicates if the convolution should be expanded or not(where output size equals input)
    \return     \ref AF_SUCCESS if the convolution is successful,
    otherwise an appropriate error code is returned.

    \ingroup signal_func_fft_convolve3
  +/
  af_err af_fft_convolve3(af_array *output, const af_array signal, const af_array filter, const af_conv_mode mode);

  /+
    C Interface for finite impulse response  filter

    \param[out] y is the output signal from the filter
    \param[in] b is the array containing the coefficients of the filter
    \param[in] x is the input signal to the filter

    \ingroup signal_func_fir
  +/
  af_err af_fir(af_array *y, const af_array b, const af_array x);

  /+
    C Interface for infinite impulse response filter

    \param[out] y is the output signal from the filter
    \param[in] b is the array containing the feedforward coefficients
    \param[in] a is the array containing the feedback coefficients
    \param[in] x is the input signal to the filter

    \note The feedforward coefficients are currently limited to a length of 512

    \ingroup signal_func_iir
  +/
  af_err af_iir(af_array *y, const af_array b, const af_array a, const af_array x);

  /+
    C Interface for median filter

    \param[out] output array is the processed image
    \param[in]  input array is the input image
    \param[in]  wind_length is the kernel height
    \param[in]  wind_width is the kernel width
    \param[in]  edge_pad value will decide what happens to border when running
    filter in their neighborhood. It takes one of the values [\ref AF_PAD_ZERO | \ref AF_PAD_SYM]
    \return     \ref AF_SUCCESS if the median filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_medfilt
  +/
  af_err af_medfilt(af_array *output, const af_array input, const dim_t wind_length, const dim_t wind_width, const af_border_type edge_pad);

  //#if AF_API_VERSION >= 34
  /+
    C Interface for 1D median filter

    \param[out] output array is the processed signal
    \param[in]  input array is the input signal
    \param[in]  wind_width is the kernel width
    \param[in]  edge_pad value will decide what happens to border when running
    filter in their neighborhood. It takes one of the values [\ref AF_PAD_ZERO | \ref AF_PAD_SYM]
    \return     \ref AF_SUCCESS if the median filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_medfilt
  +/
  af_err af_medfilt1(af_array *output, const af_array input, const dim_t wind_width, const af_border_type edge_pad);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for median filter

    \param[out] output array is the processed image
    \param[in]  input array is the input image
    \param[in]  wind_length is the kernel height
    \param[in]  wind_width is the kernel width
    \param[in]  edge_pad value will decide what happens to border when running
    filter in their neighborhood. It takes one of the values [\ref AF_PAD_ZERO | \ref AF_PAD_SYM]
    \return     \ref AF_SUCCESS if the median filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_medfilt
  +/
  af_err af_medfilt2(af_array *output, const af_array input, const dim_t wind_length, const dim_t wind_width, const af_border_type edge_pad);
  //#endif


  //#if AF_API_VERSION >= 34
  /+
    C Interface for setting plan cache size

    This function doesn't do anything if called when CPU backend is active. The plans associated with
    the most recently used array sizes are cached.

    \param[in] cache_size is the number of plans that shall be cached
  +/
  af_err af_set_fft_plan_cache_size(size_t cache_size);
  //#endif

}
