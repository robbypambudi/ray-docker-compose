import ray

@ray.remote(num_gpus=1)
def use_gpu():
    import tensorflow as tf
 
    # Create a TensorFlow session. TensorFlow will restrict itself to use the
    # GPUs specified by the CUDA_VISIBLE_DEVICES environment variable.
    tf.Session()