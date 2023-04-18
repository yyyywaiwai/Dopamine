//
//  JailbreakView.swift
//  Fugu15
//
//  Created by Linus Henze on 2022-07-29.
//

import SwiftUI
import Fugu15KernelExploit

enum JBStatus {
    case notStarted
    case unsupported
    case inProgress
    case failed
    case done

    func text() -> String {
        switch self {
        case .notStarted:
            return "越狱"

        case .unsupported:
            return "不支持"

        case .inProgress:
            return "越狱中..."

        case .failed:
            return "错误!"

        case .done:
            return "已越狱!"
        }
    }

    func color() -> Color {
        switch self {
        case .notStarted:
            return .accentColor

        case .unsupported:
            return .accentColor

        case .inProgress:
            return .accentColor

        case .failed:
            return .red

        case .done:
            return .green
        }
    }
}

enum ActiveAlert {
    case jailbroken, hidden, uninstall
}

struct JailbreakView: View {
    @Binding var logText: String

    @State var status: JBStatus = .notStarted
    @State var textStatus1      = "Status: Not running"
    @State var textStatus2      = ""
    @State var textStatus3      = ""
    @State var showAlert                = false
    @State var activeAlert: ActiveAlert = .jailbroken

    var body: some View {
        VStack {
            Button(status.text(), action: {
                status = .inProgress

                DispatchQueue(label: "Fugu15").async {
                    launchExploit()
                }
            })
                .contextMenu {
                    Button(action: {
                        execCmd(args: [CommandLine.arguments[0], "hide_environment"])
                        activeAlert = .hidden
                        showAlert = true
                    }, label: {
                        Label("Hide Environment", systemImage: "eye.slash")
                    })
                    Button(role: .destructive, action: {
                        activeAlert = .uninstall
                        showAlert = true
                    }, label: {
                        Label("Uninstall Environment", systemImage: "trash")
                    })
                }
                .padding()
                .frame(width:180, height: 50, alignment: .center)
                .background(status.color())
                .cornerRadius(10)
                .foregroundColor(Color.white)
                .disabled(status != .notStarted)

            Text(textStatus1)
                .padding([.top, .leading, .trailing])
                .font(.headline)
            Text(textStatus2)
                .padding([.leading, .trailing])
                .font(.subheadline)
                .opacity(0.5)
            Text(textStatus3)
                .padding([.leading, .trailing])
                .font(.footnote)
                .opacity(0.4)

            Button("注销", action: {
                execCmd(args: ["/var/jb/usr/bin/killall", "-9", "backboardd"])
            })
                .padding()
                .frame(width:180, height: 50, alignment: .center)
                .background(Color.cyan)
                .cornerRadius(10)
                .foregroundColor(Color.white)

            Button("软重启", action: {
                execCmd(args: ["/var/jb/usr/bin/ldrestart"])
            })
                .padding()
                .frame(width:180, height: 50, alignment: .center)
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(Color.white)

            Button("重启用户空间", action: {
                execCmd(args: ["/var/jb/usr/bin/launchctl", "reboot", "userspace"])
            })
                .padding()
                .frame(width:180, height: 50, alignment: .center)
                .background(Color.mint)
                .cornerRadius(10)
                .foregroundColor(Color.white)

            Button("重启", action: {
                execCmd(args: ["/var/jb/usr/sbin/reboot"])
            })
                .padding()
                .frame(width:180, height: 50, alignment: .center)
                .background(Color.red)
                .cornerRadius(10)
                .foregroundColor(Color.white)
        }.alert(isPresented: $showAlert) {
            switch activeAlert {
                case .jailbroken:
                    return  Alert(
                title: Text("成功"),
                message: Text("越狱环境已成功建立，但系统范围的注入将仅仅影响自此之后的新进程。" +
                              "因此，建议立即重启用户空间，但你也可以选择稍后自行注销/软重启/重启用户空间。"),
                primaryButton: .cancel(
                    Text("稍后自行处理")
                ),
                secondaryButton: .default(
                    Text("立即重启用户空间"),
                    action: {
                                execCmd(args: ["/var/jb/usr/bin/launchctl", "reboot", "userspace"])
                            }
                )
            )
                case .hidden:
                    return Alert(title: Text("已隐藏越狱"), message: Text("下次越狱前，越狱环境已完全隐藏。"), dismissButton: .default(Text("OK")))
                case .uninstall:
                    return Alert(title: Text("删除越狱"),
                        message: Text("你确定要删除越狱环境嘛？这将删除你安装的所有越狱包、插件、App；仅有一些配置文件可能得到保留。"),
                        primaryButton: .cancel(Text("取消")),
                        secondaryButton: .default(Text("删除越狱")) {
                            execCmd(args: [CommandLine.arguments[0], "uninstall_environment"])
                    })
            }
        }
    }

    func print(_ text: String, ender: String = "\n") {
        NSLog(text)
        logText += text + ender
    }

    func statusUpdate(_ s: String) {
        textStatus3 = textStatus2
        textStatus2 = textStatus1
        textStatus1 = s
    }

    func launchExploit() {
        do {
            statusUpdate("Status: Launching kexploitd")

            try Fugu15.launchKernelExploit(oobPCI: Bundle.main.bundleURL.appendingPathComponent("oobPCI")) { msg in
                if status != .done {
                    DispatchQueue.main.async {
                        if msg.hasPrefix("Status: ") {
                            statusUpdate(msg)
                        }

                        print(msg)
                    }
                }
            }

            try Fugu15.startEnvironment()
            //try Fugu15.launch_iDownload()

            DispatchQueue.main.async {
                statusUpdate("Status: Done!")
                status = .done
                activeAlert = .jailbroken
                showAlert = true
            }
        } catch {
            DispatchQueue.main.async {
                print("Fugu15 error: \(error)")
                status = .failed
            }
        }
    }
}

struct JailbreakView_Previews: PreviewProvider {
    @State static var logText = ""

    static var previews: some View {
        JailbreakView(logText: $logText)
    }
}
