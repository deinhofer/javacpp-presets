/*
 * Copyright (C) 2014 Samuel Audet, Martin Deinhofer
 *
 * Licensed either under the Apache License, Version 2.0, or (at your option)
 * under the terms of the GNU General Public License as published by
 * the Free Software Foundation (subject to the "Classpath" exception),
 * either version 2, or any later version (collectively, the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *     http://www.gnu.org/licenses/
 *     http://www.gnu.org/software/classpath/license.html
 *
 * or as provided in the LICENSE.txt file that accompanied this code.
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.bytedeco.dlib.presets;

import org.bytedeco.javacpp.Loader;
import org.bytedeco.javacpp.annotation.Platform;
import org.bytedeco.javacpp.annotation.Properties;
import org.bytedeco.javacpp.tools.InfoMap;
import org.bytedeco.javacpp.tools.InfoMapper;

import org.bytedeco.opencv.presets.opencv_imgproc;

/**
 * @author Martin Deinhofer
 */
@Properties(value = @Platform(link = "dlib"/*, resource = {"include", "lib"}*/, compiler = "cpp11"),
    inherit = opencv_imgproc.class, target = "org.bytedeco.dlib", global = "org.bytedeco.dlib.global.dlib")
public class dlib implements InfoMapper {
    static { Loader.checkVersion("org.bytedeco", "dlib"); }

    public void map(InfoMap infoMap) {
    }
}
