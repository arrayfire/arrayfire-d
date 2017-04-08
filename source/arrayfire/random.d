module arrayfire.random;

import arrayfire.defines;

extern ( C ) {

  alias void * af_random_engine;

  //#if AF_API_VERSION >= 34
  /+
    C Interface for creating random engine

    \param[out]  engine The pointer to the returned random engine object
    \param[in]   rtype The type of the random number generator
    \param[in]   seed The initializing seed of the random number generator

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_func_constructor
  +/
  af_err af_create_random_engine(af_random_engine *engine, af_random_engine_type rtype, uint seed);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for retaining random engine

    \param[out]  output The pointer to the returned random engine object
    \param[in]   engine The random engine object

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_func_constructor
  +/
  af_err af_retain_random_engine(af_random_engine *output, const af_random_engine engine);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for changing random engine type

    \param[in]   engine The random engine object
    \param[in]   rtype The type of the random number generator

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_set_type
  +/
  af_err af_random_engine_set_type(af_random_engine *engine, const af_random_engine_type rtype);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for getting random engine type

    \param[out]  rtype The type of the random number generator
    \param[in]   engine The random engine object

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_get_type
  +/
  af_err af_random_engine_get_type(af_random_engine_type *rtype, const af_random_engine engine);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for creating an array of uniform numbers using a random engine

    \param[out]  output The pointer to the returned object.
    \param[in]   ndims The number of dimensions read from the \p dims parameter
    \param[in]   dims A C pointer with \p ndims elements. Each value represents the size of that dimension
    \param[in]   type The type of the \ref af_array object
    \param[in]   engine The random engine object

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_func_randu
  +/
  af_err af_random_uniform(af_array *output, const uint ndims, const dim_t * dims, const af_dtype type, af_random_engine engine);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for creating an array of normal numbers using a random engine

    \param[out]  output The pointer to the returned object.
    \param[in]   ndims The number of dimensions read from the \p dims parameter
    \param[in]   dims A C pointer with \p ndims elements. Each value represents the size of that dimension
    \param[in]   type The type of the \ref af_array object
    \param[in]   engine The random engine object

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_func_randn
  +/
  af_err af_random_normal(af_array *output, const uint ndims, const dim_t * dims, const af_dtype type, af_random_engine engine);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for setting the seed of a random engine

    \param[out]  engine The pointer to the returned random engine object
    \param[in]   seed The initializing seed of the random number generator

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_set_seed
  +/
  af_err af_random_engine_set_seed(af_random_engine *engine, const uint seed);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for getting the default random engine

    \param[out]  engine The pointer to returned default random engine object

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_func_get_default_engine
  +/
  af_err af_get_default_random_engine(af_random_engine *engine);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for setting the type of the default random engine

    \param[in]   rtype The type of the random number generator

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_func_set_type
  +/
  af_err af_set_default_random_engine_type(const af_random_engine_type rtype);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for getting the seed of a random engine

    \param[out]  seed The pointer to the returned seed.
    \param[in]   engine The random engine object

    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_get_type
  +/
  af_err af_random_engine_get_seed(const uint * seed, af_random_engine engine);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for releasing random engine

    \param[in] engine The random engine object
    \returns \ref AF_SUCCESS if the execution completes properly

    \ingroup random_engine_destructor
  +/
  af_err af_release_random_engine(af_random_engine engine);
  //#endif

  /+
    \param[out] output The generated array
    \param[in] ndims Size of dimension array \p dims
    \param[in] dims The array containing sizes of the dimension
    \param[in] type The type of array to generate

    \ingroup random_func_randu
  +/
  af_err af_randu(af_array *output, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    \param[out] output The generated array
    \param[in] ndims Size of dimension array \p dims
    \param[in] dims The array containing sizes of the dimension
    \param[in] type The type of array to generate

    \ingroup random_func_randn
  +/
  af_err af_randn(af_array *output, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    \param[in] seed A 64 bit uint integer

    \ingroup random_func_set_seed
  +/
  af_err af_set_seed(const uint seed);

  /+
    \param[out] seed A 64 bit uint integer

    \ingroup random_func_get_seed
  +/
  af_err af_get_seed(uint *seed);

}
