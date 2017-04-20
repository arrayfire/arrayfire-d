module arrayfire.image;

import arrayfire.defines;

extern ( C ) {

  /+
    C Interface for calculating the gradients

    \param[out] dx the gradient along first dimension
    \param[out] dy the gradient along second dimension
    \param[in]  input is the input array
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup calc_func_grad
  +/
  af_err af_gradient(af_array *dx, af_array *dy, const af_array input);

  /+
    C Interface for loading an image

    \param[out] output will contain the image
    \param[in] filename is name of file to be loaded
    \param[in] isColor boolean denoting if the image should be loaded as 1 channel or 3 channel
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup imageio_func_load
  +/
  af_err af_load_image(af_array *output, const char* filename, const bool isColor);

  /+
    C Interface for saving an image

    \param[in] filename is name of file to be loaded
    \param[in] input is the arrayfire array to be saved as an image
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup imageio_func_save
  +/
  af_err af_save_image(const char* filename, const af_array input);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for loading an image from memory

    \param[out] output is an array that will contain the image
    \param[in] ptr is the FIMEMORY pointer created by either saveImageMem function, the
    af_save_image_memory function, or the FreeImage_OpenMemory API.
    \return     \ref AF_SUCCESS if successful

    \ingroup imagemem_func_load
  +/
  af_err af_load_image_memory(af_array *output, const void* ptr);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for saving an image to memory using FreeImage

    \param[out] ptr is the FIMEMORY pointer created by FreeImage.
    \param[in] input is the arrayfire array to be saved as an image
    \param[in] format is the type of image to create in memory. The enum borrows from
    the FREE_IMAGE_FORMAT enum of FreeImage. Other values not included in af_image_format
    but included in putFREE_IMAGE_FORMAT can also be passed to this function.
    \return     \ref AF_SUCCESS if successful.

    \ingroup imagemem_func_save
  +/
  af_err af_save_image_memory(void** ptr, const af_array input, const af_image_format format);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for deleting an image from memory

    \param[in] ptr is the FIMEMORY pointer created by either saveImageMem function, the
    af_save_image_memory function, or the FreeImage_OpenMemory API.
    \return     \ref AF_SUCCESS if successful

    \ingroup imagemem_func_delete
  +/
  af_err af_delete_image_memory(void* ptr);
  //#endif

  //#if AF_API_VERSION >= 32
  /+
    C Interface for loading an image as is original type

    This load image function allows you to load images as u8, u16 or f32
    depending on the type of input image as shown by the table below.

    Bits per Color (Gray/RGB/RGBA Bits Per Pixel) | Array Type  | Range
    -----------------------------------------------|-------------|---------------
    8 ( 8/24/32  BPP)                            | u8          | 0 - 255
    16 (16/48/64  BPP)                            | u16         | 0 - 65535
    32 (32/96/128 BPP)                            | f32         | 0 - 1

    \param[out] output contains them image
    \param[in] filename is name of file to be loaded
    \return     \ref AF_SUCCESS if successful

    \ingroup imageio_func_load
  +/
  af_err af_load_image_native(af_array *output, const char* filename);
  //#endif

  //#if AF_API_VERSION >= 32
  /+
    C Interface for saving an image withoutput modifications

    This function only accepts u8, u16, f32 arrays. These arrays are saved to
    images withoutput any modifications.

    You must also note that note all image type support 16 or 32 bit images.

    The best options for 16 bit images are PNG, PPM and TIFF.
    The best option for 32 bit images is TIFF.
    These allow lossless storage.

    The images stored have the following properties:

    Array Type  | Bits per Color (Gray/RGB/RGBA Bits Per Pixel) | Range
    -------------|-----------------------------------------------|---------------
    u8          |  8 ( 8/24/32  BPP)                            | 0 - 255
    u16         | 16 (16/48/64  BPP)                            | 0 - 65535
    f32         | 32 (32/96/128 BPP)                            | 0 - 1

    \param[in] filename is name of file to be saved
    \param[in] input is the array to be saved. Should be u8 for saving 8-bit image,
    u16 for 16-bit image, and f32 for 32-bit image.

    \return     \ref AF_SUCCESS if successful

    \ingroup imageio_func_save
  +/
  af_err af_save_image_native(const char* filename, const af_array input);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Function to check if Image IO is available

    \param[out] output is true if ArrayFire was commpiled with ImageIO support,
    false otherwise.

    \return     \ref AF_SUCCESS if successful

    \ingroup imageio_func_available
  +/
  af_err af_is_image_io_available(bool *output);
  //#endif

  /+
    C Interface for resizing an image to specified dimensions

    \param[out] output will contain the resized image of specified by \p odim0 and \p odim1
    \param[in] input is input image
    \param[in] odim0 is the size for the first output dimension
    \param[in] odim1 is the size for the second output dimension
    \param[in] method is the interpolation type (Nearest by default)

    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup transform_func_resize
  +/
  af_err af_resize(af_array *output, const af_array input, const dim_t odim0, const dim_t odim1, const af_interp_type method);

  /+
    C Interface for transforming an image

    \param[out] output will contain the transformed image
    \param[in] input is input image
    \param[in] transform is transformation matrix
    \param[in] odim0 is the first output dimension
    \param[in] odim1 is the second output dimension
    \param[in] method is the interpolation type (Nearest by default)
    \param[in] inverse if true applies inverse transform, if false applies forward transoform
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup transform_func_transform
  +/
  af_err af_transform(af_array *output, const af_array input, const af_array transform,
    const dim_t odim0, const dim_t odim1,
    const af_interp_type method, const bool inverse);

  //#if AF_API_VERSION >= 33
  /+
    C Interface for transforming an image
    C++ Interface for transforming coordinates

    \param[out] output the transformed coordinates
    \param[in] tf is transformation matrix
    \param[in] d0 is the first input dimension
    \param[in] d1 is the second input dimension

    \ingroup transform_func_coordinates
  +/
  af_err af_transform_coordinates(af_array *output, const af_array tf, const float d0, const float d1);
  //#endif

  /+
    C Interface for rotating an image

    \param[out] output will contain the image \p input rotated by \p theta
    \param[in] input is input image
    \param[in] theta is the degree (in radians) by which the input is rotated
    \param[in] crop if true the output is cropped original dimensions. If false the output dimensions scale based on \p theta
    \param[in] method is the interpolation type (Nearest by default)
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup transform_func_rotate
  +/
  af_err af_rotate(af_array *output, const af_array input, const float theta,
    const bool crop, const af_interp_type method);
  /+
    C Interface for translate an image

    \param[out] output will contain the translated image
    \param[in] input is input image
    \param[in] trans0 is amount by which the first dimension is translated
    \param[in] trans1 is amount by which the second dimension is translated
    \param[in] odim0 is the first output dimension
    \param[in] odim1 is the second output dimension
    \param[in] method is the interpolation type (Nearest by default)
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup transform_func_translate
  +/
  af_err af_translate(af_array *output, const af_array input, const float trans0, const float trans1,
    const dim_t odim0, const dim_t odim1, const af_interp_type method);
  /+
    C Interface for scaling an image

    \param[out] output will contain the scaled image
    \param[in] input is input image
    \param[in] scale0 is amount by which the first dimension is scaled
    \param[in] scale1 is amount by which the second dimension is scaled
    \param[in] odim0 is the first output dimension
    \param[in] odim1 is the second output dimension
    \param[in] method is the interpolation type (Nearest by default)
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup transform_func_scale
  +/
  af_err af_scale(af_array *output, const af_array input, const float scale0, const float scale1,
    const dim_t odim0, const dim_t odim1, const af_interp_type method);
  /+
    C Interface for skewing an image

    \param[out] output will contain the skewed image
    \param[in] input is input image
    \param[in] skew0 is amount by which the first dimension is skewed
    \param[in] skew1 is amount by which the second dimension is skewed
    \param[in] odim0 is the first output dimension
    \param[in] odim1 is the second output dimension
    \param[in] inverse if true applies inverse transform, if false applies forward transoform
    \param[in] method is the interpolation type (Nearest by default)
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup transform_func_skew
  +/
  af_err af_skew(af_array *output, const af_array input, const float skew0, const float skew1,
    const dim_t odim0, const dim_t odim1, const af_interp_type method,
    const bool inverse);

  /+
    C Interface for histogram

    \param[out] output (type u32) is the histogram for input array input
    \param[in]  input is the input array
    \param[in]  nbins  Number of bins to populate between min and max
    \param[in]  minval minimum bin value (accumulates -inf to min)
    \param[in]  maxval minimum bin value (accumulates max to +inf)
    \return     \ref AF_SUCCESS if the histogram is successfully created,
    otherwise an appropriate error code is returned.

    \ingroup image_func_histogram
  +/
  af_err af_histogram(af_array *output, const af_array input, const uint nbins, const double minval, const double maxval);

  /+
    C Interface for image dilation (max filter)

    \param[out] output array is the dilated image
    \param[in]  input array is the input image
    \param[in]  mask is the neighborhood window
    \return     \ref AF_SUCCESS if the dilated successfully,
    otherwise an appropriate error code is returned.

    \note if \p mask is all ones, this function behaves like max filter

    \ingroup image_func_dilate
  +/
  af_err af_dilate(af_array *output, const af_array input, const af_array mask);

  /+
    C Interface for 3d image dilation

    \param[out] output array is the dilated volume
    \param[in]  input array is the input volume
    \param[in]  mask is the neighborhood delta volume
    \return     \ref AF_SUCCESS if the dilated successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_dilate3d
  +/
  af_err af_dilate3(af_array *output, const af_array input, const af_array mask);

  /+
    C Interface for image erosion (min filter)

    \param[out] output array is the eroded image
    \param[in]  input array is the input image
    \param[in]  mask is the neighborhood window
    \return     \ref AF_SUCCESS if the eroded successfully,
    otherwise an appropriate error code is returned.

    \note if \p mask is all ones, this function behaves like min filter

    \ingroup image_func_erode
  +/
  af_err af_erode(af_array *output, const af_array input, const af_array mask);

  /+
    C Interface for 3D image erosion

    \param[out] output array is the eroded volume
    \param[in]  input array is the input volume
    \param[in]  mask is the neighborhood delta volume
    \return     \ref AF_SUCCESS if the eroded successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_erode3d
  +/
  af_err af_erode3(af_array *output, const af_array input, const af_array mask);

  /+
    C Interface for bilateral filter

    \param[out] output array is the processed image
    \param[in]  input array is the input image
    \param[in]  spatial_sigma is the spatial variance parameter that decides the filter window
    \param[in]  chromatic_sigma is the chromatic variance parameter
    \param[in]  isColor indicates if the input \p input is color image or grayscale
    \return     \ref AF_SUCCESS if the filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_bilateral
  +/
  af_err af_bilateral(af_array *output, const af_array input, const float spatial_sigma, const float chromatic_sigma, const bool isColor);

  /+
    C Interface for mean shift

    \param[out] output array is the processed image
    \param[in]  input array is the input image
    \param[in]  spatial_sigma is the spatial variance parameter that decides the filter window
    \param[in]  chromatic_sigma is the chromatic variance parameter
    \param[in]  iter is the number of iterations filter operation is performed
    \param[in]  is_color indicates if the input \p input is color image or grayscale
    \return     \ref AF_SUCCESS if the filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_mean_shift
  +/
  af_err af_mean_shift(af_array *output, const af_array input, const float spatial_sigma, const float chromatic_sigma, const uint iter, const bool is_color);

  /+
    C Interface for minimum filter

    \param[out] output array is the processed image
    \param[in]  input array is the input image
    \param[in]  wind_length is the kernel height
    \param[in]  wind_width is the kernel width
    \param[in]  edge_pad value will decide what happens to border when running
    filter in their neighborhood. It takes one of the values [\ref AF_PAD_ZERO | \ref AF_PAD_SYM]
    \return     \ref AF_SUCCESS if the minimum filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_minfilt
  +/
  af_err af_minfilt(af_array *output, const af_array input, const dim_t wind_length, const dim_t wind_width, const af_border_type edge_pad);

  /+
    C Interface for maximum filter

    \param[out] output array is the processed image
    \param[in]  in array is the input image
    \param[in]  wind_length is the kernel height
    \param[in]  wind_width is the kernel width
    \param[in]  edge_pad value will decide what happens to border when running
    filter in their neighborhood. It takes one of the values [\ref AF_PAD_ZERO | \ref AF_PAD_SYM]
    \return     \ref AF_SUCCESS if the maximum filter is applied successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_maxfilt
  +/
  af_err af_maxfilt(af_array *output, const af_array input, const dim_t wind_length, const dim_t wind_width, const af_border_type edge_pad);

  /+
    C Interface for regions in an image

    \param[out] output array will have labels indicating different regions
    \param[in]  input array should be binary image of type \ref b8
    \param[in]  connectivity can take one of the following [\ref AF_CONNECTIVITY_4 | \ref AF_CONNECTIVITY_8]
    \param[in]  ty is type of output array
    \return     \ref AF_SUCCESS if the regions are identified successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_regions
  +/
  af_err af_regions(af_array *output, const af_array input, const af_connectivity connectivity, const af_dtype ty);

  /+
    C Interface for getting sobel gradients

    \param[out] dx is derivative along horizontal direction
    \param[out] dy is derivative along vertical direction
    \param[in]  img is an array with image data
    \param[in]  ker_size sobel kernel size or window size
    \return     \ref AF_SUCCESS if sobel derivatives are computed successfully,
    otherwise an appropriate error code is returned.

    \note If \p img is 3d array, a batch operation will be performed.

    \ingroup image_func_sobel
  +/
  af_err af_sobel_operator(af_array *dx, af_array *dy, const af_array img, const uint ker_size);

  /+
    C Interface for converting RGB to gray

    \param[out] output is an array in target color space
    \param[in]  input is an array in the RGB color space
    \param[in]  rPercent is percentage of red channel value contributing to grayscale intensity
    \param[in]  gPercent is percentage of green channel value contributing to grayscale intensity
    \param[in]  bPercent is percentage of blue channel value contributing to grayscale intensity
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be three dimensional for RGB to Grayscale conversion.

    \ingroup image_func_rgb2gray
  +/
  af_err af_rgb2gray(af_array* output, const af_array input, const float rPercent, const float gPercent, const float bPercent);

  /+
    C Interface for converting gray to RGB

    \param[out] output is an array in target color space
    \param[in]  input is an array in the Grayscale color space
    \param[in]  rFactor is percentage of intensity value contributing to red channel
    \param[in]  gFactor is percentage of intensity value contributing to green channel
    \param[in]  bFactor is percentage of intensity value contributing to blue channel
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be two dimensional for Grayscale to RGB conversion.

    \ingroup image_func_gray2rgb
  +/
  af_err af_gray2rgb(af_array* output, const af_array input, const float rFactor, const float gFactor, const float bFactor);

  /+
    C Interface for histogram equalization

    \param[out] output is an array with data that has histogram approximately equal to histogram
    \param[in]  input is the input array, non-normalized input (!! assumes values [0-255] !!)
    \param[in]  hist target histogram to approximate in output (based on number of bins)
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be two dimensional.

    \ingroup image_func_histequal
  +/
  af_err af_hist_equal(af_array *output, const af_array input, const af_array hist);

  /+
    C Interface generating gaussian kernels

    \param[out] output is an array with values generated using gaussian function
    \param[in]  rows number of rows of the gaussian kernel
    \param[in]  cols number of columns of the gaussian kernel
    \param[in]  sigma_r (default 0) (calculated internally as 0.25 * rows + 0.75)
    \param[in]  sigma_c (default 0) (calculated internally as 0.25 * cols + 0.75)
    \return     \ref AF_SUCCESS if gaussian distribution values are generated successfully,
    otherwise an appropriate error code is returned.

    \ingroup image_func_gauss
  +/
  af_err af_gaussian_kernel(af_array *output,
    const int rows, const int cols,
    const double sigma_r, const double sigma_c);

  /+
    C Interface for converting HSV to RGB

    \param[out] output is an array in the RGB color space
    \param[in]  input is an array in the HSV color space
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be three dimensional

    \ingroup image_func_hsv2rgb
  +/
  af_err af_hsv2rgb(af_array* output, const af_array input);

  /+
    C Interface for converting RGB to HSV

    \param[out] output is an array in the HSV color space
    \param[in]  in is an array in the RGB color space
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be three dimensional

    \ingroup image_func_rgb2hsv
  +/
  af_err af_rgb2hsv(af_array* output, const af_array input);

  /+
    C Interface wrapper for color space conversion

    \param[out] output is an array in target color space
    \param[in]  image is the input array
    \param[in]  to is the target array color space \param[in]
    from is the input array color space
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code
    is returned.

    \note  \p image must be 3 dimensional for \ref AF_HSV to \ref AF_RGB, \ref
    AF_RGB to \ref AF_HSV, & \ref AF_RGB to \ref AF_GRAY transformations.
    For \ref AF_GRAY to \ref AF_RGB transformation, 2D array is expected.

    \ingroup image_func_colorspace
  +/
  af_err af_color_space(af_array *output, const af_array image, const af_cspace_t to, const af_cspace_t from);

  //#if AF_API_VERSION >= 31
  /+
    C Interface wrapper for unwrap

    \param[out] output is an array with image blocks as rows or columns.
    \param[in]  input is the input image (or set of images)
    \param[in]  wx is the block window size along 0th-dimension between [1, input.dims[0] + px]
    \param[in]  wy is the block window size along 1st-dimension between [1, input.dims[1] + py]
    \param[in]  sx is the stride along 0th-dimension
    \param[in]  sy is the stride along 1st-dimension
    \param[in]  px is the padding along 0th-dimension between [0, wx). Padding is applied both before and after.
    \param[in]  py is the padding along 1st-dimension between [0, wy). Padding is applied both before and after.
    \param[in]  is_column specifies the layoutput for the unwrapped patch. If is_column is false, the unrapped patch is laid output as a row.
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \ingroup image_func_unwrap
  +/
  af_err af_unwrap(af_array *output, const af_array input, const dim_t wx, const dim_t wy,
    const dim_t sx, const dim_t sy, const dim_t px, const dim_t py,
    const bool is_column);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface wrapper for wrap

    \param[out] output is an array after converting
    \param[in]  input is the input array
    \param[in]  ox is the 0th-dimension of \p output
    \param[in]  oy is the ist-dimension of \p output
    \param[in]  wx is the block window size along 0th-dimension between
    \param[in]  wy is the block window size along 1st-dimension between
    \param[in]  sx is the stride along 0th-dimension
    \param[in]  sy is the stride along 1st-dimension
    \param[in]  px is the padding used along 0th-dimension between [0, wx).
    \param[in]  py is the padding used along 1st-dimension between [0, wy).
    \param[in]  is_column specifies the layoutput for the unwrapped patch. If is_column is false, the rows are treated as the patches
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note The padding used in \ref af_unwrap is calculated from the provided parameters

    \ingroup image_func_wrap
  +/
  af_err af_wrap(af_array *output,
    const af_array input,
    const dim_t ox, const dim_t oy,
    const dim_t wx, const dim_t wy,
    const dim_t sx, const dim_t sy,
    const dim_t px, const dim_t py,
    const bool is_column);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface wrapper for summed area tables

    \param[out] output is the summed area table on input image(s)
    \param[in]  in is the input array
    \return \ref AF_SUCCESS if the sat computation is successful,
    otherwise an appropriate error code is returned.

    \ingroup image_func_sat
  +/
  af_err af_sat(af_array *output, const af_array input);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for converting YCbCr to RGB

    \param[out] output is an array in the RGB color space
    \param[in]  input is an array in the YCbCr color space
    \param[in]  standard specifies the ITU-R BT "xyz" standard which determines the Kb, Kr values
    used in colorspace conversion equation
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be three dimensional and values should lie in the range [0,1]

    \ingroup image_func_ycbcr2rgb
  +/
  af_err af_ycbcr2rgb(af_array* output, const af_array input, const af_ycc_std standard);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface for converting RGB to YCbCr

    \param[out] output is an array in the YCbCr color space
    \param[in]  input is an array in the RGB color space
    \param[in]  standard specifies the ITU-R BT "xyz" standard which determines the Kb, Kr values
    used in colorspace conversion equation
    \return     \ref AF_SUCCESS if the color transformation is successful,
    otherwise an appropriate error code is returned.

    \note \p in must be three dimensional and values should lie in the range [0,1]

    \ingroup image_func_rgb2ycbcr
  +/
  af_err af_rgb2ycbcr(af_array* output, const af_array input, const af_ycc_std standard);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for finding image moments

    \param[out] output is an array containing the calculated moments
    \param[in]  input is an array of image(s)
    \param[in] moment is moment(s) to calculate
    \return     ref AF_SUCCESS if the moment calculation is successful,
    otherwise an appropriate error code is returned.

    \ingroup image_func_moments
  +/
  af_err af_moments(af_array *output, const af_array input, const af_moment_type moment);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for calculating image moment(s) of a single image

    \param[out] output is a pointer to a pre-allocated array where the calculated moment(s) will be placed.
    User is responsible for ensuring enough space to hold all requested moments
    \param[in] input is the input image
    \param[in] moment is moment(s) to calculate
    \return     ref AF_SUCCESS if the moment calculation is successful,
    otherwise an appropriate error code is returned.

    \ingroup image_func_moments
  +/
  af_err af_moments_all(double* output, const af_array input, const af_moment_type moment);
  //#endif

}
