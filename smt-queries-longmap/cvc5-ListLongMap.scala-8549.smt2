; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104344 () Bool)

(assert start!104344)

(declare-fun b!1245936 () Bool)

(declare-fun res!831352 () Bool)

(declare-fun e!706571 () Bool)

(assert (=> b!1245936 (=> (not res!831352) (not e!706571))))

(declare-datatypes ((List!27487 0))(
  ( (Nil!27484) (Cons!27483 (h!28692 (_ BitVec 64)) (t!40956 List!27487)) )
))
(declare-fun contains!7453 (List!27487 (_ BitVec 64)) Bool)

(assert (=> b!1245936 (= res!831352 (not (contains!7453 Nil!27484 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245937 () Bool)

(declare-fun res!831344 () Bool)

(assert (=> b!1245937 (=> (not res!831344) (not e!706571))))

(declare-fun lt!562995 () List!27487)

(assert (=> b!1245937 (= res!831344 (not (contains!7453 lt!562995 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245938 () Bool)

(declare-fun subseq!653 (List!27487 List!27487) Bool)

(assert (=> b!1245938 (= e!706571 (not (subseq!653 Nil!27484 lt!562995)))))

(declare-fun b!1245939 () Bool)

(declare-fun res!831346 () Bool)

(declare-fun e!706570 () Bool)

(assert (=> b!1245939 (=> (not res!831346) (not e!706570))))

(declare-datatypes ((array!80208 0))(
  ( (array!80209 (arr!38684 (Array (_ BitVec 32) (_ BitVec 64))) (size!39220 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80208)

(declare-fun from!3270 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!80208 (_ BitVec 32) List!27487) Bool)

(assert (=> b!1245939 (= res!831346 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27484))))

(declare-fun b!1245940 () Bool)

(declare-fun res!831343 () Bool)

(assert (=> b!1245940 (=> (not res!831343) (not e!706570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245940 (= res!831343 (validKeyInArray!0 (select (arr!38684 a!3892) from!3270)))))

(declare-fun b!1245941 () Bool)

(declare-fun res!831348 () Bool)

(assert (=> b!1245941 (=> (not res!831348) (not e!706570))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1245941 (= res!831348 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39220 a!3892)) (not (= newFrom!287 (size!39220 a!3892)))))))

(declare-fun b!1245942 () Bool)

(declare-fun res!831347 () Bool)

(assert (=> b!1245942 (=> (not res!831347) (not e!706571))))

(assert (=> b!1245942 (= res!831347 (not (contains!7453 lt!562995 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!831349 () Bool)

(assert (=> start!104344 (=> (not res!831349) (not e!706570))))

(assert (=> start!104344 (= res!831349 (and (bvslt (size!39220 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39220 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39220 a!3892))))))

(assert (=> start!104344 e!706570))

(declare-fun array_inv!29532 (array!80208) Bool)

(assert (=> start!104344 (array_inv!29532 a!3892)))

(assert (=> start!104344 true))

(declare-fun b!1245943 () Bool)

(assert (=> b!1245943 (= e!706570 e!706571)))

(declare-fun res!831345 () Bool)

(assert (=> b!1245943 (=> (not res!831345) (not e!706571))))

(assert (=> b!1245943 (= res!831345 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245943 (= lt!562995 (Cons!27483 (select (arr!38684 a!3892) from!3270) Nil!27484))))

(declare-fun b!1245944 () Bool)

(declare-fun res!831351 () Bool)

(assert (=> b!1245944 (=> (not res!831351) (not e!706571))))

(assert (=> b!1245944 (= res!831351 (not (contains!7453 Nil!27484 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245945 () Bool)

(declare-fun res!831350 () Bool)

(assert (=> b!1245945 (=> (not res!831350) (not e!706571))))

(declare-fun noDuplicate!2032 (List!27487) Bool)

(assert (=> b!1245945 (= res!831350 (noDuplicate!2032 lt!562995))))

(assert (= (and start!104344 res!831349) b!1245939))

(assert (= (and b!1245939 res!831346) b!1245941))

(assert (= (and b!1245941 res!831348) b!1245940))

(assert (= (and b!1245940 res!831343) b!1245943))

(assert (= (and b!1245943 res!831345) b!1245945))

(assert (= (and b!1245945 res!831350) b!1245942))

(assert (= (and b!1245942 res!831347) b!1245937))

(assert (= (and b!1245937 res!831344) b!1245936))

(assert (= (and b!1245936 res!831352) b!1245944))

(assert (= (and b!1245944 res!831351) b!1245938))

(declare-fun m!1147889 () Bool)

(assert (=> start!104344 m!1147889))

(declare-fun m!1147891 () Bool)

(assert (=> b!1245945 m!1147891))

(declare-fun m!1147893 () Bool)

(assert (=> b!1245938 m!1147893))

(declare-fun m!1147895 () Bool)

(assert (=> b!1245937 m!1147895))

(declare-fun m!1147897 () Bool)

(assert (=> b!1245942 m!1147897))

(declare-fun m!1147899 () Bool)

(assert (=> b!1245944 m!1147899))

(declare-fun m!1147901 () Bool)

(assert (=> b!1245940 m!1147901))

(assert (=> b!1245940 m!1147901))

(declare-fun m!1147903 () Bool)

(assert (=> b!1245940 m!1147903))

(assert (=> b!1245943 m!1147901))

(declare-fun m!1147905 () Bool)

(assert (=> b!1245936 m!1147905))

(declare-fun m!1147907 () Bool)

(assert (=> b!1245939 m!1147907))

(push 1)

(assert (not b!1245939))

(assert (not b!1245937))

(assert (not b!1245940))

(assert (not start!104344))

(assert (not b!1245938))

(assert (not b!1245936))

(assert (not b!1245942))

(assert (not b!1245945))

(assert (not b!1245944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137525 () Bool)

(assert (=> d!137525 (= (validKeyInArray!0 (select (arr!38684 a!3892) from!3270)) (and (not (= (select (arr!38684 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38684 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245940 d!137525))

(declare-fun d!137527 () Bool)

(declare-fun res!831423 () Bool)

(declare-fun e!706602 () Bool)

(assert (=> d!137527 (=> res!831423 e!706602)))

(assert (=> d!137527 (= res!831423 (is-Nil!27484 lt!562995))))

(assert (=> d!137527 (= (noDuplicate!2032 lt!562995) e!706602)))

(declare-fun b!1246020 () Bool)

(declare-fun e!706603 () Bool)

(assert (=> b!1246020 (= e!706602 e!706603)))

(declare-fun res!831424 () Bool)

(assert (=> b!1246020 (=> (not res!831424) (not e!706603))))

(assert (=> b!1246020 (= res!831424 (not (contains!7453 (t!40956 lt!562995) (h!28692 lt!562995))))))

(declare-fun b!1246021 () Bool)

(assert (=> b!1246021 (= e!706603 (noDuplicate!2032 (t!40956 lt!562995)))))

(assert (= (and d!137527 (not res!831423)) b!1246020))

(assert (= (and b!1246020 res!831424) b!1246021))

(declare-fun m!1147949 () Bool)

(assert (=> b!1246020 m!1147949))

(declare-fun m!1147951 () Bool)

(assert (=> b!1246021 m!1147951))

(assert (=> b!1245945 d!137527))

(declare-fun d!137531 () Bool)

(declare-fun lt!563006 () Bool)

(declare-fun content!628 (List!27487) (Set (_ BitVec 64)))

(assert (=> d!137531 (= lt!563006 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!628 lt!562995)))))

(declare-fun e!706625 () Bool)

(assert (=> d!137531 (= lt!563006 e!706625)))

(declare-fun res!831442 () Bool)

(assert (=> d!137531 (=> (not res!831442) (not e!706625))))

(assert (=> d!137531 (= res!831442 (is-Cons!27483 lt!562995))))

(assert (=> d!137531 (= (contains!7453 lt!562995 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563006)))

(declare-fun b!1246045 () Bool)

(declare-fun e!706624 () Bool)

(assert (=> b!1246045 (= e!706625 e!706624)))

(declare-fun res!831443 () Bool)

(assert (=> b!1246045 (=> res!831443 e!706624)))

(assert (=> b!1246045 (= res!831443 (= (h!28692 lt!562995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246046 () Bool)

(assert (=> b!1246046 (= e!706624 (contains!7453 (t!40956 lt!562995) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137531 res!831442) b!1246045))

(assert (= (and b!1246045 (not res!831443)) b!1246046))

(declare-fun m!1147957 () Bool)

(assert (=> d!137531 m!1147957))

(declare-fun m!1147959 () Bool)

(assert (=> d!137531 m!1147959))

(declare-fun m!1147961 () Bool)

(assert (=> b!1246046 m!1147961))

(assert (=> b!1245942 d!137531))

(declare-fun d!137535 () Bool)

(declare-fun lt!563007 () Bool)

(assert (=> d!137535 (= lt!563007 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!628 Nil!27484)))))

(declare-fun e!706627 () Bool)

(assert (=> d!137535 (= lt!563007 e!706627)))

(declare-fun res!831444 () Bool)

(assert (=> d!137535 (=> (not res!831444) (not e!706627))))

(assert (=> d!137535 (= res!831444 (is-Cons!27483 Nil!27484))))

(assert (=> d!137535 (= (contains!7453 Nil!27484 #b0000000000000000000000000000000000000000000000000000000000000000) lt!563007)))

(declare-fun b!1246047 () Bool)

(declare-fun e!706626 () Bool)

(assert (=> b!1246047 (= e!706627 e!706626)))

(declare-fun res!831445 () Bool)

(assert (=> b!1246047 (=> res!831445 e!706626)))

(assert (=> b!1246047 (= res!831445 (= (h!28692 Nil!27484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246048 () Bool)

(assert (=> b!1246048 (= e!706626 (contains!7453 (t!40956 Nil!27484) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137535 res!831444) b!1246047))

(assert (= (and b!1246047 (not res!831445)) b!1246048))

(declare-fun m!1147963 () Bool)

(assert (=> d!137535 m!1147963))

(declare-fun m!1147965 () Bool)

(assert (=> d!137535 m!1147965))

(declare-fun m!1147967 () Bool)

(assert (=> b!1246048 m!1147967))

(assert (=> b!1245936 d!137535))

(declare-fun b!1246075 () Bool)

(declare-fun e!706652 () Bool)

(assert (=> b!1246075 (= e!706652 (subseq!653 Nil!27484 (t!40956 lt!562995)))))

(declare-fun b!1246072 () Bool)

(declare-fun e!706650 () Bool)

(declare-fun e!706653 () Bool)

(assert (=> b!1246072 (= e!706650 e!706653)))

(declare-fun res!831467 () Bool)

(assert (=> b!1246072 (=> (not res!831467) (not e!706653))))

(assert (=> b!1246072 (= res!831467 (is-Cons!27483 lt!562995))))

(declare-fun d!137537 () Bool)

(declare-fun res!831470 () Bool)

(assert (=> d!137537 (=> res!831470 e!706650)))

(assert (=> d!137537 (= res!831470 (is-Nil!27484 Nil!27484))))

(assert (=> d!137537 (= (subseq!653 Nil!27484 lt!562995) e!706650)))

(declare-fun b!1246074 () Bool)

(declare-fun e!706651 () Bool)

(assert (=> b!1246074 (= e!706651 (subseq!653 (t!40956 Nil!27484) (t!40956 lt!562995)))))

(declare-fun b!1246073 () Bool)

(assert (=> b!1246073 (= e!706653 e!706652)))

(declare-fun res!831469 () Bool)

(assert (=> b!1246073 (=> res!831469 e!706652)))

(assert (=> b!1246073 (= res!831469 e!706651)))

(declare-fun res!831468 () Bool)

(assert (=> b!1246073 (=> (not res!831468) (not e!706651))))

(assert (=> b!1246073 (= res!831468 (= (h!28692 Nil!27484) (h!28692 lt!562995)))))

(assert (= (and d!137537 (not res!831470)) b!1246072))

(assert (= (and b!1246072 res!831467) b!1246073))

(assert (= (and b!1246073 res!831468) b!1246074))

(assert (= (and b!1246073 (not res!831469)) b!1246075))

(declare-fun m!1147989 () Bool)

(assert (=> b!1246075 m!1147989))

(declare-fun m!1147993 () Bool)

(assert (=> b!1246074 m!1147993))

(assert (=> b!1245938 d!137537))

(declare-fun d!137549 () Bool)

(assert (=> d!137549 (= (array_inv!29532 a!3892) (bvsge (size!39220 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104344 d!137549))

(declare-fun d!137555 () Bool)

(declare-fun lt!563015 () Bool)

(assert (=> d!137555 (= lt!563015 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!628 lt!562995)))))

(declare-fun e!706667 () Bool)

(assert (=> d!137555 (= lt!563015 e!706667)))

(declare-fun res!831483 () Bool)

(assert (=> d!137555 (=> (not res!831483) (not e!706667))))

(assert (=> d!137555 (= res!831483 (is-Cons!27483 lt!562995))))

(assert (=> d!137555 (= (contains!7453 lt!562995 #b1000000000000000000000000000000000000000000000000000000000000000) lt!563015)))

(declare-fun b!1246088 () Bool)

(declare-fun e!706666 () Bool)

(assert (=> b!1246088 (= e!706667 e!706666)))

(declare-fun res!831484 () Bool)

(assert (=> b!1246088 (=> res!831484 e!706666)))

(assert (=> b!1246088 (= res!831484 (= (h!28692 lt!562995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1246089 () Bool)

(assert (=> b!1246089 (= e!706666 (contains!7453 (t!40956 lt!562995) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137555 res!831483) b!1246088))

(assert (= (and b!1246088 (not res!831484)) b!1246089))

(assert (=> d!137555 m!1147957))

(declare-fun m!1148005 () Bool)

(assert (=> d!137555 m!1148005))

(declare-fun m!1148007 () Bool)

(assert (=> b!1246089 m!1148007))

(assert (=> b!1245937 d!137555))

(declare-fun b!1246128 () Bool)

(declare-fun e!706704 () Bool)

(declare-fun call!61515 () Bool)

(assert (=> b!1246128 (= e!706704 call!61515)))

(declare-fun d!137557 () Bool)

(declare-fun res!831520 () Bool)

(declare-fun e!706705 () Bool)

(assert (=> d!137557 (=> res!831520 e!706705)))

(assert (=> d!137557 (= res!831520 (bvsge from!3270 (size!39220 a!3892)))))

(assert (=> d!137557 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27484) e!706705)))

(declare-fun b!1246129 () Bool)

(declare-fun e!706707 () Bool)

(assert (=> b!1246129 (= e!706707 (contains!7453 Nil!27484 (select (arr!38684 a!3892) from!3270)))))

(declare-fun bm!61512 () Bool)

(declare-fun c!121989 () Bool)

(assert (=> bm!61512 (= call!61515 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121989 (Cons!27483 (select (arr!38684 a!3892) from!3270) Nil!27484) Nil!27484)))))

(declare-fun b!1246130 () Bool)

(declare-fun e!706706 () Bool)

(assert (=> b!1246130 (= e!706705 e!706706)))

(declare-fun res!831519 () Bool)

(assert (=> b!1246130 (=> (not res!831519) (not e!706706))))

(assert (=> b!1246130 (= res!831519 (not e!706707))))

(declare-fun res!831521 () Bool)

(assert (=> b!1246130 (=> (not res!831521) (not e!706707))))

(assert (=> b!1246130 (= res!831521 (validKeyInArray!0 (select (arr!38684 a!3892) from!3270)))))

(declare-fun b!1246131 () Bool)

(assert (=> b!1246131 (= e!706706 e!706704)))

(assert (=> b!1246131 (= c!121989 (validKeyInArray!0 (select (arr!38684 a!3892) from!3270)))))

(declare-fun b!1246132 () Bool)

(assert (=> b!1246132 (= e!706704 call!61515)))

(assert (= (and d!137557 (not res!831520)) b!1246130))

(assert (= (and b!1246130 res!831521) b!1246129))

(assert (= (and b!1246130 res!831519) b!1246131))

(assert (= (and b!1246131 c!121989) b!1246132))

(assert (= (and b!1246131 (not c!121989)) b!1246128))

(assert (= (or b!1246132 b!1246128) bm!61512))

(assert (=> b!1246129 m!1147901))

(assert (=> b!1246129 m!1147901))

(declare-fun m!1148029 () Bool)

(assert (=> b!1246129 m!1148029))

(assert (=> bm!61512 m!1147901))

(declare-fun m!1148031 () Bool)

(assert (=> bm!61512 m!1148031))

