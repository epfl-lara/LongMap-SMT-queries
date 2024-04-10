; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115154 () Bool)

(assert start!115154)

(declare-fun b!1364229 () Bool)

(declare-fun res!907913 () Bool)

(declare-fun e!773623 () Bool)

(assert (=> b!1364229 (=> (not res!907913) (not e!773623))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92724 0))(
  ( (array!92725 (arr!44792 (Array (_ BitVec 32) (_ BitVec 64))) (size!45342 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92724)

(assert (=> b!1364229 (= res!907913 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45342 a!3742)))))

(declare-fun b!1364230 () Bool)

(declare-fun res!907916 () Bool)

(assert (=> b!1364230 (=> (not res!907916) (not e!773623))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1364230 (= res!907916 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45342 a!3742))))))

(declare-fun b!1364231 () Bool)

(declare-fun res!907914 () Bool)

(assert (=> b!1364231 (=> (not res!907914) (not e!773623))))

(declare-datatypes ((List!31833 0))(
  ( (Nil!31830) (Cons!31829 (h!33038 (_ BitVec 64)) (t!46527 List!31833)) )
))
(declare-fun acc!759 () List!31833)

(declare-fun arrayNoDuplicates!0 (array!92724 (_ BitVec 32) List!31833) Bool)

(assert (=> b!1364231 (= res!907914 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1364232 () Bool)

(declare-fun res!907917 () Bool)

(assert (=> b!1364232 (=> (not res!907917) (not e!773623))))

(assert (=> b!1364232 (= res!907917 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31830))))

(declare-fun b!1364233 () Bool)

(declare-fun res!907918 () Bool)

(assert (=> b!1364233 (=> (not res!907918) (not e!773623))))

(declare-fun contains!9542 (List!31833 (_ BitVec 64)) Bool)

(assert (=> b!1364233 (= res!907918 (not (contains!9542 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364234 () Bool)

(declare-fun res!907910 () Bool)

(assert (=> b!1364234 (=> (not res!907910) (not e!773623))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1364234 (= res!907910 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1364228 () Bool)

(declare-fun res!907915 () Bool)

(assert (=> b!1364228 (=> (not res!907915) (not e!773623))))

(declare-fun noDuplicate!2399 (List!31833) Bool)

(assert (=> b!1364228 (= res!907915 (noDuplicate!2399 acc!759))))

(declare-fun res!907912 () Bool)

(assert (=> start!115154 (=> (not res!907912) (not e!773623))))

(assert (=> start!115154 (= res!907912 (and (bvslt (size!45342 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45342 a!3742))))))

(assert (=> start!115154 e!773623))

(assert (=> start!115154 true))

(declare-fun array_inv!33820 (array!92724) Bool)

(assert (=> start!115154 (array_inv!33820 a!3742)))

(declare-fun b!1364235 () Bool)

(declare-fun res!907911 () Bool)

(assert (=> b!1364235 (=> (not res!907911) (not e!773623))))

(assert (=> b!1364235 (= res!907911 (not (contains!9542 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364236 () Bool)

(assert (=> b!1364236 (= e!773623 (not (arrayNoDuplicates!0 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742)) from!3120 acc!759)))))

(assert (= (and start!115154 res!907912) b!1364228))

(assert (= (and b!1364228 res!907915) b!1364233))

(assert (= (and b!1364233 res!907918) b!1364235))

(assert (= (and b!1364235 res!907911) b!1364232))

(assert (= (and b!1364232 res!907917) b!1364231))

(assert (= (and b!1364231 res!907914) b!1364230))

(assert (= (and b!1364230 res!907916) b!1364234))

(assert (= (and b!1364234 res!907910) b!1364229))

(assert (= (and b!1364229 res!907913) b!1364236))

(declare-fun m!1248925 () Bool)

(assert (=> b!1364233 m!1248925))

(declare-fun m!1248927 () Bool)

(assert (=> b!1364228 m!1248927))

(declare-fun m!1248929 () Bool)

(assert (=> b!1364236 m!1248929))

(declare-fun m!1248931 () Bool)

(assert (=> b!1364236 m!1248931))

(declare-fun m!1248933 () Bool)

(assert (=> start!115154 m!1248933))

(declare-fun m!1248935 () Bool)

(assert (=> b!1364231 m!1248935))

(declare-fun m!1248937 () Bool)

(assert (=> b!1364234 m!1248937))

(declare-fun m!1248939 () Bool)

(assert (=> b!1364235 m!1248939))

(declare-fun m!1248941 () Bool)

(assert (=> b!1364232 m!1248941))

(push 1)

(assert (not start!115154))

(assert (not b!1364235))

(assert (not b!1364228))

(assert (not b!1364234))

(assert (not b!1364236))

(assert (not b!1364233))

(assert (not b!1364232))

(assert (not b!1364231))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!65442 () Bool)

(declare-fun bm!65439 () Bool)

(declare-fun c!127605 () Bool)

(assert (=> bm!65439 (= call!65442 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127605 (Cons!31829 (select (arr!44792 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!146279 () Bool)

(declare-fun res!908011 () Bool)

(declare-fun e!773679 () Bool)

(assert (=> d!146279 (=> res!908011 e!773679)))

(assert (=> d!146279 (= res!908011 (bvsge from!3120 (size!45342 a!3742)))))

(assert (=> d!146279 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773679)))

(declare-fun b!1364339 () Bool)

(declare-fun e!773680 () Bool)

(assert (=> b!1364339 (= e!773680 call!65442)))

(declare-fun e!773681 () Bool)

(declare-fun b!1364340 () Bool)

(assert (=> b!1364340 (= e!773681 (contains!9542 acc!759 (select (arr!44792 a!3742) from!3120)))))

(declare-fun b!1364341 () Bool)

(declare-fun e!773678 () Bool)

(assert (=> b!1364341 (= e!773679 e!773678)))

(declare-fun res!908009 () Bool)

(assert (=> b!1364341 (=> (not res!908009) (not e!773678))))

(assert (=> b!1364341 (= res!908009 (not e!773681))))

(declare-fun res!908010 () Bool)

(assert (=> b!1364341 (=> (not res!908010) (not e!773681))))

(assert (=> b!1364341 (= res!908010 (validKeyInArray!0 (select (arr!44792 a!3742) from!3120)))))

(declare-fun b!1364342 () Bool)

(assert (=> b!1364342 (= e!773678 e!773680)))

(assert (=> b!1364342 (= c!127605 (validKeyInArray!0 (select (arr!44792 a!3742) from!3120)))))

(declare-fun b!1364343 () Bool)

(assert (=> b!1364343 (= e!773680 call!65442)))

(assert (= (and d!146279 (not res!908011)) b!1364341))

(assert (= (and b!1364341 res!908010) b!1364340))

(assert (= (and b!1364341 res!908009) b!1364342))

(assert (= (and b!1364342 c!127605) b!1364339))

(assert (= (and b!1364342 (not c!127605)) b!1364343))

(assert (= (or b!1364339 b!1364343) bm!65439))

(declare-fun m!1249007 () Bool)

(assert (=> bm!65439 m!1249007))

(declare-fun m!1249011 () Bool)

(assert (=> bm!65439 m!1249011))

(assert (=> b!1364340 m!1249007))

(assert (=> b!1364340 m!1249007))

(declare-fun m!1249015 () Bool)

(assert (=> b!1364340 m!1249015))

(assert (=> b!1364341 m!1249007))

(assert (=> b!1364341 m!1249007))

(declare-fun m!1249017 () Bool)

(assert (=> b!1364341 m!1249017))

(assert (=> b!1364342 m!1249007))

(assert (=> b!1364342 m!1249007))

(assert (=> b!1364342 m!1249017))

(assert (=> b!1364231 d!146279))

(declare-fun c!127607 () Bool)

(declare-fun call!65444 () Bool)

(declare-fun bm!65441 () Bool)

(assert (=> bm!65441 (= call!65444 (arrayNoDuplicates!0 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742)) (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127607 (Cons!31829 (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120) acc!759) acc!759)))))

(declare-fun d!146293 () Bool)

(declare-fun res!908021 () Bool)

(declare-fun e!773691 () Bool)

(assert (=> d!146293 (=> res!908021 e!773691)))

(assert (=> d!146293 (= res!908021 (bvsge from!3120 (size!45342 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742)))))))

(assert (=> d!146293 (= (arrayNoDuplicates!0 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742)) from!3120 acc!759) e!773691)))

(declare-fun b!1364353 () Bool)

(declare-fun e!773692 () Bool)

(assert (=> b!1364353 (= e!773692 call!65444)))

(declare-fun b!1364354 () Bool)

(declare-fun e!773693 () Bool)

(assert (=> b!1364354 (= e!773693 (contains!9542 acc!759 (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120)))))

(declare-fun b!1364355 () Bool)

(declare-fun e!773690 () Bool)

(assert (=> b!1364355 (= e!773691 e!773690)))

(declare-fun res!908019 () Bool)

(assert (=> b!1364355 (=> (not res!908019) (not e!773690))))

(assert (=> b!1364355 (= res!908019 (not e!773693))))

(declare-fun res!908020 () Bool)

(assert (=> b!1364355 (=> (not res!908020) (not e!773693))))

(assert (=> b!1364355 (= res!908020 (validKeyInArray!0 (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120)))))

(declare-fun b!1364356 () Bool)

(assert (=> b!1364356 (= e!773690 e!773692)))

(assert (=> b!1364356 (= c!127607 (validKeyInArray!0 (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120)))))

(declare-fun b!1364357 () Bool)

(assert (=> b!1364357 (= e!773692 call!65444)))

(assert (= (and d!146293 (not res!908021)) b!1364355))

(assert (= (and b!1364355 res!908020) b!1364354))

(assert (= (and b!1364355 res!908019) b!1364356))

(assert (= (and b!1364356 c!127607) b!1364353))

(assert (= (and b!1364356 (not c!127607)) b!1364357))

(assert (= (or b!1364353 b!1364357) bm!65441))

(declare-fun m!1249023 () Bool)

(assert (=> bm!65441 m!1249023))

(declare-fun m!1249027 () Bool)

(assert (=> bm!65441 m!1249027))

(assert (=> b!1364354 m!1249023))

(assert (=> b!1364354 m!1249023))

(declare-fun m!1249031 () Bool)

(assert (=> b!1364354 m!1249031))

(assert (=> b!1364355 m!1249023))

(assert (=> b!1364355 m!1249023))

(declare-fun m!1249033 () Bool)

(assert (=> b!1364355 m!1249033))

(assert (=> b!1364356 m!1249023))

(assert (=> b!1364356 m!1249023))

(assert (=> b!1364356 m!1249033))

(assert (=> b!1364236 d!146293))

(declare-fun d!146297 () Bool)

(declare-fun lt!601034 () Bool)

(declare-fun content!710 (List!31833) (Set (_ BitVec 64)))

(assert (=> d!146297 (= lt!601034 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!710 acc!759)))))

(declare-fun e!773708 () Bool)

(assert (=> d!146297 (= lt!601034 e!773708)))

(declare-fun res!908036 () Bool)

(assert (=> d!146297 (=> (not res!908036) (not e!773708))))

(assert (=> d!146297 (= res!908036 (is-Cons!31829 acc!759))))

(assert (=> d!146297 (= (contains!9542 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!601034)))

(declare-fun b!1364374 () Bool)

(declare-fun e!773709 () Bool)

(assert (=> b!1364374 (= e!773708 e!773709)))

(declare-fun res!908037 () Bool)

(assert (=> b!1364374 (=> res!908037 e!773709)))

(assert (=> b!1364374 (= res!908037 (= (h!33038 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364375 () Bool)

(assert (=> b!1364375 (= e!773709 (contains!9542 (t!46527 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146297 res!908036) b!1364374))

(assert (= (and b!1364374 (not res!908037)) b!1364375))

(declare-fun m!1249043 () Bool)

(assert (=> d!146297 m!1249043))

(declare-fun m!1249045 () Bool)

(assert (=> d!146297 m!1249045))

(declare-fun m!1249047 () Bool)

(assert (=> b!1364375 m!1249047))

(assert (=> b!1364235 d!146297))

(declare-fun d!146303 () Bool)

(assert (=> d!146303 (= (array_inv!33820 a!3742) (bvsge (size!45342 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115154 d!146303))

(declare-fun d!146305 () Bool)

(declare-fun res!908045 () Bool)

(declare-fun e!773720 () Bool)

(assert (=> d!146305 (=> res!908045 e!773720)))

(assert (=> d!146305 (= res!908045 (is-Nil!31830 acc!759))))

(assert (=> d!146305 (= (noDuplicate!2399 acc!759) e!773720)))

(declare-fun b!1364387 () Bool)

(declare-fun e!773721 () Bool)

(assert (=> b!1364387 (= e!773720 e!773721)))

(declare-fun res!908046 () Bool)

(assert (=> b!1364387 (=> (not res!908046) (not e!773721))))

(assert (=> b!1364387 (= res!908046 (not (contains!9542 (t!46527 acc!759) (h!33038 acc!759))))))

(declare-fun b!1364388 () Bool)

(assert (=> b!1364388 (= e!773721 (noDuplicate!2399 (t!46527 acc!759)))))

(assert (= (and d!146305 (not res!908045)) b!1364387))

(assert (= (and b!1364387 res!908046) b!1364388))

(declare-fun m!1249049 () Bool)

(assert (=> b!1364387 m!1249049))

(declare-fun m!1249051 () Bool)

(assert (=> b!1364388 m!1249051))

(assert (=> b!1364228 d!146305))

(declare-fun d!146307 () Bool)

(assert (=> d!146307 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1364234 d!146307))

(declare-fun bm!65446 () Bool)

(declare-fun call!65449 () Bool)

(declare-fun c!127612 () Bool)

(assert (=> bm!65446 (= call!65449 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127612 (Cons!31829 (select (arr!44792 a!3742) #b00000000000000000000000000000000) Nil!31830) Nil!31830)))))

(declare-fun d!146311 () Bool)

(declare-fun res!908052 () Bool)

(declare-fun e!773727 () Bool)

(assert (=> d!146311 (=> res!908052 e!773727)))

(assert (=> d!146311 (= res!908052 (bvsge #b00000000000000000000000000000000 (size!45342 a!3742)))))

(assert (=> d!146311 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31830) e!773727)))

(declare-fun b!1364394 () Bool)

(declare-fun e!773728 () Bool)

(assert (=> b!1364394 (= e!773728 call!65449)))

(declare-fun b!1364395 () Bool)

(declare-fun e!773729 () Bool)

(assert (=> b!1364395 (= e!773729 (contains!9542 Nil!31830 (select (arr!44792 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364396 () Bool)

(declare-fun e!773726 () Bool)

(assert (=> b!1364396 (= e!773727 e!773726)))

(declare-fun res!908050 () Bool)

(assert (=> b!1364396 (=> (not res!908050) (not e!773726))))

(assert (=> b!1364396 (= res!908050 (not e!773729))))

(declare-fun res!908051 () Bool)

(assert (=> b!1364396 (=> (not res!908051) (not e!773729))))

(assert (=> b!1364396 (= res!908051 (validKeyInArray!0 (select (arr!44792 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364397 () Bool)

(assert (=> b!1364397 (= e!773726 e!773728)))

(assert (=> b!1364397 (= c!127612 (validKeyInArray!0 (select (arr!44792 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1364398 () Bool)

(assert (=> b!1364398 (= e!773728 call!65449)))

(assert (= (and d!146311 (not res!908052)) b!1364396))

(assert (= (and b!1364396 res!908051) b!1364395))

(assert (= (and b!1364396 res!908050) b!1364397))

(assert (= (and b!1364397 c!127612) b!1364394))

(assert (= (and b!1364397 (not c!127612)) b!1364398))

(assert (= (or b!1364394 b!1364398) bm!65446))

(declare-fun m!1249069 () Bool)

(assert (=> bm!65446 m!1249069))

(declare-fun m!1249071 () Bool)

(assert (=> bm!65446 m!1249071))

(assert (=> b!1364395 m!1249069))

(assert (=> b!1364395 m!1249069))

(declare-fun m!1249075 () Bool)

(assert (=> b!1364395 m!1249075))

(assert (=> b!1364396 m!1249069))

(assert (=> b!1364396 m!1249069))

(declare-fun m!1249079 () Bool)

(assert (=> b!1364396 m!1249079))

(assert (=> b!1364397 m!1249069))

(assert (=> b!1364397 m!1249069))

(assert (=> b!1364397 m!1249079))

(assert (=> b!1364232 d!146311))

(declare-fun d!146317 () Bool)

(declare-fun lt!601036 () Bool)

(assert (=> d!146317 (= lt!601036 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!710 acc!759)))))

(declare-fun e!773732 () Bool)

(assert (=> d!146317 (= lt!601036 e!773732)))

(declare-fun res!908055 () Bool)

(assert (=> d!146317 (=> (not res!908055) (not e!773732))))

(assert (=> d!146317 (= res!908055 (is-Cons!31829 acc!759))))

(assert (=> d!146317 (= (contains!9542 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!601036)))

(declare-fun b!1364401 () Bool)

(declare-fun e!773733 () Bool)

(assert (=> b!1364401 (= e!773732 e!773733)))

(declare-fun res!908056 () Bool)

(assert (=> b!1364401 (=> res!908056 e!773733)))

(assert (=> b!1364401 (= res!908056 (= (h!33038 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364402 () Bool)

(assert (=> b!1364402 (= e!773733 (contains!9542 (t!46527 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146317 res!908055) b!1364401))

(assert (= (and b!1364401 (not res!908056)) b!1364402))

(assert (=> d!146317 m!1249043))

(declare-fun m!1249081 () Bool)

(assert (=> d!146317 m!1249081))

(declare-fun m!1249083 () Bool)

(assert (=> b!1364402 m!1249083))

(assert (=> b!1364233 d!146317))

(push 1)

(assert (not b!1364396))

(assert (not b!1364395))

(assert (not b!1364355))

(assert (not b!1364388))

(assert (not bm!65439))

(assert (not b!1364375))

(assert (not bm!65446))

(assert (not b!1364340))

(assert (not b!1364354))

(assert (not b!1364341))

(assert (not b!1364356))

(assert (not d!146297))

(assert (not b!1364387))

(assert (not b!1364397))

(assert (not b!1364402))

(assert (not bm!65441))

(assert (not d!146317))

(assert (not b!1364342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!146367 () Bool)

(assert (=> d!146367 (= (validKeyInArray!0 (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120)) (and (not (= (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44792 (array!92725 (store (arr!44792 a!3742) i!1404 l!3587) (size!45342 a!3742))) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1364356 d!146367))

(declare-fun d!146369 () Bool)

(assert (=> d!146369 (= (validKeyInArray!0 (select (arr!44792 a!3742) from!3120)) (and (not (= (select (arr!44792 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44792 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1364342 d!146369))

(assert (=> b!1364355 d!146367))

(declare-fun d!146371 () Bool)

(declare-fun lt!601048 () Bool)

(assert (=> d!146371 (= lt!601048 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!710 (t!46527 acc!759))))))

(declare-fun e!773782 () Bool)

(assert (=> d!146371 (= lt!601048 e!773782)))

(declare-fun res!908096 () Bool)

(assert (=> d!146371 (=> (not res!908096) (not e!773782))))

(assert (=> d!146371 (= res!908096 (is-Cons!31829 (t!46527 acc!759)))))

(assert (=> d!146371 (= (contains!9542 (t!46527 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000) lt!601048)))

(declare-fun b!1364462 () Bool)

(declare-fun e!773783 () Bool)

(assert (=> b!1364462 (= e!773782 e!773783)))

(declare-fun res!908097 () Bool)

(assert (=> b!1364462 (=> res!908097 e!773783)))

(assert (=> b!1364462 (= res!908097 (= (h!33038 (t!46527 acc!759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1364463 () Bool)

(assert (=> b!1364463 (= e!773783 (contains!9542 (t!46527 (t!46527 acc!759)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146371 res!908096) b!1364462))

(assert (= (and b!1364462 (not res!908097)) b!1364463))

(declare-fun m!1249183 () Bool)

(assert (=> d!146371 m!1249183))

(declare-fun m!1249185 () Bool)

(assert (=> d!146371 m!1249185))

(declare-fun m!1249187 () Bool)

(assert (=> b!1364463 m!1249187))

(assert (=> b!1364375 d!146371))

(declare-fun bm!65452 () Bool)

(declare-fun c!127623 () Bool)

(declare-fun call!65455 () Bool)

(assert (=> bm!65452 (= call!65455 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!127623 (Cons!31829 (select (arr!44792 a!3742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!127612 (Cons!31829 (select (arr!44792 a!3742) #b00000000000000000000000000000000) Nil!31830) Nil!31830)) (ite c!127612 (Cons!31829 (select (arr!44792 a!3742) #b00000000000000000000000000000000) Nil!31830) Nil!31830))))))

(declare-fun d!146373 () Bool)

(declare-fun res!908100 () Bool)

(declare-fun e!773786 () Bool)

(assert (=> d!146373 (=> res!908100 e!773786)))

(assert (=> d!146373 (= res!908100 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45342 a!3742)))))

(assert (=> d!146373 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127612 (Cons!31829 (select (arr!44792 a!3742) #b00000000000000000000000000000000) Nil!31830) Nil!31830)) e!773786)))

(declare-fun b!1364464 () Bool)

(declare-fun e!773787 () Bool)

(assert (=> b!1364464 (= e!773787 call!65455)))

(declare-fun b!1364465 () Bool)

(declare-fun e!773788 () Bool)

(assert (=> b!1364465 (= e!773788 (contains!9542 (ite c!127612 (Cons!31829 (select (arr!44792 a!3742) #b00000000000000000000000000000000) Nil!31830) Nil!31830) (select (arr!44792 a!3742) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

