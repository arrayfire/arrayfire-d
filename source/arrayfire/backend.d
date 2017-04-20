module arrayfire.backend;

import arrayfire.defines;

extern ( C ) {

   //#if AF_API_VERSION >= 32
   /+
      \param[in] bknd takes one of the values of enum \ref af_backend
      \returns \ref af_err error code

      \ingroup unified_func_setbackend
   +/
   af_err af_set_backend(const af_backend bknd);
      //#endif

      //#if AF_API_VERSION >= 32
   /+
      \param[out] num_backends Number of available backends
      \returns \ref af_err error code

      \ingroup unified_func_getbackendcount
   +/
   af_err af_get_backend_count(uint* num_backends);
      //#endif

      //#if AF_API_VERSION >= 32
   /+
      \param[out] backends is the OR sum of the backends available.
      \returns \ref af_err error code

      \ingroup unified_func_getavailbackends
   +/
   af_err af_get_available_backends(int* backends);
      //#endif

      //#if AF_API_VERSION >= 32
   /+
      \param[out] backend takes one of the values of enum \ref af_backend
      \param[in] input is the array who's backend is to be queried
      \returns \ref af_err error code

      \ingroup unified_func_getbackendid
   +/
   af_err af_get_backend_id(af_backend *backend, const af_array input);
      //#endif

      //#if AF_API_VERSION >= 33
   /+
      \param[out] backend takes one of the values of enum \ref af_backend
      from the backend that is currently set to active
      \returns \ref af_err error code

      \ingroup unified_func_getactivebackend
   +/
   af_err af_get_active_backend(af_backend *backend);
      //#endif

      //#if AF_API_VERSION >= 33
   /+
      \param[out] device contains the device on which \p input was created.
      \param[in] input is the array who's device is to be queried.
      \returns \ref af_err error code

      \ingroup unified_func_getdeviceid
   +/
   af_err af_get_device_id(int *device, const af_array input);

}
