; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93546 () Bool)

(assert start!93546)

(declare-fun b!1058988 () Bool)

(declare-fun res!706849 () Bool)

(declare-fun e!602406 () Bool)

(assert (=> b!1058988 (=> (not res!706849) (not e!602406))))

(declare-datatypes ((array!66760 0))(
  ( (array!66761 (arr!32095 (Array (_ BitVec 32) (_ BitVec 64))) (size!32632 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66760)

(declare-datatypes ((List!22377 0))(
  ( (Nil!22374) (Cons!22373 (h!23591 (_ BitVec 64)) (t!31676 List!22377)) )
))
(declare-fun arrayNoDuplicates!0 (array!66760 (_ BitVec 32) List!22377) Bool)

(assert (=> b!1058988 (= res!706849 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22374))))

(declare-fun res!706848 () Bool)

(assert (=> start!93546 (=> (not res!706848) (not e!602406))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!93546 (= res!706848 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32632 a!3488)) (bvslt (size!32632 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93546 e!602406))

(assert (=> start!93546 true))

(declare-fun array_inv!24877 (array!66760) Bool)

(assert (=> start!93546 (array_inv!24877 a!3488)))

(declare-fun b!1058989 () Bool)

(declare-fun e!602403 () Bool)

(declare-fun noDuplicate!1573 (List!22377) Bool)

(assert (=> b!1058989 (= e!602403 (noDuplicate!1573 Nil!22374))))

(declare-fun b!1058990 () Bool)

(declare-fun e!602402 () Bool)

(assert (=> b!1058990 (= e!602406 e!602402)))

(declare-fun res!706845 () Bool)

(assert (=> b!1058990 (=> (not res!706845) (not e!602402))))

(declare-fun lt!467088 () array!66760)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058990 (= res!706845 (arrayContainsKey!0 lt!467088 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1058990 (= lt!467088 (array!66761 (store (arr!32095 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32632 a!3488)))))

(declare-fun b!1058991 () Bool)

(declare-fun res!706841 () Bool)

(assert (=> b!1058991 (=> (not res!706841) (not e!602406))))

(assert (=> b!1058991 (= res!706841 (= (select (arr!32095 a!3488) i!1381) k0!2747))))

(declare-fun b!1058992 () Bool)

(declare-fun res!706846 () Bool)

(assert (=> b!1058992 (=> (not res!706846) (not e!602406))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058992 (= res!706846 (validKeyInArray!0 k0!2747))))

(declare-fun b!1058993 () Bool)

(declare-fun e!602401 () Bool)

(assert (=> b!1058993 (= e!602401 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1058994 () Bool)

(declare-fun e!602405 () Bool)

(declare-fun e!602407 () Bool)

(assert (=> b!1058994 (= e!602405 (not e!602407))))

(declare-fun res!706842 () Bool)

(assert (=> b!1058994 (=> res!706842 e!602407)))

(declare-fun lt!467087 () (_ BitVec 32))

(assert (=> b!1058994 (= res!706842 (or (bvsgt lt!467087 i!1381) (bvsle i!1381 lt!467087)))))

(declare-fun e!602404 () Bool)

(assert (=> b!1058994 e!602404))

(declare-fun res!706847 () Bool)

(assert (=> b!1058994 (=> (not res!706847) (not e!602404))))

(assert (=> b!1058994 (= res!706847 (= (select (store (arr!32095 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!467087) k0!2747))))

(declare-fun b!1058995 () Bool)

(assert (=> b!1058995 (= e!602407 e!602403)))

(declare-fun res!706850 () Bool)

(assert (=> b!1058995 (=> res!706850 e!602403)))

(declare-fun lt!467090 () (_ BitVec 32))

(assert (=> b!1058995 (= res!706850 (or (bvslt lt!467087 #b00000000000000000000000000000000) (bvsge lt!467090 (size!32632 a!3488)) (bvsge lt!467087 (size!32632 a!3488))))))

(assert (=> b!1058995 (arrayContainsKey!0 a!3488 k0!2747 lt!467090)))

(declare-datatypes ((Unit!34681 0))(
  ( (Unit!34682) )
))
(declare-fun lt!467086 () Unit!34681)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34681)

(assert (=> b!1058995 (= lt!467086 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467090))))

(assert (=> b!1058995 (= lt!467090 (bvadd #b00000000000000000000000000000001 lt!467087))))

(assert (=> b!1058995 (arrayNoDuplicates!0 a!3488 lt!467087 Nil!22374)))

(declare-fun lt!467089 () Unit!34681)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66760 (_ BitVec 32) (_ BitVec 32)) Unit!34681)

(assert (=> b!1058995 (= lt!467089 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467087))))

(declare-fun b!1058996 () Bool)

(assert (=> b!1058996 (= e!602404 e!602401)))

(declare-fun res!706844 () Bool)

(assert (=> b!1058996 (=> res!706844 e!602401)))

(assert (=> b!1058996 (= res!706844 (or (bvsgt lt!467087 i!1381) (bvsle i!1381 lt!467087)))))

(declare-fun b!1058997 () Bool)

(assert (=> b!1058997 (= e!602402 e!602405)))

(declare-fun res!706843 () Bool)

(assert (=> b!1058997 (=> (not res!706843) (not e!602405))))

(assert (=> b!1058997 (= res!706843 (not (= lt!467087 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66760 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1058997 (= lt!467087 (arrayScanForKey!0 lt!467088 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93546 res!706848) b!1058988))

(assert (= (and b!1058988 res!706849) b!1058992))

(assert (= (and b!1058992 res!706846) b!1058991))

(assert (= (and b!1058991 res!706841) b!1058990))

(assert (= (and b!1058990 res!706845) b!1058997))

(assert (= (and b!1058997 res!706843) b!1058994))

(assert (= (and b!1058994 res!706847) b!1058996))

(assert (= (and b!1058996 (not res!706844)) b!1058993))

(assert (= (and b!1058994 (not res!706842)) b!1058995))

(assert (= (and b!1058995 (not res!706850)) b!1058989))

(declare-fun m!979025 () Bool)

(assert (=> b!1058993 m!979025))

(declare-fun m!979027 () Bool)

(assert (=> b!1058995 m!979027))

(declare-fun m!979029 () Bool)

(assert (=> b!1058995 m!979029))

(declare-fun m!979031 () Bool)

(assert (=> b!1058995 m!979031))

(declare-fun m!979033 () Bool)

(assert (=> b!1058995 m!979033))

(declare-fun m!979035 () Bool)

(assert (=> b!1058994 m!979035))

(declare-fun m!979037 () Bool)

(assert (=> b!1058994 m!979037))

(declare-fun m!979039 () Bool)

(assert (=> b!1058991 m!979039))

(declare-fun m!979041 () Bool)

(assert (=> b!1058989 m!979041))

(declare-fun m!979043 () Bool)

(assert (=> b!1058988 m!979043))

(declare-fun m!979045 () Bool)

(assert (=> start!93546 m!979045))

(declare-fun m!979047 () Bool)

(assert (=> b!1058997 m!979047))

(declare-fun m!979049 () Bool)

(assert (=> b!1058992 m!979049))

(declare-fun m!979051 () Bool)

(assert (=> b!1058990 m!979051))

(assert (=> b!1058990 m!979035))

(check-sat (not b!1058992) (not b!1058990) (not b!1058995) (not b!1058988) (not b!1058989) (not start!93546) (not b!1058997) (not b!1058993))
(check-sat)
(get-model)

(declare-fun d!128915 () Bool)

(assert (=> d!128915 (= (array_inv!24877 a!3488) (bvsge (size!32632 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93546 d!128915))

(declare-fun d!128917 () Bool)

(declare-fun res!706915 () Bool)

(declare-fun e!602460 () Bool)

(assert (=> d!128917 (=> res!706915 e!602460)))

(assert (=> d!128917 (= res!706915 (= (select (arr!32095 a!3488) i!1381) k0!2747))))

(assert (=> d!128917 (= (arrayContainsKey!0 a!3488 k0!2747 i!1381) e!602460)))

(declare-fun b!1059062 () Bool)

(declare-fun e!602461 () Bool)

(assert (=> b!1059062 (= e!602460 e!602461)))

(declare-fun res!706916 () Bool)

(assert (=> b!1059062 (=> (not res!706916) (not e!602461))))

(assert (=> b!1059062 (= res!706916 (bvslt (bvadd i!1381 #b00000000000000000000000000000001) (size!32632 a!3488)))))

(declare-fun b!1059063 () Bool)

(assert (=> b!1059063 (= e!602461 (arrayContainsKey!0 a!3488 k0!2747 (bvadd i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128917 (not res!706915)) b!1059062))

(assert (= (and b!1059062 res!706916) b!1059063))

(assert (=> d!128917 m!979039))

(declare-fun m!979109 () Bool)

(assert (=> b!1059063 m!979109))

(assert (=> b!1058993 d!128917))

(declare-fun d!128919 () Bool)

(declare-fun res!706924 () Bool)

(declare-fun e!602470 () Bool)

(assert (=> d!128919 (=> res!706924 e!602470)))

(assert (=> d!128919 (= res!706924 (bvsge #b00000000000000000000000000000000 (size!32632 a!3488)))))

(assert (=> d!128919 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22374) e!602470)))

(declare-fun b!1059074 () Bool)

(declare-fun e!602473 () Bool)

(declare-fun call!44918 () Bool)

(assert (=> b!1059074 (= e!602473 call!44918)))

(declare-fun b!1059075 () Bool)

(declare-fun e!602472 () Bool)

(assert (=> b!1059075 (= e!602470 e!602472)))

(declare-fun res!706923 () Bool)

(assert (=> b!1059075 (=> (not res!706923) (not e!602472))))

(declare-fun e!602471 () Bool)

(assert (=> b!1059075 (= res!706923 (not e!602471))))

(declare-fun res!706925 () Bool)

(assert (=> b!1059075 (=> (not res!706925) (not e!602471))))

(assert (=> b!1059075 (= res!706925 (validKeyInArray!0 (select (arr!32095 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1059076 () Bool)

(assert (=> b!1059076 (= e!602472 e!602473)))

(declare-fun c!107543 () Bool)

(assert (=> b!1059076 (= c!107543 (validKeyInArray!0 (select (arr!32095 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44915 () Bool)

(assert (=> bm!44915 (= call!44918 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107543 (Cons!22373 (select (arr!32095 a!3488) #b00000000000000000000000000000000) Nil!22374) Nil!22374)))))

(declare-fun b!1059077 () Bool)

(assert (=> b!1059077 (= e!602473 call!44918)))

(declare-fun b!1059078 () Bool)

(declare-fun contains!6224 (List!22377 (_ BitVec 64)) Bool)

(assert (=> b!1059078 (= e!602471 (contains!6224 Nil!22374 (select (arr!32095 a!3488) #b00000000000000000000000000000000)))))

(assert (= (and d!128919 (not res!706924)) b!1059075))

(assert (= (and b!1059075 res!706925) b!1059078))

(assert (= (and b!1059075 res!706923) b!1059076))

(assert (= (and b!1059076 c!107543) b!1059074))

(assert (= (and b!1059076 (not c!107543)) b!1059077))

(assert (= (or b!1059074 b!1059077) bm!44915))

(declare-fun m!979111 () Bool)

(assert (=> b!1059075 m!979111))

(assert (=> b!1059075 m!979111))

(declare-fun m!979113 () Bool)

(assert (=> b!1059075 m!979113))

(assert (=> b!1059076 m!979111))

(assert (=> b!1059076 m!979111))

(assert (=> b!1059076 m!979113))

(assert (=> bm!44915 m!979111))

(declare-fun m!979115 () Bool)

(assert (=> bm!44915 m!979115))

(assert (=> b!1059078 m!979111))

(assert (=> b!1059078 m!979111))

(declare-fun m!979117 () Bool)

(assert (=> b!1059078 m!979117))

(assert (=> b!1058988 d!128919))

(declare-fun d!128921 () Bool)

(declare-fun lt!467123 () (_ BitVec 32))

(assert (=> d!128921 (and (or (bvslt lt!467123 #b00000000000000000000000000000000) (bvsge lt!467123 (size!32632 lt!467088)) (and (bvsge lt!467123 #b00000000000000000000000000000000) (bvslt lt!467123 (size!32632 lt!467088)))) (bvsge lt!467123 #b00000000000000000000000000000000) (bvslt lt!467123 (size!32632 lt!467088)) (= (select (arr!32095 lt!467088) lt!467123) k0!2747))))

(declare-fun e!602482 () (_ BitVec 32))

(assert (=> d!128921 (= lt!467123 e!602482)))

(declare-fun c!107546 () Bool)

(assert (=> d!128921 (= c!107546 (= (select (arr!32095 lt!467088) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32632 lt!467088)) (bvslt (size!32632 lt!467088) #b01111111111111111111111111111111))))

(assert (=> d!128921 (= (arrayScanForKey!0 lt!467088 k0!2747 #b00000000000000000000000000000000) lt!467123)))

(declare-fun b!1059089 () Bool)

(assert (=> b!1059089 (= e!602482 #b00000000000000000000000000000000)))

(declare-fun b!1059090 () Bool)

(assert (=> b!1059090 (= e!602482 (arrayScanForKey!0 lt!467088 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128921 c!107546) b!1059089))

(assert (= (and d!128921 (not c!107546)) b!1059090))

(declare-fun m!979123 () Bool)

(assert (=> d!128921 m!979123))

(declare-fun m!979125 () Bool)

(assert (=> d!128921 m!979125))

(declare-fun m!979127 () Bool)

(assert (=> b!1059090 m!979127))

(assert (=> b!1058997 d!128921))

(declare-fun d!128927 () Bool)

(assert (=> d!128927 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1058992 d!128927))

(declare-fun d!128929 () Bool)

(declare-fun res!706938 () Bool)

(declare-fun e!602489 () Bool)

(assert (=> d!128929 (=> res!706938 e!602489)))

(assert (=> d!128929 (= res!706938 (= (select (arr!32095 a!3488) lt!467090) k0!2747))))

(assert (=> d!128929 (= (arrayContainsKey!0 a!3488 k0!2747 lt!467090) e!602489)))

(declare-fun b!1059097 () Bool)

(declare-fun e!602490 () Bool)

(assert (=> b!1059097 (= e!602489 e!602490)))

(declare-fun res!706939 () Bool)

(assert (=> b!1059097 (=> (not res!706939) (not e!602490))))

(assert (=> b!1059097 (= res!706939 (bvslt (bvadd lt!467090 #b00000000000000000000000000000001) (size!32632 a!3488)))))

(declare-fun b!1059098 () Bool)

(assert (=> b!1059098 (= e!602490 (arrayContainsKey!0 a!3488 k0!2747 (bvadd lt!467090 #b00000000000000000000000000000001)))))

(assert (= (and d!128929 (not res!706938)) b!1059097))

(assert (= (and b!1059097 res!706939) b!1059098))

(declare-fun m!979133 () Bool)

(assert (=> d!128929 m!979133))

(declare-fun m!979135 () Bool)

(assert (=> b!1059098 m!979135))

(assert (=> b!1058995 d!128929))

(declare-fun d!128933 () Bool)

(assert (=> d!128933 (arrayContainsKey!0 a!3488 k0!2747 lt!467090)))

(declare-fun lt!467128 () Unit!34681)

(declare-fun choose!114 (array!66760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34681)

(assert (=> d!128933 (= lt!467128 (choose!114 a!3488 k0!2747 i!1381 lt!467090))))

(assert (=> d!128933 (bvsge i!1381 #b00000000000000000000000000000000)))

(assert (=> d!128933 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 i!1381 lt!467090) lt!467128)))

(declare-fun bs!31038 () Bool)

(assert (= bs!31038 d!128933))

(assert (=> bs!31038 m!979027))

(declare-fun m!979141 () Bool)

(assert (=> bs!31038 m!979141))

(assert (=> b!1058995 d!128933))

(declare-fun d!128939 () Bool)

(declare-fun res!706943 () Bool)

(declare-fun e!602493 () Bool)

(assert (=> d!128939 (=> res!706943 e!602493)))

(assert (=> d!128939 (= res!706943 (bvsge lt!467087 (size!32632 a!3488)))))

(assert (=> d!128939 (= (arrayNoDuplicates!0 a!3488 lt!467087 Nil!22374) e!602493)))

(declare-fun b!1059101 () Bool)

(declare-fun e!602496 () Bool)

(declare-fun call!44919 () Bool)

(assert (=> b!1059101 (= e!602496 call!44919)))

(declare-fun b!1059102 () Bool)

(declare-fun e!602495 () Bool)

(assert (=> b!1059102 (= e!602493 e!602495)))

(declare-fun res!706942 () Bool)

(assert (=> b!1059102 (=> (not res!706942) (not e!602495))))

(declare-fun e!602494 () Bool)

(assert (=> b!1059102 (= res!706942 (not e!602494))))

(declare-fun res!706944 () Bool)

(assert (=> b!1059102 (=> (not res!706944) (not e!602494))))

(assert (=> b!1059102 (= res!706944 (validKeyInArray!0 (select (arr!32095 a!3488) lt!467087)))))

(declare-fun b!1059103 () Bool)

(assert (=> b!1059103 (= e!602495 e!602496)))

(declare-fun c!107547 () Bool)

(assert (=> b!1059103 (= c!107547 (validKeyInArray!0 (select (arr!32095 a!3488) lt!467087)))))

(declare-fun bm!44916 () Bool)

(assert (=> bm!44916 (= call!44919 (arrayNoDuplicates!0 a!3488 (bvadd lt!467087 #b00000000000000000000000000000001) (ite c!107547 (Cons!22373 (select (arr!32095 a!3488) lt!467087) Nil!22374) Nil!22374)))))

(declare-fun b!1059104 () Bool)

(assert (=> b!1059104 (= e!602496 call!44919)))

(declare-fun b!1059105 () Bool)

(assert (=> b!1059105 (= e!602494 (contains!6224 Nil!22374 (select (arr!32095 a!3488) lt!467087)))))

(assert (= (and d!128939 (not res!706943)) b!1059102))

(assert (= (and b!1059102 res!706944) b!1059105))

(assert (= (and b!1059102 res!706942) b!1059103))

(assert (= (and b!1059103 c!107547) b!1059101))

(assert (= (and b!1059103 (not c!107547)) b!1059104))

(assert (= (or b!1059101 b!1059104) bm!44916))

(declare-fun m!979145 () Bool)

(assert (=> b!1059102 m!979145))

(assert (=> b!1059102 m!979145))

(declare-fun m!979147 () Bool)

(assert (=> b!1059102 m!979147))

(assert (=> b!1059103 m!979145))

(assert (=> b!1059103 m!979145))

(assert (=> b!1059103 m!979147))

(assert (=> bm!44916 m!979145))

(declare-fun m!979149 () Bool)

(assert (=> bm!44916 m!979149))

(assert (=> b!1059105 m!979145))

(assert (=> b!1059105 m!979145))

(declare-fun m!979151 () Bool)

(assert (=> b!1059105 m!979151))

(assert (=> b!1058995 d!128939))

(declare-fun d!128943 () Bool)

(assert (=> d!128943 (arrayNoDuplicates!0 a!3488 lt!467087 Nil!22374)))

(declare-fun lt!467132 () Unit!34681)

(declare-fun choose!39 (array!66760 (_ BitVec 32) (_ BitVec 32)) Unit!34681)

(assert (=> d!128943 (= lt!467132 (choose!39 a!3488 #b00000000000000000000000000000000 lt!467087))))

(assert (=> d!128943 (bvslt (size!32632 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128943 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!467087) lt!467132)))

(declare-fun bs!31040 () Bool)

(assert (= bs!31040 d!128943))

(assert (=> bs!31040 m!979031))

(declare-fun m!979157 () Bool)

(assert (=> bs!31040 m!979157))

(assert (=> b!1058995 d!128943))

(declare-fun d!128947 () Bool)

(declare-fun res!706961 () Bool)

(declare-fun e!602515 () Bool)

(assert (=> d!128947 (=> res!706961 e!602515)))

(assert (=> d!128947 (= res!706961 (= (select (arr!32095 lt!467088) #b00000000000000000000000000000000) k0!2747))))

(assert (=> d!128947 (= (arrayContainsKey!0 lt!467088 k0!2747 #b00000000000000000000000000000000) e!602515)))

(declare-fun b!1059126 () Bool)

(declare-fun e!602516 () Bool)

(assert (=> b!1059126 (= e!602515 e!602516)))

(declare-fun res!706962 () Bool)

(assert (=> b!1059126 (=> (not res!706962) (not e!602516))))

(assert (=> b!1059126 (= res!706962 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32632 lt!467088)))))

(declare-fun b!1059127 () Bool)

(assert (=> b!1059127 (= e!602516 (arrayContainsKey!0 lt!467088 k0!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128947 (not res!706961)) b!1059126))

(assert (= (and b!1059126 res!706962) b!1059127))

(assert (=> d!128947 m!979125))

(declare-fun m!979159 () Bool)

(assert (=> b!1059127 m!979159))

(assert (=> b!1058990 d!128947))

(declare-fun d!128949 () Bool)

(declare-fun res!706972 () Bool)

(declare-fun e!602527 () Bool)

(assert (=> d!128949 (=> res!706972 e!602527)))

(get-info :version)

(assert (=> d!128949 (= res!706972 ((_ is Nil!22374) Nil!22374))))

(assert (=> d!128949 (= (noDuplicate!1573 Nil!22374) e!602527)))

(declare-fun b!1059139 () Bool)

(declare-fun e!602528 () Bool)

(assert (=> b!1059139 (= e!602527 e!602528)))

(declare-fun res!706973 () Bool)

(assert (=> b!1059139 (=> (not res!706973) (not e!602528))))

(assert (=> b!1059139 (= res!706973 (not (contains!6224 (t!31676 Nil!22374) (h!23591 Nil!22374))))))

(declare-fun b!1059140 () Bool)

(assert (=> b!1059140 (= e!602528 (noDuplicate!1573 (t!31676 Nil!22374)))))

(assert (= (and d!128949 (not res!706972)) b!1059139))

(assert (= (and b!1059139 res!706973) b!1059140))

(declare-fun m!979165 () Bool)

(assert (=> b!1059139 m!979165))

(declare-fun m!979167 () Bool)

(assert (=> b!1059140 m!979167))

(assert (=> b!1058989 d!128949))

(check-sat (not b!1059105) (not b!1059098) (not b!1059127) (not bm!44915) (not b!1059139) (not b!1059076) (not b!1059103) (not b!1059090) (not d!128943) (not d!128933) (not b!1059102) (not b!1059078) (not b!1059075) (not b!1059063) (not bm!44916) (not b!1059140))
(check-sat)
