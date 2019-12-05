module org.bytedeco.dlib {
  requires transitive org.bytedeco.javacpp;
  requires transitive org.bytedeco.opencv;
  exports org.bytedeco.dlib.global;
  exports org.bytedeco.dlib.presets;
  exports org.bytedeco.dlib;
}
