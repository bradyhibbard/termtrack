; ModuleID = 'obj/Debug/android/marshal_methods.armeabi-v7a.ll'
source_filename = "obj/Debug/android/marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android"


%struct.MonoImage = type opaque

%struct.MonoClass = type opaque

%struct.MarshalMethodsManagedClass = type {
	i32,; uint32_t token
	%struct.MonoClass*; MonoClass* klass
}

%struct.MarshalMethodName = type {
	i64,; uint64_t id
	i8*; char* name
}

%class._JNIEnv = type opaque

%class._jobject = type {
	i8; uint8_t b
}

%class._jclass = type {
	i8; uint8_t b
}

%class._jstring = type {
	i8; uint8_t b
}

%class._jthrowable = type {
	i8; uint8_t b
}

%class._jarray = type {
	i8; uint8_t b
}

%class._jobjectArray = type {
	i8; uint8_t b
}

%class._jbooleanArray = type {
	i8; uint8_t b
}

%class._jbyteArray = type {
	i8; uint8_t b
}

%class._jcharArray = type {
	i8; uint8_t b
}

%class._jshortArray = type {
	i8; uint8_t b
}

%class._jintArray = type {
	i8; uint8_t b
}

%class._jlongArray = type {
	i8; uint8_t b
}

%class._jfloatArray = type {
	i8; uint8_t b
}

%class._jdoubleArray = type {
	i8; uint8_t b
}

; assembly_image_cache
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 4
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [242 x i32] [
	i32 32687329, ; 0: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 62
	i32 34715100, ; 1: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 94
	i32 39109920, ; 2: Newtonsoft.Json.dll => 0x254c520 => 9
	i32 57263871, ; 3: Xamarin.Forms.Core.dll => 0x369c6ff => 89
	i32 101534019, ; 4: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 78
	i32 120558881, ; 5: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 78
	i32 134690465, ; 6: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 98
	i32 165246403, ; 7: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 39
	i32 182336117, ; 8: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 80
	i32 209399409, ; 9: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 37
	i32 220171995, ; 10: System.Diagnostics.Debug => 0xd1f8edb => 112
	i32 230216969, ; 11: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 56
	i32 232815796, ; 12: System.Web.Services => 0xde07cb4 => 111
	i32 261689757, ; 13: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 42
	i32 278686392, ; 14: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 60
	i32 280482487, ; 15: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 54
	i32 318968648, ; 16: Xamarin.AndroidX.Activity.dll => 0x13031348 => 29
	i32 321597661, ; 17: System.Numerics => 0x132b30dd => 22
	i32 328805026, ; 18: TermTracker1.Android => 0x13992aa2 => 0
	i32 342366114, ; 19: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 58
	i32 347068432, ; 20: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 16
	i32 385762202, ; 21: System.Memory.dll => 0x16fe439a => 21
	i32 441335492, ; 22: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 41
	i32 442521989, ; 23: Xamarin.Essentials => 0x1a605985 => 88
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 113
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 53
	i32 465846621, ; 26: mscorlib => 0x1bc4415d => 8
	i32 469710990, ; 27: System.dll => 0x1bff388e => 20
	i32 476646585, ; 28: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 54
	i32 486930444, ; 29: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 66
	i32 498788369, ; 30: System.ObjectModel => 0x1dbae811 => 117
	i32 504143952, ; 31: Plugin.LocalNotification.dll => 0x1e0ca050 => 10
	i32 526420162, ; 32: System.Transactions.dll => 0x1f6088c2 => 106
	i32 527452488, ; 33: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 98
	i32 545304856, ; 34: System.Runtime.Extensions => 0x2080b118 => 118
	i32 605376203, ; 35: System.IO.Compression.FileSystem => 0x24154ecb => 109
	i32 627609679, ; 36: Xamarin.AndroidX.CustomView => 0x2568904f => 47
	i32 639843206, ; 37: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 52
	i32 663517072, ; 38: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 85
	i32 666292255, ; 39: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 34
	i32 690569205, ; 40: System.Xml.Linq.dll => 0x29293ff5 => 27
	i32 691348768, ; 41: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 100
	i32 700284507, ; 42: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 95
	i32 720511267, ; 43: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 99
	i32 748832960, ; 44: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 14
	i32 775507847, ; 45: System.IO.Compression => 0x2e394f87 => 108
	i32 800472933, ; 46: SQLiteNetExtensionsAsync => 0x2fb63f65 => 13
	i32 809851609, ; 47: System.Drawing.Common.dll => 0x30455ad9 => 103
	i32 843511501, ; 48: Xamarin.AndroidX.Print => 0x3246f6cd => 73
	i32 928116545, ; 49: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 94
	i32 955402788, ; 50: Newtonsoft.Json => 0x38f24a24 => 9
	i32 956575887, ; 51: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 99
	i32 967690846, ; 52: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 58
	i32 974778368, ; 53: FormsViewGroup.dll => 0x3a19f000 => 5
	i32 992768348, ; 54: System.Collections.dll => 0x3b2c715c => 113
	i32 1012816738, ; 55: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 77
	i32 1035644815, ; 56: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 33
	i32 1042160112, ; 57: Xamarin.Forms.Platform.dll => 0x3e1e19f0 => 91
	i32 1044663988, ; 58: System.Linq.Expressions.dll => 0x3e444eb4 => 114
	i32 1052210849, ; 59: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 63
	i32 1084122840, ; 60: Xamarin.Kotlin.StdLib => 0x409e66d8 => 97
	i32 1098259244, ; 61: System => 0x41761b2c => 20
	i32 1175144683, ; 62: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 83
	i32 1178241025, ; 63: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 70
	i32 1204270330, ; 64: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 34
	i32 1264511973, ; 65: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 79
	i32 1267360935, ; 66: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 84
	i32 1275534314, ; 67: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 100
	i32 1292207520, ; 68: SQLitePCLRaw.core.dll => 0x4d0585a0 => 15
	i32 1293217323, ; 69: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 49
	i32 1324164729, ; 70: System.Linq => 0x4eed2679 => 116
	i32 1365406463, ; 71: System.ServiceModel.Internals.dll => 0x516272ff => 102
	i32 1376866003, ; 72: Xamarin.AndroidX.SavedState => 0x52114ed3 => 77
	i32 1379779777, ; 73: System.Resources.ResourceManager => 0x523dc4c1 => 1
	i32 1395857551, ; 74: Xamarin.AndroidX.Media.dll => 0x5333188f => 67
	i32 1406073936, ; 75: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 43
	i32 1411638395, ; 76: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 24
	i32 1457743152, ; 77: System.Runtime.Extensions.dll => 0x56e36530 => 118
	i32 1460219004, ; 78: Xamarin.Forms.Xaml => 0x57092c7c => 92
	i32 1462112819, ; 79: System.IO.Compression.dll => 0x57261233 => 108
	i32 1469204771, ; 80: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 32
	i32 1524747670, ; 81: Plugin.LocalNotification => 0x5ae1cd96 => 10
	i32 1550322496, ; 82: System.Reflection.Extensions.dll => 0x5c680b40 => 2
	i32 1582372066, ; 83: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 48
	i32 1592978981, ; 84: System.Runtime.Serialization.dll => 0x5ef2ee25 => 4
	i32 1604451928, ; 85: SQLiteNetExtensions => 0x5fa1fe58 => 12
	i32 1622152042, ; 86: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 65
	i32 1624863272, ; 87: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 87
	i32 1635184631, ; 88: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 52
	i32 1636350590, ; 89: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 46
	i32 1639515021, ; 90: System.Net.Http.dll => 0x61b9038d => 3
	i32 1657153582, ; 91: System.Runtime => 0x62c6282e => 25
	i32 1658241508, ; 92: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 81
	i32 1658251792, ; 93: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 93
	i32 1666713512, ; 94: SQLiteNetExtensions.dll => 0x635807a8 => 12
	i32 1670060433, ; 95: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 42
	i32 1698840827, ; 96: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 96
	i32 1701541528, ; 97: System.Diagnostics.Debug.dll => 0x656b7698 => 112
	i32 1711441057, ; 98: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 16
	i32 1726116996, ; 99: System.Reflection.dll => 0x66e27484 => 115
	i32 1729485958, ; 100: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 38
	i32 1765942094, ; 101: System.Reflection.Extensions => 0x6942234e => 2
	i32 1766324549, ; 102: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 80
	i32 1776026572, ; 103: System.Core.dll => 0x69dc03cc => 19
	i32 1788241197, ; 104: Xamarin.AndroidX.Fragment => 0x6a96652d => 53
	i32 1808609942, ; 105: Xamarin.AndroidX.Loader => 0x6bcd3296 => 65
	i32 1813058853, ; 106: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 97
	i32 1813201214, ; 107: Xamarin.Google.Android.Material => 0x6c13413e => 93
	i32 1818569960, ; 108: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 71
	i32 1858542181, ; 109: System.Linq.Expressions => 0x6ec71a65 => 114
	i32 1867746548, ; 110: Xamarin.Essentials.dll => 0x6f538cf4 => 88
	i32 1878053835, ; 111: Xamarin.Forms.Xaml.dll => 0x6ff0d3cb => 92
	i32 1885316902, ; 112: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 35
	i32 1900610850, ; 113: System.Resources.ResourceManager.dll => 0x71490522 => 1
	i32 1919157823, ; 114: Xamarin.AndroidX.MultiDex.dll => 0x7264063f => 68
	i32 1983156543, ; 115: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 96
	i32 2011961780, ; 116: System.Buffers.dll => 0x77ec19b4 => 18
	i32 2019465201, ; 117: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 63
	i32 2055257422, ; 118: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 59
	i32 2079903147, ; 119: System.Runtime.dll => 0x7bf8cdab => 25
	i32 2090596640, ; 120: System.Numerics.Vectors => 0x7c9bf920 => 23
	i32 2097448633, ; 121: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x7d0486b9 => 55
	i32 2103459038, ; 122: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 17
	i32 2126786730, ; 123: Xamarin.Forms.Platform.Android => 0x7ec430aa => 90
	i32 2193016926, ; 124: System.ObjectModel.dll => 0x82b6c85e => 117
	i32 2201107256, ; 125: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 101
	i32 2201231467, ; 126: System.Net.Http => 0x8334206b => 3
	i32 2217644978, ; 127: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 83
	i32 2244775296, ; 128: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 66
	i32 2256548716, ; 129: Xamarin.AndroidX.MultiDex => 0x8680336c => 68
	i32 2261435625, ; 130: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x86cac4e9 => 57
	i32 2279755925, ; 131: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 75
	i32 2315684594, ; 132: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 30
	i32 2403452196, ; 133: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 51
	i32 2409053734, ; 134: Xamarin.AndroidX.Preference.dll => 0x8f973e26 => 72
	i32 2465273461, ; 135: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 14
	i32 2465532216, ; 136: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 41
	i32 2471841756, ; 137: netstandard.dll => 0x93554fdc => 104
	i32 2475788418, ; 138: Java.Interop.dll => 0x93918882 => 6
	i32 2501346920, ; 139: System.Data.DataSetExtensions => 0x95178668 => 107
	i32 2505896520, ; 140: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 62
	i32 2581819634, ; 141: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 84
	i32 2605712449, ; 142: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 101
	i32 2620871830, ; 143: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 46
	i32 2624644809, ; 144: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 50
	i32 2633051222, ; 145: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 60
	i32 2701096212, ; 146: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 81
	i32 2715334215, ; 147: System.Threading.Tasks.dll => 0xa1d8b647 => 119
	i32 2732626843, ; 148: Xamarin.AndroidX.Activity => 0xa2e0939b => 29
	i32 2737747696, ; 149: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 32
	i32 2766581644, ; 150: Xamarin.Forms.Core => 0xa4e6af8c => 89
	i32 2770495804, ; 151: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 95
	i32 2778768386, ; 152: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 86
	i32 2779977773, ; 153: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 76
	i32 2810250172, ; 154: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 43
	i32 2819470561, ; 155: System.Xml.dll => 0xa80db4e1 => 26
	i32 2821294376, ; 156: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 76
	i32 2842784823, ; 157: TermTracker1.dll => 0xa9717437 => 28
	i32 2853208004, ; 158: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 86
	i32 2855708567, ; 159: Xamarin.AndroidX.Transition => 0xaa36a797 => 82
	i32 2901442782, ; 160: System.Reflection => 0xacf080de => 115
	i32 2903344695, ; 161: System.ComponentModel.Composition => 0xad0d8637 => 110
	i32 2905242038, ; 162: mscorlib.dll => 0xad2a79b6 => 8
	i32 2916838712, ; 163: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 87
	i32 2919462931, ; 164: System.Numerics.Vectors.dll => 0xae037813 => 23
	i32 2921128767, ; 165: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 31
	i32 2978675010, ; 166: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 49
	i32 2996846495, ; 167: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 61
	i32 3016983068, ; 168: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 79
	i32 3024354802, ; 169: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 56
	i32 3044182254, ; 170: FormsViewGroup => 0xb57288ee => 5
	i32 3057625584, ; 171: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 69
	i32 3075834255, ; 172: System.Threading.Tasks => 0xb755818f => 119
	i32 3111772706, ; 173: System.Runtime.Serialization => 0xb979e222 => 4
	i32 3204380047, ; 174: System.Data.dll => 0xbefef58f => 105
	i32 3211777861, ; 175: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 48
	i32 3247949154, ; 176: Mono.Security => 0xc197c562 => 120
	i32 3258312781, ; 177: Xamarin.AndroidX.CardView => 0xc235e84d => 38
	i32 3267021929, ; 178: Xamarin.AndroidX.AsyncLayoutInflater => 0xc2bacc69 => 36
	i32 3286872994, ; 179: SQLite-net.dll => 0xc3e9b3a2 => 11
	i32 3317135071, ; 180: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 47
	i32 3317144872, ; 181: System.Data => 0xc5b79d28 => 105
	i32 3340431453, ; 182: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 35
	i32 3345895724, ; 183: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 74
	i32 3346324047, ; 184: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 70
	i32 3353484488, ; 185: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0xc7e21cc8 => 55
	i32 3360279109, ; 186: SQLitePCLRaw.core => 0xc849ca45 => 15
	i32 3362522851, ; 187: Xamarin.AndroidX.Core => 0xc86c06e3 => 45
	i32 3366347497, ; 188: Java.Interop => 0xc8a662e9 => 6
	i32 3374999561, ; 189: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 75
	i32 3395150330, ; 190: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 24
	i32 3404865022, ; 191: System.ServiceModel.Internals => 0xcaf21dfe => 102
	i32 3429136800, ; 192: System.Xml => 0xcc6479a0 => 26
	i32 3430777524, ; 193: netstandard => 0xcc7d82b4 => 104
	i32 3441283291, ; 194: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 50
	i32 3476120550, ; 195: Mono.Android => 0xcf3163e6 => 7
	i32 3486566296, ; 196: System.Transactions => 0xcfd0c798 => 106
	i32 3493954962, ; 197: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 40
	i32 3501239056, ; 198: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0xd0b0ab10 => 36
	i32 3509114376, ; 199: System.Xml.Linq => 0xd128d608 => 27
	i32 3536029504, ; 200: Xamarin.Forms.Platform.Android.dll => 0xd2c38740 => 90
	i32 3562133118, ; 201: TermTracker1.Android.dll => 0xd451d67e => 0
	i32 3567349600, ; 202: System.ComponentModel.Composition.dll => 0xd4a16f60 => 110
	i32 3608519521, ; 203: System.Linq.dll => 0xd715a361 => 116
	i32 3618140916, ; 204: Xamarin.AndroidX.Preference => 0xd7a872f4 => 72
	i32 3627220390, ; 205: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 73
	i32 3632359727, ; 206: Xamarin.Forms.Platform => 0xd881692f => 91
	i32 3633644679, ; 207: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 31
	i32 3641597786, ; 208: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 59
	i32 3672681054, ; 209: Mono.Android.dll => 0xdae8aa5e => 7
	i32 3676310014, ; 210: System.Web.Services.dll => 0xdb2009fe => 111
	i32 3682565725, ; 211: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 37
	i32 3684561358, ; 212: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 40
	i32 3689375977, ; 213: System.Drawing.Common => 0xdbe768e9 => 103
	i32 3706696989, ; 214: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 44
	i32 3718780102, ; 215: Xamarin.AndroidX.Annotation => 0xdda814c6 => 30
	i32 3724971120, ; 216: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 69
	i32 3754567612, ; 217: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 17
	i32 3758932259, ; 218: Xamarin.AndroidX.Legacy.Support.V4 => 0xe00cc123 => 57
	i32 3786282454, ; 219: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 39
	i32 3822602673, ; 220: Xamarin.AndroidX.Media => 0xe3d849b1 => 67
	i32 3829621856, ; 221: System.Numerics.dll => 0xe4436460 => 22
	i32 3876362041, ; 222: SQLite-net => 0xe70c9739 => 11
	i32 3885922214, ; 223: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 82
	i32 3888767677, ; 224: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 74
	i32 3896760992, ; 225: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 45
	i32 3911491832, ; 226: TermTracker1 => 0xe924a0f8 => 28
	i32 3920810846, ; 227: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 109
	i32 3921031405, ; 228: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 85
	i32 3931092270, ; 229: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 71
	i32 3945713374, ; 230: System.Data.DataSetExtensions.dll => 0xeb2ecede => 107
	i32 3955647286, ; 231: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 33
	i32 3959773229, ; 232: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 61
	i32 4025784931, ; 233: System.Memory => 0xeff49a63 => 21
	i32 4087494849, ; 234: SQLiteNetExtensionsAsync.dll => 0xf3a238c1 => 13
	i32 4101593132, ; 235: Xamarin.AndroidX.Emoji2 => 0xf479582c => 51
	i32 4105002889, ; 236: Mono.Security.dll => 0xf4ad5f89 => 120
	i32 4151237749, ; 237: System.Core => 0xf76edc75 => 19
	i32 4182413190, ; 238: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 64
	i32 4256097574, ; 239: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 44
	i32 4260525087, ; 240: System.Buffers => 0xfdf2741f => 18
	i32 4292120959 ; 241: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 64
], align 4
@assembly_image_cache_indices = local_unnamed_addr constant [242 x i32] [
	i32 62, i32 94, i32 9, i32 89, i32 78, i32 78, i32 98, i32 39, ; 0..7
	i32 80, i32 37, i32 112, i32 56, i32 111, i32 42, i32 60, i32 54, ; 8..15
	i32 29, i32 22, i32 0, i32 58, i32 16, i32 21, i32 41, i32 88, ; 16..23
	i32 113, i32 53, i32 8, i32 20, i32 54, i32 66, i32 117, i32 10, ; 24..31
	i32 106, i32 98, i32 118, i32 109, i32 47, i32 52, i32 85, i32 34, ; 32..39
	i32 27, i32 100, i32 95, i32 99, i32 14, i32 108, i32 13, i32 103, ; 40..47
	i32 73, i32 94, i32 9, i32 99, i32 58, i32 5, i32 113, i32 77, ; 48..55
	i32 33, i32 91, i32 114, i32 63, i32 97, i32 20, i32 83, i32 70, ; 56..63
	i32 34, i32 79, i32 84, i32 100, i32 15, i32 49, i32 116, i32 102, ; 64..71
	i32 77, i32 1, i32 67, i32 43, i32 24, i32 118, i32 92, i32 108, ; 72..79
	i32 32, i32 10, i32 2, i32 48, i32 4, i32 12, i32 65, i32 87, ; 80..87
	i32 52, i32 46, i32 3, i32 25, i32 81, i32 93, i32 12, i32 42, ; 88..95
	i32 96, i32 112, i32 16, i32 115, i32 38, i32 2, i32 80, i32 19, ; 96..103
	i32 53, i32 65, i32 97, i32 93, i32 71, i32 114, i32 88, i32 92, ; 104..111
	i32 35, i32 1, i32 68, i32 96, i32 18, i32 63, i32 59, i32 25, ; 112..119
	i32 23, i32 55, i32 17, i32 90, i32 117, i32 101, i32 3, i32 83, ; 120..127
	i32 66, i32 68, i32 57, i32 75, i32 30, i32 51, i32 72, i32 14, ; 128..135
	i32 41, i32 104, i32 6, i32 107, i32 62, i32 84, i32 101, i32 46, ; 136..143
	i32 50, i32 60, i32 81, i32 119, i32 29, i32 32, i32 89, i32 95, ; 144..151
	i32 86, i32 76, i32 43, i32 26, i32 76, i32 28, i32 86, i32 82, ; 152..159
	i32 115, i32 110, i32 8, i32 87, i32 23, i32 31, i32 49, i32 61, ; 160..167
	i32 79, i32 56, i32 5, i32 69, i32 119, i32 4, i32 105, i32 48, ; 168..175
	i32 120, i32 38, i32 36, i32 11, i32 47, i32 105, i32 35, i32 74, ; 176..183
	i32 70, i32 55, i32 15, i32 45, i32 6, i32 75, i32 24, i32 102, ; 184..191
	i32 26, i32 104, i32 50, i32 7, i32 106, i32 40, i32 36, i32 27, ; 192..199
	i32 90, i32 0, i32 110, i32 116, i32 72, i32 73, i32 91, i32 31, ; 200..207
	i32 59, i32 7, i32 111, i32 37, i32 40, i32 103, i32 44, i32 30, ; 208..215
	i32 69, i32 17, i32 57, i32 39, i32 67, i32 22, i32 11, i32 82, ; 216..223
	i32 74, i32 45, i32 28, i32 109, i32 85, i32 71, i32 107, i32 33, ; 224..231
	i32 61, i32 21, i32 13, i32 51, i32 120, i32 19, i32 64, i32 44, ; 232..239
	i32 18, i32 64 ; 240..241
], align 4

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 4; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 4

; Function attributes: "frame-pointer"="all" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 4
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 4
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 8; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="all" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+thumb-mode,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 1, !"min_enum_size", i32 4}
!3 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
