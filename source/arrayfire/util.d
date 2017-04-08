module arrayfire.util;

import arrayfire.defines;

extern ( C ) {

  /+
    \param[in] arr is the input array

    \returns error codes

    \ingroup print_func_print
  +/
  af_err af_print_array(af_array arr);

  //#if AF_API_VERSION >= 31
  /+
    \param[in] exp is the expression or name of the array
    \param[in] arr is the input array
    \param[in] precision precision for the display

    \returns error codes

    \ingroup print_func_print
  +/
  af_err af_print_array_gen(const char *exp, const af_array arr, const int precision);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[out] index is the index location of the array in the file
    \param[in] key is an expression used as tag/key for the array during \ref readArray()
    \param[in] arr is the array to be written
    \param[in] filename is the path to the location on disk
    \param[in] append is used to append to an existing file when true and create or
    overwrite an existing file when false

    \ingroup stream_func_save
  +/
  af_err af_save_array(int *index, const char* key, const af_array arr, const char *filename, const bool append);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[out] output is the array read from index
    \param[in] filename is the path to the location on disk
    \param[in] index is the 0-based sequential location of the array to be read

    \note This function will throw an exception if the key is not found.

    \ingroup stream_func_read
  +/
  af_err af_read_array_index(af_array *output, const char *filename, const uint index);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[out] output is the array read from key
    \param[in] filename is the path to the location on disk
    \param[in] key is the tag/name of the array to be read. The key needs to have an exact match.

    \note This function will throw an exception if the key is not found.

    \ingroup stream_func_read
  +/
  af_err af_read_array_key(af_array *output, const char *filename, const char* key);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    When reading by key, it may be a good idea to run this function first to check for the key
    and then call the readArray using the index. This will avoid exceptions in case of key not found.

    \param[out] index of the array in the file if the key is found. -1 if key is not found.
    \param[in] filename is the path to the location on disk
    \param[in] key is the tag/name of the array to be read. The key needs to have an exact match.

    \ingroup stream_func_read
  +/
  af_err af_read_array_key_check(int *index, const char *filename, const char* key);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    \param[out] output is the pointer to the c-string that will hold the data. The memory for
    outputput is allocated by the function. The user is responsible for deleting the memory.
    \param[in] exp is an expression, generally the name of the array
    \param[in] arr is the input array
    \param[in] precision is the precision length for display
    \param[in] transpose determines whether or not to transpose the array before storing it in
    the string

    \ingroup print_func_tostring
  +/
  af_err af_array_to_string(char **outputput, const char *exp, const af_array arr, const int precision, const bool transpose);
  //#endif

    // Purpose of Addition: "How to add Function" documentation
  af_err af_example_function(af_array* output, const af_array input, const af_someenum_t param);

    ///
    /// Get the version information of the library
    ///
  af_err af_get_version(int *major, int *minor, int *patch);


  //#if AF_API_VERSION >= 33
    ///
    /// Get the revision (commit) information of the library.
    /// This returns a constant string from compile time and should not be
    /// freed by the user.
    ///
  char *af_get_revision();
  //#endif

  //#if AF_API_VERSION >= 34
    ///
    /// Get the size of the type represented by an af_dtype enum
    ///
  af_err af_get_size_of(size_t *size, af_dtype type);
  //#endif

}
