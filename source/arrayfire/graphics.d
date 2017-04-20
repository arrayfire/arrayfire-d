module arrayfire.graphics;

import arrayfire.defines;

extern ( C ) {

  alias ulong af_window;

  struct af_cell{
      int row;
      int col;
      const char* title;
      af_colormap cmap;
  };

  /+
    C Interface wrapper for creating a window

    \param[out]  output is the handle to the created window
    \param[in]   width is the width of the window that will be created
    \param[in]   height is the height of the window that will be created
    \param[in]   title is the window title

    \return     \ref AF_SUCCESS if window creation is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_create_window(af_window *output, const int width, const int height, const char* title);

  /+
    C Interface wrapper for setting the start position when window is displayed

    \param[in]   wind is the window handle
    \param[in]   x is horizontal start coordinate
    \param[in]   y is vertical start coordinate

    \return     \ref AF_SUCCESS if set position for window is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_set_position(const af_window wind, const uint x, const uint y);

  /+
    C Interface wrapper for setting window title

    \param[in]   wind is the window handle
    \param[in]   title is title of the window

    \return     \ref AF_SUCCESS if set title for window is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_set_title(const af_window wind, const char* title);

  //#if AF_API_VERSION >= 31
  /+
    C Interface wrapper for setting window position

    \param[in]   wind is the window handle
    \param[in]   w is target width of the window
    \param[in]   h is target height of the window

    \return     \ref AF_SUCCESS if set size for window is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_set_size(const af_window wind, const uint w, const uint h);
  //#endif

  /+
    C Interface wrapper for drawing an array as an image

    \param[in]   wind is the window handle
    \param[in]   input is an \ref af_array
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p in should be 2d array or 3d array with 3 channels.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_image(const af_window wind, const af_array input, const af_cell* props);

  /+
    C Interface wrapper for drawing an array as a plot

    \param[in]   wind is the window handle
    \param[in]   X is an \ref af_array with the x-axis data points
    \param[in]   Y is an \ref af_array with the y-axis data points
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X and \p Y should be vectors.

    \ingroup gfx_func_draw
  +/
  //DEPRECATED("Use af_draw_plot_nd or af_draw_plot_2d instead")
  af_err af_draw_plot(const af_window wind, const af_array X, const af_array Y, const af_cell* props);

  //#if AF_API_VERSION >= 32
  /+
    C Interface wrapper for drawing an array as a plot

    \param[in]   wind is the window handle
    \param[in]   P is an \ref af_array or matrix with the xyz-values of the points
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p P should be a 3n x 1 vector or one of a 3xn or nx3 matrices.

    \ingroup gfx_func_draw
  +/
  //DEPRECATED("Use af_draw_plot_nd or af_draw_plot_3d instead")
  af_err af_draw_plot3(const af_window wind, const af_array P, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing an array as a 2D or 3D plot

    \param[in]   wind is the window handle
    \param[in]   P is an \ref af_array or matrix with the xyz-values of the points
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p in must be 2d and of the form [n, order], where order is either 2 or 3.
    If order is 2, then chart is 2D and if order is 3, then chart is 3D.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_plot_nd(const af_window wind, const af_array P, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing an array as a 2D plot

    \param[in]   wind is the window handle
    \param[in]   X is an \ref af_array with the x-axis data points
    \param[in]   Y is an \ref af_array with the y-axis data points
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X and \p Y should be vectors.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_plot_2d(const af_window wind, const af_array X, const af_array Y,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing an array as a 3D plot

    \param[in]   wind is the window handle
    \param[in]   X is an \ref af_array with the x-axis data points
    \param[in]   Y is an \ref af_array with the y-axis data points
    \param[in]   Z is an \ref af_array with the z-axis data points
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X, \p Y and \p Z should be vectors.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_plot_3d(const af_window wind,
    const af_array X, const af_array Y, const af_array Z,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    C Interface wrapper for drawing an array as a plot

    \param[in]   wind is the window handle
    \param[in]   X is an \ref af_array with the x-axis data points
    \param[in]   Y is an \ref af_array with the y-axis data points
    \param[in]   marker is an \ref af_marker_type enum specifying which marker to use in the scatter plot
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X and \p Y should be vectors.

    \ingroup gfx_func_draw
  +/
  //DEPRECATED("Use af_draw_scatter_nd or af_draw_scatter_2d instead")
  af_err af_draw_scatter(const af_window wind, const af_array X, const af_array Y,
    const af_marker_type marker, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 33
  /+
    C Interface wrapper for drawing an array as a plot

    \param[in]   wind is the window handle
    \param[in]   P is an \ref af_array or matrix with the xyz-values of the points
    \param[in]   marker is an \ref af_marker_type enum specifying which marker to use in the scatter plot
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_draw
  +/
  //DEPRECATED("Use af_draw_scatter_nd or af_draw_scatter_3d instead")
  af_err af_draw_scatter3(const af_window wind, const af_array P,
    const af_marker_type marker, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing an array as a plot

    \param[in]   wind is the window handle
    \param[in]   P is an \ref af_array or matrix with the xyz-values of the points
    \param[in]   marker is an \ref af_marker_type enum specifying which marker to use in the scatter plot
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p in must be 2d and of the form [n, order], where order is either 2 or 3.
    If order is 2, then chart is 2D and if order is 3, then chart is 3D.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_scatter_nd(const af_window wind, const af_array P,
    const af_marker_type marker, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing an array as a 2D plot

    \param[in]   wind is the window handle
    \param[in]   X is an \ref af_array with the x-axis data points
    \param[in]   Y is an \ref af_array with the y-axis data points
    \param[in]   marker is an \ref af_marker_type enum specifying which marker to use in the scatter plot
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X and \p Y should be vectors.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_scatter_2d(const af_window wind, const af_array X, const af_array Y,
    const af_marker_type marker, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing an array as a 3D plot

    \param[in]   wind is the window handle
    \param[in]   X is an \ref af_array with the x-axis data points
    \param[in]   Y is an \ref af_array with the y-axis data points
    \param[in]   Z is an \ref af_array with the z-axis data points
    \param[in]   marker is an \ref af_marker_type enum specifying which marker to use in the scatter plot
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X, \p Y and \p Z should be vectors.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_scatter_3d(const af_window wind,
    const af_array X, const af_array Y, const af_array Z,
    const af_marker_type marker, const af_cell* props);
  //#endif

  /+
    C Interface wrapper for drawing an array as a histogram

    \param[in]   wind is the window handle
    \param[in]   X is the data frequency \ref af_array
    \param[in]   minval is the value of the minimum data point of the array whose histogram(\p X) is going to be rendered.
    \param[in]   maxval is the value of the maximum data point of the array whose histogram(\p X) is going to be rendered.
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X should be a vector.

    \ingroup gfx_func_draw
  +/
  af_err af_draw_hist(const af_window wind, const af_array X, const double minval, const double maxval, const af_cell* props);

  //#if AF_API_VERSION >= 32
  /+
    C Interface wrapper for drawing array's as a surface

    \param[in]   wind is the window handle
    \param[in]   xVals is an \ref af_array with the x-axis data points
    \param[in]   yVals is an \ref af_array with the y-axis data points
    \param[in]   S is an \ref af_array with the z-axis data points
    \param[in]   props is structure \ref af_cell that has the properties that are used
    for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p X and \p Y should be vectors. \p S should be a 2D array

    \ingroup gfx_func_draw
  +/
  af_err af_draw_surface(const af_window wind, const af_array xVals, const af_array yVals, const af_array S, const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing array's as a 2D or 3D vector field

    \param[in]   wind is the window handle
    \param[in]   points is an \ref af_array with the points
    \param[in]   directions is an \ref af_array with the directions
    \param[in]   props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note \p points and \p directions should have the same size and must
    be 2D.
    The number of rows (dim 0) determines are number of points and the
    number columns determines the type of plot. If the number of columns
    are 2, then the plot is 2D and if there are 3 columns, then the plot
    is 3D.

    \note all the \ref af_array inputs should be vectors and the same size

    \ingroup gfx_func_draw
  +/
  af_err af_draw_vector_field_nd(const af_window wind,
    const af_array points, const af_array directions,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing array's as a 3D vector field

    \param[in]   wind is the window handle
    \param[in]   xPoints is an \ref af_array with the x-axis points
    \param[in]   yPoints is an \ref af_array with the y-axis points
    \param[in]   zPoints is an \ref af_array with the z-axis points
    \param[in]   xDirs is an \ref af_array with the x-axis directions
    \param[in]   yDirs is an \ref af_array with the y-axis directions
    \param[in]   zDirs is an \ref af_array with the z-axis directions
    \param[in]   props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note all the \ref af_array inputs should be vectors and the same size

    \ingroup gfx_func_draw
  +/
  af_err af_draw_vector_field_3d(
    const af_window wind,
    const af_array xPoints, const af_array yPoints, const af_array zPoints,
    const af_array xDirs, const af_array yDirs, const af_array zDirs,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for drawing array's as a 2D vector field

    \param[in]   wind is the window handle
    \param[in]   xPoints is an \ref af_array with the x-axis points
    \param[in]   yPoints is an \ref af_array with the y-axis points
    \param[in]   xDirs is an \ref af_array with the x-axis directions
    \param[in]   yDirs is an \ref af_array with the y-axis directions
    \param[in]   props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \return     \ref AF_SUCCESS if rendering is successful, otherwise an appropriate error code
    is returned.

    \note all the \ref af_array inputs should be vectors and the same size

    \ingroup gfx_func_draw
  +/
  af_err af_draw_vector_field_2d(
    const af_window wind,
    const af_array xPoints, const af_array yPoints,
    const af_array xDirs, const af_array yDirs,
    const af_cell* props);
  //#endif

  /+
    C Interface wrapper for grid setup in a window

    \param[in]   wind is the window handle
    \param[in]   rows is number of rows you want to show in a window
    \param[in]   cols is number of coloumns you want to show in a window

    \return     \ref AF_SUCCESS if grid setup for window is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_grid(const af_window wind, const int rows, const int cols);

  //#if AF_API_VERSION >= 34
  /+
    C Interface for setting axes limits for a histogram/plot/surface/vector field

    This function computes the minimum and maximum for each dimension

    \param[in] wind is the window handle
    \param[in] x the data to compute the limits for x-axis.
    \param[in] y the data to compute the limits for y-axis.
    \param[in] z the data to compute the limits for z-axis.
    \param[in] exact is for using the exact min/max values from \p x, \p y and \p z.
    If exact is false then the most significant digit is rounded up
    to next power of 2 and the magnitude remains the same.
    \param[in] props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \note Set \p to NULL if the chart is 2D.

    \ingroup gfx_func_window
  +/
  af_err af_set_axes_limits_compute(const af_window wind,
    const af_array x, const af_array y, const af_array z,
    const bool exact,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for setting axes limits for a 2D histogram/plot/vector field

    This function sets the axes limits to the ones provided by the user.

    \param[in] wind is the window handle
    \param[in] xmin is the minimum on x-axis
    \param[in] xmax is the maximum on x-axis
    \param[in] ymin is the minimum on y-axis
    \param[in] ymax is the maximum on y-axis
    \param[in] exact is for using the exact min/max values from \p x, and \p y.
    If exact is false then the most significant digit is rounded up
    to next power of 2 and the magnitude remains the same.
    \param[in] props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \ingroup gfx_func_window
  +/
  af_err af_set_axes_limits_2d(const af_window wind,
    const float xmin, const float xmax,
    const float ymin, const float ymax,
    const bool exact,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface for setting axes limits for a 3D plot/surface/vector field

    This function sets the axes limits to the ones provided by the user.

    \param[in] wind is the window handle
    \param[in] xmin is the minimum on x-axis
    \param[in] xmax is the maximum on x-axis
    \param[in] ymin is the minimum on y-axis
    \param[in] ymax is the maximum on y-axis
    \param[in] zmin is the minimum on z-axis
    \param[in] zmax is the maximum on z-axis
    \param[in] exact is for using the exact min/max values from \p x, \p y and \p z.
    If exact is false then the most significant digit is rounded up
    to next power of 2 and the magnitude remains the same.
    \param[in] props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \ingroup gfx_func_window
  +/
  af_err af_set_axes_limits_3d(const af_window wind,
    const float xmin, const float xmax,
    const float ymin, const float ymax,
    const float zmin, const float zmax,
    const bool exact,
    const af_cell* props);
  //#endif

  //#if AF_API_VERSION >= 34
  /+
    C Interface wrapper for setting axes titles for histogram/plot/surface/vector field

    \param[in] wind is the window handle
    \param[in] xtitle is the name of the x-axis
    \param[in] ytitle is the name of the y-axis
    \param[in] ztitle is the name of the z-axis
    \param[in] props is structure \ref af_cell that has the properties that
    are used for the current rendering.

    \ingroup gfx_func_window
  +/
  af_err af_set_axes_titles(const af_window wind,
    const char * xtitle,
    const char * ytitle,
    const char * ztitle,
    const af_cell* props);
  //#endif

  /+
    C Interface wrapper for showing a window

    \param[in] wind is the window handle

    \return \ref AF_SUCCESS if window show is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_show(const af_window wind);

  /+
    C Interface wrapper for checking if window is marked for close

    \param[out]  output is a boolean which indicates whether window is marked for close. This usually
    happens when user presses ESC key while the window is in focus.
    \param[in]   wind is the window handle

    \return     \ref AF_SUCCESS if \p wind show is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_is_window_closed(bool *output, const af_window wind);

  //#if AF_API_VERSION >= 33
  /+
    Hide/Show a window

    \param[in] wind is the window whose visibility is to be changed
    \param[in] is_visible indicates if the window is to be hidden or brought into focus

    \ingroup gfx_func_window
  +/
  af_err af_set_visibility(const af_window wind, const bool is_visible);
  //#endif

  /+
    C Interface wrapper for destroying a window handle

    \param[in]   wind is the window handle

    \return     \ref AF_SUCCESS if window destroy is successful, otherwise an appropriate error code
    is returned.

    \ingroup gfx_func_window
  +/
  af_err af_destroy_window(const af_window wind);

}
