module arrayfire.vision;

import arrayfire.defines;
import arrayfire.features;

extern ( C ) {

  /+
    C Interface for FAST feature detector

    \param[out] output struct containing arrays for x and y
    coordinates and score, while array orientation is set to 0
    as FAST does not compute orientation, and size is set to 1
    as FAST does not compute multiple scales
    \param[in]  input array containing a grayscale image (color images are
    not supported)
    \param[in]  thr FAST threshold for which a pixel of the circle around
    the central pixel is considered to be greater or smaller
    \param[in]  arc_length length of arc (or sequential segment) to be
    tested, must be within range [9-16]
    \param[in]  non_max performs non-maximal suppression if true
    \param[in]  feature_ratio maximum ratio of features to detect, the
    maximum number of features is calculated by
    feature_ratio * input.elements(). The maximum number of
    features is not based on the score, instead, features
    detected after the limit is reached are discarded
    \param[in]  edge is the length of the edges in the image to be
    discarded by FAST (minimum is 3, as the radius of the
    circle)

    \ingroup cv_func_fast
  +/
  af_err af_fast(af_features *output, const af_array input, const float thr, const uint arc_length,
    const bool non_max, const float feature_ratio, const uint edge);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for Harris corner detector

    \param[out] output struct containing arrays for x and y
    coordinates and score (Harris response), while arrays
    orientation and size are set to 0 and 1, respectively,
    because Harris does not compute that information
    \param[in]  input array containing a grayscale image (color images are not
    supported)
    \param[in]  max_corners maximum number of corners to keep, only retains
    those with highest Harris responses
    \param[in]  min_response minimum response in order for a corner to be
    retained, only used if max_corners = 0
    \param[in]  sigma the standard deviation of a circular window (its
    dimensions will be calculated according to the standard
    deviation), the covariation matrix will be calculated to a
    circular neighborhood of this standard deviation (only used
    when block_size == 0, must be >= 0.5f and <= 5.0f)
    \param[in]  block_size square window size, the covariation matrix will be
    calculated to a square neighborhood of this size (must be
    >= 3 and <= 31)
    \param[in]  k_thr Harris constant, usually set empirically to 0.04f (must
    be >= 0.01f)

    \ingroup cv_func_harris
  +/
  af_err af_harris(af_features *output, const af_array input, const uint max_corners,
    const float min_response, const float sigma,
    const uint block_size, const float k_thr);
  //#endif

  /+
    C Interface for ORB feature descriptor

    \param[out] feat af_features struct composed of arrays for x and y
    coordinates, score, orientation and size of selected features
    \param[out] desc Nx8 array containing extracted descriptors, where N is the
    number of selected features
    \param[in]  input array containing a grayscale image (color images are not
    supported)
    \param[in]  fast_thr FAST threshold for which a pixel of the circle around
    the central pixel is considered to be brighter or darker
    \param[in]  max_feat maximum number of features to hold (will only keep the
    max_feat features with higher Harris responses)
    \param[in]  scl_fctr factor to downsample the input image, meaning that
    each level will hold prior level dimensions divided by scl_fctr
    \param[in]  levels number of levels to be computed for the image pyramid
    \param[in]  blur_img blur image with a Gaussian filter with sigma=2 before
    computing descriptors to increase robustness against noise if
    true

    \ingroup cv_func_orb
  +/
  af_err af_orb(af_features *feat, af_array *desc, const af_array input,
    const float fast_thr, const uint max_feat, const float scl_fctr,
    const uint levels, const bool blur_img);

  //#if AF_API_VERSION >= 31
  /+
    C++ Interface for SIFT feature detector and descriptor

    \param[out] feat af_features object composed of arrays for x and y
    coordinates, score, orientation and size of selected features
    \param[out] desc Nx128 array containing extracted descriptors, where N is the
    number of features found by SIFT
    \param[in]  input array containing a grayscale image (color images are not
    supported)
    \param[in]  n_layers number of layers per octave, the number of octaves is
    computed automatically according to the input image dimensions,
    the original SIFT paper suggests 3
    \param[in]  contrast_thr threshold used to filter output features that have
    low contrast, the original SIFT paper suggests 0.04
    \param[in]  edge_thr threshold used to filter output features that are too
    edge-like, the original SIFT paper suggests 10.0
    \param[in]  init_sigma the sigma value used to filter the input image at
    the first octave, the original SIFT paper suggests 1.6
    \param[in]  double_input if true, the input image dimensions will be
    doubled and the doubled image will be used for the first octave
    \param[in]  intensity_scale the inverse of the difference between the minimum
    and maximum grayscale intensity value, e.g.: if the ranges are
    0-256, the proper intensity_scale value is 1/256, if the ranges
    are 0-1, the proper intensity-scale value is 1/1
    \param[in]  feature_ratio maximum ratio of features to detect, the maximum
    number of features is calculated by feature_ratio * input.elements().
    The maximum number of features is not based on the score, instead,
    features detected after the limit is reached are discarded

    \ingroup cv_func_sift
  +/
  af_err af_sift(af_features *feat, af_array *desc, const af_array input,
    const uint n_layers, const float contrast_thr, const float edge_thr,
    const float init_sigma, const bool double_input,
    const float intensity_scale, const float feature_ratio);
  //#endif

  //#if AF_API_VERSION >= 32
  /+
    C++ Interface for SIFT feature detector and GLOH descriptor

    \param[out] feat af_features object composed of arrays for x and y
    coordinates, score, orientation and size of selected features
    \param[out] desc Nx272 array containing extracted GLOH descriptors, where N
    is the number of features found by SIFT
    \param[in]  input array containing a grayscale image (color images are not
    supported)
    \param[in]  n_layers number of layers per octave, the number of octaves is
    computed automatically according to the input image dimensions,
    the original SIFT paper suggests 3
    \param[in]  contrast_thr threshold used to filter output features that have
    low contrast, the original SIFT paper suggests 0.04
    \param[in]  edge_thr threshold used to filter output features that are too
    edge-like, the original SIFT paper suggests 10.0
    \param[in]  init_sigma the sigma value used to filter the input image at
    the first octave, the original SIFT paper suggests 1.6
    \param[in]  double_input if true, the input image dimensions will be
    doubled and the doubled image will be used for the first octave
    \param[in]  intensity_scale the inverse of the difference between the minimum
    and maximum grayscale intensity value, e.g.: if the ranges are
    0-256, the proper intensity_scale value is 1/256, if the ranges
    are 0-1, the proper intensity-scale value is 1/1
    \param[in]  feature_ratio maximum ratio of features to detect, the maximum
    number of features is calculated by feature_ratio * input.elements().
    The maximum number of features is not based on the score, instead,
    features detected after the limit is reached are discarded

    \ingroup cv_func_sift
  +/
  af_err af_gloh(af_features *feat, af_array *desc, const af_array input,
    const uint n_layers, const float contrast_thr,
    const float edge_thr, const float init_sigma, const bool double_input,
    const float intensity_scale, const float feature_ratio);
  //#endif

  /+
    C Interface wrapper for Hamming matcher

    \param[out] idx is an array of MxN size, where M is equal to the number of query
    features and N is equal to n_dist. The value at position IxJ indicates
    the index of the Jth smallest distance to the Ith query value in the
    train data array.
    the index of the Ith smallest distance of the Mth query.
    \param[out] dist is an array of MxN size, where M is equal to the number of query
    features and N is equal to n_dist. The value at position IxJ indicates
    the Hamming distance of the Jth smallest distance to the Ith query
    value in the train data array.
    \param[in]  query is the array containing the data to be queried
    \param[in]  train is the array containing the data used as training data
    \param[in]  dist_dim indicates the dimension to analyze for distance (the dimension
    indicated here must be of equal length for both query and train arrays)
    \param[in]  n_dist is the number of smallest distances to return (currently, only 1
    is supported)

    \ingroup cv_func_hamming_matcher
  +/
  af_err af_hamming_matcher(af_array* idx, af_array* dist,
      const af_array query, const af_array train,
      const dim_t dist_dim, const uint n_dist);

  //#if AF_API_VERSION >= 31
  /+
    C Interface wrapper for Nearest Neighbour

    \param[out] idx is an array of MxN size, where M is equal to the number of query
    features and N is equal to n_dist. The value at position IxJ indicates
    the index of the Jth smallest distance to the Ith query value in the
    train data array.
    the index of the Ith smallest distance of the Mth query.
    \param[out] dist is an array of MxN size, where M is equal to the number of query
    features and N is equal to n_dist. The value at position IxJ indicates
    the distance of the Jth smallest distance to the Ith query value in the
    train data array based on the dist_type chosen.
    \param[in]  query is the array containing the data to be queried
    \param[in]  train is the array containing the data used as training data
    \param[in]  dist_dim indicates the dimension to analyze for distance (the dimension
    indicated here must be of equal length for both query and train arrays)
    \param[in]  n_dist is the number of smallest distances to return (currently, only 1
    is supported)
    \param[in]  dist_type is the distance computation type. Currently \ref AF_SAD (sum
    of absolute differences), \ref AF_SSD (sum of squared differences), and
    \ref AF_SHD (hamming distances) are supported.

    \ingroup cv_func_nearest_neighbour
  +/
  af_err af_nearest_neighbour(af_array* idx, af_array* dist,
        const af_array query, const af_array train,
        const dim_t dist_dim, const uint n_dist,
        const af_match_type dist_type);
  //#endif

  /+
    C Interface for image template matching

    \param[out] output will have disparity values for the window starting at
    corresponding pixel position
    \param[in]  search_img is an array with image data
    \param[in]  template_img is the template we are looking for in the image
    \param[in]  m_type is metric that should be used to calculate the disparity
    between window in the image and the template image. It can be one of
    the values defined by the enum \ref af_match_type
    \return     \ref AF_SUCCESS if disparity metric is computed successfully,
    otherwise an appropriate error code is returned.

    \note If \p search_img is 3d array, a batch operation will be performed.

    \ingroup cv_func_match_template
  +/
  af_err af_match_template(af_array *output, const af_array search_img,
     const af_array template_img, const af_match_type m_type);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for SUSAN corner detector

    \param[out] output is af_features struct composed of arrays for x and y
    coordinates, score, orientation and size of selected features
    \param[in]  input is input grayscale/intensity image
    \param[in]  radius nucleus radius for each pixel neighborhood
    \param[in]  diff_thr intensity difference threshold a.k.a **t** from equations in description
    \param[in]  geom_thr geometric threshold
    \param[in]  feature_ratio is maximum number of features that will be returned by the function
    \param[in]  edge indicates how many pixels width area should be skipped for corner detection
    \return \ref AF_SUCCESS if SUSAN corner detection is successfull, otherwise an appropriate
    error code is returned.

    \note If \p input is a 3d array, a batch operation will be performed.

    \ingroup cv_func_susan
  +/
  af_err af_susan(af_features* output, const af_array input, const uint radius,
    const float diff_thr, const float geom_thr,
    const float feature_ratio, const uint edge);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    C Interface wrapper for Difference of Gaussians

    \param[out] output is difference of smoothed inputs
    \param[in] input is input image
    \param[in] radius1 is the radius of first gaussian kernel
    \param[in] radius2 is the radius of second gaussian kernel
    \return    \ref AF_SUCCESS if the computation is is successful,
    otherwise an appropriate error code is returned.

    \ingroup cv_func_dog
  +/
  af_err af_dog(af_array *output, const af_array input, const int radius1, const int radius2);
  //#endif

  //#if AF_API_VERSION >= 32
  /+
    C Interface wrapper for Homography estimation

    \param[out] H is a 3x3 array containing the estimated homography.
    \param[out] inliers is the number of inliers that the homography was estimated to comprise,
    in the case that htype is AF_HOMOGRAPHY_RANSAC, a higher inlier_thr value will increase the
    estimated inliers. Note that if the number of inliers is too low, it is likely
    that a bad homography will be returned.
    \param[in]  x_src x coordinates of the source points.
    \param[in]  y_src y coordinates of the source points.
    \param[in]  x_dst x coordinates of the destination points.
    \param[in]  y_dst y coordinates of the destination points.
    \param[in]  htype can be AF_HOMOGRAPHY_RANSAC, for which a RANdom SAmple Consensus will be
    used to evaluate the homography quality (e.g., number of inliers), or AF_HOMOGRAPHY_LMEDS,
    which will use Least Median of Squares method to evaluate homography quality.
    \param[in]  inlier_thr if htype is AF_HOMOGRAPHY_RANSAC, this parameter will five the maximum L2-distance
    for a point to be considered an inlier.
    \param[in]  iterations maximum number of iterations when htype is AF_HOMOGRAPHY_RANSAC and backend is CPU,
    if backend is CUDA or OpenCL, iterations is the total number of iterations, an
    iteration is a selection of 4 random points for which the homography is estimated
    and evaluated for number of inliers.
    \param[in]  otype the array type for the homography output.
    \return     \ref AF_SUCCESS if the computation is is successful,
    otherwise an appropriate error code is returned.

    \ingroup cv_func_homography
  +/
  af_err af_homography(af_array *H, int *inliers, const af_array x_src, const af_array y_src,
    const af_array x_dst, const af_array y_dst,
    const af_homography_type htype, const float inlier_thr,
    const uint iterations, const af_dtype otype);
  //#endif

}
