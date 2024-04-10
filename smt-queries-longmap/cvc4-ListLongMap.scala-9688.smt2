; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114414 () Bool)

(assert start!114414)

(declare-fun b!1358226 () Bool)

(declare-fun e!770838 () Bool)

(declare-fun e!770839 () Bool)

(assert (=> b!1358226 (= e!770838 (not e!770839))))

(declare-fun res!902910 () Bool)

(assert (=> b!1358226 (=> res!902910 e!770839)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1358226 (= res!902910 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31715 0))(
  ( (Nil!31712) (Cons!31711 (h!32920 (_ BitVec 64)) (t!46382 List!31715)) )
))
(declare-fun lt!599299 () List!31715)

(declare-fun acc!759 () List!31715)

(declare-datatypes ((array!92461 0))(
  ( (array!92462 (arr!44674 (Array (_ BitVec 32) (_ BitVec 64))) (size!45224 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92461)

(declare-fun $colon$colon!829 (List!31715 (_ BitVec 64)) List!31715)

(assert (=> b!1358226 (= lt!599299 ($colon$colon!829 acc!759 (select (arr!44674 a!3742) from!3120)))))

(declare-fun subseq!826 (List!31715 List!31715) Bool)

(assert (=> b!1358226 (subseq!826 acc!759 acc!759)))

(declare-datatypes ((Unit!44683 0))(
  ( (Unit!44684) )
))
(declare-fun lt!599297 () Unit!44683)

(declare-fun lemmaListSubSeqRefl!0 (List!31715) Unit!44683)

(assert (=> b!1358226 (= lt!599297 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358227 () Bool)

(declare-fun res!902916 () Bool)

(assert (=> b!1358227 (=> (not res!902916) (not e!770838))))

(assert (=> b!1358227 (= res!902916 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45224 a!3742)))))

(declare-fun b!1358228 () Bool)

(declare-fun res!902911 () Bool)

(assert (=> b!1358228 (=> res!902911 e!770839)))

(assert (=> b!1358228 (= res!902911 (not (subseq!826 acc!759 lt!599299)))))

(declare-fun b!1358229 () Bool)

(declare-fun res!902909 () Bool)

(assert (=> b!1358229 (=> res!902909 e!770839)))

(declare-fun contains!9424 (List!31715 (_ BitVec 64)) Bool)

(assert (=> b!1358229 (= res!902909 (contains!9424 lt!599299 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358230 () Bool)

(declare-fun res!902918 () Bool)

(assert (=> b!1358230 (=> (not res!902918) (not e!770838))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358230 (= res!902918 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45224 a!3742))))))

(declare-fun b!1358231 () Bool)

(declare-fun res!902917 () Bool)

(assert (=> b!1358231 (=> (not res!902917) (not e!770838))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358231 (= res!902917 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358225 () Bool)

(declare-fun res!902919 () Bool)

(assert (=> b!1358225 (=> (not res!902919) (not e!770838))))

(assert (=> b!1358225 (= res!902919 (validKeyInArray!0 (select (arr!44674 a!3742) from!3120)))))

(declare-fun res!902914 () Bool)

(assert (=> start!114414 (=> (not res!902914) (not e!770838))))

(assert (=> start!114414 (= res!902914 (and (bvslt (size!45224 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45224 a!3742))))))

(assert (=> start!114414 e!770838))

(assert (=> start!114414 true))

(declare-fun array_inv!33702 (array!92461) Bool)

(assert (=> start!114414 (array_inv!33702 a!3742)))

(declare-fun b!1358232 () Bool)

(declare-fun res!902921 () Bool)

(assert (=> b!1358232 (=> res!902921 e!770839)))

(assert (=> b!1358232 (= res!902921 (contains!9424 lt!599299 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1358233 () Bool)

(declare-fun res!902923 () Bool)

(assert (=> b!1358233 (=> res!902923 e!770839)))

(declare-fun noDuplicate!2281 (List!31715) Bool)

(assert (=> b!1358233 (= res!902923 (not (noDuplicate!2281 lt!599299)))))

(declare-fun b!1358234 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92461 (_ BitVec 32) List!31715) Bool)

(assert (=> b!1358234 (= e!770839 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599299))))

(declare-fun lt!599298 () Unit!44683)

(declare-fun noDuplicateSubseq!136 (List!31715 List!31715) Unit!44683)

(assert (=> b!1358234 (= lt!599298 (noDuplicateSubseq!136 acc!759 lt!599299))))

(declare-fun b!1358235 () Bool)

(declare-fun res!902913 () Bool)

(assert (=> b!1358235 (=> (not res!902913) (not e!770838))))

(assert (=> b!1358235 (= res!902913 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31712))))

(declare-fun b!1358236 () Bool)

(declare-fun res!902915 () Bool)

(assert (=> b!1358236 (=> (not res!902915) (not e!770838))))

(assert (=> b!1358236 (= res!902915 (not (contains!9424 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358237 () Bool)

(declare-fun res!902922 () Bool)

(assert (=> b!1358237 (=> (not res!902922) (not e!770838))))

(assert (=> b!1358237 (= res!902922 (noDuplicate!2281 acc!759))))

(declare-fun b!1358238 () Bool)

(declare-fun res!902912 () Bool)

(assert (=> b!1358238 (=> (not res!902912) (not e!770838))))

(assert (=> b!1358238 (= res!902912 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358239 () Bool)

(declare-fun res!902920 () Bool)

(assert (=> b!1358239 (=> (not res!902920) (not e!770838))))

(assert (=> b!1358239 (= res!902920 (not (contains!9424 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114414 res!902914) b!1358237))

(assert (= (and b!1358237 res!902922) b!1358239))

(assert (= (and b!1358239 res!902920) b!1358236))

(assert (= (and b!1358236 res!902915) b!1358235))

(assert (= (and b!1358235 res!902913) b!1358238))

(assert (= (and b!1358238 res!902912) b!1358230))

(assert (= (and b!1358230 res!902918) b!1358231))

(assert (= (and b!1358231 res!902917) b!1358227))

(assert (= (and b!1358227 res!902916) b!1358225))

(assert (= (and b!1358225 res!902919) b!1358226))

(assert (= (and b!1358226 (not res!902910)) b!1358233))

(assert (= (and b!1358233 (not res!902923)) b!1358229))

(assert (= (and b!1358229 (not res!902909)) b!1358232))

(assert (= (and b!1358232 (not res!902921)) b!1358228))

(assert (= (and b!1358228 (not res!902911)) b!1358234))

(declare-fun m!1243819 () Bool)

(assert (=> b!1358228 m!1243819))

(declare-fun m!1243821 () Bool)

(assert (=> b!1358239 m!1243821))

(declare-fun m!1243823 () Bool)

(assert (=> start!114414 m!1243823))

(declare-fun m!1243825 () Bool)

(assert (=> b!1358233 m!1243825))

(declare-fun m!1243827 () Bool)

(assert (=> b!1358226 m!1243827))

(assert (=> b!1358226 m!1243827))

(declare-fun m!1243829 () Bool)

(assert (=> b!1358226 m!1243829))

(declare-fun m!1243831 () Bool)

(assert (=> b!1358226 m!1243831))

(declare-fun m!1243833 () Bool)

(assert (=> b!1358226 m!1243833))

(declare-fun m!1243835 () Bool)

(assert (=> b!1358231 m!1243835))

(declare-fun m!1243837 () Bool)

(assert (=> b!1358235 m!1243837))

(declare-fun m!1243839 () Bool)

(assert (=> b!1358237 m!1243839))

(declare-fun m!1243841 () Bool)

(assert (=> b!1358236 m!1243841))

(declare-fun m!1243843 () Bool)

(assert (=> b!1358234 m!1243843))

(declare-fun m!1243845 () Bool)

(assert (=> b!1358234 m!1243845))

(declare-fun m!1243847 () Bool)

(assert (=> b!1358238 m!1243847))

(declare-fun m!1243849 () Bool)

(assert (=> b!1358229 m!1243849))

(assert (=> b!1358225 m!1243827))

(assert (=> b!1358225 m!1243827))

(declare-fun m!1243851 () Bool)

(assert (=> b!1358225 m!1243851))

(declare-fun m!1243853 () Bool)

(assert (=> b!1358232 m!1243853))

(push 1)

(assert (not b!1358232))

(assert (not b!1358231))

(assert (not b!1358229))

(assert (not b!1358236))

(assert (not start!114414))

(assert (not b!1358235))

(assert (not b!1358225))

(assert (not b!1358234))

(assert (not b!1358239))

(assert (not b!1358237))

(assert (not b!1358228))

(assert (not b!1358233))

(assert (not b!1358226))

(assert (not b!1358238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145375 () Bool)

(assert (=> d!145375 (= (validKeyInArray!0 (select (arr!44674 a!3742) from!3120)) (and (not (= (select (arr!44674 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44674 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1358225 d!145375))

(declare-fun b!1358329 () Bool)

(declare-fun e!770919 () Bool)

(declare-fun call!65287 () Bool)

(assert (=> b!1358329 (= e!770919 call!65287)))

(declare-fun b!1358330 () Bool)

(declare-fun e!770921 () Bool)

(declare-fun e!770920 () Bool)

(assert (=> b!1358330 (= e!770921 e!770920)))

(declare-fun res!902994 () Bool)

(assert (=> b!1358330 (=> (not res!902994) (not e!770920))))

(declare-fun e!770922 () Bool)

(assert (=> b!1358330 (= res!902994 (not e!770922))))

(declare-fun res!902995 () Bool)

(assert (=> b!1358330 (=> (not res!902995) (not e!770922))))

(assert (=> b!1358330 (= res!902995 (validKeyInArray!0 (select (arr!44674 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145379 () Bool)

(declare-fun res!902993 () Bool)

(assert (=> d!145379 (=> res!902993 e!770921)))

(assert (=> d!145379 (= res!902993 (bvsge #b00000000000000000000000000000000 (size!45224 a!3742)))))

(assert (=> d!145379 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31712) e!770921)))

(declare-fun b!1358331 () Bool)

(assert (=> b!1358331 (= e!770920 e!770919)))

(declare-fun c!127108 () Bool)

(assert (=> b!1358331 (= c!127108 (validKeyInArray!0 (select (arr!44674 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1358332 () Bool)

(assert (=> b!1358332 (= e!770919 call!65287)))

(declare-fun bm!65284 () Bool)

(assert (=> bm!65284 (= call!65287 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127108 (Cons!31711 (select (arr!44674 a!3742) #b00000000000000000000000000000000) Nil!31712) Nil!31712)))))

(declare-fun b!1358333 () Bool)

(assert (=> b!1358333 (= e!770922 (contains!9424 Nil!31712 (select (arr!44674 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145379 (not res!902993)) b!1358330))

(assert (= (and b!1358330 res!902995) b!1358333))

(assert (= (and b!1358330 res!902994) b!1358331))

(assert (= (and b!1358331 c!127108) b!1358332))

(assert (= (and b!1358331 (not c!127108)) b!1358329))

(assert (= (or b!1358332 b!1358329) bm!65284))

(declare-fun m!1243923 () Bool)

(assert (=> b!1358330 m!1243923))

(assert (=> b!1358330 m!1243923))

(declare-fun m!1243925 () Bool)

(assert (=> b!1358330 m!1243925))

(assert (=> b!1358331 m!1243923))

(assert (=> b!1358331 m!1243923))

(assert (=> b!1358331 m!1243925))

(assert (=> bm!65284 m!1243923))

(declare-fun m!1243927 () Bool)

(assert (=> bm!65284 m!1243927))

(assert (=> b!1358333 m!1243923))

(assert (=> b!1358333 m!1243923))

(declare-fun m!1243929 () Bool)

(assert (=> b!1358333 m!1243929))

(assert (=> b!1358235 d!145379))

(declare-fun d!145385 () Bool)

(assert (=> d!145385 (= ($colon$colon!829 acc!759 (select (arr!44674 a!3742) from!3120)) (Cons!31711 (select (arr!44674 a!3742) from!3120) acc!759))))

(assert (=> b!1358226 d!145385))

(declare-fun b!1358356 () Bool)

(declare-fun e!770943 () Bool)

(assert (=> b!1358356 (= e!770943 (subseq!826 (t!46382 acc!759) (t!46382 acc!759)))))

(declare-fun d!145387 () Bool)

(declare-fun res!903018 () Bool)

(declare-fun e!770946 () Bool)

(assert (=> d!145387 (=> res!903018 e!770946)))

(assert (=> d!145387 (= res!903018 (is-Nil!31712 acc!759))))

(assert (=> d!145387 (= (subseq!826 acc!759 acc!759) e!770946)))

(declare-fun b!1358354 () Bool)

(declare-fun e!770945 () Bool)

(assert (=> b!1358354 (= e!770946 e!770945)))

(declare-fun res!903017 () Bool)

(assert (=> b!1358354 (=> (not res!903017) (not e!770945))))

(assert (=> b!1358354 (= res!903017 (is-Cons!31711 acc!759))))

(declare-fun b!1358357 () Bool)

(declare-fun e!770944 () Bool)

(assert (=> b!1358357 (= e!770944 (subseq!826 acc!759 (t!46382 acc!759)))))

(declare-fun b!1358355 () Bool)

(assert (=> b!1358355 (= e!770945 e!770944)))

(declare-fun res!903019 () Bool)

(assert (=> b!1358355 (=> res!903019 e!770944)))

(assert (=> b!1358355 (= res!903019 e!770943)))

(declare-fun res!903016 () Bool)

(assert (=> b!1358355 (=> (not res!903016) (not e!770943))))

(assert (=> b!1358355 (= res!903016 (= (h!32920 acc!759) (h!32920 acc!759)))))

(assert (= (and d!145387 (not res!903018)) b!1358354))

(assert (= (and b!1358354 res!903017) b!1358355))

(assert (= (and b!1358355 res!903016) b!1358356))

(assert (= (and b!1358355 (not res!903019)) b!1358357))

(declare-fun m!1243935 () Bool)

(assert (=> b!1358356 m!1243935))

(declare-fun m!1243937 () Bool)

(assert (=> b!1358357 m!1243937))

(assert (=> b!1358226 d!145387))

(declare-fun d!145391 () Bool)

(assert (=> d!145391 (subseq!826 acc!759 acc!759)))

(declare-fun lt!599317 () Unit!44683)

(declare-fun choose!36 (List!31715) Unit!44683)

(assert (=> d!145391 (= lt!599317 (choose!36 acc!759))))

(assert (=> d!145391 (= (lemmaListSubSeqRefl!0 acc!759) lt!599317)))

(declare-fun bs!38951 () Bool)

(assert (= bs!38951 d!145391))

(assert (=> bs!38951 m!1243831))

(declare-fun m!1243941 () Bool)

(assert (=> bs!38951 m!1243941))

(assert (=> b!1358226 d!145391))

(declare-fun d!145395 () Bool)

(declare-fun res!903030 () Bool)

(declare-fun e!770957 () Bool)

(assert (=> d!145395 (=> res!903030 e!770957)))

(assert (=> d!145395 (= res!903030 (is-Nil!31712 acc!759))))

(assert (=> d!145395 (= (noDuplicate!2281 acc!759) e!770957)))

(declare-fun b!1358368 () Bool)

(declare-fun e!770958 () Bool)

(assert (=> b!1358368 (= e!770957 e!770958)))

(declare-fun res!903031 () Bool)

(assert (=> b!1358368 (=> (not res!903031) (not e!770958))))

(assert (=> b!1358368 (= res!903031 (not (contains!9424 (t!46382 acc!759) (h!32920 acc!759))))))

(declare-fun b!1358369 () Bool)

(assert (=> b!1358369 (= e!770958 (noDuplicate!2281 (t!46382 acc!759)))))

