module arrayfire.algorithm;

import arrayfire.defines;

extern ( C ){

  /+
    C Interface for sum of elements in an array

    \param[out] output will contain the sum of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the add operation occurs
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_sum
  +/
  af_err af_sum(af_array *output, const af_array input, const int dim);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for sum of elements in an array while replacing nans

    \param[out] output will contain the sum of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the add operation occurs
    \param[in] nanval Replace nans with the value passed to this function
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_sum
  +/
  af_err af_sum_nan(af_array *output, const af_array input, const int dim, const double nanval);
  //#endif

  /+
    C Interface for product of elements input an array

    \param[out] output will contain the product of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the multiply operation occurs
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_product
  +/
  af_err af_product(af_array *output, const af_array input, const int dim);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for product of elements in an array while replacing nans

    \param[out] output will contain the product of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the add operation occurs
    \param[in] nanval Replace nans with the value passed to this function
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_product
  +/
  af_err af_product_nan(af_array *output, const af_array input, const int dim, const double nanval);
  //#endif

  /+
    C Interface for minimum values in an array

    \param[out] output will contain the minimum of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the minimum value is extracted
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_min
  +/
  af_err af_min(af_array *output, const af_array input, const int dim);

  /+
    C Interface for maximum values in an array

    \param[out] output will contain the maximum of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the maximum value is extracted
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_max
  +/
  af_err af_max(af_array *output, const af_array input, const int dim);

  /+
    C Interface for checking all true values in an array

    \param[out] output will contain the result of "and" operation all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the "and" operation occurs
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_all_true
  +/
  af_err af_all_true(af_array *output, const af_array input, const int dim);

  /+
    C Interface for checking any true values in an array

    \param[out] output will contain the result of "or" operation all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the "or" operation occurs
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_any_true
  +/
  af_err af_any_true(af_array *output, const af_array input, const int dim);

  /+
    C Interface for counting non-zero values in an array

    \param[out] output will contain the number of non-zero values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the non-zero values are counted
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_count
  +/
  af_err af_count(af_array *output, const af_array input, const int dim);

  /+
    C Interface for sum of all elements in an array

    \param[out] realpart will contain the real part of adding all elements in input \p input
    \param[out] imag will contain the imaginary part of adding all elements in input \p input
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p input is realpart

    \ingroup reduce_func_sum
  +/
  af_err af_sum_all(double *realpart, double *imag, const af_array input);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for sum of all elements in an array while replacing nans

    \param[out] real will contain the real part of adding all elements in input \p input
    \param[out] imag will contain the imaginary part of adding all elements in input \p input
    \param[in] input is the input array
    \param[in] nanval is the value which replaces nan
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p input is real

    \ingroup reduce_func_sum
  +/
  af_err af_sum_nan_all(double *realpart, double *imag, const af_array input, const double nanval);
  //#endif

  /+
    C Interface for product of all elements in an array

    \param[out] realpart will contain the real part of multiplying all elements in input \p input
    \param[out] imag will contain the imaginary part of multiplying all elements in input \p input
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p input is real

    \ingroup reduce_func_product
  +/
  af_err af_product_all(double *realpart, double *imag, const af_array input);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for product of all elements in an array while replacing nans

    \param[out] realpart will contain the real part of adding all elements in input \p in
    \param[out] imag will contain the imaginary part of adding all elements in input \p in
    \param[in] input is the input array
    \param[in] nanval is the value which replaces nan
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p in is real

    \ingroup reduce_func_product
  +/
  af_err af_product_nan_all(double *realpart, double *imag, const af_array input, const double nanval);
  //#endif

  /+
    C Interface for getting minimum value of an array

    \param[out] realpart will contain the real part of minimum value of all elements in input \p in
    \param[out] imag will contain the imaginary part of minimum value of all elements in input \p in
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p input is real.

    \ingroup reduce_func_min
  +/
  af_err af_min_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for getting maximum value of an array

    \param[out] realpart will contain the real part of maximum value of all elements in input \p in
    \param[out] imag will contain the imaginary part of maximum value of all elements in input \p in
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p in is real.

    \ingroup reduce_func_max
  +/
  af_err af_max_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for checking if all values in an array are true

    \param[out] realpart is 1 if all values of input \p input are true, 0 otherwise.
    \param[out] imag is always set to 0.
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0.

    \ingroup reduce_func_all_true
  +/
  af_err af_all_true_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for checking if any values in an array are true

    \param[out] real is 1 if any value of input \p input is true, 0 otherwise.
    \param[out] imag is always set to 0.
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0.

    \ingroup reduce_func_any_true
  +/
  af_err af_any_true_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for counting total number of non-zero values in an array

    \param[out] realpart will contain the number of non-zero values in \p input.
    \param[out] imag is always set to 0.
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0.

    \ingroup reduce_func_count
  +/
  af_err af_count_all(double *realpart, double *imag, const af_array input);

  /+
    C Interface for getting minimum values and their locations in an array

    \param[out] output will contain the minimum of all values in \p input along \p dim
    \param[out] idx will contain the location of minimum of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the minimum value is extracted
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_min
  +/
  af_err af_imin(af_array *output, af_array *idx, const af_array input, const int dim);

  /+
    C Interface for getting maximum values and their locations in an array

    \param[out] output will contain the maximum of all values in \p in along \p dim
    \param[out] idx will contain the location of maximum of all values in \p input along \p dim
    \param[in] input is the input array
    \param[in] dim The dimension along which the maximum value is extracted
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup reduce_func_max
  +/
  af_err af_imax(af_array *output, af_array *idx, const af_array input, const int dim);

  /+
    C Interface for getting minimum value and its location from the entire array

    \param[out] realpart will contain the real part of minimum value of all elements in input \p input
    \param[out] imag will contain the imaginary part of minimum value of all elements in input \p input
    \param[out] idx will contain the location of minimum of all values in \p input
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p input is real.
input
    \ingroup reduce_func_min
  +/
  af_err af_imin_all(double *realpart, double *imag, uint *idx, const af_array input);

  /+
    C Interface for getting maximum value and it's location from the entire array

    \param[out] realpart will contain the real part of maximum value of all elements in input \p input
    \param[out] imag will contain the imaginary part of maximum value of all elements in input \p input
    \param[out] idx will contain the location of maximum of all values in \p input
    \param[in] input is the input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note \p imag is always set to 0 when \p input is real.

    \ingroup reduce_func_max
  +/
  af_err af_imax_all(double *realpart, double *imag, uint *idx, const af_array input);

  /+
    C Interface exclusive sum (cumulative sum) of an array

    \param[out] output will contain exclusive sums of the input
    \param[in] input is the input array
    \param[in] dim The dimension along which exclusive sum is performed
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup scan_func_accum
  +/
  af_err af_accum(af_array *output, const af_array input, const int dim);

  //#if AF_API_VERSION >=34
  /+
    C Interface generalized scan of an array

    \param[out] output will contain scan of the input
    \param[in] input is the input array
    \param[in] dim The dimension along which scan is performed
    \param[in] op is the type of binary operations used
    \param[in] inclusive_scan is flag specifying whether scan is inclusive
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup scan_func_scan
  +/
  af_err af_scan(af_array *output, const af_array input, const int dim, af_binary_op op, bool inclusive_scan);

  /+
    C Interface generalized scan by key of an array

    \param[out] output will contain scan of the input
    \param[in] key is the key array
    \param[in] input is the input array
    \param[in] dim The dimension along which scan is performed
    \param[in] op is the type of binary operations used
    \param[in] inclusive_scan is flag specifying whether scan is inclusive
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup scan_func_scanbykey
  +/
  af_err af_scan_by_key(af_array *output, const af_array key, const af_array input, const int dim, af_binary_op op, bool inclusive_scan);
  //#endif

  /+
    C Interface for finding the locations of non-zero values in an array

    \param[out] idx will contain indices where \p in is non-zero
    \param[in] input is the input array.
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup scan_func_where
  +/
  af_err af_where(af_array *idx, const af_array input);

  /+
    C Interface for calculating first order differences in an array

    \param[out] output will contain the first order numerical differences of \p input
    \param[in] input is the input array
    \param[in] dim The dimension along which numerical difference is performed
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup calc_func_diff1
  +/
  af_err af_diff1(af_array *output, const af_array input, const int dim);

  /+
    C Interface for calculating second order differences in an array

    \param[out] output will contain the second order numerical differences of \p input
    \param[in] input is the input array
    \param[in] dim The dimension along which numerical difference is performed
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup calc_func_diff2
  +/
  af_err af_diff2(af_array *output, const af_array input, const int dim);

  /+
    C Interface for sorting an array

    \param[out] output will contain the sorted outputput
    \param[in] input is the input array
    \param[in] dim The dimension along which numerical difference is performed
    \param[in] isAscending specifies the sorting order
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sort_func_sort
  +/
  af_err af_sort(af_array *output, const af_array input, const uint dim, const bool isAscending);

  /+
    C Interface for sorting an array and getting original indices

    \param[out] output will contain the sorted outputput
    \param[out] indices will contain the indices in the original input
    \param[in] input is the input array
    \param[in] dim The dimension along which numerical difference is performed
    \param[in] isAscending specifies the sorting order
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sort_func_sort_index
  +/
  af_err af_sort_index(af_array *output, af_array *indices, const af_array input, const uint dim, const bool isAscending);
  /+
    C Interface for sorting an array based on keys

    \param[out] output_keys will contain the keys based on sorted values
    \param[out] output_values will contain the sorted values
    \param[in] keys is the input array
    \param[in] values The dimension along which numerical difference is performed
    \param[in] dim The dimension along which numerical difference is performed
    \param[in] isAscending specifies the sorting order
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup sort_func_sort_keys
  +/
  af_err af_sort_by_key(af_array *output_keys, af_array *output_values, const af_array keys, const af_array values, const uint dim, const bool isAscending);

  /+
    C Interface for getting unique values

    \param[out] output will contain the unique values from \p input
    \param[in] input is the input array
    \param[in] is_sorted if true, skips the sorting steps internally
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup set_func_unique
  +/
  af_err af_set_unique(af_array *output, const af_array input, const bool is_sorted);

  /+
    C Interface for performing union of two arrays

    \param[out] output will contain the union of \p first and \p second
    \param[in] first is the first array
    \param[in] second is the second array
    \param[in] is_unique if true, skips calling unique internally
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup set_func_union
  +/
  af_err af_set_union(af_array *output, const af_array first, const af_array second, const bool is_unique);

  /+
    C Interface for performing intersect of two arrays

    \param[out] output will contain the intersection of \p first and \p second
    \param[in] first is the first array
    \param[in] second is the second array
    \param[in] is_unique if true, skips calling unique internally
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup set_func_intersect
  +/
  af_err af_set_intersect(af_array *output, const af_array first, const af_array second, const bool is_unique);

}
