; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114812 () Bool)

(assert start!114812)

(declare-fun b!1361211 () Bool)

(declare-datatypes ((Unit!44706 0))(
  ( (Unit!44707) )
))
(declare-fun e!772251 () Unit!44706)

(declare-fun Unit!44708 () Unit!44706)

(assert (=> b!1361211 (= e!772251 Unit!44708)))

(declare-fun b!1361212 () Bool)

(declare-fun e!772253 () Bool)

(declare-datatypes ((List!31829 0))(
  ( (Nil!31826) (Cons!31825 (h!33034 (_ BitVec 64)) (t!46503 List!31829)) )
))
(declare-fun lt!599946 () List!31829)

(declare-datatypes ((array!92547 0))(
  ( (array!92548 (arr!44710 (Array (_ BitVec 32) (_ BitVec 64))) (size!45262 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92547)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92547 (_ BitVec 32) List!31829) Bool)

(assert (=> b!1361212 (= e!772253 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599946)))))

(declare-fun b!1361213 () Bool)

(declare-fun res!905417 () Bool)

(declare-fun e!772255 () Bool)

(assert (=> b!1361213 (=> (not res!905417) (not e!772255))))

(assert (=> b!1361213 (= res!905417 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45262 a!3742)))))

(declare-fun b!1361214 () Bool)

(declare-fun res!905421 () Bool)

(assert (=> b!1361214 (=> (not res!905421) (not e!772255))))

(declare-fun acc!759 () List!31829)

(declare-fun contains!9449 (List!31829 (_ BitVec 64)) Bool)

(assert (=> b!1361214 (= res!905421 (not (contains!9449 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361215 () Bool)

(declare-fun res!905418 () Bool)

(assert (=> b!1361215 (=> (not res!905418) (not e!772255))))

(assert (=> b!1361215 (= res!905418 (not (contains!9449 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361216 () Bool)

(declare-fun res!905412 () Bool)

(assert (=> b!1361216 (=> (not res!905412) (not e!772255))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1361216 (= res!905412 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1361217 () Bool)

(declare-fun res!905419 () Bool)

(assert (=> b!1361217 (=> (not res!905419) (not e!772255))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1361217 (= res!905419 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45262 a!3742))))))

(declare-fun b!1361218 () Bool)

(declare-fun res!905413 () Bool)

(assert (=> b!1361218 (=> (not res!905413) (not e!772253))))

(declare-fun noDuplicate!2364 (List!31829) Bool)

(assert (=> b!1361218 (= res!905413 (noDuplicate!2364 lt!599946))))

(declare-fun b!1361219 () Bool)

(declare-fun res!905411 () Bool)

(assert (=> b!1361219 (=> (not res!905411) (not e!772253))))

(assert (=> b!1361219 (= res!905411 (not (contains!9449 lt!599946 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361220 () Bool)

(declare-fun res!905415 () Bool)

(assert (=> b!1361220 (=> (not res!905415) (not e!772253))))

(assert (=> b!1361220 (= res!905415 (not (contains!9449 lt!599946 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1361221 () Bool)

(declare-fun e!772252 () Bool)

(assert (=> b!1361221 (= e!772255 e!772252)))

(declare-fun res!905414 () Bool)

(assert (=> b!1361221 (=> (not res!905414) (not e!772252))))

(declare-fun lt!599943 () Bool)

(assert (=> b!1361221 (= res!905414 (and (not (= from!3120 i!1404)) lt!599943))))

(declare-fun lt!599947 () Unit!44706)

(assert (=> b!1361221 (= lt!599947 e!772251)))

(declare-fun c!127343 () Bool)

(assert (=> b!1361221 (= c!127343 lt!599943)))

(assert (=> b!1361221 (= lt!599943 (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)))))

(declare-fun b!1361222 () Bool)

(declare-fun res!905410 () Bool)

(assert (=> b!1361222 (=> (not res!905410) (not e!772255))))

(assert (=> b!1361222 (= res!905410 (noDuplicate!2364 acc!759))))

(declare-fun res!905416 () Bool)

(assert (=> start!114812 (=> (not res!905416) (not e!772255))))

(assert (=> start!114812 (= res!905416 (and (bvslt (size!45262 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45262 a!3742))))))

(assert (=> start!114812 e!772255))

(assert (=> start!114812 true))

(declare-fun array_inv!33943 (array!92547) Bool)

(assert (=> start!114812 (array_inv!33943 a!3742)))

(declare-fun b!1361223 () Bool)

(declare-fun res!905422 () Bool)

(assert (=> b!1361223 (=> (not res!905422) (not e!772255))))

(assert (=> b!1361223 (= res!905422 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31826))))

(declare-fun b!1361224 () Bool)

(declare-fun lt!599944 () Unit!44706)

(assert (=> b!1361224 (= e!772251 lt!599944)))

(declare-fun lt!599945 () Unit!44706)

(declare-fun lemmaListSubSeqRefl!0 (List!31829) Unit!44706)

(assert (=> b!1361224 (= lt!599945 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!887 (List!31829 List!31829) Bool)

(assert (=> b!1361224 (subseq!887 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92547 List!31829 List!31829 (_ BitVec 32)) Unit!44706)

(declare-fun $colon$colon!892 (List!31829 (_ BitVec 64)) List!31829)

(assert (=> b!1361224 (= lt!599944 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!892 acc!759 (select (arr!44710 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1361224 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1361225 () Bool)

(declare-fun res!905420 () Bool)

(assert (=> b!1361225 (=> (not res!905420) (not e!772255))))

(assert (=> b!1361225 (= res!905420 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1361226 () Bool)

(assert (=> b!1361226 (= e!772252 e!772253)))

(declare-fun res!905423 () Bool)

(assert (=> b!1361226 (=> (not res!905423) (not e!772253))))

(assert (=> b!1361226 (= res!905423 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1361226 (= lt!599946 ($colon$colon!892 acc!759 (select (arr!44710 a!3742) from!3120)))))

(assert (= (and start!114812 res!905416) b!1361222))

(assert (= (and b!1361222 res!905410) b!1361214))

(assert (= (and b!1361214 res!905421) b!1361215))

(assert (= (and b!1361215 res!905418) b!1361223))

(assert (= (and b!1361223 res!905422) b!1361225))

(assert (= (and b!1361225 res!905420) b!1361217))

(assert (= (and b!1361217 res!905419) b!1361216))

(assert (= (and b!1361216 res!905412) b!1361213))

(assert (= (and b!1361213 res!905417) b!1361221))

(assert (= (and b!1361221 c!127343) b!1361224))

(assert (= (and b!1361221 (not c!127343)) b!1361211))

(assert (= (and b!1361221 res!905414) b!1361226))

(assert (= (and b!1361226 res!905423) b!1361218))

(assert (= (and b!1361218 res!905413) b!1361220))

(assert (= (and b!1361220 res!905415) b!1361219))

(assert (= (and b!1361219 res!905411) b!1361212))

(declare-fun m!1245901 () Bool)

(assert (=> b!1361220 m!1245901))

(declare-fun m!1245903 () Bool)

(assert (=> b!1361212 m!1245903))

(declare-fun m!1245905 () Bool)

(assert (=> b!1361221 m!1245905))

(assert (=> b!1361221 m!1245905))

(declare-fun m!1245907 () Bool)

(assert (=> b!1361221 m!1245907))

(declare-fun m!1245909 () Bool)

(assert (=> b!1361216 m!1245909))

(declare-fun m!1245911 () Bool)

(assert (=> b!1361219 m!1245911))

(assert (=> b!1361226 m!1245905))

(assert (=> b!1361226 m!1245905))

(declare-fun m!1245913 () Bool)

(assert (=> b!1361226 m!1245913))

(declare-fun m!1245915 () Bool)

(assert (=> b!1361224 m!1245915))

(assert (=> b!1361224 m!1245905))

(assert (=> b!1361224 m!1245913))

(declare-fun m!1245917 () Bool)

(assert (=> b!1361224 m!1245917))

(declare-fun m!1245919 () Bool)

(assert (=> b!1361224 m!1245919))

(assert (=> b!1361224 m!1245905))

(assert (=> b!1361224 m!1245913))

(declare-fun m!1245921 () Bool)

(assert (=> b!1361224 m!1245921))

(declare-fun m!1245923 () Bool)

(assert (=> b!1361214 m!1245923))

(declare-fun m!1245925 () Bool)

(assert (=> b!1361222 m!1245925))

(declare-fun m!1245927 () Bool)

(assert (=> b!1361215 m!1245927))

(declare-fun m!1245929 () Bool)

(assert (=> b!1361218 m!1245929))

(declare-fun m!1245931 () Bool)

(assert (=> b!1361225 m!1245931))

(declare-fun m!1245933 () Bool)

(assert (=> b!1361223 m!1245933))

(declare-fun m!1245935 () Bool)

(assert (=> start!114812 m!1245935))

(check-sat (not b!1361212) (not start!114812) (not b!1361225) (not b!1361221) (not b!1361222) (not b!1361223) (not b!1361214) (not b!1361220) (not b!1361226) (not b!1361216) (not b!1361218) (not b!1361219) (not b!1361215) (not b!1361224))
(check-sat)
(get-model)

(declare-fun d!145723 () Bool)

(declare-fun lt!599980 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!693 (List!31829) (InoxSet (_ BitVec 64)))

(assert (=> d!145723 (= lt!599980 (select (content!693 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772291 () Bool)

(assert (=> d!145723 (= lt!599980 e!772291)))

(declare-fun res!905512 () Bool)

(assert (=> d!145723 (=> (not res!905512) (not e!772291))))

(get-info :version)

(assert (=> d!145723 (= res!905512 ((_ is Cons!31825) acc!759))))

(assert (=> d!145723 (= (contains!9449 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599980)))

(declare-fun b!1361327 () Bool)

(declare-fun e!772290 () Bool)

(assert (=> b!1361327 (= e!772291 e!772290)))

(declare-fun res!905513 () Bool)

(assert (=> b!1361327 (=> res!905513 e!772290)))

(assert (=> b!1361327 (= res!905513 (= (h!33034 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361328 () Bool)

(assert (=> b!1361328 (= e!772290 (contains!9449 (t!46503 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145723 res!905512) b!1361327))

(assert (= (and b!1361327 (not res!905513)) b!1361328))

(declare-fun m!1246009 () Bool)

(assert (=> d!145723 m!1246009))

(declare-fun m!1246011 () Bool)

(assert (=> d!145723 m!1246011))

(declare-fun m!1246013 () Bool)

(assert (=> b!1361328 m!1246013))

(assert (=> b!1361214 d!145723))

(declare-fun b!1361339 () Bool)

(declare-fun e!772302 () Bool)

(declare-fun call!65341 () Bool)

(assert (=> b!1361339 (= e!772302 call!65341)))

(declare-fun bm!65338 () Bool)

(declare-fun c!127352 () Bool)

(assert (=> bm!65338 (= call!65341 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127352 (Cons!31825 (select (arr!44710 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1361340 () Bool)

(assert (=> b!1361340 (= e!772302 call!65341)))

(declare-fun b!1361341 () Bool)

(declare-fun e!772301 () Bool)

(assert (=> b!1361341 (= e!772301 e!772302)))

(assert (=> b!1361341 (= c!127352 (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)))))

(declare-fun b!1361342 () Bool)

(declare-fun e!772303 () Bool)

(assert (=> b!1361342 (= e!772303 e!772301)))

(declare-fun res!905521 () Bool)

(assert (=> b!1361342 (=> (not res!905521) (not e!772301))))

(declare-fun e!772300 () Bool)

(assert (=> b!1361342 (= res!905521 (not e!772300))))

(declare-fun res!905522 () Bool)

(assert (=> b!1361342 (=> (not res!905522) (not e!772300))))

(assert (=> b!1361342 (= res!905522 (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)))))

(declare-fun d!145725 () Bool)

(declare-fun res!905520 () Bool)

(assert (=> d!145725 (=> res!905520 e!772303)))

(assert (=> d!145725 (= res!905520 (bvsge from!3120 (size!45262 a!3742)))))

(assert (=> d!145725 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!772303)))

(declare-fun b!1361343 () Bool)

(assert (=> b!1361343 (= e!772300 (contains!9449 acc!759 (select (arr!44710 a!3742) from!3120)))))

(assert (= (and d!145725 (not res!905520)) b!1361342))

(assert (= (and b!1361342 res!905522) b!1361343))

(assert (= (and b!1361342 res!905521) b!1361341))

(assert (= (and b!1361341 c!127352) b!1361339))

(assert (= (and b!1361341 (not c!127352)) b!1361340))

(assert (= (or b!1361339 b!1361340) bm!65338))

(assert (=> bm!65338 m!1245905))

(declare-fun m!1246015 () Bool)

(assert (=> bm!65338 m!1246015))

(assert (=> b!1361341 m!1245905))

(assert (=> b!1361341 m!1245905))

(assert (=> b!1361341 m!1245907))

(assert (=> b!1361342 m!1245905))

(assert (=> b!1361342 m!1245905))

(assert (=> b!1361342 m!1245907))

(assert (=> b!1361343 m!1245905))

(assert (=> b!1361343 m!1245905))

(declare-fun m!1246017 () Bool)

(assert (=> b!1361343 m!1246017))

(assert (=> b!1361225 d!145725))

(declare-fun b!1361344 () Bool)

(declare-fun e!772306 () Bool)

(declare-fun call!65342 () Bool)

(assert (=> b!1361344 (= e!772306 call!65342)))

(declare-fun bm!65339 () Bool)

(declare-fun c!127353 () Bool)

(assert (=> bm!65339 (= call!65342 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127353 (Cons!31825 (select (arr!44710 a!3742) #b00000000000000000000000000000000) Nil!31826) Nil!31826)))))

(declare-fun b!1361345 () Bool)

(assert (=> b!1361345 (= e!772306 call!65342)))

(declare-fun b!1361346 () Bool)

(declare-fun e!772305 () Bool)

(assert (=> b!1361346 (= e!772305 e!772306)))

(assert (=> b!1361346 (= c!127353 (validKeyInArray!0 (select (arr!44710 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1361347 () Bool)

(declare-fun e!772307 () Bool)

(assert (=> b!1361347 (= e!772307 e!772305)))

(declare-fun res!905524 () Bool)

(assert (=> b!1361347 (=> (not res!905524) (not e!772305))))

(declare-fun e!772304 () Bool)

(assert (=> b!1361347 (= res!905524 (not e!772304))))

(declare-fun res!905525 () Bool)

(assert (=> b!1361347 (=> (not res!905525) (not e!772304))))

(assert (=> b!1361347 (= res!905525 (validKeyInArray!0 (select (arr!44710 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145727 () Bool)

(declare-fun res!905523 () Bool)

(assert (=> d!145727 (=> res!905523 e!772307)))

(assert (=> d!145727 (= res!905523 (bvsge #b00000000000000000000000000000000 (size!45262 a!3742)))))

(assert (=> d!145727 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31826) e!772307)))

(declare-fun b!1361348 () Bool)

(assert (=> b!1361348 (= e!772304 (contains!9449 Nil!31826 (select (arr!44710 a!3742) #b00000000000000000000000000000000)))))

(assert (= (and d!145727 (not res!905523)) b!1361347))

(assert (= (and b!1361347 res!905525) b!1361348))

(assert (= (and b!1361347 res!905524) b!1361346))

(assert (= (and b!1361346 c!127353) b!1361344))

(assert (= (and b!1361346 (not c!127353)) b!1361345))

(assert (= (or b!1361344 b!1361345) bm!65339))

(declare-fun m!1246019 () Bool)

(assert (=> bm!65339 m!1246019))

(declare-fun m!1246021 () Bool)

(assert (=> bm!65339 m!1246021))

(assert (=> b!1361346 m!1246019))

(assert (=> b!1361346 m!1246019))

(declare-fun m!1246023 () Bool)

(assert (=> b!1361346 m!1246023))

(assert (=> b!1361347 m!1246019))

(assert (=> b!1361347 m!1246019))

(assert (=> b!1361347 m!1246023))

(assert (=> b!1361348 m!1246019))

(assert (=> b!1361348 m!1246019))

(declare-fun m!1246025 () Bool)

(assert (=> b!1361348 m!1246025))

(assert (=> b!1361223 d!145727))

(declare-fun d!145729 () Bool)

(assert (=> d!145729 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!599983 () Unit!44706)

(declare-fun choose!80 (array!92547 List!31829 List!31829 (_ BitVec 32)) Unit!44706)

(assert (=> d!145729 (= lt!599983 (choose!80 a!3742 ($colon$colon!892 acc!759 (select (arr!44710 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145729 (bvslt (size!45262 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145729 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!892 acc!759 (select (arr!44710 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!599983)))

(declare-fun bs!39012 () Bool)

(assert (= bs!39012 d!145729))

(assert (=> bs!39012 m!1245919))

(assert (=> bs!39012 m!1245913))

(declare-fun m!1246027 () Bool)

(assert (=> bs!39012 m!1246027))

(assert (=> b!1361224 d!145729))

(declare-fun b!1361359 () Bool)

(declare-fun e!772316 () Bool)

(assert (=> b!1361359 (= e!772316 (subseq!887 (t!46503 acc!759) (t!46503 acc!759)))))

(declare-fun b!1361357 () Bool)

(declare-fun e!772318 () Bool)

(declare-fun e!772319 () Bool)

(assert (=> b!1361357 (= e!772318 e!772319)))

(declare-fun res!905537 () Bool)

(assert (=> b!1361357 (=> (not res!905537) (not e!772319))))

(assert (=> b!1361357 (= res!905537 ((_ is Cons!31825) acc!759))))

(declare-fun d!145735 () Bool)

(declare-fun res!905536 () Bool)

(assert (=> d!145735 (=> res!905536 e!772318)))

(assert (=> d!145735 (= res!905536 ((_ is Nil!31826) acc!759))))

(assert (=> d!145735 (= (subseq!887 acc!759 acc!759) e!772318)))

(declare-fun b!1361358 () Bool)

(declare-fun e!772317 () Bool)

(assert (=> b!1361358 (= e!772319 e!772317)))

(declare-fun res!905535 () Bool)

(assert (=> b!1361358 (=> res!905535 e!772317)))

(assert (=> b!1361358 (= res!905535 e!772316)))

(declare-fun res!905534 () Bool)

(assert (=> b!1361358 (=> (not res!905534) (not e!772316))))

(assert (=> b!1361358 (= res!905534 (= (h!33034 acc!759) (h!33034 acc!759)))))

(declare-fun b!1361360 () Bool)

(assert (=> b!1361360 (= e!772317 (subseq!887 acc!759 (t!46503 acc!759)))))

(assert (= (and d!145735 (not res!905536)) b!1361357))

(assert (= (and b!1361357 res!905537) b!1361358))

(assert (= (and b!1361358 res!905534) b!1361359))

(assert (= (and b!1361358 (not res!905535)) b!1361360))

(declare-fun m!1246029 () Bool)

(assert (=> b!1361359 m!1246029))

(declare-fun m!1246031 () Bool)

(assert (=> b!1361360 m!1246031))

(assert (=> b!1361224 d!145735))

(declare-fun b!1361361 () Bool)

(declare-fun e!772322 () Bool)

(declare-fun call!65343 () Bool)

(assert (=> b!1361361 (= e!772322 call!65343)))

(declare-fun bm!65340 () Bool)

(declare-fun c!127354 () Bool)

(assert (=> bm!65340 (= call!65343 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127354 (Cons!31825 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1361362 () Bool)

(assert (=> b!1361362 (= e!772322 call!65343)))

(declare-fun b!1361363 () Bool)

(declare-fun e!772321 () Bool)

(assert (=> b!1361363 (= e!772321 e!772322)))

(assert (=> b!1361363 (= c!127354 (validKeyInArray!0 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361364 () Bool)

(declare-fun e!772323 () Bool)

(assert (=> b!1361364 (= e!772323 e!772321)))

(declare-fun res!905539 () Bool)

(assert (=> b!1361364 (=> (not res!905539) (not e!772321))))

(declare-fun e!772320 () Bool)

(assert (=> b!1361364 (= res!905539 (not e!772320))))

(declare-fun res!905540 () Bool)

(assert (=> b!1361364 (=> (not res!905540) (not e!772320))))

(assert (=> b!1361364 (= res!905540 (validKeyInArray!0 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145743 () Bool)

(declare-fun res!905538 () Bool)

(assert (=> d!145743 (=> res!905538 e!772323)))

(assert (=> d!145743 (= res!905538 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45262 a!3742)))))

(assert (=> d!145743 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!772323)))

(declare-fun b!1361365 () Bool)

(assert (=> b!1361365 (= e!772320 (contains!9449 acc!759 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145743 (not res!905538)) b!1361364))

(assert (= (and b!1361364 res!905540) b!1361365))

(assert (= (and b!1361364 res!905539) b!1361363))

(assert (= (and b!1361363 c!127354) b!1361361))

(assert (= (and b!1361363 (not c!127354)) b!1361362))

(assert (= (or b!1361361 b!1361362) bm!65340))

(declare-fun m!1246033 () Bool)

(assert (=> bm!65340 m!1246033))

(declare-fun m!1246035 () Bool)

(assert (=> bm!65340 m!1246035))

(assert (=> b!1361363 m!1246033))

(assert (=> b!1361363 m!1246033))

(declare-fun m!1246037 () Bool)

(assert (=> b!1361363 m!1246037))

(assert (=> b!1361364 m!1246033))

(assert (=> b!1361364 m!1246033))

(assert (=> b!1361364 m!1246037))

(assert (=> b!1361365 m!1246033))

(assert (=> b!1361365 m!1246033))

(declare-fun m!1246039 () Bool)

(assert (=> b!1361365 m!1246039))

(assert (=> b!1361224 d!145743))

(declare-fun d!145745 () Bool)

(assert (=> d!145745 (= ($colon$colon!892 acc!759 (select (arr!44710 a!3742) from!3120)) (Cons!31825 (select (arr!44710 a!3742) from!3120) acc!759))))

(assert (=> b!1361224 d!145745))

(declare-fun d!145747 () Bool)

(assert (=> d!145747 (subseq!887 acc!759 acc!759)))

(declare-fun lt!599986 () Unit!44706)

(declare-fun choose!36 (List!31829) Unit!44706)

(assert (=> d!145747 (= lt!599986 (choose!36 acc!759))))

(assert (=> d!145747 (= (lemmaListSubSeqRefl!0 acc!759) lt!599986)))

(declare-fun bs!39013 () Bool)

(assert (= bs!39013 d!145747))

(assert (=> bs!39013 m!1245921))

(declare-fun m!1246041 () Bool)

(assert (=> bs!39013 m!1246041))

(assert (=> b!1361224 d!145747))

(declare-fun d!145749 () Bool)

(declare-fun lt!599987 () Bool)

(assert (=> d!145749 (= lt!599987 (select (content!693 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772333 () Bool)

(assert (=> d!145749 (= lt!599987 e!772333)))

(declare-fun res!905547 () Bool)

(assert (=> d!145749 (=> (not res!905547) (not e!772333))))

(assert (=> d!145749 (= res!905547 ((_ is Cons!31825) acc!759))))

(assert (=> d!145749 (= (contains!9449 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599987)))

(declare-fun b!1361376 () Bool)

(declare-fun e!772332 () Bool)

(assert (=> b!1361376 (= e!772333 e!772332)))

(declare-fun res!905548 () Bool)

(assert (=> b!1361376 (=> res!905548 e!772332)))

(assert (=> b!1361376 (= res!905548 (= (h!33034 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361377 () Bool)

(assert (=> b!1361377 (= e!772332 (contains!9449 (t!46503 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145749 res!905547) b!1361376))

(assert (= (and b!1361376 (not res!905548)) b!1361377))

(assert (=> d!145749 m!1246009))

(declare-fun m!1246043 () Bool)

(assert (=> d!145749 m!1246043))

(declare-fun m!1246045 () Bool)

(assert (=> b!1361377 m!1246045))

(assert (=> b!1361215 d!145749))

(assert (=> b!1361226 d!145745))

(declare-fun d!145751 () Bool)

(assert (=> d!145751 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361216 d!145751))

(declare-fun d!145753 () Bool)

(declare-fun lt!599988 () Bool)

(assert (=> d!145753 (= lt!599988 (select (content!693 lt!599946) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772343 () Bool)

(assert (=> d!145753 (= lt!599988 e!772343)))

(declare-fun res!905555 () Bool)

(assert (=> d!145753 (=> (not res!905555) (not e!772343))))

(assert (=> d!145753 (= res!905555 ((_ is Cons!31825) lt!599946))))

(assert (=> d!145753 (= (contains!9449 lt!599946 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599988)))

(declare-fun b!1361388 () Bool)

(declare-fun e!772342 () Bool)

(assert (=> b!1361388 (= e!772343 e!772342)))

(declare-fun res!905556 () Bool)

(assert (=> b!1361388 (=> res!905556 e!772342)))

(assert (=> b!1361388 (= res!905556 (= (h!33034 lt!599946) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361389 () Bool)

(assert (=> b!1361389 (= e!772342 (contains!9449 (t!46503 lt!599946) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145753 res!905555) b!1361388))

(assert (= (and b!1361388 (not res!905556)) b!1361389))

(declare-fun m!1246047 () Bool)

(assert (=> d!145753 m!1246047))

(declare-fun m!1246049 () Bool)

(assert (=> d!145753 m!1246049))

(declare-fun m!1246051 () Bool)

(assert (=> b!1361389 m!1246051))

(assert (=> b!1361219 d!145753))

(declare-fun d!145755 () Bool)

(declare-fun lt!599989 () Bool)

(assert (=> d!145755 (= lt!599989 (select (content!693 lt!599946) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!772345 () Bool)

(assert (=> d!145755 (= lt!599989 e!772345)))

(declare-fun res!905557 () Bool)

(assert (=> d!145755 (=> (not res!905557) (not e!772345))))

(assert (=> d!145755 (= res!905557 ((_ is Cons!31825) lt!599946))))

(assert (=> d!145755 (= (contains!9449 lt!599946 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599989)))

(declare-fun b!1361390 () Bool)

(declare-fun e!772344 () Bool)

(assert (=> b!1361390 (= e!772345 e!772344)))

(declare-fun res!905558 () Bool)

(assert (=> b!1361390 (=> res!905558 e!772344)))

(assert (=> b!1361390 (= res!905558 (= (h!33034 lt!599946) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1361391 () Bool)

(assert (=> b!1361391 (= e!772344 (contains!9449 (t!46503 lt!599946) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145755 res!905557) b!1361390))

(assert (= (and b!1361390 (not res!905558)) b!1361391))

(assert (=> d!145755 m!1246047))

(declare-fun m!1246053 () Bool)

(assert (=> d!145755 m!1246053))

(declare-fun m!1246055 () Bool)

(assert (=> b!1361391 m!1246055))

(assert (=> b!1361220 d!145755))

(declare-fun d!145757 () Bool)

(declare-fun res!905563 () Bool)

(declare-fun e!772350 () Bool)

(assert (=> d!145757 (=> res!905563 e!772350)))

(assert (=> d!145757 (= res!905563 ((_ is Nil!31826) lt!599946))))

(assert (=> d!145757 (= (noDuplicate!2364 lt!599946) e!772350)))

(declare-fun b!1361396 () Bool)

(declare-fun e!772351 () Bool)

(assert (=> b!1361396 (= e!772350 e!772351)))

(declare-fun res!905564 () Bool)

(assert (=> b!1361396 (=> (not res!905564) (not e!772351))))

(assert (=> b!1361396 (= res!905564 (not (contains!9449 (t!46503 lt!599946) (h!33034 lt!599946))))))

(declare-fun b!1361397 () Bool)

(assert (=> b!1361397 (= e!772351 (noDuplicate!2364 (t!46503 lt!599946)))))

(assert (= (and d!145757 (not res!905563)) b!1361396))

(assert (= (and b!1361396 res!905564) b!1361397))

(declare-fun m!1246057 () Bool)

(assert (=> b!1361396 m!1246057))

(declare-fun m!1246059 () Bool)

(assert (=> b!1361397 m!1246059))

(assert (=> b!1361218 d!145757))

(declare-fun d!145759 () Bool)

(declare-fun res!905565 () Bool)

(declare-fun e!772352 () Bool)

(assert (=> d!145759 (=> res!905565 e!772352)))

(assert (=> d!145759 (= res!905565 ((_ is Nil!31826) acc!759))))

(assert (=> d!145759 (= (noDuplicate!2364 acc!759) e!772352)))

(declare-fun b!1361398 () Bool)

(declare-fun e!772353 () Bool)

(assert (=> b!1361398 (= e!772352 e!772353)))

(declare-fun res!905566 () Bool)

(assert (=> b!1361398 (=> (not res!905566) (not e!772353))))

(assert (=> b!1361398 (= res!905566 (not (contains!9449 (t!46503 acc!759) (h!33034 acc!759))))))

(declare-fun b!1361399 () Bool)

(assert (=> b!1361399 (= e!772353 (noDuplicate!2364 (t!46503 acc!759)))))

(assert (= (and d!145759 (not res!905565)) b!1361398))

(assert (= (and b!1361398 res!905566) b!1361399))

(declare-fun m!1246061 () Bool)

(assert (=> b!1361398 m!1246061))

(declare-fun m!1246063 () Bool)

(assert (=> b!1361399 m!1246063))

(assert (=> b!1361222 d!145759))

(declare-fun b!1361400 () Bool)

(declare-fun e!772356 () Bool)

(declare-fun call!65348 () Bool)

(assert (=> b!1361400 (= e!772356 call!65348)))

(declare-fun c!127359 () Bool)

(declare-fun bm!65345 () Bool)

(assert (=> bm!65345 (= call!65348 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127359 (Cons!31825 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) lt!599946) lt!599946)))))

(declare-fun b!1361401 () Bool)

(assert (=> b!1361401 (= e!772356 call!65348)))

(declare-fun b!1361402 () Bool)

(declare-fun e!772355 () Bool)

(assert (=> b!1361402 (= e!772355 e!772356)))

(assert (=> b!1361402 (= c!127359 (validKeyInArray!0 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1361403 () Bool)

(declare-fun e!772357 () Bool)

(assert (=> b!1361403 (= e!772357 e!772355)))

(declare-fun res!905568 () Bool)

(assert (=> b!1361403 (=> (not res!905568) (not e!772355))))

(declare-fun e!772354 () Bool)

(assert (=> b!1361403 (= res!905568 (not e!772354))))

(declare-fun res!905569 () Bool)

(assert (=> b!1361403 (=> (not res!905569) (not e!772354))))

(assert (=> b!1361403 (= res!905569 (validKeyInArray!0 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145761 () Bool)

(declare-fun res!905567 () Bool)

(assert (=> d!145761 (=> res!905567 e!772357)))

(assert (=> d!145761 (= res!905567 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45262 a!3742)))))

(assert (=> d!145761 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!599946) e!772357)))

(declare-fun b!1361404 () Bool)

(assert (=> b!1361404 (= e!772354 (contains!9449 lt!599946 (select (arr!44710 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(assert (= (and d!145761 (not res!905567)) b!1361403))

(assert (= (and b!1361403 res!905569) b!1361404))

(assert (= (and b!1361403 res!905568) b!1361402))

(assert (= (and b!1361402 c!127359) b!1361400))

(assert (= (and b!1361402 (not c!127359)) b!1361401))

(assert (= (or b!1361400 b!1361401) bm!65345))

(assert (=> bm!65345 m!1246033))

(declare-fun m!1246065 () Bool)

(assert (=> bm!65345 m!1246065))

(assert (=> b!1361402 m!1246033))

(assert (=> b!1361402 m!1246033))

(assert (=> b!1361402 m!1246037))

(assert (=> b!1361403 m!1246033))

(assert (=> b!1361403 m!1246033))

(assert (=> b!1361403 m!1246037))

(assert (=> b!1361404 m!1246033))

(assert (=> b!1361404 m!1246033))

(declare-fun m!1246067 () Bool)

(assert (=> b!1361404 m!1246067))

(assert (=> b!1361212 d!145761))

(declare-fun d!145763 () Bool)

(assert (=> d!145763 (= (array_inv!33943 a!3742) (bvsge (size!45262 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114812 d!145763))

(declare-fun d!145765 () Bool)

(assert (=> d!145765 (= (validKeyInArray!0 (select (arr!44710 a!3742) from!3120)) (and (not (= (select (arr!44710 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44710 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1361221 d!145765))

(check-sat (not bm!65340) (not d!145723) (not b!1361365) (not b!1361341) (not b!1361343) (not bm!65345) (not b!1361402) (not b!1361403) (not b!1361359) (not d!145753) (not bm!65339) (not d!145755) (not d!145729) (not b!1361347) (not b!1361397) (not d!145747) (not b!1361348) (not b!1361342) (not d!145749) (not b!1361364) (not b!1361391) (not b!1361396) (not b!1361389) (not b!1361346) (not b!1361398) (not b!1361399) (not b!1361363) (not b!1361360) (not b!1361404) (not bm!65338) (not b!1361328) (not b!1361377))
(check-sat)
