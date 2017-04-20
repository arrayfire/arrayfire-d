<a href="http://arrayfire.com/"><img src="http://arrayfire.com/logos/arrayfire_logo_whitebkgnd.png" width="300"></a>

ArrayFire is a general-purpose library that simplifies the process of developing
software that targets parallel and massively-parallel architectures including
CPUs, GPUs, and other hardware acceleration devices.

`arrayfire-d` is a D binding for ArrayFire.

# Installation


# Specifying Backend:

ArrayFire library supports the following backends:
* CPU : `afcpu`
* OpenCL : `afopencl`
* CUDA : `afcuda`
* Unified backend :  `af`

To specify the backend you want to use place it in your `dub.json` file.

For example, if you have a Nvidia GPU and want to use the CUDA backend:

`dub.json`:
```json
{
  "name": "af_example",
  "authors": [
    "John Doe"
  ],
  "libs": ["afcuda"],
  "description": "ArrayFire Example"
}

```

If you specify `af` as ArrayFire backend, the following preference would be used by ArrayFire
to harvest maximum efficiency:
1. CUDA
2. OpenCL
3. CPU

# LICENSE

This software is distributed under the [BSD 3-Clause License](LICENSE).

Copyright © 2017, Prasun Anand and ArrayFire
