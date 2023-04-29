## 关于本次更新

这本质上是一个自用版本，发布的意思是「分享」。

### 1.1 - 20230626_215711

1. 挂载路径从 `/var/mobile/Library/Preference/` 挪到 `/var/jb/var/mobile/Library/Preference/`。这更加符合 rootless 越狱的标准配置。
2. 在 `/var/jb` 目录下建立对 `/var/jb/var/mobile/Library/Preference/page.liam.prefixers.plist` 的符号链接。这将有助于减少查找该配置文件的时间，但不改变本质。
3. 此版本建议更新后重启重新越狱，否则，可能看不到设置页中的「增加/删除路径映射」。

## 修改版的主要功能

1. 提供汉化（包括中国大陆、中国香港、中国台湾）。对，汉化作者是我（自豪）。
2. 可与官方版本共存。
3. 支持应用内更新越狱包。
4. 支持目录映射，并支持越狱后新增目录映射（而无需重启越狱；位于越狱后的设置中）。
5. 允许用户在越狱成功后点按「用户空间重启以完成越狱」，而不是自动重启。
6. 额外提供「软重启」、「重启」功能按钮。
7. 提供重建越狱引导环境的功能（位于设置中）。
8. 提供「屏蔽更新」的功能，以屏蔽 Dopamine 在启动时检查更新。当然，你可能因此错过最新更新；虽然这通常不是什么大问题。
9. 提供「桥接心浪」的功能，以便以 XinA 的模式安装有根插件。
10. 首页加入编译时间，关于页加入编译版本。

------

## About This Update

This modification is disigned to be used only by me myself.

### 1.1 - 20230626_215711

1. Move the mount path from `/var/mobile/Library/Preference/` to `/var/jb/var/mobile/Library/Preference/`. This aligns better with the standard configuration of a rootless jailbreak.
2. Create a symbolic link to `/var/mobile/Library/Preference/page.liam.prefixers.plist` in the `/var/jb` directory. This will help reduce the time required to locate the configuration file, without altering its essence. Those who do not have this requirement can skip this version upgrade.
3. This version recommends updating and restarting for re-jailbreaking. Otherwise, you may not see the "Add/Delete Path Mapping" option in the settings page.

## About this Mod

1. Offers Chinese translation (Mainland China, Hongkong of China, Taiwan of China).
2. Be able to stay with the official version.
3. Offers the ability to OTA update.
4. Support path bind & mount. Also support hot bind & mount (do not need to reboot and re-jailbreak; find it at settings page after jailbroken).
5. Allow users to reboot userspace by tap button, rather than slightly reboot.
6. Offers ldrestart and reboot buttons.
7. In settings, users could enable "rebuild environment".
8. Provide a "block updates" feature to block Dopamine from checking for updates on startup. However, you may miss out on the latest updates as a result, although this is generally not a significant issue.
9. Provide the "Bridge to XinA" feature to facilitate the installation of rooted plugins using the XinA mode.
10. Add compile time on the first page, and add compile version in about page.

------
