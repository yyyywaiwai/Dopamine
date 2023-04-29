## 关于本次更新

本质上是我自己用的版本。**不建议普通用户使用，否则后果自负。**

1. 20230424_224717: 本次更新基于最新越狱引导环境（opa334/Dopamine::6c85fdc）。因此，**首次**安装或更新到此类版本，越狱后将删除已有的越狱引导环境；即是说，对于**首次**安装或更新到此类版本并越狱，**你订阅的源和安装的插件将丢失**，请注意备份。
2. 20230424_224717: 更新对 plist 配置文件的访问方式，使之符合 Apple 的推荐的最佳实践。
3. 20230424_224717: 解决配置文件中，路径映射默认值被意外删除的问题。
4. 20230424_224717: 解决反向代理失效的问题。
5. 20230425_092500: 更新上游代码 `opa334::Dopamine::90ffc04`
6. 20230425_162500: 修复逻辑 bug，在重建环境时，允许用户选择包管理器的功能。
7. 20230425_183000: 修复部分机型上因地区选择问题导致汉化文件 fallback 到 zh-Hans 的问题。
8. 20230426_080000: 用更好的方式将反向代理嵌入 OTA 升级流程。这样，普通用户也能享受到最快的更新下载速度。
9. 20230502_093000: 更新上游代码 `opa334::Dopamien::9b4792d`，更新路径映射代码，更新升级流程代码。
10. 20230502_091500: 更新上游代码 `opa334::Dopamien::37f5b83`。
11. 改进更多汉化。

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

This modification is disigned to be used only by me myself. **It is not recommended to be used by average users. Use it on your own risk.**

1. 20230424_224717: This update is based on the latest Jailbreak Bootstrap Environment (opa334/Dopamine::6c85fdc). Hence, on the **VERY FIRST TIME** that you install/upgrade-to this kind of versions, **YOUR ENVIRONMENT WILL BE REMOVED AND REINSTALLED**. That is, **THE SOURCES YOU'VE SUBSCRIBED AND THE TWEAKS YOU'VE INSTALLED WILL LOSE**. Please kindly and carefully back them up.
2. 20230424_224717: Update the usage of the plist file, which makes code matching the requirement of Apple's best practice.
3. 20230424_224717: Fix the problem that accidently deleting the default value of `emableMount` in the plist file.
4. 20230424_224717: Fix the reverse proxy.
5. 20230425_092500: update source code from upstream `opa334::Dopamine::90ffc04`
6. 20230425_162500: fix a logic bug that while rebuilding environment, allow user to select package manager.
7. 20230425_183000: fix the issue that on some iPhone model zh_CN failed to load and fallback to zh-Hans.
8. 20230426_080000: Embedding the reverse proxy in a better way into the upgrading process. Now, average users will enjoy a better downloading speed.
9. 20230502_093000: update source code from upstream `opa334::Dopamien::9b4792d`; update code for path mapping; update code for upgrading.
10. 20230502_091500: update source code from upstream `opa334::Dopamien::37f5b83`.
11. Improve Translations.

## About this Mod

1. Offers Chinese translation (Mainland China, Hongkong of China, Taiwan of China).
2. Be able to stay with the official version.
3. Offers the ability to OTA update.
4. Support path bind & mount. Also support hot bind & mount (do not need to reboot and re-jailbreak; find it at settings page after jailbroken).
5. Allow users to reboot userspace by tap button, rather than slightly reboot.
6. Offers ldrestart and reboot buttons.
7. In settings, users could enable "rebuild environment".
8. Add compile time on the first page, and add compile version in about page.
