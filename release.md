## 关于本次更新

1. 本次更新基于最新越狱引导环境（opa334/Dopamine::6c85fdc）。因此，**首次**安装或更新到此类版本，越狱后将删除已有的越狱引导环境；即是说，对于**首次**安装或更新到此类版本并越狱，**你订阅的源和安装的插件将丢失**，请注意备份。
2. 更新对 plist 配置文件的访问方式，使之符合 Apple 的推荐的最佳实践。
3. 解决配置文件中，路径映射默认值被意外删除的问题。
4. 解决反向代理失效的问题。
5. 改进更多汉化。

## 修改版的主要功能

1. 提供汉化（包括中国大陆、中国香港、中国台湾）。对，汉化作者是我（自豪）。
2. 可与官方版本共存。
3. 支持应用内更新越狱包。
4. 支持目录映射，并支持越狱后新增目录映射（而无需重启越狱；位于越狱后的设置中）。
5. 允许用户在越狱成功后点按「用户空间重启以完成越狱」，而不是自动重启。
6. 额外提供「软重启」、「重启」功能按钮。
7. 提供重建越狱引导环境的功能（位于设置中）。
8. 首页加入编译时间，关于页加入编译版本。

## About This Update

1. This update is based on the latest Jailbreak Bootstrap Environment (opa334/Dopamine::6c85fdc). Hence, on the **VERY FIRST TIME** that you install/upgrade-to this kind of versions, **YOUR ENVIRONMENT WILL BE REMOVED AND REINSTALLED**. That is, **THE SOURCES YOU'VE SUBSCRIBED AND THE TWEAKS YOU'VE INSTALLED WILL LOSE**. Please kindly and carefully back them up.
2. Update the usage of the plist file, which makes code matching the requirement of Apple's best practice.
3. Fix the problem that accidently deleting the default value of `emableMount` in the plist file.
4. Fix the reverse proxy.
5. Improve Translations.

## About this Mod

1. Offers Chinese translation (Mainland China, Hongkong of China, Taiwan of China).
2. Be able to stay with the official version.
3. Offers the ability to OTA update.
4. Support path bind & mount. Also support hot bind & mount (do not need to reboot and re-jailbreak; find it at settings page after jailbroken).
5. Allow users to reboot userspace by tap button, rather than slightly reboot.
6. Offers ldrestart and reboot buttons.
7. In settings, users could enable "rebuild environment".
8. Add compile time on the first page, and add compile version in about page.
