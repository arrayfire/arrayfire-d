module arrayfire.exception;

import arrayfire.defines;

extern ( C ) {

  void af_get_last_error(char **msg, dim_t *len);
  //const char *af_err_to_string(const af_err err);

}