; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103132 () Bool)

(assert start!103132)

(declare-fun b!1238373 () Bool)

(declare-fun res!826102 () Bool)

(declare-fun e!701812 () Bool)

(assert (=> b!1238373 (=> res!826102 e!701812)))

(declare-datatypes ((List!27285 0))(
  ( (Nil!27282) (Cons!27281 (h!28490 (_ BitVec 64)) (t!40748 List!27285)) )
))
(declare-fun lt!561292 () List!27285)

(declare-fun noDuplicate!1944 (List!27285) Bool)

(assert (=> b!1238373 (= res!826102 (not (noDuplicate!1944 lt!561292)))))

(declare-fun b!1238374 () Bool)

(declare-fun res!826101 () Bool)

(declare-fun e!701813 () Bool)

(assert (=> b!1238374 (=> (not res!826101) (not e!701813))))

(declare-fun acc!846 () List!27285)

(declare-fun contains!7347 (List!27285 (_ BitVec 64)) Bool)

(assert (=> b!1238374 (= res!826101 (not (contains!7347 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238375 () Bool)

(declare-fun res!826108 () Bool)

(assert (=> b!1238375 (=> (not res!826108) (not e!701813))))

(assert (=> b!1238375 (= res!826108 (not (contains!7347 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826105 () Bool)

(assert (=> start!103132 (=> (not res!826105) (not e!701813))))

(declare-datatypes ((array!79818 0))(
  ( (array!79819 (arr!38512 (Array (_ BitVec 32) (_ BitVec 64))) (size!39048 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79818)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103132 (= res!826105 (and (bvslt (size!39048 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39048 a!3835))))))

(assert (=> start!103132 e!701813))

(declare-fun array_inv!29360 (array!79818) Bool)

(assert (=> start!103132 (array_inv!29360 a!3835)))

(assert (=> start!103132 true))

(declare-fun b!1238376 () Bool)

(declare-fun res!826100 () Bool)

(assert (=> b!1238376 (=> (not res!826100) (not e!701813))))

(assert (=> b!1238376 (= res!826100 (not (= from!3213 (bvsub (size!39048 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238377 () Bool)

(declare-fun res!826098 () Bool)

(assert (=> b!1238377 (=> (not res!826098) (not e!701813))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238377 (= res!826098 (validKeyInArray!0 (select (arr!38512 a!3835) from!3213)))))

(declare-fun b!1238378 () Bool)

(declare-fun res!826099 () Bool)

(assert (=> b!1238378 (=> (not res!826099) (not e!701813))))

(assert (=> b!1238378 (= res!826099 (noDuplicate!1944 acc!846))))

(declare-fun b!1238379 () Bool)

(declare-fun res!826104 () Bool)

(assert (=> b!1238379 (=> res!826104 e!701812)))

(assert (=> b!1238379 (= res!826104 (contains!7347 lt!561292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238380 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79818 (_ BitVec 32) List!27285) Bool)

(assert (=> b!1238380 (= e!701812 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561292))))

(declare-datatypes ((Unit!41110 0))(
  ( (Unit!41111) )
))
(declare-fun lt!561290 () Unit!41110)

(declare-fun noDuplicateSubseq!82 (List!27285 List!27285) Unit!41110)

(assert (=> b!1238380 (= lt!561290 (noDuplicateSubseq!82 acc!846 lt!561292))))

(declare-fun b!1238381 () Bool)

(declare-fun res!826107 () Bool)

(assert (=> b!1238381 (=> (not res!826107) (not e!701813))))

(assert (=> b!1238381 (= res!826107 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238382 () Bool)

(declare-fun res!826103 () Bool)

(assert (=> b!1238382 (=> res!826103 e!701812)))

(assert (=> b!1238382 (= res!826103 (contains!7347 lt!561292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238383 () Bool)

(assert (=> b!1238383 (= e!701813 (not e!701812))))

(declare-fun res!826106 () Bool)

(assert (=> b!1238383 (=> res!826106 e!701812)))

(assert (=> b!1238383 (= res!826106 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!601 (List!27285 List!27285) Bool)

(assert (=> b!1238383 (subseq!601 acc!846 lt!561292)))

(declare-fun lt!561293 () Unit!41110)

(declare-fun subseqTail!88 (List!27285 List!27285) Unit!41110)

(assert (=> b!1238383 (= lt!561293 (subseqTail!88 lt!561292 lt!561292))))

(assert (=> b!1238383 (subseq!601 lt!561292 lt!561292)))

(declare-fun lt!561291 () Unit!41110)

(declare-fun lemmaListSubSeqRefl!0 (List!27285) Unit!41110)

(assert (=> b!1238383 (= lt!561291 (lemmaListSubSeqRefl!0 lt!561292))))

(assert (=> b!1238383 (= lt!561292 (Cons!27281 (select (arr!38512 a!3835) from!3213) acc!846))))

(declare-fun b!1238384 () Bool)

(declare-fun res!826097 () Bool)

(assert (=> b!1238384 (=> (not res!826097) (not e!701813))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238384 (= res!826097 (contains!7347 acc!846 k!2925))))

(assert (= (and start!103132 res!826105) b!1238378))

(assert (= (and b!1238378 res!826099) b!1238374))

(assert (= (and b!1238374 res!826101) b!1238375))

(assert (= (and b!1238375 res!826108) b!1238381))

(assert (= (and b!1238381 res!826107) b!1238384))

(assert (= (and b!1238384 res!826097) b!1238376))

(assert (= (and b!1238376 res!826100) b!1238377))

(assert (= (and b!1238377 res!826098) b!1238383))

(assert (= (and b!1238383 (not res!826106)) b!1238373))

(assert (= (and b!1238373 (not res!826102)) b!1238382))

(assert (= (and b!1238382 (not res!826103)) b!1238379))

(assert (= (and b!1238379 (not res!826104)) b!1238380))

(declare-fun m!1141923 () Bool)

(assert (=> b!1238381 m!1141923))

(declare-fun m!1141925 () Bool)

(assert (=> b!1238378 m!1141925))

(declare-fun m!1141927 () Bool)

(assert (=> b!1238373 m!1141927))

(declare-fun m!1141929 () Bool)

(assert (=> b!1238380 m!1141929))

(declare-fun m!1141931 () Bool)

(assert (=> b!1238380 m!1141931))

(declare-fun m!1141933 () Bool)

(assert (=> b!1238382 m!1141933))

(declare-fun m!1141935 () Bool)

(assert (=> b!1238374 m!1141935))

(declare-fun m!1141937 () Bool)

(assert (=> b!1238377 m!1141937))

(assert (=> b!1238377 m!1141937))

(declare-fun m!1141939 () Bool)

(assert (=> b!1238377 m!1141939))

(declare-fun m!1141941 () Bool)

(assert (=> b!1238375 m!1141941))

(declare-fun m!1141943 () Bool)

(assert (=> b!1238383 m!1141943))

(declare-fun m!1141945 () Bool)

(assert (=> b!1238383 m!1141945))

(declare-fun m!1141947 () Bool)

(assert (=> b!1238383 m!1141947))

(declare-fun m!1141949 () Bool)

(assert (=> b!1238383 m!1141949))

(assert (=> b!1238383 m!1141937))

(declare-fun m!1141951 () Bool)

(assert (=> start!103132 m!1141951))

(declare-fun m!1141953 () Bool)

(assert (=> b!1238379 m!1141953))

(declare-fun m!1141955 () Bool)

(assert (=> b!1238384 m!1141955))

(push 1)

(assert (not start!103132))

(assert (not b!1238384))

(assert (not b!1238383))

(assert (not b!1238382))

(assert (not b!1238381))

(assert (not b!1238373))

(assert (not b!1238380))

(assert (not b!1238378))

(assert (not b!1238377))

(assert (not b!1238375))

(assert (not b!1238379))

(assert (not b!1238374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1238425 () Bool)

(declare-fun e!701853 () Bool)

(declare-fun e!701854 () Bool)

(assert (=> b!1238425 (= e!701853 e!701854)))

(declare-fun res!826147 () Bool)

(assert (=> b!1238425 (=> (not res!826147) (not e!701854))))

(declare-fun e!701855 () Bool)

(assert (=> b!1238425 (= res!826147 (not e!701855))))

(declare-fun res!826146 () Bool)

(assert (=> b!1238425 (=> (not res!826146) (not e!701855))))

(assert (=> b!1238425 (= res!826146 (validKeyInArray!0 (select (arr!38512 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1238426 () Bool)

(declare-fun e!701856 () Bool)

(declare-fun call!61057 () Bool)

(assert (=> b!1238426 (= e!701856 call!61057)))

(declare-fun c!121000 () Bool)

(declare-fun bm!61054 () Bool)

(assert (=> bm!61054 (= call!61057 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213 #b00000000000000000000000000000001) (ite c!121000 (Cons!27281 (select (arr!38512 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) lt!561292) lt!561292)))))

(declare-fun b!1238427 () Bool)

(assert (=> b!1238427 (= e!701854 e!701856)))

(assert (=> b!1238427 (= c!121000 (validKeyInArray!0 (select (arr!38512 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1238428 () Bool)

(assert (=> b!1238428 (= e!701855 (contains!7347 lt!561292 (select (arr!38512 a!3835) (bvadd #b00000000000000000000000000000001 from!3213))))))

(declare-fun b!1238429 () Bool)

(assert (=> b!1238429 (= e!701856 call!61057)))

(declare-fun d!135861 () Bool)

(declare-fun res!826145 () Bool)

(assert (=> d!135861 (=> res!826145 e!701853)))

(assert (=> d!135861 (= res!826145 (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39048 a!3835)))))

(assert (=> d!135861 (= (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!561292) e!701853)))

(assert (= (and d!135861 (not res!826145)) b!1238425))

(assert (= (and b!1238425 res!826146) b!1238428))

(assert (= (and b!1238425 res!826147) b!1238427))

(assert (= (and b!1238427 c!121000) b!1238426))

(assert (= (and b!1238427 (not c!121000)) b!1238429))

(assert (= (or b!1238426 b!1238429) bm!61054))

(declare-fun m!1141977 () Bool)

(assert (=> b!1238425 m!1141977))

(assert (=> b!1238425 m!1141977))

(declare-fun m!1141979 () Bool)

(assert (=> b!1238425 m!1141979))

(assert (=> bm!61054 m!1141977))

(declare-fun m!1141987 () Bool)

(assert (=> bm!61054 m!1141987))

(assert (=> b!1238427 m!1141977))

(assert (=> b!1238427 m!1141977))

(assert (=> b!1238427 m!1141979))

(assert (=> b!1238428 m!1141977))

(assert (=> b!1238428 m!1141977))

(declare-fun m!1141989 () Bool)

(assert (=> b!1238428 m!1141989))

(assert (=> b!1238380 d!135861))

(declare-fun d!135869 () Bool)

(assert (=> d!135869 (noDuplicate!1944 acc!846)))

(declare-fun lt!561307 () Unit!41110)

(declare-fun choose!1830 (List!27285 List!27285) Unit!41110)

(assert (=> d!135869 (= lt!561307 (choose!1830 acc!846 lt!561292))))

(declare-fun e!701873 () Bool)

(assert (=> d!135869 e!701873))

(declare-fun res!826158 () Bool)

(assert (=> d!135869 (=> (not res!826158) (not e!701873))))

(assert (=> d!135869 (= res!826158 (subseq!601 acc!846 lt!561292))))

(assert (=> d!135869 (= (noDuplicateSubseq!82 acc!846 lt!561292) lt!561307)))

(declare-fun b!1238452 () Bool)

(assert (=> b!1238452 (= e!701873 (noDuplicate!1944 lt!561292))))

(assert (= (and d!135869 res!826158) b!1238452))

(assert (=> d!135869 m!1141925))

(declare-fun m!1142001 () Bool)

(assert (=> d!135869 m!1142001))

(assert (=> d!135869 m!1141947))

(assert (=> b!1238452 m!1141927))

(assert (=> b!1238380 d!135869))

(declare-fun b!1238453 () Bool)

(declare-fun e!701874 () Bool)

(declare-fun e!701875 () Bool)

(assert (=> b!1238453 (= e!701874 e!701875)))

(declare-fun res!826161 () Bool)

(assert (=> b!1238453 (=> (not res!826161) (not e!701875))))

(declare-fun e!701876 () Bool)

(assert (=> b!1238453 (= res!826161 (not e!701876))))

(declare-fun res!826160 () Bool)

(assert (=> b!1238453 (=> (not res!826160) (not e!701876))))

(assert (=> b!1238453 (= res!826160 (validKeyInArray!0 (select (arr!38512 a!3835) from!3213)))))

(declare-fun b!1238454 () Bool)

(declare-fun e!701877 () Bool)

(declare-fun call!61060 () Bool)

(assert (=> b!1238454 (= e!701877 call!61060)))

(declare-fun c!121007 () Bool)

(declare-fun bm!61057 () Bool)

(assert (=> bm!61057 (= call!61060 (arrayNoDuplicates!0 a!3835 (bvadd from!3213 #b00000000000000000000000000000001) (ite c!121007 (Cons!27281 (select (arr!38512 a!3835) from!3213) acc!846) acc!846)))))

(declare-fun b!1238455 () Bool)

(assert (=> b!1238455 (= e!701875 e!701877)))

(assert (=> b!1238455 (= c!121007 (validKeyInArray!0 (select (arr!38512 a!3835) from!3213)))))

(declare-fun b!1238456 () Bool)

(assert (=> b!1238456 (= e!701876 (contains!7347 acc!846 (select (arr!38512 a!3835) from!3213)))))

(declare-fun b!1238457 () Bool)

(assert (=> b!1238457 (= e!701877 call!61060)))

(declare-fun d!135877 () Bool)

(declare-fun res!826159 () Bool)

(assert (=> d!135877 (=> res!826159 e!701874)))

(assert (=> d!135877 (= res!826159 (bvsge from!3213 (size!39048 a!3835)))))

(assert (=> d!135877 (= (arrayNoDuplicates!0 a!3835 from!3213 acc!846) e!701874)))

(assert (= (and d!135877 (not res!826159)) b!1238453))

(assert (= (and b!1238453 res!826160) b!1238456))

(assert (= (and b!1238453 res!826161) b!1238455))

(assert (= (and b!1238455 c!121007) b!1238454))

(assert (= (and b!1238455 (not c!121007)) b!1238457))

(assert (= (or b!1238454 b!1238457) bm!61057))

(assert (=> b!1238453 m!1141937))

(assert (=> b!1238453 m!1141937))

(assert (=> b!1238453 m!1141939))

(assert (=> bm!61057 m!1141937))

(declare-fun m!1142003 () Bool)

(assert (=> bm!61057 m!1142003))

(assert (=> b!1238455 m!1141937))

(assert (=> b!1238455 m!1141937))

(assert (=> b!1238455 m!1141939))

(assert (=> b!1238456 m!1141937))

(assert (=> b!1238456 m!1141937))

(declare-fun m!1142009 () Bool)

(assert (=> b!1238456 m!1142009))

(assert (=> b!1238381 d!135877))

(declare-fun d!135879 () Bool)

(declare-fun lt!561315 () Bool)

(declare-fun content!592 (List!27285) (Set (_ BitVec 64)))

(assert (=> d!135879 (= lt!561315 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!592 lt!561292)))))

(declare-fun e!701905 () Bool)

(assert (=> d!135879 (= lt!561315 e!701905)))

(declare-fun res!826183 () Bool)

(assert (=> d!135879 (=> (not res!826183) (not e!701905))))

(assert (=> d!135879 (= res!826183 (is-Cons!27281 lt!561292))))

(assert (=> d!135879 (= (contains!7347 lt!561292 #b1000000000000000000000000000000000000000000000000000000000000000) lt!561315)))

(declare-fun b!1238490 () Bool)

(declare-fun e!701904 () Bool)

(assert (=> b!1238490 (= e!701905 e!701904)))

(declare-fun res!826182 () Bool)

(assert (=> b!1238490 (=> res!826182 e!701904)))

(assert (=> b!1238490 (= res!826182 (= (h!28490 lt!561292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1238491 () Bool)

(assert (=> b!1238491 (= e!701904 (contains!7347 (t!40748 lt!561292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!135879 res!826183) b!1238490))

(assert (= (and b!1238490 (not res!826182)) b!1238491))

(declare-fun m!1142031 () Bool)

(assert (=> d!135879 m!1142031))

(declare-fun m!1142033 () Bool)

(assert (=> d!135879 m!1142033))

(declare-fun m!1142035 () Bool)

(assert (=> b!1238491 m!1142035))

(assert (=> b!1238379 d!135879))

(declare-fun b!1238522 () Bool)

(declare-fun e!701934 () Bool)

(declare-fun e!701936 () Bool)

(assert (=> b!1238522 (= e!701934 e!701936)))

(declare-fun res!826213 () Bool)

(assert (=> b!1238522 (=> (not res!826213) (not e!701936))))

(assert (=> b!1238522 (= res!826213 (is-Cons!27281 lt!561292))))

(declare-fun b!1238523 () Bool)

(declare-fun e!701935 () Bool)

(assert (=> b!1238523 (= e!701936 e!701935)))

(declare-fun res!826211 () Bool)

(assert (=> b!1238523 (=> res!826211 e!701935)))

(declare-fun e!701937 () Bool)

(assert (=> b!1238523 (= res!826211 e!701937)))

(declare-fun res!826210 () Bool)

(assert (=> b!1238523 (=> (not res!826210) (not e!701937))))

(assert (=> b!1238523 (= res!826210 (= (h!28490 acc!846) (h!28490 lt!561292)))))

(declare-fun b!1238524 () Bool)

(assert (=> b!1238524 (= e!701937 (subseq!601 (t!40748 acc!846) (t!40748 lt!561292)))))

(declare-fun b!1238525 () Bool)

(assert (=> b!1238525 (= e!701935 (subseq!601 acc!846 (t!40748 lt!561292)))))

(declare-fun d!135891 () Bool)

(declare-fun res!826212 () Bool)

(assert (=> d!135891 (=> res!826212 e!701934)))

(assert (=> d!135891 (= res!826212 (is-Nil!27282 acc!846))))

(assert (=> d!135891 (= (subseq!601 acc!846 lt!561292) e!701934)))

(assert (= (and d!135891 (not res!826212)) b!1238522))

(assert (= (and b!1238522 res!826213) b!1238523))

(assert (= (and b!1238523 res!826210) b!1238524))

(assert (= (and b!1238523 (not res!826211)) b!1238525))

(declare-fun m!1142041 () Bool)

(assert (=> b!1238524 m!1142041))

(declare-fun m!1142043 () Bool)

(assert (=> b!1238525 m!1142043))

(assert (=> b!1238383 d!135891))

(declare-fun b!1238594 () Bool)

(declare-fun e!701992 () Unit!41110)

