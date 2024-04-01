; ModuleID = 'obj/Debug/android/marshal_methods.x86_64.ll'
source_filename = "obj/Debug/android/marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android"


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
@assembly_image_cache = local_unnamed_addr global [0 x %struct.MonoImage*] zeroinitializer, align 8
; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = local_unnamed_addr constant [242 x i64] [
	i64 24362543149721218, ; 0: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 50
	i64 36418902923615093, ; 1: Plugin.LocalNotification => 0x8162cc9bdf1b75 => 10
	i64 120698629574877762, ; 2: Mono.Android => 0x1accec39cafe242 => 7
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 114
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 39
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 77
	i64 295915112840604065, ; 6: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 78
	i64 316157742385208084, ; 7: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 44
	i64 634308326490598313, ; 8: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 62
	i64 702024105029695270, ; 9: System.Drawing.Common => 0x9be17343c0e7726 => 103
	i64 720058930071658100, ; 10: Xamarin.AndroidX.Legacy.Support.Core.UI => 0x9fe29c82844de74 => 55
	i64 870603111519317375, ; 11: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 16
	i64 872800313462103108, ; 12: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 49
	i64 940822596282819491, ; 13: System.Transactions => 0xd0e792aa81923a3 => 106
	i64 996343623809489702, ; 14: Xamarin.Forms.Platform => 0xdd3b93f3b63db26 => 91
	i64 1000557547492888992, ; 15: Mono.Security.dll => 0xde2b1c9cba651a0 => 120
	i64 1120440138749646132, ; 16: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 93
	i64 1301485588176585670, ; 17: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 15
	i64 1315114680217950157, ; 18: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 34
	i64 1425944114962822056, ; 19: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 4
	i64 1518315023656898250, ; 20: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 17
	i64 1624659445732251991, ; 21: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 32
	i64 1628611045998245443, ; 22: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 64
	i64 1636321030536304333, ; 23: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 56
	i64 1731380447121279447, ; 24: Newtonsoft.Json => 0x18071957e9b889d7 => 9
	i64 1743969030606105336, ; 25: System.Memory.dll => 0x1833d297e88f2af8 => 21
	i64 1795316252682057001, ; 26: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 33
	i64 1836611346387731153, ; 27: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 77
	i64 1875917498431009007, ; 28: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 30
	i64 1981742497975770890, ; 29: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 63
	i64 2064708342624596306, ; 30: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 98
	i64 2133195048986300728, ; 31: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 9
	i64 2136356949452311481, ; 32: Xamarin.AndroidX.MultiDex.dll => 0x1da5dd539d8acbb9 => 68
	i64 2165725771938924357, ; 33: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 37
	i64 2262844636196693701, ; 34: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 49
	i64 2284400282711631002, ; 35: System.Web.Services => 0x1fb3d1f42fd4249a => 111
	i64 2304837677853103545, ; 36: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 76
	i64 2329709569556905518, ; 37: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 59
	i64 2337758774805907496, ; 38: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 24
	i64 2470498323731680442, ; 39: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 43
	i64 2479423007379663237, ; 40: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 83
	i64 2497223385847772520, ; 41: System.Runtime => 0x22a7eb7046413568 => 25
	i64 2547086958574651984, ; 42: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 29
	i64 2592350477072141967, ; 43: System.Xml.dll => 0x23f9e10627330e8f => 26
	i64 2624866290265602282, ; 44: mscorlib.dll => 0x246d65fbde2db8ea => 8
	i64 2694427813909235223, ; 45: Xamarin.AndroidX.Preference.dll => 0x256487d230fe0617 => 72
	i64 2783046991838674048, ; 46: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 24
	i64 2787234703088983483, ; 47: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 79
	i64 2960931600190307745, ; 48: Xamarin.Forms.Core => 0x2917579a49927da1 => 89
	i64 3017704767998173186, ; 49: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 93
	i64 3289520064315143713, ; 50: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 58
	i64 3303437397778967116, ; 51: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 31
	i64 3311221304742556517, ; 52: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 23
	i64 3344514922410554693, ; 53: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 101
	i64 3493805808809882663, ; 54: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 81
	i64 3500754593174728706, ; 55: TermTracker1 => 0x30952dc133ff3002 => 28
	i64 3522470458906976663, ; 56: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 80
	i64 3531994851595924923, ; 57: System.Numerics => 0x31042a9aade235bb => 22
	i64 3571415421602489686, ; 58: System.Runtime.dll => 0x319037675df7e556 => 25
	i64 3716579019761409177, ; 59: netstandard.dll => 0x3393f0ed5c8c5c99 => 104
	i64 3727469159507183293, ; 60: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 75
	i64 3772598417116884899, ; 61: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 50
	i64 3966267475168208030, ; 62: System.Memory => 0x370b03412596249e => 21
	i64 4187479170553454871, ; 63: System.Linq.Expressions => 0x3a1cea1e912fa117 => 114
	i64 4201423742386704971, ; 64: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 44
	i64 4337444564132831293, ; 65: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 14
	i64 4525561845656915374, ; 66: System.ServiceModel.Internals => 0x3ece06856b710dae => 102
	i64 4636684751163556186, ; 67: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 85
	i64 4759461199762736555, ; 68: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 61
	i64 4782108999019072045, ; 69: Xamarin.AndroidX.AsyncLayoutInflater.dll => 0x425d76cc43bb0a2d => 36
	i64 4794310189461587505, ; 70: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 29
	i64 4795410492532947900, ; 71: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 80
	i64 5081566143765835342, ; 72: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 1
	i64 5099468265966638712, ; 73: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 1
	i64 5142919913060024034, ; 74: Xamarin.Forms.Platform.Android.dll => 0x475f52699e39bee2 => 90
	i64 5203618020066742981, ; 75: Xamarin.Essentials => 0x4836f704f0e652c5 => 88
	i64 5205316157927637098, ; 76: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 66
	i64 5348796042099802469, ; 77: Xamarin.AndroidX.Media => 0x4a3abda9415fc165 => 67
	i64 5376510917114486089, ; 78: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 83
	i64 5408338804355907810, ; 79: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 82
	i64 5446034149219586269, ; 80: System.Diagnostics.Debug => 0x4b94333452e150dd => 112
	i64 5451019430259338467, ; 81: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 42
	i64 5507995362134886206, ; 82: System.Core.dll => 0x4c705499688c873e => 19
	i64 5528247634813456972, ; 83: Plugin.LocalNotification.dll => 0x4cb847ef1773124c => 10
	i64 5692067934154308417, ; 84: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 87
	i64 5757522595884336624, ; 85: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 40
	i64 5814345312393086621, ; 86: Xamarin.AndroidX.Preference => 0x50b0b44182a5c69d => 72
	i64 5896680224035167651, ; 87: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 60
	i64 6085203216496545422, ; 88: Xamarin.Forms.Platform.dll => 0x5472fc15a9574e8e => 91
	i64 6086316965293125504, ; 89: FormsViewGroup.dll => 0x5476f10882baef80 => 5
	i64 6183170893902868313, ; 90: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 14
	i64 6252756117335416132, ; 91: SQLiteNetExtensionsAsync.dll => 0x56c6408f68ed9d44 => 13
	i64 6319713645133255417, ; 92: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 62
	i64 6341946009088310164, ; 93: TermTracker1.Android.dll => 0x58031e4b506a3b94 => 0
	i64 6401687960814735282, ; 94: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 59
	i64 6504860066809920875, ; 95: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 37
	i64 6548213210057960872, ; 96: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 47
	i64 6591024623626361694, ; 97: System.Web.Services.dll => 0x5b7805f9751a1b5e => 111
	i64 6659513131007730089, ; 98: Xamarin.AndroidX.Legacy.Support.Core.UI.dll => 0x5c6b57e8b6c3e1a9 => 55
	i64 6876862101832370452, ; 99: System.Xml.Linq => 0x5f6f85a57d108914 => 27
	i64 6894844156784520562, ; 100: System.Numerics.Vectors => 0x5faf683aead1ad72 => 23
	i64 6999232271162345813, ; 101: SQLiteNetExtensions => 0x612244aac7150955 => 12
	i64 7036436454368433159, ; 102: Xamarin.AndroidX.Legacy.Support.V4.dll => 0x61a671acb33d5407 => 57
	i64 7103753931438454322, ; 103: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 54
	i64 7270811800166795866, ; 104: System.Linq => 0x64e71ccf51a90a5a => 116
	i64 7338192458477945005, ; 105: System.Reflection => 0x65d67f295d0740ad => 115
	i64 7488575175965059935, ; 106: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 27
	i64 7489048572193775167, ; 107: System.ObjectModel => 0x67ee71ff6b419e3f => 117
	i64 7547171332664898270, ; 108: SQLiteNetExtensions.dll => 0x68bcf0572680b2de => 12
	i64 7635363394907363464, ; 109: Xamarin.Forms.Core.dll => 0x69f6428dc4795888 => 89
	i64 7637365915383206639, ; 110: Xamarin.Essentials.dll => 0x69fd5fd5e61792ef => 88
	i64 7654504624184590948, ; 111: System.Net.Http => 0x6a3a4366801b8264 => 3
	i64 7735352534559001595, ; 112: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 97
	i64 7820441508502274321, ; 113: System.Data => 0x6c87ca1e14ff8111 => 105
	i64 7836164640616011524, ; 114: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 32
	i64 8044118961405839122, ; 115: System.ComponentModel.Composition => 0x6fa2739369944712 => 110
	i64 8064050204834738623, ; 116: System.Collections.dll => 0x6fe942efa61731bf => 113
	i64 8083354569033831015, ; 117: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 58
	i64 8103644804370223335, ; 118: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 107
	i64 8113615946733131500, ; 119: System.Reflection.Extensions => 0x70995ab73cf916ec => 2
	i64 8167236081217502503, ; 120: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 6
	i64 8185542183669246576, ; 121: System.Collections => 0x7198e33f4794aa70 => 113
	i64 8187640529827139739, ; 122: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 100
	i64 8290740647658429042, ; 123: System.Runtime.Extensions => 0x730ea0b15c929a72 => 118
	i64 8398329775253868912, ; 124: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 41
	i64 8400357532724379117, ; 125: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 71
	i64 8426919725312979251, ; 126: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 61
	i64 8598790081731763592, ; 127: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 52
	i64 8601935802264776013, ; 128: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 82
	i64 8626175481042262068, ; 129: Java.Interop => 0x77b654e585b55834 => 6
	i64 8639588376636138208, ; 130: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 70
	i64 8684531736582871431, ; 131: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 109
	i64 8853378295825400934, ; 132: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 96
	i64 8951477988056063522, ; 133: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 74
	i64 9122838066389988801, ; 134: TermTracker1.dll => 0x7e9ad4e2f29635c1 => 28
	i64 9312692141327339315, ; 135: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 87
	i64 9324707631942237306, ; 136: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 33
	i64 9662334977499516867, ; 137: System.Numerics.dll => 0x8617827802b0cfc3 => 22
	i64 9678050649315576968, ; 138: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 43
	i64 9711637524876806384, ; 139: Xamarin.AndroidX.Media.dll => 0x86c6aadfd9a2c8f0 => 67
	i64 9808709177481450983, ; 140: Mono.Android.dll => 0x881f890734e555e7 => 7
	i64 9825649861376906464, ; 141: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 40
	i64 9834056768316610435, ; 142: System.Transactions.dll => 0x8879968718899783 => 106
	i64 9907349773706910547, ; 143: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 52
	i64 9998632235833408227, ; 144: Mono.Security => 0x8ac2470b209ebae3 => 120
	i64 10038780035334861115, ; 145: System.Net.Http.dll => 0x8b50e941206af13b => 3
	i64 10226222362177979215, ; 146: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 98
	i64 10229024438826829339, ; 147: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 47
	i64 10321854143672141184, ; 148: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 95
	i64 10376576884623852283, ; 149: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 81
	i64 10406448008575299332, ; 150: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 101
	i64 10430153318873392755, ; 151: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 45
	i64 10714184849103829812, ; 152: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 118
	i64 10847732767863316357, ; 153: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 34
	i64 11023048688141570732, ; 154: System.Core => 0x98f9bc61168392ac => 19
	i64 11037814507248023548, ; 155: System.Xml => 0x992e31d0412bf7fc => 26
	i64 11162124722117608902, ; 156: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 86
	i64 11340910727871153756, ; 157: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 46
	i64 11392833485892708388, ; 158: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 73
	i64 11529969570048099689, ; 159: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 86
	i64 11578238080964724296, ; 160: Xamarin.AndroidX.Legacy.Support.V4 => 0xa0ae2a30c4cd8648 => 57
	i64 11580057168383206117, ; 161: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 30
	i64 11591352189662810718, ; 162: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 79
	i64 11597940890313164233, ; 163: netstandard => 0xa0f429ca8d1805c9 => 104
	i64 11672361001936329215, ; 164: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 54
	i64 11739066727115742305, ; 165: SQLite-net.dll => 0xa2e98afdf8575c61 => 11
	i64 11743665907891708234, ; 166: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 119
	i64 11806260347154423189, ; 167: SQLite-net => 0xa3d8433bc5eb5d95 => 11
	i64 12102847907131387746, ; 168: System.Buffers => 0xa7f5f40c43256f62 => 18
	i64 12123043025855404482, ; 169: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 2
	i64 12137774235383566651, ; 170: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 84
	i64 12279246230491828964, ; 171: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 17
	i64 12451044538927396471, ; 172: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 53
	i64 12466513435562512481, ; 173: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 65
	i64 12487638416075308985, ; 174: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 48
	i64 12538491095302438457, ; 175: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 38
	i64 12550732019250633519, ; 176: System.IO.Compression => 0xae2d28465e8e1b2f => 108
	i64 12700543734426720211, ; 177: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 39
	i64 12828192437253469131, ; 178: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 99
	i64 12963446364377008305, ; 179: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 103
	i64 13129914918964716986, ; 180: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 51
	i64 13370592475155966277, ; 181: System.Runtime.Serialization => 0xb98de304062ea945 => 4
	i64 13401370062847626945, ; 182: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 84
	i64 13404347523447273790, ; 183: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 41
	i64 13454009404024712428, ; 184: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 94
	i64 13465488254036897740, ; 185: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 97
	i64 13491513212026656886, ; 186: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 35
	i64 13572454107664307259, ; 187: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 75
	i64 13647894001087880694, ; 188: System.Data.dll => 0xbd670f48cb071df6 => 105
	i64 13802825973146328710, ; 189: SQLiteNetExtensionsAsync => 0xbf8d7d1791ec1e86 => 13
	i64 13828521679616088467, ; 190: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 96
	i64 13959074834287824816, ; 191: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 53
	i64 13967638549803255703, ; 192: Xamarin.Forms.Platform.Android => 0xc1d70541e0134797 => 90
	i64 14124974489674258913, ; 193: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 38
	i64 14172845254133543601, ; 194: Xamarin.AndroidX.MultiDex => 0xc4b00faaed35f2b1 => 68
	i64 14261073672896646636, ; 195: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 73
	i64 14327695147300244862, ; 196: System.Reflection.dll => 0xc6d632d338eb4d7e => 115
	i64 14486659737292545672, ; 197: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 60
	i64 14495724990987328804, ; 198: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 76
	i64 14644440854989303794, ; 199: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 66
	i64 14792063746108907174, ; 200: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 94
	i64 14852515768018889994, ; 201: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 46
	i64 14987728460634540364, ; 202: System.IO.Compression.dll => 0xcfff1ba06622494c => 108
	i64 14988210264188246988, ; 203: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 48
	i64 15076659072870671916, ; 204: System.ObjectModel.dll => 0xd13b0d8c1620662c => 117
	i64 15133485256822086103, ; 205: System.Linq.dll => 0xd204f0a9127dd9d7 => 116
	i64 15150743910298169673, ; 206: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 74
	i64 15279429628684179188, ; 207: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 100
	i64 15370334346939861994, ; 208: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 45
	i64 15582737692548360875, ; 209: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 64
	i64 15609085926864131306, ; 210: System.dll => 0xd89e9cf3334914ea => 20
	i64 15777549416145007739, ; 211: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 78
	i64 15810740023422282496, ; 212: Xamarin.Forms.Xaml => 0xdb6b08484c22eb00 => 92
	i64 15817206913877585035, ; 213: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 119
	i64 16154507427712707110, ; 214: System => 0xe03056ea4e39aa26 => 20
	i64 16423015068819898779, ; 215: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 99
	i64 16565028646146589191, ; 216: System.ComponentModel.Composition.dll => 0xe5e2cdc9d3bcc207 => 110
	i64 16621146507174665210, ; 217: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 42
	i64 16677317093839702854, ; 218: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 71
	i64 16755018182064898362, ; 219: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 15
	i64 16822611501064131242, ; 220: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 107
	i64 16833383113903931215, ; 221: mscorlib => 0xe99c30c1484d7f4f => 8
	i64 17024911836938395553, ; 222: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 31
	i64 17031351772568316411, ; 223: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 69
	i64 17037200463775726619, ; 224: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 56
	i64 17477010794075399097, ; 225: TermTracker1.Android => 0xf28ad0b8548823b9 => 0
	i64 17544493274320527064, ; 226: Xamarin.AndroidX.AsyncLayoutInflater => 0xf37a8fada41aded8 => 36
	i64 17685921127322830888, ; 227: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 112
	i64 17704177640604968747, ; 228: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 65
	i64 17710060891934109755, ; 229: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 63
	i64 17838668724098252521, ; 230: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 18
	i64 17882897186074144999, ; 231: FormsViewGroup => 0xf82cd03e3ac830e7 => 5
	i64 17891337867145587222, ; 232: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 95
	i64 17892495832318972303, ; 233: Xamarin.Forms.Xaml.dll => 0xf84eea293687918f => 92
	i64 17928294245072900555, ; 234: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 109
	i64 18116111925905154859, ; 235: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 35
	i64 18121036031235206392, ; 236: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 69
	i64 18129453464017766560, ; 237: System.ServiceModel.Internals.dll => 0xfb98c1df1ec108a0 => 102
	i64 18260797123374478311, ; 238: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 51
	i64 18305135509493619199, ; 239: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 70
	i64 18370042311372477656, ; 240: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 16
	i64 18380184030268848184 ; 241: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 85
], align 16
@assembly_image_cache_indices = local_unnamed_addr constant [242 x i32] [
	i32 50, i32 10, i32 7, i32 114, i32 39, i32 77, i32 78, i32 44, ; 0..7
	i32 62, i32 103, i32 55, i32 16, i32 49, i32 106, i32 91, i32 120, ; 8..15
	i32 93, i32 15, i32 34, i32 4, i32 17, i32 32, i32 64, i32 56, ; 16..23
	i32 9, i32 21, i32 33, i32 77, i32 30, i32 63, i32 98, i32 9, ; 24..31
	i32 68, i32 37, i32 49, i32 111, i32 76, i32 59, i32 24, i32 43, ; 32..39
	i32 83, i32 25, i32 29, i32 26, i32 8, i32 72, i32 24, i32 79, ; 40..47
	i32 89, i32 93, i32 58, i32 31, i32 23, i32 101, i32 81, i32 28, ; 48..55
	i32 80, i32 22, i32 25, i32 104, i32 75, i32 50, i32 21, i32 114, ; 56..63
	i32 44, i32 14, i32 102, i32 85, i32 61, i32 36, i32 29, i32 80, ; 64..71
	i32 1, i32 1, i32 90, i32 88, i32 66, i32 67, i32 83, i32 82, ; 72..79
	i32 112, i32 42, i32 19, i32 10, i32 87, i32 40, i32 72, i32 60, ; 80..87
	i32 91, i32 5, i32 14, i32 13, i32 62, i32 0, i32 59, i32 37, ; 88..95
	i32 47, i32 111, i32 55, i32 27, i32 23, i32 12, i32 57, i32 54, ; 96..103
	i32 116, i32 115, i32 27, i32 117, i32 12, i32 89, i32 88, i32 3, ; 104..111
	i32 97, i32 105, i32 32, i32 110, i32 113, i32 58, i32 107, i32 2, ; 112..119
	i32 6, i32 113, i32 100, i32 118, i32 41, i32 71, i32 61, i32 52, ; 120..127
	i32 82, i32 6, i32 70, i32 109, i32 96, i32 74, i32 28, i32 87, ; 128..135
	i32 33, i32 22, i32 43, i32 67, i32 7, i32 40, i32 106, i32 52, ; 136..143
	i32 120, i32 3, i32 98, i32 47, i32 95, i32 81, i32 101, i32 45, ; 144..151
	i32 118, i32 34, i32 19, i32 26, i32 86, i32 46, i32 73, i32 86, ; 152..159
	i32 57, i32 30, i32 79, i32 104, i32 54, i32 11, i32 119, i32 11, ; 160..167
	i32 18, i32 2, i32 84, i32 17, i32 53, i32 65, i32 48, i32 38, ; 168..175
	i32 108, i32 39, i32 99, i32 103, i32 51, i32 4, i32 84, i32 41, ; 176..183
	i32 94, i32 97, i32 35, i32 75, i32 105, i32 13, i32 96, i32 53, ; 184..191
	i32 90, i32 38, i32 68, i32 73, i32 115, i32 60, i32 76, i32 66, ; 192..199
	i32 94, i32 46, i32 108, i32 48, i32 117, i32 116, i32 74, i32 100, ; 200..207
	i32 45, i32 64, i32 20, i32 78, i32 92, i32 119, i32 20, i32 99, ; 208..215
	i32 110, i32 42, i32 71, i32 15, i32 107, i32 8, i32 31, i32 69, ; 216..223
	i32 56, i32 0, i32 36, i32 112, i32 65, i32 63, i32 18, i32 5, ; 224..231
	i32 95, i32 92, i32 109, i32 35, i32 69, i32 102, i32 51, i32 70, ; 232..239
	i32 16, i32 85 ; 240..241
], align 16

@marshal_methods_number_of_classes = local_unnamed_addr constant i32 0, align 4

; marshal_methods_class_cache
@marshal_methods_class_cache = global [0 x %struct.MarshalMethodsManagedClass] [
], align 8; end of 'marshal_methods_class_cache' array


@get_function_pointer = internal unnamed_addr global void (i32, i32, i32, i8**)* null, align 8

; Function attributes: "frame-pointer"="none" "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn writeonly
define void @xamarin_app_init (void (i32, i32, i32, i8**)* %fn) local_unnamed_addr #0
{
	store void (i32, i32, i32, i8**)* %fn, void (i32, i32, i32, i8**)** @get_function_pointer, align 8
	ret void
}

; Names of classes in which marshal methods reside
@mm_class_names = local_unnamed_addr constant [0 x i8*] zeroinitializer, align 8
@__MarshalMethodName_name.0 = internal constant [1 x i8] c"\00", align 1

; mm_method_names
@mm_method_names = local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	; 0
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		i8* getelementptr inbounds ([1 x i8], [1 x i8]* @__MarshalMethodName_name.0, i32 0, i32 0); name
	}
], align 16; end of 'mm_method_names' array


attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable willreturn writeonly "frame-pointer"="none" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nounwind sspstrong "stack-protector-buffer-size"="8" uwtable "frame-pointer"="none" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Xamarin.Android remotes/origin/d17-5 @ 45b0e144f73b2c8747d8b5ec8cbd3b55beca67f0"}
!llvm.linker.options = !{}
