module arrayfire.cuda;

import arrayfire.defines;

extern ( C ) {

  //FIXME :: Check CudaStream_t
  alias int cudaStream_t;

  //#if AF_API_VERSION >= 31
  /+
    Get the stream for the CUDA device with \p id in ArrayFire context

    \param[out] stream CUDA Stream of device with \p id in ArrayFire context
    \param[in] id ArrayFire device id
    \returns \ref af_err error code

    \ingroup cuda_mat
  +/
  af_err afcu_get_stream(cudaStream_t* stream, int id);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    Get the native device id of the CUDA device with \p id in ArrayFire context

    \param[out] nativeid native device id of the CUDA device with \p id in ArrayFire context
    \param[in] id ArrayFire device id
    \returns \ref af_err error code

    \ingroup cuda_mat
  +/
  af_err afcu_get_native_id(int* nativeid, int id);
  //#endif

  //#if AF_API_VERSION >= 32
  /+
    Set the CUDA device with given native id as the active device for ArrayFire

    \param[in] nativeid native device id of the CUDA device
    \returns \ref af_err error code

    \ingroup cuda_mat
  +/
  af_err afcu_set_native_id(int nativeid);
  //#endif

}
