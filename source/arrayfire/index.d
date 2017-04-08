module arrayfire.index;

import arrayfire.defines;
import arrayfire.seq;

extern ( C ){

  struct af_index_t{
    union idx{
      af_array arr;   ///< The af_array used for indexing
      af_seq   seq;   ///< The af_seq used for indexing
    };

    bool     isSeq;     ///< If true the idx value represents a seq
    bool     isBatch;   ///< If true the seq object is a batch parameter
  }

  ///
  /// Lookup the values of input array based on sequences
  ///
  /// \param[out] output  outputput array containing values indexed by the
  ///                  sequences
  /// \param[in] input    is the input array
  /// \param[in] ndims is the number of sequences provided
  /// \param[in] index is an array of sequences
  ///
  /// \ingroup index_func_index

  af_err af_index(  af_array *output, const af_array input, const uint ndims, const af_seq* index);


  ///
  /// Lookup the values of input array based on index
  ///
  /// \param[out] output      outputput array containing values at locations
  ///                      specified by \p index
  /// \param[in] input        is input lookup array
  /// \param[in] indices   is lookup indices
  /// \param[in] dim       specifies the dimension for indexing
  ///
  /// \ingroup index_func_index
  ///

  af_err af_lookup( af_array *output, const af_array input, const af_array indices, const uint dim);

  ///
  /// Copy and write values in the locations specified by the sequences
  ///
  /// \param[out] output     outputput array with values of \p rhs copied to
  ///                     locations specified by \p index and values from
  ///                     \p lhs in all other locations.
  /// \param[in] lhs      is array whose values are used for indices NOT
  ///                     specified by \p index
  /// \param[in] ndims    is the number of sequences provided
  /// \param[in] indices  is an array of sequences
  /// \param[in] rhs      is the array whose values are used for indices
  ///                     specified by \p index
  ///
  /// \ingroup index_func_assign
  ///

  af_err af_assign_seq( af_array *output, const af_array lhs, const uint ndims, const af_seq* indices, const af_array rhs);

  ///
  /// \brief Indexing an array using \ref af_seq, or \ref af_array
  ///
  /// Generalized indexing function that accepts either af_array or af_seq
  /// along a dimension to index the input array and create the corresponding
  /// outputput array
  ///
  /// \param[out] output     outputput array containing values at indexed by
  ///                     the sequences
  /// \param[in] input       is the input array
  /// \param[in] ndims    is the number of \ref af_index_t provided
  /// \param[in] indices  is an array of \ref af_index_t objects
  ///
  /// \ingroup index_func_index
  ///
  af_err af_index_gen(  af_array *output, const af_array input, const dim_t ndims, const af_index_t* indices);

  ///
  /// \brief Assignment of an array using \ref af_seq, or \ref af_array
  ///
  /// Generalized assignment function that accepts either af_array or af_seq
  /// along a dimension to assign elements form an input array to an outputput
  /// array
  ///
  /// \param[out] output     outputput array containing values at indexed by
  ///                     the sequences
  /// \param[in] lhs      is the input array
  /// \param[in] ndims    is the number of \ref af_index_t provided
  /// \param[in] indices  is an af_array of \ref af_index_t objects
  /// \param[in] rhs      is the array whose values will be assigned to \p lhs
  ///
  /// \ingroup index_func_assign
  ///
  af_err af_assign_gen( af_array *output, const af_array lhs, const dim_t ndims, const af_index_t* indices, const af_array rhs);

  //#if AF_API_VERSION >= 32
  ///
  /// \brief Create an quadruple of af_index_t array
  ///
  /// \snippet test/index.cpp ex_index_util_0
  ///
  /// \param[out] indexers pointer to location where quadruple af_index_t array is created
  /// \returns \ref af_err error code
  ///
  /// \ingroup index_func_index
  ///
  af_err af_create_indexers(af_index_t** indexers);
  //#endif

  //#if AF_API_VERSION >= 32
  ///
  /// \brief set \p dim to given indexer af_array \p idx
  ///
  /// \snippet test/index.cpp ex_index_util_0
  ///
  /// \param[in] indexer pointer to location where quadruple af_index_t array was created
  /// \param[in] idx is the af_array indexer for given dimension \p dim
  /// \param[in] dim is the dimension to be indexed
  /// \returns \ref af_err error code
  ///
  /// \ingroup index_func_index
  ///
  af_err af_set_array_indexer(af_index_t* indexer, const af_array idx, const dim_t dim);
  //#endif

  //#if AF_API_VERSION >= 32
  ///
  /// \brief set \p dim to given indexer af_array \p idx
  ///
  /// This function is similar to \ref af_set_array_indexer in terms of functionality except
  /// that this version accepts object of type \ref af_seq instead of \ref af_array.
  ///
  /// \snippet test/index.cpp ex_index_util_0
  ///
  /// \param[in] indexer pointer to location where quadruple af_index_t array was created
  /// \param[in] idx is the af_seq indexer for given dimension \p dim
  /// \param[in] dim is the dimension to be indexed
  /// \param[in] is_batch indicates if the sequence based indexing is inside a batch operation
  ///
  /// \ingroup index_func_index
  ///
  af_err af_set_seq_indexer(af_index_t* indexer, const af_seq* idx, const dim_t dim, const bool is_batch);
  //#endif

  //#if AF_API_VERSION >= 32
  ///
  /// \brief set \p dim to given indexer af_array \p idx
  ///
  ///  This function is alternative to \ref af_set_seq_indexer where instead of passing
  ///  in an already prepared \ref af_seq object, you pass the arguments necessary for
  ///  creating an af_seq directly.
  ///
  /// \param[in] indexer pointer to location where quadruple af_index_t array was created
  /// \param[in] begin is the beginning index of along dimension \p dim
  /// \param[in] end is the beginning index of along dimension \p dim
  /// \param[in] step size along dimension \p dim
  /// \param[in] dim is the dimension to be indexed
  /// \param[in] is_batch indicates if the sequence based indexing is inside a batch operation
  /// \returns \ref af_err error code
  ///
  /// \ingroup index_func_index
  ///
  af_err af_set_seq_param_indexer(af_index_t* indexer, const double begin, const double end, const double step, const dim_t dim, const bool is_batch);
  //#endif

  //#if AF_API_VERSION >= 32
  ///
  /// \brief Release's the memory resource used by the quadruple af_index_t array
  ///
  /// \snippet test/index.cpp ex_index_util_0
  ///
  /// \param[in] indexers is pointer to location where quadruple af_index_t array is created
  //  \returns \ref af_err error code
  ///
  /// \ingroup index_func_index
  ///
  af_err af_release_indexers(af_index_t* indexers);
  //#endif

}
