module arrayfire.device;

import arrayfire.defines;

extern ( C ){
  /+
    \ingroup device_func_info
  +/
  af_err af_info();

  /+
    \ingroup device_func_info
  +/
  af_err af_init();

  /+
    \brief Gets the output of af_info() as a string

    \param[out] str contains the string
    \param[in] verbose flag to return verbose info

    \ingroup device_func_info_string
  +/
  af_err af_info_string(char** str, const bool verbose);

  /+
    \copydoc device_func_prop

    \ingroup device_func_prop
  +/
  af_err af_device_info(char* d_name, char* d_platform, char *d_toolkit, char* d_compute);

  /+
    \ingroup device_func_count
  +/
  af_err af_get_device_count(int *num_of_devices);

  /+
    \ingroup device_func_dbl
  +/
  af_err af_get_dbl_support(bool* available, const int device);

  /+
    \ingroup device_func_set
  +/
  af_err af_set_device(const int device);

  /+
    \ingroup device_func_set
  +/
  af_err af_get_device(int *device);

  /+
    \ingroup device_func_sync
  +/
  af_err af_sync(const int device);

  /+
    \ingroup device_func_alloc

    This device memory returned by this function can only be freed using af_free_device
  +/
  af_err af_alloc_device(void **ptr, const dim_t bytes);

  /+
    \ingroup device_func_free

    This function will free a device pointer even if it has been previously locked.
  +/
  af_err af_free_device(void *ptr);

  /+
    \ingroup device_func_pinned
  +/
  af_err af_alloc_pinned(void **ptr, const dim_t bytes);

  /+
    \ingroup device_func_free_pinned
  +/
  af_err af_free_pinned(void *ptr);

  //#if AF_API_VERSION >= 33
  /+
    \ingroup device_func_alloc_host
  +/
  af_err af_alloc_host(void **ptr, const dim_t bytes);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    \ingroup device_func_free_host
  +/
  af_err af_free_host(void *ptr);
  //#endif

  /+
    Create array from device memory
    \ingroup construct_mat
  +/
  af_err af_device_array(af_array *arr, const void *data, const uint ndims, const dim_t * dims, const af_dtype type);

  /+
    Get memory information from the memory manager
    \ingroup device_func_mem
  +/
  af_err af_device_mem_info(size_t *alloc_bytes, size_t *alloc_buffers, size_t *lock_bytes, size_t *lock_buffers);

  //#if AF_API_VERSION >= 33
    ///
    /// Prints buffer details from the ArrayFire Device Manager
    //
    /// \param [in] msg A message to print before the table
    /// \param [in] device_id print the memory info of the specified device.
    ///  -1 signifies active device.
    ///
    /// return AF_SUCCESS if successful
    ///
    /// \ingroup device_func_mem
    ///
  af_err af_print_mem_info(const char *msg, const int device_id);
  //#endif

  /+
    Call the garbage collection routine
    \ingroup device_func_mem
  +/
  af_err af_device_gc();

  /+
    Set the minimum memory chunk size
    \ingroup device_func_mem
  +/
  af_err af_set_mem_step_size(const size_t step_bytes);

  /+
    Get the minimum memory chunk size
    \ingroup device_func_mem
  +/
  af_err af_get_mem_step_size(size_t *step_bytes);

  //#if AF_API_VERSION >= 31
  /+
    Lock the device buffer in the memory manager.

    Locked buffers are not freed by memory manager until \ref af_unlock_array is called.
    \ingroup device_func_mem
  +/
  //#if AF_API_VERSION >= 33
    //  DEPRECATED("Use af_lock_array instead")
  //#endif
  af_err af_lock_device_ptr(const af_array arr);
  //#endif

  //#if AF_API_VERSION >= 31
  /+
    Unlock device buffer in the memory manager.

    This function will give back the control over the device pointer to the memory manager.
    \ingroup device_func_mem
  +/
  //#if AF_API_VERSION >= 33
    //  DEPRECATED("Use af_unlock_array instead")
  //#endif
  af_err af_unlock_device_ptr(const af_array arr);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Lock the device buffer in the memory manager.

    Locked buffers are not freed by memory manager until \ref af_unlock_array is called.
    \ingroup device_func_mem
  +/
  af_err af_lock_array(const af_array arr);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Unlock device buffer in the memory manager.

    This function will give back the control over the device pointer to the memory manager.
    \ingroup device_func_mem
  +/
  af_err af_unlock_array(const af_array arr);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    Query if the array has been locked by the user.

    An array can be locked by the user by calling `af_lock_array`
    or `af_get_device_ptr` or `af_get_raw_ptr` function.

    \ingroup device_func_mem
  +/
  af_err af_is_locked_array(bool *res, const af_array arr);
  //#endif

  /+
    Get the device pointer and lock the buffer in memory manager.

    The device pointer \p ptr is notfreed by memory manager until \ref af_unlock_device_ptr is called.
    \ingroup device_func_mem

    \note For OpenCL backend *ptr should be cast to cl_mem.
  +/
  af_err af_get_device_ptr(void **ptr, const af_array arr);

}
