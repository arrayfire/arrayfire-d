module arrayfire.opencl;

import arrayfire.defines;

extern ( C ){

  alias void* cl_platform_id;
  alias void* cl_device_id;
  alias void* cl_context;
  alias void* cl_command_queue;
  alias void* cl_mem;
  alias void* cl_program;
  alias void* cl_kernel;
  alias void* cl_event;
  alias void* cl_sampler;

  //#if AF_API_VERSION >= 33
  enum afcl_device_type{
    AFCL_DEVICE_TYPE_CPU ,
    CL_DEVICE_TYPE_CPU,
    AFCL_DEVICE_TYPE_GPU,
    CL_DEVICE_TYPE_GPU,
    AFCL_DEVICE_TYPE_ACC,
    CL_DEVICE_TYPE_ACCELERATOR,
    AFCL_DEVICE_TYPE_UNKNOWN = -1
  };
  //#endif

  //#if AF_API_VERSION >= 33
  enum afcl_platform{
    AFCL_PLATFORM_AMD     = 0,
    AFCL_PLATFORM_APPLE   = 1,
    AFCL_PLATFORM_INTEL   = 2,
    AFCL_PLATFORM_NVIDIA  = 3,
    AFCL_PLATFORM_BEIGNET = 4,
    AFCL_PLATFORM_POCL    = 5,
    AFCL_PLATFORM_UNKNOWN = -1
  };
  //#endif

  /+
    \ingroup opencl_mat
    @{
  +/
  /+
    Get a handle to ArrayFire's OpenCL context

    \param[out] ctx the current context being used by ArrayFire
    \param[in] retain if true calls clRetainContext prior to returning the context
    \returns \ref af_err error code

    \note Set \p retain to true if this value will be passed to a cl::Context constructor
  +/
  af_err afcl_get_context(cl_context *ctx, const bool retain);

  /+
    Get a handle to ArrayFire's OpenCL command queue

    \param[out] queue the current command queue being used by ArrayFire
    \param[in] retain if true calls clRetainCommandQueue prior to returning the context
    \returns \ref af_err error code

    \note Set \p retain to true if this value will be passed to a cl::CommandQueue constructor
  +/
  af_err afcl_get_queue(cl_command_queue *queue, const bool retain);

  /+
    Get the device ID for ArrayFire's current active device

    \param[out] id the cl_device_id of the current device
    \returns \ref af_err error code
  +/
  af_err afcl_get_device_id(cl_device_id *id);

  //#if AF_API_VERSION >= 32
  /+
    Set ArrayFire's active device based on \p id of type cl_device_id

    \param[in] id the cl_device_id of the device to be set as active device
    \returns \ref af_err error code
  +/
  af_err afcl_set_device_id(cl_device_id id);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Push user provided device control constructs into the ArrayFire device manager pool

    This function should be used only when the user would like ArrayFire to use an
    user generated OpenCL context and related objects for ArrayFire operations.

    \param[in] dev is the OpenCL device for which user provided context will be used by ArrayFire
    \param[in] ctx is the user provided OpenCL cl_context to be used by ArrayFire
    \param[in] que is the user provided OpenCL cl_command_queue to be used by ArrayFire. If this
    parameter is NULL, then we create a command queue for the user using the OpenCL
    context they provided us.

    \note ArrayFire does not take control of releasing the objects passed to it. The user needs to release them appropriately.
  +/
  af_err afcl_add_device_context(cl_device_id dev, cl_context ctx, cl_command_queue que);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Set active device using cl_context and cl_device_id

    \param[in] dev is the OpenCL device id that is to be set as Active device inside ArrayFire
    \param[in] ctx is the OpenCL cl_context being used by ArrayFire
  +/
  af_err afcl_set_device_context(cl_device_id dev, cl_context ctx);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Remove the user provided device control constructs from the ArrayFire device manager pool

    This function should be used only when the user would like ArrayFire to remove an already
    pushed user generated OpenCL context and related objects.

    \param[in] dev is the OpenCL device id that has to be popped
    \param[in] ctx is the cl_context object to be removed from ArrayFire pool

    \note ArrayFire does not take control of releasing the objects passed to it. The user needs to release them appropriately.
  +/
  af_err afcl_delete_device_context(cl_device_id dev, cl_context ctx);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Get the type of the current device
  +/
  af_err afcl_get_device_type(afcl_device_type *res);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    Get the platform of the current device
  +/
  af_err afcl_get_platform(afcl_platform *res);
  //#endif

  /+
    @}
  +/

}
