; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [331 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [993 x i32] [
	i32 u0x0027eb9e, ; 0: System.Net.NetworkInformation.dll => 70
	i32 u0x00345a11, ; 1: lib_System.Net.Requests.dll.so => 74
	i32 u0x009b21bb, ; 2: System.Net.NameResolution.dll => 69
	i32 u0x00c8cc5d, ; 3: lib_Xamarin.AndroidX.Loader.dll.so => 255
	i32 u0x00e0bbf7, ; 4: lib_System.Xml.XmlSerializer.dll.so => 166
	i32 u0x00efe298, ; 5: System.Runtime.Intrinsics.dll => 111
	i32 u0x0119bc86, ; 6: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 182
	i32 u0x01cdfed1, ; 7: System.Linq.AsyncEnumerable => 59
	i32 u0x01f2c4e1, ; 8: Xamarin.AndroidX.Lifecycle.Runtime => 246
	i32 u0x0211b5dc, ; 9: Xamarin.Google.Guava.ListenableFuture.dll => 287
	i32 u0x02139ac3, ; 10: System.IO.FileSystem.DriveInfo => 48
	i32 u0x025a8054, ; 11: System.Net.WebSockets.dll => 83
	i32 u0x02664405, ; 12: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 325
	i32 u0x028aa24d, ; 13: System.Threading.Thread => 149
	i32 u0x03358480, ; 14: lib_Microsoft.Maui.dll.so => 193
	i32 u0x0335cdbc, ; 15: ca/Microsoft.Maui.Controls.resources => 297
	i32 u0x03f75868, ; 16: System.Diagnostics.StackTrace => 30
	i32 u0x0410f24b, ; 17: System.Security.Cryptography.Primitives => 127
	i32 u0x044bb714, ; 18: Microsoft.Maui.Graphics.dll => 195
	i32 u0x04e7b0a1, ; 19: System.Runtime.CompilerServices.VisualC.dll => 105
	i32 u0x056606a6, ; 20: lib_System.Collections.NonGeneric.dll.so => 10
	i32 u0x05dc54b4, ; 21: Microsoft.Extensions.Diagnostics.Abstractions => 183
	i32 u0x060d4943, ; 22: Xamarin.AndroidX.SlidingPaneLayout => 269
	i32 u0x0621fa55, ; 23: lib_System.Net.ServerSentEvents.dll.so => 76
	i32 u0x065dd880, ; 24: lib_System.Linq.Queryable.dll.so => 62
	i32 u0x06987b81, ; 25: lib_D-ToDoList.dll.so => 0
	i32 u0x06989c2e, ; 26: Xamarin.AndroidX.Navigation.Runtime.Android.dll => 260
	i32 u0x06c2cd46, ; 27: zh-HK/Microsoft.Maui.Controls.resources => 327
	i32 u0x06e4e181, ; 28: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 287
	i32 u0x06ee56d3, ; 29: lib_System.Net.Mail.dll.so => 68
	i32 u0x06ffddbc, ; 30: System.Runtime.InteropServices => 110
	i32 u0x0720e5bb, ; 31: Xamarin.AndroidX.Navigation.Common.Android.dll => 257
	i32 u0x072f9521, ; 32: Xamarin.AndroidX.SlidingPaneLayout.dll => 269
	i32 u0x074aea82, ; 33: System.Threading.Channels.dll => 143
	i32 u0x0772c6a7, ; 34: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 31
	i32 u0x0881c32f, ; 35: System.Net.WebHeaderCollection => 80
	i32 u0x08f064cf, ; 36: System.Security.Cryptography.Primitives.dll => 127
	i32 u0x097ed3c0, ; 37: System.ComponentModel.Annotations => 13
	i32 u0x098905a2, ; 38: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 222
	i32 u0x09d975c3, ; 39: Xamarin.AndroidX.Collection.dll => 219
	i32 u0x0a0c2bd0, ; 40: lib_Xamarin.AndroidX.Activity.dll.so => 208
	i32 u0x0a4f2d15, ; 41: Syncfusion.Maui.Core.dll => 202
	i32 u0x0a81994f, ; 42: System.ServiceProcess => 135
	i32 u0x0ade3a75, ; 43: Xamarin.AndroidX.SwipeRefreshLayout.dll => 271
	i32 u0x0ae43932, ; 44: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 272
	i32 u0x0aee6a3d, ; 45: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 326
	i32 u0x0aeedc53, ; 46: lib_Xamarin.Google.Android.Material.dll.so => 283
	i32 u0x0afca281, ; 47: System.ValueTuple.dll => 155
	i32 u0x0b0de1c3, ; 48: lib_System.Xml.XPath.XDocument.dll.so => 163
	i32 u0x0b63b1e1, ; 49: lib_System.Net.Http.Json.dll.so => 65
	i32 u0x0b721a36, ; 50: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 316
	i32 u0x0ba65f85, ; 51: vi/Microsoft.Maui.Controls.resources.dll => 326
	i32 u0x0ba8e231, ; 52: lib_System.Net.ServicePoint.dll.so => 77
	i32 u0x0be195c3, ; 53: zh-HK/Microsoft.Maui.Controls.resources.dll => 327
	i32 u0x0c38ff48, ; 54: System.ComponentModel => 18
	i32 u0x0c7b2e71, ; 55: Xamarin.AndroidX.Browser.dll => 217
	i32 u0x0cbc4dce, ; 56: System.Threading.AccessControl.dll => 142
	i32 u0x0cfa66a6, ; 57: lib_System.IO.Compression.FileSystem.dll.so => 44
	i32 u0x0d1f8edb, ; 58: System.Diagnostics.Debug => 26
	i32 u0x0d73bff4, ; 59: lib_Microsoft.Extensions.Logging.Debug.dll.so => 188
	i32 u0x0dc10265, ; 60: Microsoft.CSharp.dll => 1
	i32 u0x0dc2edec, ; 61: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 228
	i32 u0x0dc2f416, ; 62: lib_Xamarin.AndroidX.CustomView.dll.so => 230
	i32 u0x0dcb05c4, ; 63: System.Linq.Parallel => 61
	i32 u0x0dd133ce, ; 64: System.Globalization => 42
	i32 u0x0e3c65a0, ; 65: lib_System.Threading.AccessControl.dll.so => 142
	i32 u0x0e762ada, ; 66: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 314
	i32 u0x0eb2f8c5, ; 67: System.Reflection.Emit.Lightweight => 94
	i32 u0x0ec71be0, ; 68: lib_System.Security.SecureString.dll.so => 132
	i32 u0x0ecfdca9, ; 69: lib_Xamarin.Android.Glide.dll.so => 204
	i32 u0x0f99119d, ; 70: Xamarin.AndroidX.ConstraintLayout.dll => 223
	i32 u0x107abf20, ; 71: System.Threading.Timer.dll => 151
	i32 u0x109c6ab8, ; 72: Xamarin.AndroidX.Lifecycle.LiveData.dll => 242
	i32 u0x10b7d2b7, ; 73: Xamarin.AndroidX.Interpolator => 239
	i32 u0x10bf9929, ; 74: cs/Microsoft.Maui.Controls.resources.dll => 298
	i32 u0x10c1d9f6, ; 75: lib_System.Data.DataSetExtensions.dll.so => 23
	i32 u0x113d3381, ; 76: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 321
	i32 u0x1159791e, ; 77: System.IO.Pipes.AccessControl.dll => 55
	i32 u0x11d123fd, ; 78: System.Net.Ping.dll => 71
	i32 u0x13031348, ; 79: Xamarin.AndroidX.Activity.dll => 208
	i32 u0x132b30dd, ; 80: System.Numerics => 86
	i32 u0x1331a702, ; 81: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 285
	i32 u0x136bf828, ; 82: lib_System.Runtime.dll.so => 119
	i32 u0x14095832, ; 83: ja/Microsoft.Maui.Controls.resources.dll => 311
	i32 u0x146817a2, ; 84: Xamarin.AndroidX.Lifecycle.Common => 240
	i32 u0x14afd810, ; 85: SQLitePCLRaw.lib.e_sqlite3.android.dll => 199
	i32 u0x14eaf2a7, ; 86: lib_System.ComponentModel.Annotations.dll.so => 13
	i32 u0x153e1455, ; 87: it/Microsoft.Maui.Controls.resources.dll => 310
	i32 u0x15502fa0, ; 88: cs/Microsoft.Maui.Controls.resources => 298
	i32 u0x15766b7b, ; 89: System.ServiceModel.Web => 134
	i32 u0x15c177ae, ; 90: lib_Microsoft.Extensions.Configuration.dll.so => 179
	i32 u0x15e184df, ; 91: lib_System.Runtime.Loader.dll.so => 112
	i32 u0x15ebe147, ; 92: System.IO.Pipes => 56
	i32 u0x1658bf94, ; 93: System.Transactions.Local => 153
	i32 u0x16646418, ; 94: System.Net.ServicePoint.dll => 77
	i32 u0x16a510e1, ; 95: System.Threading.Thread.dll => 149
	i32 u0x16d476c4, ; 96: System.IO.Hashing.dll => 176
	i32 u0x16fe439a, ; 97: System.Memory.dll => 64
	i32 u0x1766c1f7, ; 98: System.Threading.ThreadPool.dll => 150
	i32 u0x1778984a, ; 99: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 264
	i32 u0x17969339, ; 100: _Microsoft.Android.Resource.Designer => 330
	i32 u0x180c08d0, ; 101: WindowsBase => 169
	i32 u0x195d1904, ; 102: Xamarin.AndroidX.Lifecycle.Runtime.Android => 247
	i32 u0x198cd3eb, ; 103: lib_System.Security.Cryptography.Encoding.dll.so => 125
	i32 u0x19f6996b, ; 104: sv/Microsoft.Maui.Controls.resources.dll => 322
	i32 u0x1a4e3ec4, ; 105: Xamarin.AndroidX.ConstraintLayout.Core => 224
	i32 u0x1a61054f, ; 106: System.Collections => 12
	i32 u0x1ae0ec2c, ; 107: Xamarin.AndroidX.Fragment.dll => 237
	i32 u0x1ae969b2, ; 108: System.Security.Cryptography.X509Certificates => 128
	i32 u0x1b317bfd, ; 109: System.Web.HttpUtility.dll => 156
	i32 u0x1b46a9fd, ; 110: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 248
	i32 u0x1b5932ea, ; 111: lib_Mono.Android.Runtime.dll.so => 174
	i32 u0x1b611806, ; 112: System.Runtime.Serialization.Primitives.dll => 116
	i32 u0x1bc4415d, ; 113: mscorlib => 170
	i32 u0x1bc6ffe7, ; 114: lib_Java.Interop.dll.so => 172
	i32 u0x1bff388e, ; 115: System.dll => 168
	i32 u0x1c690cb9, ; 116: Xamarin.AndroidX.Interpolator.dll => 239
	i32 u0x1c78d08a, ; 117: lib_System.Private.Uri.dll.so => 89
	i32 u0x1d48410e, ; 118: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 269
	i32 u0x1d4d8185, ; 119: lib_System.Runtime.Serialization.dll.so => 118
	i32 u0x1dbae811, ; 120: System.ObjectModel => 87
	i32 u0x1dd2dc50, ; 121: id/Microsoft.Maui.Controls.resources.dll => 309
	i32 u0x1e092f31, ; 122: fi/Microsoft.Maui.Controls.resources.dll => 303
	i32 u0x1e9789de, ; 123: Microsoft.Extensions.Primitives.dll => 190
	i32 u0x1f1dceb7, ; 124: lib_System.Security.Cryptography.Primitives.dll.so => 127
	i32 u0x1f443e2d, ; 125: lib_System.AppContext.dll.so => 6
	i32 u0x1f6088c2, ; 126: System.Transactions.dll => 154
	i32 u0x1f6bf43d, ; 127: hi/Microsoft.Maui.Controls.resources => 306
	i32 u0x1f9b4faa, ; 128: System.Linq.Queryable => 62
	i32 u0x20216150, ; 129: Microsoft.Extensions.Logging => 186
	i32 u0x20303736, ; 130: System.IO.FileSystem.dll => 51
	i32 u0x2080b118, ; 131: System.Runtime.Extensions => 106
	i32 u0x20924146, ; 132: System.Runtime.Serialization.Xml => 117
	i32 u0x20bbb280, ; 133: System.Globalization.Calendars => 40
	i32 u0x2116ab2f, ; 134: Xamarin.JSpecify.dll => 289
	i32 u0x213954e7, ; 135: Jsr305Binding => 284
	i32 u0x218bdf07, ; 136: Xamarin.AndroidX.Core.ViewTree.dll => 228
	i32 u0x21e38d8e, ; 137: Syncfusion.Maui.ProgressBar.dll => 203
	i32 u0x22697083, ; 138: System.Security.Cryptography.Cng => 123
	i32 u0x234b6fb2, ; 139: pt-BR/Microsoft.Maui.Controls.resources.dll => 317
	i32 u0x236793de, ; 140: lib_GoogleGson.dll.so => 178
	i32 u0x2386616a, ; 141: lib_System.ServiceModel.Web.dll.so => 134
	i32 u0x2397454a, ; 142: lib_System.Collections.Specialized.dll.so => 11
	i32 u0x23d83352, ; 143: System.IO.IsolatedStorage.dll => 52
	i32 u0x23eaab34, ; 144: lib_System.Core.dll.so => 21
	i32 u0x24154ecb, ; 145: System.IO.Compression.FileSystem => 44
	i32 u0x2459aaf0, ; 146: lib_System.Net.Sockets.dll.so => 78
	i32 u0x2493d7b9, ; 147: System.Security.Cryptography.Algorithms => 122
	i32 u0x2512d1c5, ; 148: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 247
	i32 u0x252c9491, ; 149: Syncfusion.Maui.ProgressBar => 203
	i32 u0x2568904f, ; 150: Xamarin.AndroidX.CustomView => 230
	i32 u0x26233b86, ; 151: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 235
	i32 u0x26249f17, ; 152: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 231
	i32 u0x262968a7, ; 153: lib_System.Reflection.Extensions.dll.so => 96
	i32 u0x262d781c, ; 154: lib-de-Microsoft.Maui.Controls.resources.dll.so => 300
	i32 u0x2660a755, ; 155: System.Net => 84
	i32 u0x27787397, ; 156: System.Text.Encodings.Web.dll => 139
	i32 u0x278c7790, ; 157: Xamarin.AndroidX.VersionedParcelable => 277
	i32 u0x27b53050, ; 158: lib_System.Data.Common.dll.so => 22
	i32 u0x27b6d01f, ; 159: Xamarin.AndroidX.Arch.Core.Common.dll => 215
	i32 u0x2814a96c, ; 160: System.Collections.Concurrent => 8
	i32 u0x282acf5e, ; 161: lib_System.IO.FileSystem.dll.so => 51
	i32 u0x28607aa1, ; 162: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 317
	i32 u0x28bdabca, ; 163: System.Net.Security => 75
	i32 u0x2904cf94, ; 164: ca/Microsoft.Maui.Controls.resources.dll => 297
	i32 u0x29293ff5, ; 165: System.Xml.Linq.dll => 159
	i32 u0x29352520, ; 166: Xamarin.KotlinX.Coroutines.Android.dll => 291
	i32 u0x29423679, ; 167: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 229
	i32 u0x295a9e3d, ; 168: System.Windows => 158
	i32 u0x296c7566, ; 169: lib_System.Xml.dll.so => 167
	i32 u0x29af2b3b, ; 170: System.Reflection.Emit => 95
	i32 u0x29bd7e5b, ; 171: Xamarin.Jetbrains.Annotations => 288
	i32 u0x29be9df3, ; 172: System.IO.Compression.ZipFile => 45
	i32 u0x2a1e8ecb, ; 173: ko/Microsoft.Maui.Controls.resources.dll => 312
	i32 u0x2a4afd4a, ; 174: de/Microsoft.Maui.Controls.resources.dll => 300
	i32 u0x2b15ed29, ; 175: System.Runtime.Loader.dll => 112
	i32 u0x2ba1ca8c, ; 176: lib_System.Security.dll.so => 133
	i32 u0x2bd14e96, ; 177: System.Security.SecureString.dll => 132
	i32 u0x2ca248c0, ; 178: SQLitePCLRaw.batteries_v2 => 197
	i32 u0x2cd6293c, ; 179: System.Diagnostics.Contracts.dll => 25
	i32 u0x2d052d0c, ; 180: Xamarin.Android.Glide.Annotations.dll => 205
	i32 u0x2d322560, ; 181: lib_System.Xml.XmlDocument.dll.so => 165
	i32 u0x2d445acd, ; 182: System.Net.Requests => 74
	i32 u0x2d745423, ; 183: System.IO.Pipes.dll => 56
	i32 u0x2e394f87, ; 184: System.IO.Compression => 46
	i32 u0x2eec5558, ; 185: lib_System.Reflection.dll.so => 100
	i32 u0x2f0980eb, ; 186: Microsoft.Extensions.Options => 189
	i32 u0x2f0fe5eb, ; 187: lib_System.Reflection.DispatchProxy.dll.so => 92
	i32 u0x2f1c1e69, ; 188: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 231
	i32 u0x2ff6fb9f, ; 189: System.Data.Common => 22
	i32 u0x302809e9, ; 190: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 244
	i32 u0x30a0e95c, ; 191: lib_System.Threading.Thread.dll.so => 149
	i32 u0x311247b5, ; 192: System.Private.Uri.dll => 89
	i32 u0x317d5b75, ; 193: System.IO.Compression.Brotli => 43
	i32 u0x31a103c6, ; 194: System.Xml.XPath.dll => 164
	i32 u0x31b69d60, ; 195: System.Net.Quic => 73
	i32 u0x3312831d, ; 196: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 232
	i32 u0x33e88be1, ; 197: ar/Microsoft.Maui.Controls.resources => 296
	i32 u0x340ac0b8, ; 198: Microsoft.VisualBasic => 3
	i32 u0x34505120, ; 199: System.Globalization.dll => 42
	i32 u0x3463c971, ; 200: System.Net.Http.Json => 65
	i32 u0x34a30d77, ; 201: System.IO.Hashing => 176
	i32 u0x34a66c56, ; 202: lib_System.IO.Pipes.dll.so => 56
	i32 u0x351454c7, ; 203: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 199
	i32 u0x352e5794, ; 204: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 286
	i32 u0x35e25008, ; 205: System.ComponentModel.Primitives.dll => 16
	i32 u0x3612ff2c, ; 206: lib_System.IO.dll.so => 58
	i32 u0x364e69a3, ; 207: System.IO.MemoryMappedFiles.dll => 53
	i32 u0x36e9595b, ; 208: lib_System.Transactions.dll.so => 154
	i32 u0x370eff4f, ; 209: lib_System.Globalization.Extensions.dll.so => 41
	i32 u0x373f6a31, ; 210: tr/Microsoft.Maui.Controls.resources.dll => 324
	i32 u0x3751ef41, ; 211: Xamarin.Google.Guava.ListenableFuture => 287
	i32 u0x3787b992, ; 212: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i32 u0x37ea9cd7, ; 213: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 251
	i32 u0x382704bd, ; 214: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 235
	i32 u0x38c136f7, ; 215: System.Runtime.InteropServices.JavaScript.dll => 108
	i32 u0x38d89c1d, ; 216: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 241
	i32 u0x38fe5498, ; 217: Xamarin.AndroidX.Window.WindowCore.Jvm => 282
	i32 u0x39481653, ; 218: lib_mscorlib.dll.so => 170
	i32 u0x399f1f06, ; 219: Xamarin.Google.Crypto.Tink.Android => 285
	i32 u0x39adca5e, ; 220: Xamarin.AndroidX.Lifecycle.Common.dll => 240
	i32 u0x3a20ecf3, ; 221: System.Diagnostics.Tracing => 34
	i32 u0x3a2aaa1d, ; 222: System.Xml.XDocument => 162
	i32 u0x3a8b0a79, ; 223: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 291
	i32 u0x3acd0267, ; 224: System.Private.DataContractSerialization.dll => 88
	i32 u0x3ad7b407, ; 225: System.Diagnostics.Tools => 32
	i32 u0x3b008d80, ; 226: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 233
	i32 u0x3b2c715c, ; 227: System.Collections.dll => 12
	i32 u0x3b3271e4, ; 228: zh-Hans/Microsoft.Maui.Controls.resources => 328
	i32 u0x3b458447, ; 229: lib_System.Threading.Tasks.Dataflow.dll.so => 145
	i32 u0x3b45fb35, ; 230: System.IO.FileSystem => 51
	i32 u0x3b4797e5, ; 231: es/Microsoft.Maui.Controls.resources => 302
	i32 u0x3bb6bd33, ; 232: System.IO.UnmanagedMemoryStream.dll => 57
	i32 u0x3c5e5b62, ; 233: Xamarin.AndroidX.SavedState.dll => 265
	i32 u0x3cbffa41, ; 234: System.Drawing => 36
	i32 u0x3d548d92, ; 235: Microsoft.Extensions.DependencyInjection.Abstractions => 182
	i32 u0x3d5a6611, ; 236: da/Microsoft.Maui.Controls.resources.dll => 299
	i32 u0x3d7be038, ; 237: Xamarin.Google.ErrorProne.Annotations.dll => 286
	i32 u0x3dbaaf8f, ; 238: Xamarin.AndroidX.AppCompat => 213
	i32 u0x3dc84a49, ; 239: System.Drawing.Primitives.dll => 35
	i32 u0x3df150e9, ; 240: lib_Xamarin.AndroidX.Interpolator.dll.so => 239
	i32 u0x3e444eb4, ; 241: System.Linq.Expressions.dll => 60
	i32 u0x3e5c42fd, ; 242: lib_System.Reflection.TypeExtensions.dll.so => 99
	i32 u0x3e865cbd, ; 243: Microsoft.Extensions.Diagnostics.Abstractions.dll => 183
	i32 u0x3eb776a1, ; 244: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 250
	i32 u0x3ebd41f6, ; 245: lib_System.Collections.dll.so => 12
	i32 u0x3ecd3024, ; 246: lib_System.Resources.Reader.dll.so => 101
	i32 u0x3eea4db8, ; 247: lib_Microsoft.Extensions.Primitives.dll.so => 190
	i32 u0x3f3e1e33, ; 248: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 245
	i32 u0x3f9dcf8c, ; 249: GoogleGson => 178
	i32 u0x408b17f4, ; 250: System.ComponentModel.TypeConverter => 17
	i32 u0x409e66d8, ; 251: Xamarin.Kotlin.StdLib => 290
	i32 u0x41761b2c, ; 252: System => 168
	i32 u0x422dfa8a, ; 253: Microsoft.Extensions.Hosting.Abstractions => 185
	i32 u0x4232ae7b, ; 254: lib_System.Reflection.Emit.dll.so => 95
	i32 u0x42be2972, ; 255: lib_System.Text.Encodings.Web.dll.so => 139
	i32 u0x42c091c1, ; 256: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 207
	i32 u0x42da3e50, ; 257: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 248
	i32 u0x43362f15, ; 258: Microsoft.Extensions.Logging.Debug => 188
	i32 u0x4393e151, ; 259: lib-th-Microsoft.Maui.Controls.resources.dll.so => 323
	i32 u0x441f18e1, ; 260: lib_System.Security.Cryptography.OpenSsl.dll.so => 126
	i32 u0x444e5c8e, ; 261: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i32 u0x44549c93, ; 262: lib_System.Net.WebProxy.dll.so => 81
	i32 u0x4474042c, ; 263: lib_System.Numerics.Vectors.dll.so => 85
	i32 u0x447dc2e6, ; 264: Xamarin.AndroidX.Window => 280
	i32 u0x44845810, ; 265: lib_System.Net.Http.dll.so => 66
	i32 u0x44c3958b, ; 266: lib_System.Private.DataContractSerialization.dll.so => 88
	i32 u0x4528fc75, ; 267: System.Net.ServerSentEvents.dll => 76
	i32 u0x45bde382, ; 268: lib_System.Windows.dll.so => 158
	i32 u0x45c677b2, ; 269: System.Web.dll => 157
	i32 u0x45ec7ce1, ; 270: Microsoft.Extensions.FileProviders.Abstractions.dll => 184
	i32 u0x460b48eb, ; 271: Xamarin.AndroidX.VectorDrawable.Animated => 276
	i32 u0x463a8801, ; 272: Xamarin.AndroidX.Navigation.Runtime.dll => 259
	i32 u0x464305ed, ; 273: fi/Microsoft.Maui.Controls.resources => 303
	i32 u0x466ae52b, ; 274: lib_System.Threading.Overlapped.dll.so => 144
	i32 u0x47a87de7, ; 275: lib_System.Resources.Writer.dll.so => 103
	i32 u0x47b79c15, ; 276: pl/Microsoft.Maui.Controls.resources.dll => 316
	i32 u0x47c7b4fa, ; 277: Xamarin.AndroidX.Arch.Core.Common => 215
	i32 u0x480a69ad, ; 278: System.Diagnostics.Process => 29
	i32 u0x48aa6be3, ; 279: System.IO.IsolatedStorage => 52
	i32 u0x48bf92c4, ; 280: lib_Xamarin.AndroidX.Collection.dll.so => 219
	i32 u0x49654709, ; 281: lib_System.Threading.Timer.dll.so => 151
	i32 u0x499b8219, ; 282: nb/Microsoft.Maui.Controls.resources.dll => 314
	i32 u0x49dd578a, ; 283: lib_Microsoft.Extensions.Hosting.Abstractions.dll.so => 185
	i32 u0x4a0189ae, ; 284: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 306
	i32 u0x4a4cd262, ; 285: Xamarin.AndroidX.Collection.Jvm.dll => 220
	i32 u0x4a8cb221, ; 286: lib_Xamarin.JSpecify.dll.so => 289
	i32 u0x4aaf6f7c, ; 287: Microsoft.Win32.Registry => 5
	i32 u0x4ae97402, ; 288: lib_Microsoft.Maui.Graphics.dll.so => 195
	i32 u0x4b275854, ; 289: Xamarin.KotlinX.Serialization.Core.Jvm => 295
	i32 u0x4b5eebe5, ; 290: Xamarin.AndroidX.Startup.StartupRuntime.dll => 270
	i32 u0x4b64b158, ; 291: Xamarin.KotlinX.Coroutines.Core.dll => 292
	i32 u0x4b863c7a, ; 292: lib_System.Private.Xml.Linq.dll.so => 90
	i32 u0x4b8a64a7, ; 293: Xamarin.AndroidX.VectorDrawable => 275
	i32 u0x4bb12d98, ; 294: lib_System.Runtime.Serialization.Xml.dll.so => 117
	i32 u0x4be46b58, ; 295: Xamarin.AndroidX.Collection.Ktx => 221
	i32 u0x4c071bea, ; 296: Xamarin.KotlinX.Coroutines.Android => 291
	i32 u0x4c3393c5, ; 297: Xamarin.AndroidX.Annotation.Jvm => 212
	i32 u0x4d0585a0, ; 298: SQLitePCLRaw.core.dll => 198
	i32 u0x4d14ee2b, ; 299: Xamarin.AndroidX.DrawerLayout.dll => 232
	i32 u0x4de0ce3b, ; 300: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 262
	i32 u0x4e08a30b, ; 301: System.Private.DataContractSerialization => 88
	i32 u0x4e50159c, ; 302: Xamarin.AndroidX.Navigation.Common.Android => 257
	i32 u0x4ea003f9, ; 303: lib_Xamarin.AndroidX.Navigation.Common.Android.dll.so => 257
	i32 u0x4ed70c83, ; 304: Xamarin.AndroidX.Window.dll => 280
	i32 u0x4eed2679, ; 305: System.Linq => 63
	i32 u0x4f97822f, ; 306: System.Runtime.Serialization.Json.dll => 115
	i32 u0x50255dd9, ; 307: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 307
	i32 u0x50acdfd7, ; 308: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 297
	i32 u0x50f5c1df, ; 309: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll.so => 254
	i32 u0x514d38cd, ; 310: System.IO => 58
	i32 u0x52114ed3, ; 311: Xamarin.AndroidX.SavedState => 265
	i32 u0x523dc4c1, ; 312: System.Resources.ResourceManager => 102
	i32 u0x533678bd, ; 313: lib_System.Private.CoreLib.dll.so => 177
	i32 u0x53701274, ; 314: lib_System.IO.FileSystem.Watcher.dll.so => 50
	i32 u0x53936ab4, ; 315: System.Configuration.dll => 19
	i32 u0x53cefc50, ; 316: Xamarin.AndroidX.CoordinatorLayout => 225
	i32 u0x53d71638, ; 317: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android.dll => 254
	i32 u0x53f80ba6, ; 318: System.Runtime.Serialization.Formatters.dll => 114
	i32 u0x5423e47b, ; 319: System.Runtime.CompilerServices.Unsafe => 104
	i32 u0x54246761, ; 320: lib_System.Diagnostics.Tools.dll.so => 32
	i32 u0x5498bac9, ; 321: lib_Microsoft.VisualBasic.dll.so => 3
	i32 u0x54ca50cb, ; 322: System.Runtime.CompilerServices.VisualC => 105
	i32 u0x557217fe, ; 323: lib_System.Numerics.dll.so => 86
	i32 u0x557b5293, ; 324: System.Runtime.Handles => 107
	i32 u0x558bc221, ; 325: Xamarin.Google.Crypto.Tink.Android.dll => 285
	i32 u0x55ab7451, ; 326: Xamarin.AndroidX.Lifecycle.Common.Jvm => 241
	i32 u0x55d10363, ; 327: System.Net.Quic.dll => 73
	i32 u0x55dfaca3, ; 328: lib_Microsoft.Win32.Primitives.dll.so => 4
	i32 u0x55e55df2, ; 329: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 251
	i32 u0x568cd628, ; 330: System.Formats.Asn1.dll => 38
	i32 u0x569fcb36, ; 331: System.Diagnostics.Tools.dll => 32
	i32 u0x56c018af, ; 332: lib_System.IO.UnmanagedMemoryStream.dll.so => 57
	i32 u0x56e36530, ; 333: System.Runtime.Extensions.dll => 106
	i32 u0x56e7a7ad, ; 334: System.Net.Security.dll => 75
	i32 u0x5718a9ef, ; 335: System.Collections.Immutable.dll => 9
	i32 u0x57201017, ; 336: System.Security.Cryptography.OpenSsl => 126
	i32 u0x57261233, ; 337: System.IO.Compression.dll => 46
	i32 u0x57924923, ; 338: Xamarin.AndroidX.AppCompat.AppCompatResources => 214
	i32 u0x57a5e912, ; 339: Microsoft.Extensions.Primitives => 190
	i32 u0x5833866d, ; 340: System.Collections.Immutable => 9
	i32 u0x583e844f, ; 341: System.IO.Compression.Brotli.dll => 43
	i32 u0x58a57897, ; 342: Microsoft.Win32.Primitives => 4
	i32 u0x58cffa99, ; 343: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 267
	i32 u0x58fd6613, ; 344: hi/Microsoft.Maui.Controls.resources.dll => 306
	i32 u0x596b5b3a, ; 345: lib_System.Drawing.Primitives.dll.so => 35
	i32 u0x5a48cf6c, ; 346: el/Microsoft.Maui.Controls.resources.dll => 301
	i32 u0x5b9331b6, ; 347: System.Diagnostics.TextWriterTraceListener => 31
	i32 u0x5be451c7, ; 348: lib_Xamarin.AndroidX.Browser.dll.so => 217
	i32 u0x5bf8ca0f, ; 349: System.Text.RegularExpressions.dll => 141
	i32 u0x5bfdbb43, ; 350: System.Reflection.Emit.dll => 95
	i32 u0x5c680b40, ; 351: System.Reflection.Extensions.dll => 96
	i32 u0x5c7be408, ; 352: sk/Microsoft.Maui.Controls.resources.dll => 321
	i32 u0x5cabc9a4, ; 353: fr/Microsoft.Maui.Controls.resources => 304
	i32 u0x5cb489e2, ; 354: Xamarin.AndroidX.Tracing.Tracing.Android => 273
	i32 u0x5d552ab7, ; 355: System.IO.FileSystem.Primitives => 49
	i32 u0x5d5a6c40, ; 356: System.Threading.Tasks.Dataflow.dll => 145
	i32 u0x5dccd455, ; 357: System.Runtime.Serialization.Json => 115
	i32 u0x5e0b6fdc, ; 358: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 295
	i32 u0x5e2d7514, ; 359: System.Threading.Overlapped => 144
	i32 u0x5e2e3abe, ; 360: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i32 u0x5e33306d, ; 361: sv/Microsoft.Maui.Controls.resources => 322
	i32 u0x5e7321d2, ; 362: lib_System.ComponentModel.Primitives.dll.so => 16
	i32 u0x5ed5f779, ; 363: zh-Hant/Microsoft.Maui.Controls.resources => 329
	i32 u0x5ef2ee25, ; 364: System.Runtime.Serialization.dll => 118
	i32 u0x5f3ec4dd, ; 365: Xamarin.Google.ErrorProne.Annotations => 286
	i32 u0x5f6f0b5b, ; 366: System.Xml.Serialization => 161
	i32 u0x5fa7b851, ; 367: System.Net.WebClient => 79
	i32 u0x6078995d, ; 368: System.Net.WebSockets.Client.dll => 82
	i32 u0x60892624, ; 369: lib_System.Formats.Tar.dll.so => 39
	i32 u0x60b0136a, ; 370: Xamarin.AndroidX.Loader.dll => 255
	i32 u0x60b33958, ; 371: System.Dynamic.Runtime => 37
	i32 u0x60d97228, ; 372: Xamarin.AndroidX.ViewPager2 => 279
	i32 u0x60ec189c, ; 373: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 216
	i32 u0x6176eff7, ; 374: Xamarin.AndroidX.Emoji2.ViewsHelper => 235
	i32 u0x6188ba7e, ; 375: Xamarin.AndroidX.CursorAdapter => 229
	i32 u0x61b9038d, ; 376: System.Net.Http.dll => 66
	i32 u0x61c036ca, ; 377: System.Text.RegularExpressions => 141
	i32 u0x61d59e0e, ; 378: System.ComponentModel.EventBasedAsync.dll => 15
	i32 u0x62021776, ; 379: lib_System.IO.Compression.dll.so => 46
	i32 u0x620a8774, ; 380: lib_System.Xml.ReaderWriter.dll.so => 160
	i32 u0x625755ef, ; 381: lib_WindowsBase.dll.so => 169
	i32 u0x62c6282e, ; 382: System.Runtime => 119
	i32 u0x62cec1a2, ; 383: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 293
	i32 u0x62d6c1e4, ; 384: Xamarin.AndroidX.Tracing.Tracing.dll => 272
	i32 u0x62d6ea10, ; 385: Xamarin.Google.Android.Material.dll => 283
	i32 u0x638b1991, ; 386: Xamarin.AndroidX.ConstraintLayout => 223
	i32 u0x63dee9da, ; 387: System.IO.FileSystem.DriveInfo.dll => 48
	i32 u0x63fca3d0, ; 388: System.Net.Primitives.dll => 72
	i32 u0x640c0103, ; 389: System.Net.WebSockets => 83
	i32 u0x641979dd, ; 390: Xamarin.JSpecify => 289
	i32 u0x641f3e5a, ; 391: System.Security.Cryptography => 129
	i32 u0x64d1e4f5, ; 392: System.Reflection.Metadata => 97
	i32 u0x6525abc9, ; 393: System.Security.Cryptography.Csp => 124
	i32 u0x654b1498, ; 394: lib_System.Transactions.Local.dll.so => 153
	i32 u0x656b7698, ; 395: System.Diagnostics.Debug.dll => 26
	i32 u0x660284a1, ; 396: SQLitePCLRaw.lib.e_sqlite3.android => 199
	i32 u0x6670b12e, ; 397: lib_System.Security.AccessControl.dll.so => 120
	i32 u0x66888819, ; 398: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 244
	i32 u0x66e27484, ; 399: System.Reflection.dll => 100
	i32 u0x66ffb0f8, ; 400: System.Diagnostics.FileVersionInfo.dll => 28
	i32 u0x6715dc86, ; 401: Xamarin.AndroidX.CardView.dll => 218
	i32 u0x67577fe1, ; 402: lib_System.Runtime.CompilerServices.VisualC.dll.so => 105
	i32 u0x677cd287, ; 403: ro/Microsoft.Maui.Controls.resources.dll => 319
	i32 u0x67fe8db2, ; 404: System.Transactions.Local.dll => 153
	i32 u0x68139a0d, ; 405: System.IO.Pipelines.dll => 54
	i32 u0x6816ab6a, ; 406: Mono.Android.Export => 173
	i32 u0x6853a83d, ; 407: Microsoft.Win32.Primitives.dll => 4
	i32 u0x68cc9d1e, ; 408: System.Resources.Reader.dll => 101
	i32 u0x68f61ae4, ; 409: lib_System.Formats.Asn1.dll.so => 38
	i32 u0x690d4b7d, ; 410: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 329
	i32 u0x69239124, ; 411: System.Diagnostics.TraceSource.dll => 33
	i32 u0x693efa35, ; 412: lib_System.Net.WebHeaderCollection.dll.so => 80
	i32 u0x6942234e, ; 413: System.Reflection.Extensions => 96
	i32 u0x6947f945, ; 414: Xamarin.AndroidX.SwipeRefreshLayout => 271
	i32 u0x6988f147, ; 415: Microsoft.Extensions.Logging.dll => 186
	i32 u0x69ae5451, ; 416: lib_System.Runtime.InteropServices.JavaScript.dll.so => 108
	i32 u0x69d6d061, ; 417: lib_Xamarin.AndroidX.Window.WindowCore.Jvm.dll.so => 282
	i32 u0x69dc03cc, ; 418: System.Core.dll => 21
	i32 u0x69ec0683, ; 419: System.Globalization.Extensions.dll => 41
	i32 u0x69f4f41d, ; 420: lib_Xamarin.AndroidX.AppCompat.dll.so => 213
	i32 u0x6a216153, ; 421: Mono.Android.Runtime.dll => 174
	i32 u0x6a539b49, ; 422: lib_System.Runtime.Extensions.dll.so => 106
	i32 u0x6a96652d, ; 423: Xamarin.AndroidX.Fragment => 237
	i32 u0x6afaf338, ; 424: lib_System.Threading.dll.so => 152
	i32 u0x6b645ada, ; 425: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 304
	i32 u0x6bbb2a76, ; 426: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 184
	i32 u0x6bcd3296, ; 427: Xamarin.AndroidX.Loader => 255
	i32 u0x6be1e423, ; 428: nb/Microsoft.Maui.Controls.resources => 314
	i32 u0x6c111525, ; 429: Xamarin.Kotlin.StdLib.dll => 290
	i32 u0x6c13413e, ; 430: Xamarin.Google.Android.Material => 283
	i32 u0x6c5562e0, ; 431: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 292
	i32 u0x6c652ce8, ; 432: Xamarin.AndroidX.Navigation.UI.dll => 261
	i32 u0x6c687fa7, ; 433: Microsoft.VisualBasic.Core => 2
	i32 u0x6c96614d, ; 434: hu/Microsoft.Maui.Controls.resources => 308
	i32 u0x6cbab720, ; 435: System.Text.Encoding.Extensions => 137
	i32 u0x6cc30c8c, ; 436: System.Runtime.Serialization.Formatters => 114
	i32 u0x6cf3d432, ; 437: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 277
	i32 u0x6cff90ba, ; 438: Microsoft.Extensions.Logging.Abstractions.dll => 187
	i32 u0x6dcaebf7, ; 439: uk/Microsoft.Maui.Controls.resources.dll => 325
	i32 u0x6e1ed932, ; 440: Xamarin.Android.Glide.Annotations => 205
	i32 u0x6ec71a65, ; 441: System.Linq.Expressions => 60
	i32 u0x6f7a29e4, ; 442: System.Reflection.Primitives => 98
	i32 u0x6fab02f2, ; 443: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 223
	i32 u0x7009e4c3, ; 444: System.Formats.Tar.dll => 39
	i32 u0x705fa726, ; 445: Xamarin.AndroidX.Arch.Core.Runtime.dll => 216
	i32 u0x7070c6c0, ; 446: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 328
	i32 u0x70972b6d, ; 447: System.Diagnostics.Contracts => 25
	i32 u0x70a66bdd, ; 448: System.Reflection.Metadata.dll => 97
	i32 u0x7124cf39, ; 449: System.Reflection.DispatchProxy => 92
	i32 u0x71490522, ; 450: System.Resources.ResourceManager.dll => 102
	i32 u0x71dc7c8b, ; 451: System.Collections.NonGeneric.dll => 10
	i32 u0x72fcebde, ; 452: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 214
	i32 u0x731dd955, ; 453: lib_Mono.Android.dll.so => 175
	i32 u0x73674b00, ; 454: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 200
	i32 u0x739bd4a8, ; 455: System.Private.Xml.Linq => 90
	i32 u0x73b20433, ; 456: lib_System.IO.FileSystem.Primitives.dll.so => 49
	i32 u0x73fbecbe, ; 457: lib_System.Memory.dll.so => 64
	i32 u0x74126030, ; 458: lib_System.Net.WebClient.dll.so => 79
	i32 u0x74a1c5bb, ; 459: System.Resources.Writer => 103
	i32 u0x74d743bf, ; 460: ja/Microsoft.Maui.Controls.resources => 311
	i32 u0x74eee4ef, ; 461: Xamarin.AndroidX.Security.SecurityCrypto.dll => 268
	i32 u0x75533a5e, ; 462: Microsoft.Extensions.Configuration.dll => 179
	i32 u0x7593c33f, ; 463: lib_System.IO.FileSystem.AccessControl.dll.so => 47
	i32 u0x75ec88d8, ; 464: System.Net.ServerSentEvents => 76
	i32 u0x765c50a4, ; 465: Xamarin.Android.Glide.GifDecoder => 207
	i32 u0x77ec19b4, ; 466: System.Buffers.dll => 7
	i32 u0x781074ce, ; 467: hr/Microsoft.Maui.Controls.resources => 307
	i32 u0x784d3e49, ; 468: lib_System.Net.dll.so => 84
	i32 u0x785e97f1, ; 469: Xamarin.AndroidX.Lifecycle.ViewModel => 250
	i32 u0x78b622b1, ; 470: ar/Microsoft.Maui.Controls.resources.dll => 296
	i32 u0x790376c9, ; 471: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 211
	i32 u0x791a414b, ; 472: Xamarin.Android.Glide => 204
	i32 u0x7970be4f, ; 473: lib-he-Microsoft.Maui.Controls.resources.dll.so => 305
	i32 u0x79d00016, ; 474: it/Microsoft.Maui.Controls.resources => 310
	i32 u0x79eb68ee, ; 475: System.Private.Xml => 91
	i32 u0x7a80bd4e, ; 476: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 243
	i32 u0x7aca0819, ; 477: System.Windows.dll => 158
	i32 u0x7b350579, ; 478: lib__Microsoft.Android.Resource.Designer.dll.so => 330
	i32 u0x7b3b4d96, ; 479: System.Linq.AsyncEnumerable.dll => 59
	i32 u0x7b473a37, ; 480: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 238
	i32 u0x7b6f419e, ; 481: System.Diagnostics.TraceSource => 33
	i32 u0x7b8f6ff7, ; 482: lib_System.Runtime.Serialization.Json.dll.so => 115
	i32 u0x7bf8cdab, ; 483: System.Runtime.dll => 119
	i32 u0x7c51ebd4, ; 484: lib_System.Net.HttpListener.dll.so => 67
	i32 u0x7c9bf920, ; 485: System.Numerics.Vectors => 85
	i32 u0x7d603cde, ; 486: SQLitePCLRaw.provider.e_sqlite3.dll => 200
	i32 u0x7d702d52, ; 487: lib_System.Text.Encoding.dll.so => 138
	i32 u0x7ec9ffe9, ; 488: System.Console => 20
	i32 u0x7fb38cd2, ; 489: System.Collections.Specialized => 11
	i32 u0x7fc7a41e, ; 490: System.Xml.XmlSerializer.dll => 166
	i32 u0x7fd90a71, ; 491: lib_System.Text.Encoding.CodePages.dll.so => 136
	i32 u0x7fdcdc37, ; 492: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 312
	i32 u0x7ff65cf5, ; 493: Microsoft.VisualBasic.dll => 3
	i32 u0x802a7166, ; 494: lib_System.Diagnostics.FileVersionInfo.dll.so => 28
	i32 u0x8030853e, ; 495: ko/Microsoft.Maui.Controls.resources => 312
	i32 u0x8044e1bd, ; 496: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 313
	i32 u0x8081c489, ; 497: lib_Jsr305Binding.dll.so => 284
	i32 u0x80bd55ad, ; 498: Microsoft.Maui => 193
	i32 u0x80f2f56e, ; 499: lib_System.Runtime.Serialization.Formatters.dll.so => 114
	i32 u0x810c11c2, ; 500: ro/Microsoft.Maui.Controls.resources => 319
	i32 u0x8115bdf3, ; 501: lib_System.Resources.ResourceManager.dll.so => 102
	i32 u0x816751d8, ; 502: lib_System.Diagnostics.DiagnosticSource.dll.so => 27
	i32 u0x81a110ae, ; 503: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i32 u0x820d22b3, ; 504: Microsoft.Extensions.Options.dll => 189
	i32 u0x82364da2, ; 505: lib_System.Buffers.dll.so => 7
	i32 u0x82a8237c, ; 506: Microsoft.Extensions.Logging.Abstractions => 187
	i32 u0x82b6c85e, ; 507: System.ObjectModel.dll => 87
	i32 u0x82bb5429, ; 508: lib_System.Linq.Expressions.dll.so => 60
	i32 u0x82c1cf3e, ; 509: lib_System.Net.Quic.dll.so => 73
	i32 u0x832ec206, ; 510: lib_System.Diagnostics.StackTrace.dll.so => 30
	i32 u0x83323b38, ; 511: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 293
	i32 u0x8334206b, ; 512: System.Net.Http => 66
	i32 u0x842e93b2, ; 513: Xamarin.AndroidX.VectorDrawable.Animated.dll => 276
	i32 u0x8471e4ec, ; 514: System.Threading.Tasks.Parallel => 147
	i32 u0x857e4dd2, ; 515: lib_System.Net.WebSockets.dll.so => 83
	i32 u0x8628f1a4, ; 516: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 320
	i32 u0x863c6ac5, ; 517: System.Xml.Serialization.dll => 161
	i32 u0x865f9104, ; 518: Xamarin.AndroidX.Window.WindowCore.dll => 281
	i32 u0x867c9c52, ; 519: System.Globalization.Extensions => 41
	i32 u0x86b0fd78, ; 520: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 252
	i32 u0x86bba59b, ; 521: lib_Microsoft.Maui.Controls.dll.so => 191
	i32 u0x8702d9a2, ; 522: System.Security.AccessControl.dll => 120
	i32 u0x871c9c1b, ; 523: Microsoft.Extensions.Configuration.Abstractions => 180
	i32 u0x872eeb7b, ; 524: Xamarin.Android.Glide.DiskLruCache.dll => 206
	i32 u0x875633cc, ; 525: fr/Microsoft.Maui.Controls.resources.dll => 304
	i32 u0x87a1a22b, ; 526: lib-it-Microsoft.Maui.Controls.resources.dll.so => 310
	i32 u0x87e25095, ; 527: Xamarin.AndroidX.RecyclerView.dll => 263
	i32 u0x87e7fdbb, ; 528: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 315
	i32 u0x881f94da, ; 529: lib_netstandard.dll.so => 171
	i32 u0x8873eb17, ; 530: th/Microsoft.Maui.Controls.resources => 323
	i32 u0x887ae6a1, ; 531: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 247
	i32 u0x88937130, ; 532: Xamarin.AndroidX.Window.WindowCore => 281
	i32 u0x88acefcd, ; 533: System.ServiceModel.Web.dll => 134
	i32 u0x88d8bfaa, ; 534: System.Net.Sockets => 78
	i32 u0x88ed6f27, ; 535: lib_SQLitePCLRaw.batteries_v2.dll.so => 197
	i32 u0x88ffe49e, ; 536: System.Net.Mail => 68
	i32 u0x896b7878, ; 537: System.Private.CoreLib.dll => 177
	i32 u0x8a068af2, ; 538: Xamarin.AndroidX.Annotation.dll => 210
	i32 u0x8a52059a, ; 539: System.Threading.Tasks.Parallel.dll => 147
	i32 u0x8b804dbf, ; 540: System.Runtime.InteropServices.RuntimeInformation.dll => 109
	i32 u0x8bbaa2cd, ; 541: System.ValueTuple => 155
	i32 u0x8c20c628, ; 542: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 303
	i32 u0x8c20f140, ; 543: lib_System.Console.dll.so => 20
	i32 u0x8c40e0db, ; 544: System.Net.Primitives => 72
	i32 u0x8c5a5413, ; 545: Syncfusion.Licensing => 201
	i32 u0x8c93dffb, ; 546: lib_SQLite-net.dll.so => 196
	i32 u0x8d19e4a2, ; 547: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 242
	i32 u0x8d24e767, ; 548: System.Xml.ReaderWriter.dll => 160
	i32 u0x8d3fac99, ; 549: tr/Microsoft.Maui.Controls.resources => 324
	i32 u0x8d52b2e2, ; 550: Microsoft.Extensions.Configuration => 179
	i32 u0x8d52d3de, ; 551: lib_System.Threading.Tasks.dll.so => 148
	i32 u0x8dc6dbce, ; 552: System.Security.Cryptography.Csp.dll => 124
	i32 u0x8dcb0101, ; 553: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 258
	i32 u0x8e02310f, ; 554: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 296
	i32 u0x8e114655, ; 555: System.Security.Principal.Windows.dll => 130
	i32 u0x8e4e8441, ; 556: Xamarin.AndroidX.Window.WindowCore.Jvm.dll => 282
	i32 u0x8f24faee, ; 557: System.Web.HttpUtility => 156
	i32 u0x8f41c524, ; 558: Xamarin.AndroidX.Emoji2.dll => 234
	i32 u0x8f4e087a, ; 559: lib_System.Web.dll.so => 157
	i32 u0x8f8c64e2, ; 560: lib_System.Private.Xml.dll.so => 91
	i32 u0x903eb247, ; 561: lib_Xamarin.AndroidX.Window.WindowCore.dll.so => 281
	i32 u0x905355ed, ; 562: System.Threading.Tasks.Dataflow => 145
	i32 u0x905caa9d, ; 563: nl/Microsoft.Maui.Controls.resources => 315
	i32 u0x906d466b, ; 564: Xamarin.AndroidX.Collection.Ktx.dll => 221
	i32 u0x907c7b71, ; 565: D-ToDoList.dll => 0
	i32 u0x90e50509, ; 566: lib_System.Reflection.Primitives.dll.so => 98
	i32 u0x911615a7, ; 567: lib_Xamarin.AndroidX.Fragment.dll.so => 237
	i32 u0x912896e5, ; 568: System.Console.dll => 20
	i32 u0x9130f5e7, ; 569: System.ComponentModel.DataAnnotations.dll => 14
	i32 u0x91abdf3a, ; 570: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 270
	i32 u0x924edee6, ; 571: System.Text.Encoding.dll => 138
	i32 u0x928c75ca, ; 572: System.Net.Sockets.dll => 78
	i32 u0x92916334, ; 573: System.Linq.Parallel.dll => 61
	i32 u0x92f11675, ; 574: SQLitePCLRaw.batteries_v2.dll => 197
	i32 u0x92f50938, ; 575: Xamarin.AndroidX.ConstraintLayout.Core.dll => 224
	i32 u0x93554fdc, ; 576: netstandard.dll => 171
	i32 u0x93634cc0, ; 577: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 244
	i32 u0x93918882, ; 578: Java.Interop.dll => 172
	i32 u0x93dba8a1, ; 579: Microsoft.Maui.Controls => 191
	i32 u0x93fd4c66, ; 580: lib_Syncfusion.Maui.ProgressBar.dll.so => 203
	i32 u0x940d5c2f, ; 581: System.ComponentModel.EventBasedAsync => 15
	i32 u0x94147f61, ; 582: System.Net.ServicePoint => 77
	i32 u0x9438d78e, ; 583: lib_System.Text.Json.dll.so => 140
	i32 u0x9469ba86, ; 584: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 246
	i32 u0x94798bc5, ; 585: System.AppContext.dll => 6
	i32 u0x94a1db18, ; 586: lib-id-Microsoft.Maui.Controls.resources.dll.so => 309
	i32 u0x94fad8e5, ; 587: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 209
	i32 u0x95178668, ; 588: System.Data.DataSetExtensions => 23
	i32 u0x955cf248, ; 589: Xamarin.AndroidX.Lifecycle.Runtime.dll => 246
	i32 u0x9593ae7f, ; 590: lib_Xamarin.AndroidX.SavedState.dll.so => 265
	i32 u0x963ac2da, ; 591: sk/Microsoft.Maui.Controls.resources => 321
	i32 u0x9659e17c, ; 592: Xamarin.Android.Glide.dll => 204
	i32 u0x96bea474, ; 593: lib_Microsoft.Maui.Controls.Xaml.dll.so => 192
	i32 u0x974b89a2, ; 594: System.Reflection.Emit.Lightweight.dll => 94
	i32 u0x98ba5a04, ; 595: Microsoft.CSharp => 1
	i32 u0x9930ee42, ; 596: System.Text.Encodings.Web => 139
	i32 u0x999dcf0d, ; 597: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 249
	i32 u0x99e2e424, ; 598: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 248
	i32 u0x99e370f2, ; 599: Xamarin.AndroidX.VectorDrawable.dll => 275
	i32 u0x9a1756ac, ; 600: System.Text.Encoding.Extensions.dll => 137
	i32 u0x9a20430d, ; 601: System.Net.Ping => 71
	i32 u0x9a5a3337, ; 602: System.Threading.ThreadPool => 150
	i32 u0x9a83ffe1, ; 603: Microsoft.Extensions.FileProviders.Abstractions => 184
	i32 u0x9b24ab96, ; 604: lib_System.Runtime.Serialization.Primitives.dll.so => 116
	i32 u0x9b500441, ; 605: Xamarin.KotlinX.Coroutines.Core.Jvm => 293
	i32 u0x9b5e5b1c, ; 606: lib_System.Diagnostics.Contracts.dll.so => 25
	i32 u0x9be14c08, ; 607: Xamarin.AndroidX.Fragment.Ktx => 238
	i32 u0x9bf052c1, ; 608: Microsoft.Extensions.Logging.Debug.dll => 188
	i32 u0x9bfe3a41, ; 609: System.Private.Xml.dll => 91
	i32 u0x9c165ff9, ; 610: System.Reflection.TypeExtensions.dll => 99
	i32 u0x9c375496, ; 611: Xamarin.AndroidX.CursorAdapter.dll => 229
	i32 u0x9c70e6c9, ; 612: Xamarin.AndroidX.DynamicAnimation => 233
	i32 u0x9c96ac4c, ; 613: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 261
	i32 u0x9c97ad4a, ; 614: System.Diagnostics.TextWriterTraceListener.dll => 31
	i32 u0x9cc03a58, ; 615: System.IO.Compression.ZipFile.dll => 45
	i32 u0x9cd341b2, ; 616: lib_System.Threading.Tasks.Parallel.dll.so => 147
	i32 u0x9cf12c56, ; 617: Xamarin.AndroidX.Lifecycle.LiveData => 242
	i32 u0x9e78dac1, ; 618: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 253
	i32 u0x9ec022c0, ; 619: Xamarin.Android.Glide.DiskLruCache => 206
	i32 u0x9ec4cf01, ; 620: System.Runtime.Loader => 112
	i32 u0x9ecf752a, ; 621: System.Xml.XDocument.dll => 162
	i32 u0x9ee22cc0, ; 622: System.Drawing.Primitives => 35
	i32 u0x9f3b757e, ; 623: Xamarin.KotlinX.Coroutines.Core => 292
	i32 u0x9f7ea921, ; 624: lib_System.Runtime.InteropServices.dll.so => 110
	i32 u0x9f8c6f40, ; 625: System.Data.Common.dll => 22
	i32 u0xa026a50c, ; 626: System.Runtime.Serialization.Xml.dll => 117
	i32 u0xa090e36a, ; 627: System.IO.dll => 58
	i32 u0xa0fb56af, ; 628: lib_System.Text.RegularExpressions.dll.so => 141
	i32 u0xa0ff7514, ; 629: Xamarin.AndroidX.Tracing.Tracing => 272
	i32 u0xa1d8b647, ; 630: System.Threading.Tasks.dll => 148
	i32 u0xa1fd7d9f, ; 631: System.Security.Claims => 121
	i32 u0xa21f5a1f, ; 632: System.Security.Cryptography.Cng.dll => 123
	i32 u0xa25c90e5, ; 633: lib_Xamarin.AndroidX.Core.dll.so => 226
	i32 u0xa262a30f, ; 634: System.Runtime.Numerics.dll => 113
	i32 u0xa2ce8457, ; 635: lib-es-Microsoft.Maui.Controls.resources.dll.so => 302
	i32 u0xa2e0939b, ; 636: Xamarin.AndroidX.Activity => 208
	i32 u0xa30769e5, ; 637: System.Threading.Channels => 143
	i32 u0xa32eb6f0, ; 638: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 214
	i32 u0xa35f8f92, ; 639: System.IO.Pipes.AccessControl => 55
	i32 u0xa3c818c7, ; 640: lib_System.Net.WebSockets.Client.dll.so => 82
	i32 u0xa3cc7fa7, ; 641: System.Runtime.InteropServices.JavaScript => 108
	i32 u0xa3de87ea, ; 642: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.Android => 254
	i32 u0xa4672f3b, ; 643: Microsoft.Maui.Controls.Xaml => 192
	i32 u0xa493aa02, ; 644: lib_System.Collections.Concurrent.dll.so => 8
	i32 u0xa4caf7a7, ; 645: Microsoft.Maui.dll => 193
	i32 u0xa4d4aaf8, ; 646: lib_System.Security.Cryptography.Cng.dll.so => 123
	i32 u0xa4db22c6, ; 647: System.Text.Encoding.CodePages.dll => 136
	i32 u0xa4e79dfd, ; 648: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 251
	i32 u0xa522693c, ; 649: Xamarin.Jetbrains.Annotations.dll => 288
	i32 u0xa52ac270, ; 650: lib_Xamarin.AndroidX.Window.dll.so => 280
	i32 u0xa553c739, ; 651: lib_System.ValueTuple.dll.so => 155
	i32 u0xa5a0a402, ; 652: Xamarin.AndroidX.ViewPager.dll => 278
	i32 u0xa5b3182d, ; 653: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 264
	i32 u0xa5b67c07, ; 654: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 241
	i32 u0xa5c5753c, ; 655: lib_System.Collections.Immutable.dll.so => 9
	i32 u0xa5ea80d9, ; 656: lib_Xamarin.Android.Glide.Annotations.dll.so => 205
	i32 u0xa6133c7f, ; 657: lib_System.IO.FileSystem.DriveInfo.dll.so => 48
	i32 u0xa630ecdd, ; 658: Xamarin.AndroidX.Fragment.Ktx.dll => 238
	i32 u0xa668c988, ; 659: lib_System.Net.NameResolution.dll.so => 69
	i32 u0xa68bc8b3, ; 660: lib_Xamarin.AndroidX.Tracing.Tracing.Android.dll.so => 273
	i32 u0xa7008e0b, ; 661: Microsoft.Maui.Graphics => 195
	i32 u0xa7042ae3, ; 662: uk/Microsoft.Maui.Controls.resources => 325
	i32 u0xa715dd7e, ; 663: System.Xml.XPath.XDocument.dll => 163
	i32 u0xa741ef0b, ; 664: es/Microsoft.Maui.Controls.resources.dll => 302
	i32 u0xa744f665, ; 665: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 259
	i32 u0xa78103bc, ; 666: Xamarin.AndroidX.CoordinatorLayout.dll => 225
	i32 u0xa7b5fe13, ; 667: lib_Syncfusion.Licensing.dll.so => 201
	i32 u0xa8032c67, ; 668: lib_Microsoft.Win32.Registry.dll.so => 5
	i32 u0xa80db4e1, ; 669: System.Xml.dll => 167
	i32 u0xa81b119f, ; 670: lib_System.Security.Cryptography.dll.so => 129
	i32 u0xa8282c09, ; 671: System.ServiceProcess.dll => 135
	i32 u0xa8298928, ; 672: Xamarin.AndroidX.ResourceInspection.Annotation => 264
	i32 u0xa85a7b6c, ; 673: System.Xml.XmlDocument => 165
	i32 u0xa8c61dcb, ; 674: nl/Microsoft.Maui.Controls.resources.dll => 315
	i32 u0xa9366b55, ; 675: Xamarin.AndroidX.Tracing.Tracing.Android.dll => 273
	i32 u0xa9379a4f, ; 676: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 252
	i32 u0xa9d96f9b, ; 677: System.Threading.Overlapped.dll => 144
	i32 u0xaa107fc4, ; 678: Xamarin.AndroidX.ViewPager => 278
	i32 u0xaa2b531f, ; 679: lib_System.Globalization.dll.so => 42
	i32 u0xaa36a797, ; 680: Xamarin.AndroidX.Transition => 274
	i32 u0xaa4e51ff, ; 681: el/Microsoft.Maui.Controls.resources => 301
	i32 u0xaa88e550, ; 682: Mono.Android.Export.dll => 173
	i32 u0xaa8a4878, ; 683: Microsoft.Maui.Essentials => 194
	i32 u0xaafab4cd, ; 684: Syncfusion.Licensing.dll => 201
	i32 u0xab123e9a, ; 685: Xamarin.AndroidX.Activity.Ktx.dll => 209
	i32 u0xab5f85c3, ; 686: Jsr305Binding.dll => 284
	i32 u0xab606289, ; 687: System.Globalization.Calendars.dll => 40
	i32 u0xabbc23e8, ; 688: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 295
	i32 u0xabdea79a, ; 689: ru/Microsoft.Maui.Controls.resources => 320
	i32 u0xabf58099, ; 690: Xamarin.AndroidX.ExifInterface => 236
	i32 u0xac1dd496, ; 691: System.Net.dll => 84
	i32 u0xacd6baa9, ; 692: System.IO.UnmanagedMemoryStream => 57
	i32 u0xace3f9b4, ; 693: System.Dynamic.Runtime.dll => 37
	i32 u0xace7ba82, ; 694: lib_System.Security.Principal.Windows.dll.so => 130
	i32 u0xacf080de, ; 695: System.Reflection => 100
	i32 u0xacf097ce, ; 696: System.Threading.AccessControl => 142
	i32 u0xad2a79b6, ; 697: mscorlib.dll => 170
	i32 u0xad6f1e8a, ; 698: System.Private.CoreLib => 177
	i32 u0xad90894d, ; 699: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 294
	i32 u0xaddb6d38, ; 700: Xamarin.AndroidX.ViewPager2.dll => 279
	i32 u0xae037813, ; 701: System.Numerics.Vectors.dll => 85
	i32 u0xae1ce33f, ; 702: Xamarin.AndroidX.Annotation.Experimental.dll => 211
	i32 u0xaeb2d8a5, ; 703: lib_Microsoft.Extensions.Options.dll.so => 189
	i32 u0xaf06273c, ; 704: System.Resources.Reader => 101
	i32 u0xaf3a6b91, ; 705: lib_System.Diagnostics.Debug.dll.so => 26
	i32 u0xaf4af872, ; 706: System.Diagnostics.StackTrace.dll => 30
	i32 u0xaf624531, ; 707: System.Xml.XPath.XDocument => 163
	i32 u0xaf8b1081, ; 708: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 267
	i32 u0xb0682092, ; 709: System.ComponentModel.dll => 18
	i32 u0xb0ed41f3, ; 710: System.Security.Principal.Windows => 130
	i32 u0xb1182a36, ; 711: lib_Xamarin.AndroidX.Navigation.Runtime.Android.dll.so => 260
	i32 u0xb128f886, ; 712: System.Security.Cryptography.Algorithms.dll => 122
	i32 u0xb18af942, ; 713: Xamarin.AndroidX.DrawerLayout => 232
	i32 u0xb1a434a2, ; 714: lib_System.Xml.Linq.dll.so => 159
	i32 u0xb1a7d210, ; 715: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 249
	i32 u0xb21220a3, ; 716: Xamarin.AndroidX.Security.SecurityCrypto => 268
	i32 u0xb223fa8c, ; 717: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 298
	i32 u0xb28cab85, ; 718: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 206
	i32 u0xb294d40b, ; 719: lib_System.Net.Ping.dll.so => 71
	i32 u0xb2a03f9f, ; 720: Xamarin.AndroidX.Lifecycle.Process.dll => 245
	i32 u0xb3d3821c, ; 721: Xamarin.AndroidX.Startup.StartupRuntime => 270
	i32 u0xb434b64b, ; 722: WindowsBase.dll => 169
	i32 u0xb514b305, ; 723: _Microsoft.Android.Resource.Designer.dll => 330
	i32 u0xb58d85d9, ; 724: lib_System.Runtime.Handles.dll.so => 107
	i32 u0xb62a9ccb, ; 725: Xamarin.AndroidX.SavedState.SavedState.Ktx => 267
	i32 u0xb63fa9f0, ; 726: Xamarin.AndroidX.Navigation.Common => 256
	i32 u0xb6490b5e, ; 727: lib_Mono.Android.Export.dll.so => 173
	i32 u0xb65adef9, ; 728: Mono.Android.Runtime => 174
	i32 u0xb660be12, ; 729: System.ComponentModel.Primitives => 16
	i32 u0xb6a153b2, ; 730: lib_Xamarin.AndroidX.ViewPager2.dll.so => 279
	i32 u0xb70c6fb4, ; 731: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 275
	i32 u0xb755818f, ; 732: System.Threading.Tasks => 148
	i32 u0xb76be845, ; 733: hu/Microsoft.Maui.Controls.resources.dll => 308
	i32 u0xb7e7c341, ; 734: lib_System.Globalization.Calendars.dll.so => 40
	i32 u0xb838e2b0, ; 735: System.Security.Cryptography.X509Certificates.dll => 128
	i32 u0xb8c22b7f, ; 736: System.Security.Claims.dll => 121
	i32 u0xb8fd311b, ; 737: System.Formats.Asn1 => 38
	i32 u0xb979e222, ; 738: System.Runtime.Serialization => 118
	i32 u0xba0dbf1c, ; 739: System.IO.FileSystem.AccessControl.dll => 47
	i32 u0xba4127cb, ; 740: System.Threading.Tasks.Extensions => 146
	i32 u0xbaa520e7, ; 741: lib_System.ObjectModel.dll.so => 87
	i32 u0xbab301d1, ; 742: System.Security.AccessControl => 120
	i32 u0xbb95ee37, ; 743: System.Diagnostics.Tracing.dll => 34
	i32 u0xbb96e4f6, ; 744: Syncfusion.Maui.Core => 202
	i32 u0xbba64c02, ; 745: GoogleGson.dll => 178
	i32 u0xbc4c6465, ; 746: System.Reflection.Primitives.dll => 98
	i32 u0xbc652da7, ; 747: System.IO.MemoryMappedFiles => 53
	i32 u0xbc98c93d, ; 748: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 220
	i32 u0xbcc610a0, ; 749: lib_System.Reflection.Metadata.dll.so => 97
	i32 u0xbd113355, ; 750: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 256
	i32 u0xbd78b0c8, ; 751: Xamarin.AndroidX.Navigation.Fragment.dll => 258
	i32 u0xbddce8a2, ; 752: lib_System.Security.Principal.dll.so => 131
	i32 u0xbe3f07c2, ; 753: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 104
	i32 u0xbe4755f4, ; 754: System.Security.SecureString => 132
	i32 u0xbe592c0c, ; 755: System.Web => 157
	i32 u0xbefef58f, ; 756: System.Data.dll => 24
	i32 u0xbf506931, ; 757: System.Xml.XmlDocument.dll => 165
	i32 u0xbff2e236, ; 758: System.Threading => 152
	i32 u0xc04c3c0a, ; 759: System.Runtime.Handles.dll => 107
	i32 u0xc095e070, ; 760: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 240
	i32 u0xc10b79a7, ; 761: Xamarin.AndroidX.Core.ViewTree => 228
	i32 u0xc1c6ebf4, ; 762: System.Reflection.DispatchProxy.dll => 92
	i32 u0xc217efb6, ; 763: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 224
	i32 u0xc2293e61, ; 764: Xamarin.AndroidX.SavedState.SavedState.Android.dll => 266
	i32 u0xc235e84d, ; 765: Xamarin.AndroidX.CardView => 218
	i32 u0xc2a37b91, ; 766: System.Linq.Queryable.dll => 62
	i32 u0xc2a993fa, ; 767: System.Threading.Tasks.Extensions.dll => 146
	i32 u0xc3428433, ; 768: lib_System.Reflection.Emit.ILGeneration.dll.so => 93
	i32 u0xc35f7fa4, ; 769: System.Resources.Writer.dll => 103
	i32 u0xc37f65ce, ; 770: Microsoft.Win32.Registry.dll => 5
	i32 u0xc3888e16, ; 771: System.ComponentModel.Annotations.dll => 13
	i32 u0xc3ba1d80, ; 772: lib_System.Security.Cryptography.Csp.dll.so => 124
	i32 u0xc3e9b3a2, ; 773: SQLite-net.dll => 196
	i32 u0xc4251ff9, ; 774: System.Security.Cryptography.Encoding => 125
	i32 u0xc4684d9e, ; 775: lib_System.Security.Cryptography.Algorithms.dll.so => 122
	i32 u0xc4a8494a, ; 776: System.Text.Encoding => 138
	i32 u0xc4e76306, ; 777: System.Diagnostics.FileVersionInfo => 28
	i32 u0xc591efe9, ; 778: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 180
	i32 u0xc5b097e4, ; 779: System.Net.Requests.dll => 74
	i32 u0xc5b776df, ; 780: Xamarin.AndroidX.CustomView.dll => 230
	i32 u0xc5b79d28, ; 781: System.Data => 24
	i32 u0xc69f3b41, ; 782: lib_System.Data.dll.so => 24
	i32 u0xc71af05d, ; 783: Xamarin.AndroidX.Arch.Core.Runtime => 216
	i32 u0xc76e512c, ; 784: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 262
	i32 u0xc774da4f, ; 785: Xamarin.AndroidX.Navigation.Runtime => 259
	i32 u0xc7a3b0f0, ; 786: lib_Xamarin.AndroidX.Transition.dll.so => 274
	i32 u0xc7b797d0, ; 787: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 227
	i32 u0xc821fc10, ; 788: lib_System.ComponentModel.dll.so => 18
	i32 u0xc82afec1, ; 789: System.Text.Json => 140
	i32 u0xc849ca45, ; 790: SQLitePCLRaw.core => 198
	i32 u0xc8693088, ; 791: Xamarin.AndroidX.Activity.Ktx => 209
	i32 u0xc86c06e3, ; 792: Xamarin.AndroidX.Core => 226
	i32 u0xc8a662e9, ; 793: Java.Interop => 172
	i32 u0xc8d10307, ; 794: lib_System.Diagnostics.TraceSource.dll.so => 33
	i32 u0xc9094c00, ; 795: Xamarin.AndroidX.Navigation.Runtime.Android => 260
	i32 u0xc92a6809, ; 796: Xamarin.AndroidX.RecyclerView => 263
	i32 u0xca5de1fa, ; 797: System.Runtime.CompilerServices.Unsafe.dll => 104
	i32 u0xcae37e41, ; 798: System.Security.Cryptography.OpenSsl.dll => 126
	i32 u0xcaf7bd4b, ; 799: Xamarin.AndroidX.CustomView.PoolingContainer => 231
	i32 u0xcb5af55c, ; 800: lib_System.Reflection.Emit.Lightweight.dll.so => 94
	i32 u0xcc5af6ee, ; 801: Microsoft.Extensions.DependencyInjection.dll => 181
	i32 u0xcc6479a0, ; 802: System.Xml => 167
	i32 u0xcc7d82b4, ; 803: netstandard => 171
	i32 u0xcd1dd0db, ; 804: Xamarin.AndroidX.DynamicAnimation.dll => 233
	i32 u0xcd5a809f, ; 805: System.Formats.Tar => 39
	i32 u0xcdd8cd54, ; 806: lib_Xamarin.AndroidX.Emoji2.dll.so => 234
	i32 u0xce3fa116, ; 807: lib_System.Diagnostics.Process.dll.so => 29
	i32 u0xce70fda2, ; 808: hr/Microsoft.Maui.Controls.resources.dll => 307
	i32 u0xcef19b37, ; 809: System.ComponentModel.TypeConverter.dll => 17
	i32 u0xcf3163e6, ; 810: Mono.Android => 175
	i32 u0xcf663a21, ; 811: ru/Microsoft.Maui.Controls.resources.dll => 320
	i32 u0xcfa20c36, ; 812: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 271
	i32 u0xcfbaacae, ; 813: System.Text.Json.dll => 140
	i32 u0xcfd0c798, ; 814: System.Transactions => 154
	i32 u0xd0418592, ; 815: Xamarin.AndroidX.Concurrent.Futures.dll => 222
	i32 u0xd128d608, ; 816: System.Xml.Linq => 159
	i32 u0xd1854eb4, ; 817: System.Security.dll => 133
	i32 u0xd2757232, ; 818: System.Configuration => 19
	i32 u0xd2ff69f1, ; 819: System.Net.HttpListener => 67
	i32 u0xd310c033, ; 820: lib_Xamarin.Jetbrains.Annotations.dll.so => 288
	i32 u0xd328ac54, ; 821: vi/Microsoft.Maui.Controls.resources => 326
	i32 u0xd4045e1b, ; 822: lib_System.dll.so => 168
	i32 u0xd404ddfe, ; 823: lib_System.Runtime.Intrinsics.dll.so => 111
	i32 u0xd432d20b, ; 824: System.Threading.Timer => 151
	i32 u0xd457e5c9, ; 825: lib_Microsoft.CSharp.dll.so => 1
	i32 u0xd47cb45a, ; 826: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 215
	i32 u0xd496c3c3, ; 827: lib_Xamarin.AndroidX.ExifInterface.dll.so => 236
	i32 u0xd4d2575b, ; 828: System.IO.FileSystem.AccessControl => 47
	i32 u0xd505225a, ; 829: lib_System.Xml.XPath.dll.so => 164
	i32 u0xd622b752, ; 830: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 319
	i32 u0xd664cdf2, ; 831: de/Microsoft.Maui.Controls.resources => 300
	i32 u0xd6665034, ; 832: Xamarin.Android.Glide.GifDecoder.dll => 207
	i32 u0xd67a52b3, ; 833: System.Net.WebSockets.Client => 82
	i32 u0xd715a361, ; 834: System.Linq.dll => 63
	i32 u0xd7f95f5a, ; 835: da/Microsoft.Maui.Controls.resources => 299
	i32 u0xd804d57a, ; 836: System.Runtime.InteropServices.RuntimeInformation => 109
	i32 u0xd889aee8, ; 837: lib_System.Threading.Channels.dll.so => 143
	i32 u0xd8950487, ; 838: Xamarin.AndroidX.Annotation.Experimental => 211
	i32 u0xd8bba49d, ; 839: lib_Xamarin.AndroidX.RecyclerView.dll.so => 263
	i32 u0xd8dbab5d, ; 840: System.IO.FileSystem.Primitives.dll => 49
	i32 u0xd90e5f5a, ; 841: Xamarin.AndroidX.Lifecycle.LiveData.Core => 243
	i32 u0xd92e86f1, ; 842: Xamarin.KotlinX.Serialization.Core.dll => 294
	i32 u0xd930cda0, ; 843: Xamarin.AndroidX.Navigation.Fragment => 258
	i32 u0xd943a729, ; 844: System.ComponentModel.DataAnnotations => 14
	i32 u0xd96cf6f7, ; 845: pt-BR/Microsoft.Maui.Controls.resources => 317
	i32 u0xd9f65f5e, ; 846: lib-el-Microsoft.Maui.Controls.resources.dll.so => 301
	i32 u0xd9fdda56, ; 847: Microsoft.Extensions.Configuration.Abstractions.dll => 180
	i32 u0xda2f27df, ; 848: System.Net.NetworkInformation => 70
	i32 u0xda4773dd, ; 849: he/Microsoft.Maui.Controls.resources => 305
	i32 u0xdabf74ac, ; 850: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 212
	i32 u0xdae8aa5e, ; 851: Mono.Android.dll => 175
	i32 u0xdb7f7e5d, ; 852: Xamarin.AndroidX.Browser => 217
	i32 u0xdb9df1ce, ; 853: Xamarin.AndroidX.Concurrent.Futures => 222
	i32 u0xdbb50d93, ; 854: ms/Microsoft.Maui.Controls.resources => 313
	i32 u0xdc5370c5, ; 855: lib_System.Web.HttpUtility.dll.so => 156
	i32 u0xdc68940c, ; 856: zh-Hant/Microsoft.Maui.Controls.resources.dll => 329
	i32 u0xdc96bdf5, ; 857: System.Net.WebProxy.dll => 81
	i32 u0xdcefb51d, ; 858: Xamarin.AndroidX.Core.Core.Ktx.dll => 227
	i32 u0xdd864306, ; 859: System.Runtime.Intrinsics => 111
	i32 u0xdda814c6, ; 860: Xamarin.AndroidX.Annotation => 210
	i32 u0xde068c70, ; 861: Xamarin.AndroidX.Navigation.Common.dll => 256
	i32 u0xde7354ab, ; 862: System.Net.NameResolution => 69
	i32 u0xdecad304, ; 863: System.Net.Http.Json.dll => 65
	i32 u0xdf1b1ecd, ; 864: lib_System.ServiceProcess.dll.so => 135
	i32 u0xdf6f3870, ; 865: System.Diagnostics.DiagnosticSource => 27
	i32 u0xdf9a7f42, ; 866: System.Xml.XPath => 164
	i32 u0xdfca27bc, ; 867: SQLitePCLRaw.provider.e_sqlite3 => 200
	i32 u0xdfd65a5d, ; 868: lib_System.Diagnostics.Tracing.dll.so => 34
	i32 u0xe05b6245, ; 869: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 249
	i32 u0xe12f62fc, ; 870: lib_System.Threading.ThreadPool.dll.so => 150
	i32 u0xe13414bb, ; 871: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 308
	i32 u0xe1a41194, ; 872: lib_System.Xml.XDocument.dll.so => 162
	i32 u0xe1ae15d6, ; 873: Xamarin.AndroidX.Collection => 219
	i32 u0xe1eea3e4, ; 874: lib_System.IO.Compression.ZipFile.dll.so => 45
	i32 u0xe1f0a5d8, ; 875: lib_Xamarin.AndroidX.ViewPager.dll.so => 278
	i32 u0xe2098b0b, ; 876: System.Collections.NonGeneric => 10
	i32 u0xe250cda6, ; 877: lib_Microsoft.Extensions.Logging.dll.so => 186
	i32 u0xe2513246, ; 878: lib_System.Runtime.Numerics.dll.so => 113
	i32 u0xe2a3f2e8, ; 879: System.Collections.Specialized.dll => 11
	i32 u0xe34ee011, ; 880: lib_System.IO.Pipelines.dll.so => 54
	i32 u0xe3774f52, ; 881: lib_System.IO.MemoryMappedFiles.dll.so => 53
	i32 u0xe3a54a09, ; 882: System.Net.WebProxy => 81
	i32 u0xe3c7860c, ; 883: lib_System.Security.Claims.dll.so => 121
	i32 u0xe3df9d2b, ; 884: System.Security.Cryptography.dll => 129
	i32 u0xe4436460, ; 885: System.Numerics.dll => 86
	i32 u0xe4fab729, ; 886: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 182
	i32 u0xe52378b9, ; 887: System.Net.Mail.dll => 68
	i32 u0xe56ef253, ; 888: System.Runtime.InteropServices.dll => 110
	i32 u0xe625b819, ; 889: lib_Xamarin.AndroidX.CardView.dll.so => 218
	i32 u0xe6b14171, ; 890: System.Net.HttpListener.dll => 67
	i32 u0xe6ca3640, ; 891: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 221
	i32 u0xe6e179fa, ; 892: System.Security.Principal => 131
	i32 u0xe6e8f547, ; 893: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 183
	i32 u0xe6f98713, ; 894: System.Security.Cryptography.Encoding.dll => 125
	i32 u0xe70c9739, ; 895: SQLite-net => 196
	i32 u0xe797fcc1, ; 896: System.Net.WebHeaderCollection.dll => 80
	i32 u0xe79e77a6, ; 897: Xamarin.AndroidX.Transition.dll => 274
	i32 u0xe7c9e2bd, ; 898: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 262
	i32 u0xe7dc15ff, ; 899: zh-Hans/Microsoft.Maui.Controls.resources.dll => 328
	i32 u0xe839deed, ; 900: System.Collections.Concurrent.dll => 8
	i32 u0xe843daa0, ; 901: Xamarin.AndroidX.Core.dll => 226
	i32 u0xe89260c1, ; 902: Microsoft.VisualBasic.Core.dll => 2
	i32 u0xe90fdb70, ; 903: Xamarin.AndroidX.Collection.Jvm => 220
	i32 u0xe92ace5f, ; 904: lib_System.Linq.Parallel.dll.so => 61
	i32 u0xe97d0db9, ; 905: lib_System.IO.Hashing.dll.so => 176
	i32 u0xe99f7d24, ; 906: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 324
	i32 u0xe9b2d35e, ; 907: System.IO.Compression.FileSystem.dll => 44
	i32 u0xe9b630ed, ; 908: Xamarin.AndroidX.VersionedParcelable.dll => 277
	i32 u0xea0092d6, ; 909: lib_System.Threading.Tasks.Extensions.dll.so => 146
	i32 u0xea213423, ; 910: System.Xml.ReaderWriter => 160
	i32 u0xea4780ec, ; 911: System.Security.Principal.dll => 131
	i32 u0xea4fb52e, ; 912: Xamarin.AndroidX.Navigation.UI => 261
	i32 u0xea90e353, ; 913: D-ToDoList => 0
	i32 u0xeab81858, ; 914: lib_Microsoft.Maui.Essentials.dll.so => 194
	i32 u0xeaf244cc, ; 915: lib_System.IO.Pipes.AccessControl.dll.so => 55
	i32 u0xeaf598f6, ; 916: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 187
	i32 u0xeb2ecede, ; 917: System.Data.DataSetExtensions.dll => 23
	i32 u0xeb5560c9, ; 918: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 109
	i32 u0xebac8bfe, ; 919: System.Text.Encoding.CodePages => 136
	i32 u0xebb0254b, ; 920: lib_System.Net.NetworkInformation.dll.so => 70
	i32 u0xebc66336, ; 921: Xamarin.AndroidX.AppCompat.dll => 213
	i32 u0xec05582d, ; 922: Xamarin.AndroidX.Lifecycle.Process => 245
	i32 u0xed1090ae, ; 923: lib_System.Net.Primitives.dll.so => 72
	i32 u0xed409aea, ; 924: th/Microsoft.Maui.Controls.resources.dll => 323
	i32 u0xed96d41f, ; 925: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 225
	i32 u0xedadd6e2, ; 926: he/Microsoft.Maui.Controls.resources.dll => 305
	i32 u0xedf6669b, ; 927: lib_System.Drawing.dll.so => 36
	i32 u0xee9f991d, ; 928: System.Diagnostics.Process.dll => 29
	i32 u0xeeefb9c8, ; 929: lib_System.Dynamic.Runtime.dll.so => 37
	i32 u0xef5e8475, ; 930: Xamarin.AndroidX.Annotation.Jvm.dll => 212
	i32 u0xefd01a89, ; 931: System.IO.Pipelines => 54
	i32 u0xeff49a63, ; 932: System.Memory => 64
	i32 u0xeff49c4a, ; 933: lib_System.Text.Encoding.Extensions.dll.so => 137
	i32 u0xf0672b49, ; 934: lib_Syncfusion.Maui.Core.dll.so => 202
	i32 u0xf09122fc, ; 935: lib_System.IO.IsolatedStorage.dll.so => 52
	i32 u0xf121f953, ; 936: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 243
	i32 u0xf1304331, ; 937: Microsoft.Maui.Controls.Xaml.dll => 192
	i32 u0xf15cb56d, ; 938: Xamarin.KotlinX.Serialization.Core => 294
	i32 u0xf1676aaa, ; 939: lib-da-Microsoft.Maui.Controls.resources.dll.so => 299
	i32 u0xf1ad867b, ; 940: System.Reflection.Emit.ILGeneration => 93
	i32 u0xf27f60d1, ; 941: System.Private.Xml.Linq.dll => 90
	i32 u0xf29c5384, ; 942: id/Microsoft.Maui.Controls.resources => 309
	i32 u0xf2ce3c98, ; 943: System.Threading.dll => 152
	i32 u0xf2dd3fc4, ; 944: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 311
	i32 u0xf3201983, ; 945: Microsoft.Extensions.Hosting.Abstractions.dll => 185
	i32 u0xf323e0a6, ; 946: lib_Xamarin.Kotlin.StdLib.dll.so => 290
	i32 u0xf33c42ef, ; 947: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 276
	i32 u0xf3a16066, ; 948: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 250
	i32 u0xf40add04, ; 949: Microsoft.Maui.Essentials.dll => 194
	i32 u0xf42589bc, ; 950: lib_System.Security.Cryptography.X509Certificates.dll.so => 128
	i32 u0xf45985cf, ; 951: System.Drawing.dll => 36
	i32 u0xf462c30d, ; 952: System.Private.Uri => 89
	i32 u0xf479582c, ; 953: Xamarin.AndroidX.Emoji2 => 234
	i32 u0xf47b0a29, ; 954: lib_System.Configuration.dll.so => 19
	i32 u0xf48143e5, ; 955: pt/Microsoft.Maui.Controls.resources.dll => 318
	i32 u0xf5185c24, ; 956: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 318
	i32 u0xf53cb11d, ; 957: lib_System.Net.Security.dll.so => 75
	i32 u0xf554c79b, ; 958: lib_System.Linq.AsyncEnumerable.dll.so => 59
	i32 u0xf5861a4f, ; 959: pl/Microsoft.Maui.Controls.resources => 316
	i32 u0xf5e94e90, ; 960: ms/Microsoft.Maui.Controls.resources.dll => 313
	i32 u0xf5f4f1f0, ; 961: Microsoft.Extensions.DependencyInjection => 181
	i32 u0xf5fdf056, ; 962: lib_Microsoft.Extensions.DependencyInjection.dll.so => 181
	i32 u0xf60736e2, ; 963: System.IO.FileSystem.Watcher => 50
	i32 u0xf6318da0, ; 964: System.AppContext => 6
	i32 u0xf73be021, ; 965: System.Reflection.Emit.ILGeneration.dll => 93
	i32 u0xf76edc75, ; 966: System.Core => 21
	i32 u0xf7e95c85, ; 967: System.Xml.XmlSerializer => 166
	i32 u0xf807b767, ; 968: System.Reflection.TypeExtensions => 99
	i32 u0xf83dd773, ; 969: System.IO.FileSystem.Watcher.dll => 50
	i32 u0xf86129d4, ; 970: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 322
	i32 u0xf93ba7d4, ; 971: System.Runtime.Serialization.Primitives => 116
	i32 u0xf94a8f86, ; 972: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 253
	i32 u0xf97c5a99, ; 973: System.Security => 133
	i32 u0xf9be026d, ; 974: lib_SQLitePCLRaw.core.dll.so => 198
	i32 u0xfa21f6af, ; 975: System.Net.WebClient.dll => 79
	i32 u0xfa50891f, ; 976: lib_System.Linq.dll.so => 63
	i32 u0xfa6ae1e2, ; 977: lib_Xamarin.AndroidX.Annotation.dll.so => 210
	i32 u0xfac98279, ; 978: Xamarin.AndroidX.SavedState.SavedState.Android => 266
	i32 u0xfb0af295, ; 979: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 327
	i32 u0xfb1dad5d, ; 980: System.Diagnostics.DiagnosticSource.dll => 27
	i32 u0xfbc4b67c, ; 981: lib_System.IO.Compression.Brotli.dll.so => 43
	i32 u0xfc5f7d36, ; 982: pt/Microsoft.Maui.Controls.resources => 318
	i32 u0xfdaee526, ; 983: Xamarin.AndroidX.Core.Core.Ktx => 227
	i32 u0xfdd1b433, ; 984: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 252
	i32 u0xfdf2741f, ; 985: System.Buffers => 7
	i32 u0xfe42d509, ; 986: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 268
	i32 u0xfea12dee, ; 987: Microsoft.Maui.Controls.dll => 191
	i32 u0xfecef6ea, ; 988: System.Runtime.Numerics => 113
	i32 u0xff6b9aa3, ; 989: lib_Xamarin.AndroidX.SavedState.SavedState.Android.dll.so => 266
	i32 u0xff912ee3, ; 990: lib_System.Xml.Serialization.dll.so => 161
	i32 u0xffd4917f, ; 991: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 253
	i32 u0xfffce3e8 ; 992: Xamarin.AndroidX.ExifInterface.dll => 236
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [993 x i32] [
	i32 70, i32 74, i32 69, i32 255, i32 166, i32 111, i32 182, i32 59,
	i32 246, i32 287, i32 48, i32 83, i32 325, i32 149, i32 193, i32 297,
	i32 30, i32 127, i32 195, i32 105, i32 10, i32 183, i32 269, i32 76,
	i32 62, i32 0, i32 260, i32 327, i32 287, i32 68, i32 110, i32 257,
	i32 269, i32 143, i32 31, i32 80, i32 127, i32 13, i32 222, i32 219,
	i32 208, i32 202, i32 135, i32 271, i32 272, i32 326, i32 283, i32 155,
	i32 163, i32 65, i32 316, i32 326, i32 77, i32 327, i32 18, i32 217,
	i32 142, i32 44, i32 26, i32 188, i32 1, i32 228, i32 230, i32 61,
	i32 42, i32 142, i32 314, i32 94, i32 132, i32 204, i32 223, i32 151,
	i32 242, i32 239, i32 298, i32 23, i32 321, i32 55, i32 71, i32 208,
	i32 86, i32 285, i32 119, i32 311, i32 240, i32 199, i32 13, i32 310,
	i32 298, i32 134, i32 179, i32 112, i32 56, i32 153, i32 77, i32 149,
	i32 176, i32 64, i32 150, i32 264, i32 330, i32 169, i32 247, i32 125,
	i32 322, i32 224, i32 12, i32 237, i32 128, i32 156, i32 248, i32 174,
	i32 116, i32 170, i32 172, i32 168, i32 239, i32 89, i32 269, i32 118,
	i32 87, i32 309, i32 303, i32 190, i32 127, i32 6, i32 154, i32 306,
	i32 62, i32 186, i32 51, i32 106, i32 117, i32 40, i32 289, i32 284,
	i32 228, i32 203, i32 123, i32 317, i32 178, i32 134, i32 11, i32 52,
	i32 21, i32 44, i32 78, i32 122, i32 247, i32 203, i32 230, i32 235,
	i32 231, i32 96, i32 300, i32 84, i32 139, i32 277, i32 22, i32 215,
	i32 8, i32 51, i32 317, i32 75, i32 297, i32 159, i32 291, i32 229,
	i32 158, i32 167, i32 95, i32 288, i32 45, i32 312, i32 300, i32 112,
	i32 133, i32 132, i32 197, i32 25, i32 205, i32 165, i32 74, i32 56,
	i32 46, i32 100, i32 189, i32 92, i32 231, i32 22, i32 244, i32 149,
	i32 89, i32 43, i32 164, i32 73, i32 232, i32 296, i32 3, i32 42,
	i32 65, i32 176, i32 56, i32 199, i32 286, i32 16, i32 58, i32 53,
	i32 154, i32 41, i32 324, i32 287, i32 14, i32 251, i32 235, i32 108,
	i32 241, i32 282, i32 170, i32 285, i32 240, i32 34, i32 162, i32 291,
	i32 88, i32 32, i32 233, i32 12, i32 328, i32 145, i32 51, i32 302,
	i32 57, i32 265, i32 36, i32 182, i32 299, i32 286, i32 213, i32 35,
	i32 239, i32 60, i32 99, i32 183, i32 250, i32 12, i32 101, i32 190,
	i32 245, i32 178, i32 17, i32 290, i32 168, i32 185, i32 95, i32 139,
	i32 207, i32 248, i32 188, i32 323, i32 126, i32 17, i32 81, i32 85,
	i32 280, i32 66, i32 88, i32 76, i32 158, i32 157, i32 184, i32 276,
	i32 259, i32 303, i32 144, i32 103, i32 316, i32 215, i32 29, i32 52,
	i32 219, i32 151, i32 314, i32 185, i32 306, i32 220, i32 289, i32 5,
	i32 195, i32 295, i32 270, i32 292, i32 90, i32 275, i32 117, i32 221,
	i32 291, i32 212, i32 198, i32 232, i32 262, i32 88, i32 257, i32 257,
	i32 280, i32 63, i32 115, i32 307, i32 297, i32 254, i32 58, i32 265,
	i32 102, i32 177, i32 50, i32 19, i32 225, i32 254, i32 114, i32 104,
	i32 32, i32 3, i32 105, i32 86, i32 107, i32 285, i32 241, i32 73,
	i32 4, i32 251, i32 38, i32 32, i32 57, i32 106, i32 75, i32 9,
	i32 126, i32 46, i32 214, i32 190, i32 9, i32 43, i32 4, i32 267,
	i32 306, i32 35, i32 301, i32 31, i32 217, i32 141, i32 95, i32 96,
	i32 321, i32 304, i32 273, i32 49, i32 145, i32 115, i32 295, i32 144,
	i32 2, i32 322, i32 16, i32 329, i32 118, i32 286, i32 161, i32 79,
	i32 82, i32 39, i32 255, i32 37, i32 279, i32 216, i32 235, i32 229,
	i32 66, i32 141, i32 15, i32 46, i32 160, i32 169, i32 119, i32 293,
	i32 272, i32 283, i32 223, i32 48, i32 72, i32 83, i32 289, i32 129,
	i32 97, i32 124, i32 153, i32 26, i32 199, i32 120, i32 244, i32 100,
	i32 28, i32 218, i32 105, i32 319, i32 153, i32 54, i32 173, i32 4,
	i32 101, i32 38, i32 329, i32 33, i32 80, i32 96, i32 271, i32 186,
	i32 108, i32 282, i32 21, i32 41, i32 213, i32 174, i32 106, i32 237,
	i32 152, i32 304, i32 184, i32 255, i32 314, i32 290, i32 283, i32 292,
	i32 261, i32 2, i32 308, i32 137, i32 114, i32 277, i32 187, i32 325,
	i32 205, i32 60, i32 98, i32 223, i32 39, i32 216, i32 328, i32 25,
	i32 97, i32 92, i32 102, i32 10, i32 214, i32 175, i32 200, i32 90,
	i32 49, i32 64, i32 79, i32 103, i32 311, i32 268, i32 179, i32 47,
	i32 76, i32 207, i32 7, i32 307, i32 84, i32 250, i32 296, i32 211,
	i32 204, i32 305, i32 310, i32 91, i32 243, i32 158, i32 330, i32 59,
	i32 238, i32 33, i32 115, i32 119, i32 67, i32 85, i32 200, i32 138,
	i32 20, i32 11, i32 166, i32 136, i32 312, i32 3, i32 28, i32 312,
	i32 313, i32 284, i32 193, i32 114, i32 319, i32 102, i32 27, i32 15,
	i32 189, i32 7, i32 187, i32 87, i32 60, i32 73, i32 30, i32 293,
	i32 66, i32 276, i32 147, i32 83, i32 320, i32 161, i32 281, i32 41,
	i32 252, i32 191, i32 120, i32 180, i32 206, i32 304, i32 310, i32 263,
	i32 315, i32 171, i32 323, i32 247, i32 281, i32 134, i32 78, i32 197,
	i32 68, i32 177, i32 210, i32 147, i32 109, i32 155, i32 303, i32 20,
	i32 72, i32 201, i32 196, i32 242, i32 160, i32 324, i32 179, i32 148,
	i32 124, i32 258, i32 296, i32 130, i32 282, i32 156, i32 234, i32 157,
	i32 91, i32 281, i32 145, i32 315, i32 221, i32 0, i32 98, i32 237,
	i32 20, i32 14, i32 270, i32 138, i32 78, i32 61, i32 197, i32 224,
	i32 171, i32 244, i32 172, i32 191, i32 203, i32 15, i32 77, i32 140,
	i32 246, i32 6, i32 309, i32 209, i32 23, i32 246, i32 265, i32 321,
	i32 204, i32 192, i32 94, i32 1, i32 139, i32 249, i32 248, i32 275,
	i32 137, i32 71, i32 150, i32 184, i32 116, i32 293, i32 25, i32 238,
	i32 188, i32 91, i32 99, i32 229, i32 233, i32 261, i32 31, i32 45,
	i32 147, i32 242, i32 253, i32 206, i32 112, i32 162, i32 35, i32 292,
	i32 110, i32 22, i32 117, i32 58, i32 141, i32 272, i32 148, i32 121,
	i32 123, i32 226, i32 113, i32 302, i32 208, i32 143, i32 214, i32 55,
	i32 82, i32 108, i32 254, i32 192, i32 8, i32 193, i32 123, i32 136,
	i32 251, i32 288, i32 280, i32 155, i32 278, i32 264, i32 241, i32 9,
	i32 205, i32 48, i32 238, i32 69, i32 273, i32 195, i32 325, i32 163,
	i32 302, i32 259, i32 225, i32 201, i32 5, i32 167, i32 129, i32 135,
	i32 264, i32 165, i32 315, i32 273, i32 252, i32 144, i32 278, i32 42,
	i32 274, i32 301, i32 173, i32 194, i32 201, i32 209, i32 284, i32 40,
	i32 295, i32 320, i32 236, i32 84, i32 57, i32 37, i32 130, i32 100,
	i32 142, i32 170, i32 177, i32 294, i32 279, i32 85, i32 211, i32 189,
	i32 101, i32 26, i32 30, i32 163, i32 267, i32 18, i32 130, i32 260,
	i32 122, i32 232, i32 159, i32 249, i32 268, i32 298, i32 206, i32 71,
	i32 245, i32 270, i32 169, i32 330, i32 107, i32 267, i32 256, i32 173,
	i32 174, i32 16, i32 279, i32 275, i32 148, i32 308, i32 40, i32 128,
	i32 121, i32 38, i32 118, i32 47, i32 146, i32 87, i32 120, i32 34,
	i32 202, i32 178, i32 98, i32 53, i32 220, i32 97, i32 256, i32 258,
	i32 131, i32 104, i32 132, i32 157, i32 24, i32 165, i32 152, i32 107,
	i32 240, i32 228, i32 92, i32 224, i32 266, i32 218, i32 62, i32 146,
	i32 93, i32 103, i32 5, i32 13, i32 124, i32 196, i32 125, i32 122,
	i32 138, i32 28, i32 180, i32 74, i32 230, i32 24, i32 24, i32 216,
	i32 262, i32 259, i32 274, i32 227, i32 18, i32 140, i32 198, i32 209,
	i32 226, i32 172, i32 33, i32 260, i32 263, i32 104, i32 126, i32 231,
	i32 94, i32 181, i32 167, i32 171, i32 233, i32 39, i32 234, i32 29,
	i32 307, i32 17, i32 175, i32 320, i32 271, i32 140, i32 154, i32 222,
	i32 159, i32 133, i32 19, i32 67, i32 288, i32 326, i32 168, i32 111,
	i32 151, i32 1, i32 215, i32 236, i32 47, i32 164, i32 319, i32 300,
	i32 207, i32 82, i32 63, i32 299, i32 109, i32 143, i32 211, i32 263,
	i32 49, i32 243, i32 294, i32 258, i32 14, i32 317, i32 301, i32 180,
	i32 70, i32 305, i32 212, i32 175, i32 217, i32 222, i32 313, i32 156,
	i32 329, i32 81, i32 227, i32 111, i32 210, i32 256, i32 69, i32 65,
	i32 135, i32 27, i32 164, i32 200, i32 34, i32 249, i32 150, i32 308,
	i32 162, i32 219, i32 45, i32 278, i32 10, i32 186, i32 113, i32 11,
	i32 54, i32 53, i32 81, i32 121, i32 129, i32 86, i32 182, i32 68,
	i32 110, i32 218, i32 67, i32 221, i32 131, i32 183, i32 125, i32 196,
	i32 80, i32 274, i32 262, i32 328, i32 8, i32 226, i32 2, i32 220,
	i32 61, i32 176, i32 324, i32 44, i32 277, i32 146, i32 160, i32 131,
	i32 261, i32 0, i32 194, i32 55, i32 187, i32 23, i32 109, i32 136,
	i32 70, i32 213, i32 245, i32 72, i32 323, i32 225, i32 305, i32 36,
	i32 29, i32 37, i32 212, i32 54, i32 64, i32 137, i32 202, i32 52,
	i32 243, i32 192, i32 294, i32 299, i32 93, i32 90, i32 309, i32 152,
	i32 311, i32 185, i32 290, i32 276, i32 250, i32 194, i32 128, i32 36,
	i32 89, i32 234, i32 19, i32 318, i32 318, i32 75, i32 59, i32 316,
	i32 313, i32 181, i32 181, i32 50, i32 6, i32 93, i32 21, i32 166,
	i32 99, i32 50, i32 322, i32 116, i32 253, i32 133, i32 198, i32 79,
	i32 63, i32 210, i32 266, i32 327, i32 27, i32 43, i32 318, i32 227,
	i32 252, i32 7, i32 268, i32 191, i32 113, i32 266, i32 161, i32 253,
	i32 236
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.mm.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.mm.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/10.0.1xx @ 9a2d211ba972d3a0c4c108e043def432f3ec2620"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
