module arrayfire_d.arith;

import arrayfire_d.defines;

extern( C ){

  /+
    C Interface for adding arrays

    \param[out] output will contain sum of \p lhs and \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_add
  +/
  af_err af_add(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for subtracting an array from another

    \param[out] output will contain result of \p lhs - \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_sub
  +/
  af_err af_sub(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for multiplying two arrays

    \param[out] output will contain the product of \p lhs and  \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_mul
  +/
  af_err af_mul(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for dividing an array by another

    \param[out] output will contain result of \p lhs / \p rhs.
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_div
  +/
  af_err af_div(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for checking if an array is less than another

    \param[out] output will contain result of \p lhs < \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup logic_func_lt
  +/
  af_err af_lt(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for checking if an array is greater than another

    \param[out] output will contain result of \p lhs > \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_gt
  +/
  af_err af_gt(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for checking if an array is less or equal to another

    \param[out] output will contain result of \p lhs <= \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_le
  +/
  af_err af_le(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for checking if an array is greater or equal to another

    \param[out] output will contain result of \p lhs >= \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_ge
  +/
  af_err af_ge(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for checking if an array is equal to another

    \param[out] output will contain result of \p lhs == \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_eq
  +/
  af_err af_eq(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for checking if an array is not equal to another

    \param[out] output will contain result of \p lhs != \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_neq
  +/
  af_err af_neq(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for performing logical and on two arrays

    \param[out] output will contain result of \p lhs && \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_and
  +/
  af_err af_and(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for performing logical or on two arrays

    \param[out] output will contain result of \p lhs || \p rhs. output is of type b8
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_or
  +/
  af_err af_or(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for performing logical not on input

    \param[out] output will contain result of logical not of \p in. output is of type b8
    \param[in] input is the input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_not
  +/
  af_err af_not(af_array *output, const af_array input);

  /+
    C Interface for performing bitwise and on two arrays

    \param[out] output will contain result of \p lhs & \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_bitand
  +/
  af_err af_bitand(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for performing bitwise or on two arrays

    \param[out] output will contain result of \p lhs & \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_bitor
  +/
  af_err af_bitor(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for performing bitwise xor on two arrays

    \param[out] output will contain result of \p lhs ^ \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_bitxor
  +/
  af_err af_bitxor(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for left shift on integer arrays

    \param[out] output will contain result of the left shift
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_shiftl
  +/
  af_err af_bitshiftl(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for right shift on integer arrays

    \param[out] output will contain result of the right shift
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_shiftr
  +/
  af_err af_bitshiftr(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for casting an array from one type to another

    \param[out] output will contain the values in the specified type
    \param[in] input is the input
    \param[in] type is the target data type \ref af_dtype
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_cast
  +/
  af_err af_cast(af_array *output, const af_array input, const af_dtype type);

  /+
    C Interface for min of two arrays

    \param[out] output will contain minimum of \p lhs and \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_min
  +/
  af_err af_minof(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for max of two arrays

    \param[out] output will contain maximum of \p lhs and \p rhs
    \param[in] lhs first input
    \param[in] rhs second input
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_max
  +/
  af_err af_maxof(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  //#if AF_API_VERSION >= 34
  /+
    C Interface for max of two arrays

    \param[out] output will contain the values from \p clamped between \p lo and \p hi
    \param[in] input Input array
    \param[in] lo Value for lower limit
    \param[in] hi Value for upper limit
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_max
  +/

  af_err af_clamp(af_array *output, const af_array input, const af_array lo, const af_array hi, const bool batch);
  //#endif

  /+
    C Interface for remainder

    \param[out] output will contain the remainder of \p lhs divided by \p rhs
    \param[in] lhs is numerator
    \param[in] rhs is denominator
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_rem
  +/
  af_err af_rem(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for modulus

    \param[out] output will contain the outputput of \p lhs modulo \p rhs
    \param[in] lhs is dividend
    \param[in] rhs is divisor
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_mod
  +/
  af_err af_mod(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for absolute value

    \param[out] output will contain the absolute value of \p in
    \param[in] in is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_abs
  +/
  af_err af_abs(af_array *output, const af_array input);

  /+
    C Interface for finding the phase

    \param[out] output will the phase of \p input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_arg
  +/
  af_err af_arg(af_array *output, const af_array input);

  /+
    C Interface for finding the sign of the input

    \param[out] output will contain the sign of each element of the input arrays
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note outputput is 1 for negative numbers and 0 for positive numbers

    \ingroup arith_func_round
  +/
  af_err af_sign(af_array *output, const af_array input);

  /+
    C Interface for rounding an array of numbers

    \param[out] output will contain values rounded to nearest integer
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \note The values are rounded to nearest integer

    \ingroup arith_func_round
  +/
  af_err af_round(af_array *output, const af_array input);

  /+
    C Interface for truncating an array of numbers

    \param[out] output will contain values truncated to nearest integer not greater than input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_trunc
  +/
  af_err af_trunc(af_array *output, const af_array input);

  /+
    C Interface for flooring an array of numbers

    \param[out] output will contain values rounded to nearest integer less than or equal to input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_floor
  +/
  af_err af_floor(af_array *output, const af_array input);

  /+
    C Interface for ceiling an array of numbers

    \param[out] output will contain values rounded to nearest integer greater than or equal to input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_ceil
  +/
  af_err af_ceil(af_array *output, const af_array input);

  /+
    C Interface for getting length of hypotenuse of two arrays

    \param[out] output will contain the length of the hypotenuse
    \param[in] lhs is the length of first side
    \param[in] rhs is the length of second side
    \param[in] batch specifies if operations need to be performed input batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_floor
  +/
  af_err af_hypot(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for sin

    \param[out] output will contain sin of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_sin
  +/
  af_err af_sin(af_array *output, const af_array input);

  /+
    C Interface for cos

    \param[out] output will contain cos of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_cos
  +/
  af_err af_cos(af_array *output, const af_array input);

  /+
    C Interface for tan

    \param[out] output will contain tan of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_tan
  +/
  af_err af_tan(af_array *output, const af_array input);

  /+
    C Interface for arc sin

    \param[out] output will contain arc sin of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_asin
  +/
  af_err af_asin(af_array *output, const af_array input);

  /+
    C Interface for arc cos

    \param[out] output will contain arc cos of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_acos
  +/
  af_err af_acos(af_array *output, const af_array input);

  /+
    C Interface for arc tan

    \param[out] output will contain arc tan of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_atan
  +/
  af_err af_atan(af_array *output, const af_array input);

  /+
    C Interface for arc tan of two inputs

    \param[out] output will arc tan of the inputs
    \param[in] lhs value of numerator
    \param[in] rhs value of denominator
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_atan
  +/
  af_err af_atan2(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for creating complex array from two input arrays

    \param[out] output will contain the complex array generated from inputs
    \param[in] lhs is real array
    \param[in] rhs is imaginary array
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_cplx
  +/
  af_err af_cplx2(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for creating complex array from real array

    \param[out] output will contain complex array created from real input \p in
    \param[in] input is real array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_cplx
  +/
  af_err af_cplx(af_array *output, const af_array input);

  /+
    C Interface for getting real part from complex array

    \param[out] output will contain the real part of \p in
    \param[in] input is complex array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_real
  +/
  af_err af_real(af_array *output, const af_array input);

  /+
    C Interface for getting imaginary part from complex array

    \param[out] output will contain the imaginary part of \p input
    \param[in] input is complex array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_imag
  +/
  af_err af_imag(af_array *output, const af_array input);

  /+
    C Interface for getting the complex conjugate of input array

    \param[out] output will contain the complex conjugate of \p input
    \param[in] input is complex array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_conjg
  +/
  af_err af_conjg(af_array *output, const af_array input);

  /+
    C Interface for sinh

    \param[out] output will contain sinh of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_sinh
  +/
  af_err af_sinh(af_array *output, const af_array input);

  /+
    C Interface for cosh

    \param[out] output will contain cosh of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_cosh
  +/
  af_err af_cosh(af_array *output, const af_array input);

  /+
    C Interface for tanh

    \param[out] output will contain tanh of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_tanh
  +/
  af_err af_tanh(af_array *output, const af_array input);

  /+
    C Interface for asinh

    \param[out] output will contain inverse sinh of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_asinh
  +/
  af_err af_asinh(af_array *output, const af_array input);

  /+
    C Interface for acosh

    \param[out] output will contain inverse cosh of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_acosh
  +/
  af_err af_acosh(af_array *output, const af_array input);

  /+
    C Interface for atanh

    \param[out] output will contain inverse tanh of input
    \param[in] input is input array
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_atanh
  +/
  af_err af_atanh(af_array *output, const af_array input);

  /+
    C Interface for root

    \param[out] output will contain \p lhs th root of \p rhs
    \param[in] lhs is nth root
    \param[in] rhs is value
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_root
  +/
  af_err af_root(af_array *output, const af_array lhs, const af_array rhs, const bool batch);


  /+
    C Interface for power

    \param[out] output will contain \p lhs raised to power \p rhs
    \param[in] lhs is base
    \param[in] rhs is exponent
    \param[in] batch specifies if operations need to be performed in batch mode
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_pow
  +/
  af_err af_pow(af_array *output, const af_array lhs, const af_array rhs, const bool batch);

  /+
    C Interface for power of two

    \param[out] output will contain the values of 2 to the power \p input
    \param[in] input is exponent
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_pow2
  +/
  af_err af_pow2(af_array *output, const af_array input);

  /+
    C Interface for exponential of an array

    \param[out] output will contain the exponential of \p input
    \param[in] input is exponent
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_exp
  +/
  af_err af_exp(af_array *output, const af_array input);

  //#if AF_API_VERSION >= 31
  /+
    C Interface for calculating sigmoid function of an array

    \param[out] output will contain the sigmoid of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_sigmoid
  +/
  af_err af_sigmoid(af_array *output, const af_array input);
  //#endif

  /+
    C Interface for exponential of an array minus 1

    \param[out] output will contain the exponential of \p input - 1
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_expm1
  +/
  af_err af_expm1(af_array *output, const af_array input);

  /+
    C Interface for error function value

    \param[out] output will contain the error function value of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_erf
  +/
  af_err af_erf(af_array *output, const af_array input);

  /+
    C Interface for complementary error function value

    \param[out] output will contain the complementary error function value of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_erfc
  +/
  af_err af_erfc(af_array *output, const af_array input);

  /+
    C Interface for natural logarithm

    \param[out] output will contain the natural logarithm of \p in
    \param[in] in is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_log
  +/
  af_err af_log(af_array *output, const af_array input);

  /+
    C Interface for logarithm of (input + 1)

    \param[out] output will contain the logarithm of of (input + 1)
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_log1p
  +/
  af_err af_log1p(af_array *output, const af_array input);

  /+
    C Interface for logarithm base 10

    \param[out] output will contain the base 10 logarithm of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_log10
  +/
  af_err af_log10(af_array *output, const af_array input);

  /+
    C Interface for logarithm base 2

    \param[out] output will contain the base 2 logarithm of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup explog_func_log2
  +/
  af_err af_log2(af_array *output, const af_array input);

  /+
    C Interface for square root

    \param[out] output will contain the square root of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_sqrt
  +/
  af_err af_sqrt(af_array *output, const af_array input);

  /+
    C Interface for cube root

    \param[out] output will contain the cube root of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_cbrt
  +/
  af_err af_cbrt(af_array *output, const af_array input);

  /+
    C Interface for the factorial

    \param[out] output will contain the result of factorial of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_factorial
  +/
  af_err af_factorial(af_array *output, const af_array input);

  /+
    C Interface for the gamma function

    \param[out] output will contain the result of gamma function of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_tgamma
  +/
  af_err af_tgamma(af_array *output, const af_array input);

  /+
    C Interface for the logarithm of absolute values of gamma function

    \param[out] output will contain the result of logarithm of absolute values of gamma function of \p input
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_lgamma
  +/
  af_err af_lgamma(af_array *output, const af_array input);

  /+
    C Interface for checking if values are zero

    \param[out] output will contain 1's where input is 0, and 0 otherwise.
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_iszero
  +/
  af_err af_iszero(af_array *output, const af_array input);

  /+
    C Interface for checking if values are infinities

    \param[out] output will contain 1's where input is Inf or -Inf, and 0 otherwise.
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_isinf
  +/
  af_err af_isinf(af_array *output, const af_array input);

  /+
    C Interface for checking if values are NaNs

    \param[out] output will contain 1's where input is NaN, and 0 otherwise.
    \param[in] input is input
    \return \ref AF_SUCCESS if the execution completes properly

    \ingroup arith_func_isnan
  +/
  af_err af_isnan(af_array *output, const af_array input);

}
