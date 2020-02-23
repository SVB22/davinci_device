/*
 Copyright (C) 2020

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
*/

#define LOG_TAG "gfscreenoffd"

#include "touch_handler.h"

#include <android-base/logging.h>
#include <sys/resource.h>
#include <fcntl.h>
#include <linux/input.h>
#include <linux/uinput.h>
#include <unistd.h>

#include <fstream>

using ::vendor::chaldeastudio::gfscreenoffd::TouchHandler;

int main() {
    int ret, fd;
    id_t pid = getpid();
    struct uinput_user_dev udev;

    fd = open("/dev/uinput", O_WRONLY | O_NONBLOCK);
    if (fd < 0) {
        LOG(ERROR) << "Unable to open uinput, exiting.";
        return 1;
    }

    // creating virtual input for the front-ends

    ioctl(fd, UI_SET_EVBIT, EV_KEY);
    ioctl(fd, UI_SET_KEYBIT, KEY_FOD_GESTURE_DOWN);
    sprintf(udev.name, "uinput-gfscreenoffd");
    udev.id.bustype = BUS_VIRTUAL;

    ret = write(fd, &udev, sizeof(udev));
    if (ret < 0) {
        LOG(ERROR) << "Failed to create virtual input, exiting.";
        close(fd);
        return 1;
    }

    ret = ioctl(fd, UI_DEV_CREATE);
    if (ret < 0) {
        LOG(ERROR) << "Failed to create virtual input, exiting.";
        close(fd);
        return 1;
    }

    setpriority(PRIO_PROCESS, pid, 19);

    TouchHandler handler(fd);
    handler.startListener();

    close(fd);
    return 0;
}
