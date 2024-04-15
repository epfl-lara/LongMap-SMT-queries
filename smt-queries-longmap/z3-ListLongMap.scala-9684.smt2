; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114242 () Bool)

(assert start!114242)

(declare-fun b!1357130 () Bool)

(declare-fun e!770237 () Bool)

(declare-fun e!770238 () Bool)

(assert (=> b!1357130 (= e!770237 (not e!770238))))

(declare-fun res!901927 () Bool)

(assert (=> b!1357130 (=> res!901927 e!770238)))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357130 (= res!901927 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-datatypes ((List!31754 0))(
  ( (Nil!31751) (Cons!31750 (h!32959 (_ BitVec 64)) (t!46404 List!31754)) )
))
(declare-fun acc!759 () List!31754)

(declare-fun subseq!812 (List!31754 List!31754) Bool)

(assert (=> b!1357130 (subseq!812 acc!759 acc!759)))

(declare-datatypes ((Unit!44496 0))(
  ( (Unit!44497) )
))
(declare-fun lt!598942 () Unit!44496)

(declare-fun lemmaListSubSeqRefl!0 (List!31754) Unit!44496)

(assert (=> b!1357130 (= lt!598942 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357131 () Bool)

(declare-fun res!901928 () Bool)

(assert (=> b!1357131 (=> (not res!901928) (not e!770237))))

(declare-datatypes ((array!92373 0))(
  ( (array!92374 (arr!44635 (Array (_ BitVec 32) (_ BitVec 64))) (size!45187 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92373)

(declare-fun arrayNoDuplicates!0 (array!92373 (_ BitVec 32) List!31754) Bool)

(assert (=> b!1357131 (= res!901928 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31751))))

(declare-fun b!1357132 () Bool)

(declare-fun res!901930 () Bool)

(assert (=> b!1357132 (=> (not res!901930) (not e!770237))))

(declare-fun contains!9374 (List!31754 (_ BitVec 64)) Bool)

(assert (=> b!1357132 (= res!901930 (not (contains!9374 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357133 () Bool)

(declare-fun res!901936 () Bool)

(assert (=> b!1357133 (=> (not res!901936) (not e!770237))))

(declare-fun noDuplicate!2289 (List!31754) Bool)

(assert (=> b!1357133 (= res!901936 (noDuplicate!2289 acc!759))))

(declare-fun res!901931 () Bool)

(assert (=> start!114242 (=> (not res!901931) (not e!770237))))

(assert (=> start!114242 (= res!901931 (and (bvslt (size!45187 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45187 a!3742))))))

(assert (=> start!114242 e!770237))

(assert (=> start!114242 true))

(declare-fun array_inv!33868 (array!92373) Bool)

(assert (=> start!114242 (array_inv!33868 a!3742)))

(declare-fun b!1357134 () Bool)

(declare-fun res!901933 () Bool)

(assert (=> b!1357134 (=> (not res!901933) (not e!770237))))

(assert (=> b!1357134 (= res!901933 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357135 () Bool)

(declare-fun res!901935 () Bool)

(assert (=> b!1357135 (=> (not res!901935) (not e!770237))))

(assert (=> b!1357135 (= res!901935 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45187 a!3742)))))

(declare-fun b!1357136 () Bool)

(declare-fun res!901934 () Bool)

(assert (=> b!1357136 (=> (not res!901934) (not e!770237))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357136 (= res!901934 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357137 () Bool)

(declare-fun res!901937 () Bool)

(assert (=> b!1357137 (=> (not res!901937) (not e!770237))))

(assert (=> b!1357137 (= res!901937 (not (contains!9374 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357138 () Bool)

(declare-fun res!901932 () Bool)

(assert (=> b!1357138 (=> (not res!901932) (not e!770237))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357138 (= res!901932 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45187 a!3742))))))

(declare-fun b!1357139 () Bool)

(declare-fun res!901929 () Bool)

(assert (=> b!1357139 (=> (not res!901929) (not e!770237))))

(assert (=> b!1357139 (= res!901929 (validKeyInArray!0 (select (arr!44635 a!3742) from!3120)))))

(declare-fun b!1357140 () Bool)

(declare-fun $colon$colon!817 (List!31754 (_ BitVec 64)) List!31754)

(assert (=> b!1357140 (= e!770238 (noDuplicate!2289 ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120))))))

(assert (= (and start!114242 res!901931) b!1357133))

(assert (= (and b!1357133 res!901936) b!1357132))

(assert (= (and b!1357132 res!901930) b!1357137))

(assert (= (and b!1357137 res!901937) b!1357131))

(assert (= (and b!1357131 res!901928) b!1357134))

(assert (= (and b!1357134 res!901933) b!1357138))

(assert (= (and b!1357138 res!901932) b!1357136))

(assert (= (and b!1357136 res!901934) b!1357135))

(assert (= (and b!1357135 res!901935) b!1357139))

(assert (= (and b!1357139 res!901929) b!1357130))

(assert (= (and b!1357130 (not res!901927)) b!1357140))

(declare-fun m!1242481 () Bool)

(assert (=> b!1357136 m!1242481))

(declare-fun m!1242483 () Bool)

(assert (=> b!1357132 m!1242483))

(declare-fun m!1242485 () Bool)

(assert (=> b!1357139 m!1242485))

(assert (=> b!1357139 m!1242485))

(declare-fun m!1242487 () Bool)

(assert (=> b!1357139 m!1242487))

(assert (=> b!1357140 m!1242485))

(assert (=> b!1357140 m!1242485))

(declare-fun m!1242489 () Bool)

(assert (=> b!1357140 m!1242489))

(assert (=> b!1357140 m!1242489))

(declare-fun m!1242491 () Bool)

(assert (=> b!1357140 m!1242491))

(declare-fun m!1242493 () Bool)

(assert (=> b!1357131 m!1242493))

(declare-fun m!1242495 () Bool)

(assert (=> b!1357137 m!1242495))

(declare-fun m!1242497 () Bool)

(assert (=> b!1357133 m!1242497))

(declare-fun m!1242499 () Bool)

(assert (=> b!1357130 m!1242499))

(declare-fun m!1242501 () Bool)

(assert (=> b!1357130 m!1242501))

(declare-fun m!1242503 () Bool)

(assert (=> start!114242 m!1242503))

(declare-fun m!1242505 () Bool)

(assert (=> b!1357134 m!1242505))

(check-sat (not b!1357132) (not b!1357131) (not b!1357130) (not b!1357133) (not b!1357134) (not b!1357140) (not start!114242) (not b!1357137) (not b!1357139) (not b!1357136))
(check-sat)
(get-model)

(declare-fun d!144971 () Bool)

(assert (=> d!144971 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357136 d!144971))

(declare-fun d!144973 () Bool)

(assert (=> d!144973 (= (array_inv!33868 a!3742) (bvsge (size!45187 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114242 d!144973))

(declare-fun b!1357217 () Bool)

(declare-fun e!770267 () Bool)

(assert (=> b!1357217 (= e!770267 (subseq!812 (t!46404 acc!759) (t!46404 acc!759)))))

(declare-fun b!1357218 () Bool)

(declare-fun e!770268 () Bool)

(assert (=> b!1357218 (= e!770268 (subseq!812 acc!759 (t!46404 acc!759)))))

(declare-fun b!1357215 () Bool)

(declare-fun e!770266 () Bool)

(declare-fun e!770269 () Bool)

(assert (=> b!1357215 (= e!770266 e!770269)))

(declare-fun res!902012 () Bool)

(assert (=> b!1357215 (=> (not res!902012) (not e!770269))))

(get-info :version)

(assert (=> b!1357215 (= res!902012 ((_ is Cons!31750) acc!759))))

(declare-fun d!144975 () Bool)

(declare-fun res!902015 () Bool)

(assert (=> d!144975 (=> res!902015 e!770266)))

(assert (=> d!144975 (= res!902015 ((_ is Nil!31751) acc!759))))

(assert (=> d!144975 (= (subseq!812 acc!759 acc!759) e!770266)))

(declare-fun b!1357216 () Bool)

(assert (=> b!1357216 (= e!770269 e!770268)))

(declare-fun res!902013 () Bool)

(assert (=> b!1357216 (=> res!902013 e!770268)))

(assert (=> b!1357216 (= res!902013 e!770267)))

(declare-fun res!902014 () Bool)

(assert (=> b!1357216 (=> (not res!902014) (not e!770267))))

(assert (=> b!1357216 (= res!902014 (= (h!32959 acc!759) (h!32959 acc!759)))))

(assert (= (and d!144975 (not res!902015)) b!1357215))

(assert (= (and b!1357215 res!902012) b!1357216))

(assert (= (and b!1357216 res!902014) b!1357217))

(assert (= (and b!1357216 (not res!902013)) b!1357218))

(declare-fun m!1242559 () Bool)

(assert (=> b!1357217 m!1242559))

(declare-fun m!1242561 () Bool)

(assert (=> b!1357218 m!1242561))

(assert (=> b!1357130 d!144975))

(declare-fun d!144977 () Bool)

(assert (=> d!144977 (subseq!812 acc!759 acc!759)))

(declare-fun lt!598951 () Unit!44496)

(declare-fun choose!36 (List!31754) Unit!44496)

(assert (=> d!144977 (= lt!598951 (choose!36 acc!759))))

(assert (=> d!144977 (= (lemmaListSubSeqRefl!0 acc!759) lt!598951)))

(declare-fun bs!38901 () Bool)

(assert (= bs!38901 d!144977))

(assert (=> bs!38901 m!1242499))

(declare-fun m!1242563 () Bool)

(assert (=> bs!38901 m!1242563))

(assert (=> b!1357130 d!144977))

(declare-fun d!144979 () Bool)

(declare-fun res!902020 () Bool)

(declare-fun e!770274 () Bool)

(assert (=> d!144979 (=> res!902020 e!770274)))

(assert (=> d!144979 (= res!902020 ((_ is Nil!31751) ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120))))))

(assert (=> d!144979 (= (noDuplicate!2289 ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120))) e!770274)))

(declare-fun b!1357223 () Bool)

(declare-fun e!770275 () Bool)

(assert (=> b!1357223 (= e!770274 e!770275)))

(declare-fun res!902021 () Bool)

(assert (=> b!1357223 (=> (not res!902021) (not e!770275))))

(assert (=> b!1357223 (= res!902021 (not (contains!9374 (t!46404 ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120))) (h!32959 ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120))))))))

(declare-fun b!1357224 () Bool)

(assert (=> b!1357224 (= e!770275 (noDuplicate!2289 (t!46404 ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120)))))))

(assert (= (and d!144979 (not res!902020)) b!1357223))

(assert (= (and b!1357223 res!902021) b!1357224))

(declare-fun m!1242565 () Bool)

(assert (=> b!1357223 m!1242565))

(declare-fun m!1242567 () Bool)

(assert (=> b!1357224 m!1242567))

(assert (=> b!1357140 d!144979))

(declare-fun d!144981 () Bool)

(assert (=> d!144981 (= ($colon$colon!817 acc!759 (select (arr!44635 a!3742) from!3120)) (Cons!31750 (select (arr!44635 a!3742) from!3120) acc!759))))

(assert (=> b!1357140 d!144981))

(declare-fun b!1357253 () Bool)

(declare-fun e!770302 () Bool)

(declare-fun call!65226 () Bool)

(assert (=> b!1357253 (= e!770302 call!65226)))

(declare-fun b!1357254 () Bool)

(assert (=> b!1357254 (= e!770302 call!65226)))

(declare-fun e!770300 () Bool)

(declare-fun b!1357255 () Bool)

(assert (=> b!1357255 (= e!770300 (contains!9374 acc!759 (select (arr!44635 a!3742) from!3120)))))

(declare-fun b!1357256 () Bool)

(declare-fun e!770303 () Bool)

(assert (=> b!1357256 (= e!770303 e!770302)))

(declare-fun c!127048 () Bool)

(assert (=> b!1357256 (= c!127048 (validKeyInArray!0 (select (arr!44635 a!3742) from!3120)))))

(declare-fun b!1357257 () Bool)

(declare-fun e!770301 () Bool)

(assert (=> b!1357257 (= e!770301 e!770303)))

(declare-fun res!902044 () Bool)

(assert (=> b!1357257 (=> (not res!902044) (not e!770303))))

(assert (=> b!1357257 (= res!902044 (not e!770300))))

(declare-fun res!902042 () Bool)

(assert (=> b!1357257 (=> (not res!902042) (not e!770300))))

(assert (=> b!1357257 (= res!902042 (validKeyInArray!0 (select (arr!44635 a!3742) from!3120)))))

(declare-fun bm!65223 () Bool)

(assert (=> bm!65223 (= call!65226 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127048 (Cons!31750 (select (arr!44635 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun d!144983 () Bool)

(declare-fun res!902043 () Bool)

(assert (=> d!144983 (=> res!902043 e!770301)))

(assert (=> d!144983 (= res!902043 (bvsge from!3120 (size!45187 a!3742)))))

(assert (=> d!144983 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770301)))

(assert (= (and d!144983 (not res!902043)) b!1357257))

(assert (= (and b!1357257 res!902042) b!1357255))

(assert (= (and b!1357257 res!902044) b!1357256))

(assert (= (and b!1357256 c!127048) b!1357253))

(assert (= (and b!1357256 (not c!127048)) b!1357254))

(assert (= (or b!1357253 b!1357254) bm!65223))

(assert (=> b!1357255 m!1242485))

(assert (=> b!1357255 m!1242485))

(declare-fun m!1242577 () Bool)

(assert (=> b!1357255 m!1242577))

(assert (=> b!1357256 m!1242485))

(assert (=> b!1357256 m!1242485))

(assert (=> b!1357256 m!1242487))

(assert (=> b!1357257 m!1242485))

(assert (=> b!1357257 m!1242485))

(assert (=> b!1357257 m!1242487))

(assert (=> bm!65223 m!1242485))

(declare-fun m!1242579 () Bool)

(assert (=> bm!65223 m!1242579))

(assert (=> b!1357134 d!144983))

(declare-fun d!144997 () Bool)

(assert (=> d!144997 (= (validKeyInArray!0 (select (arr!44635 a!3742) from!3120)) (and (not (= (select (arr!44635 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44635 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357139 d!144997))

(declare-fun d!144999 () Bool)

(declare-fun res!902052 () Bool)

(declare-fun e!770312 () Bool)

(assert (=> d!144999 (=> res!902052 e!770312)))

(assert (=> d!144999 (= res!902052 ((_ is Nil!31751) acc!759))))

(assert (=> d!144999 (= (noDuplicate!2289 acc!759) e!770312)))

(declare-fun b!1357267 () Bool)

(declare-fun e!770313 () Bool)

(assert (=> b!1357267 (= e!770312 e!770313)))

(declare-fun res!902053 () Bool)

(assert (=> b!1357267 (=> (not res!902053) (not e!770313))))

(assert (=> b!1357267 (= res!902053 (not (contains!9374 (t!46404 acc!759) (h!32959 acc!759))))))

(declare-fun b!1357268 () Bool)

(assert (=> b!1357268 (= e!770313 (noDuplicate!2289 (t!46404 acc!759)))))

(assert (= (and d!144999 (not res!902052)) b!1357267))

(assert (= (and b!1357267 res!902053) b!1357268))

(declare-fun m!1242581 () Bool)

(assert (=> b!1357267 m!1242581))

(declare-fun m!1242583 () Bool)

(assert (=> b!1357268 m!1242583))

(assert (=> b!1357133 d!144999))

(declare-fun d!145001 () Bool)

(declare-fun lt!598957 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!672 (List!31754) (InoxSet (_ BitVec 64)))

(assert (=> d!145001 (= lt!598957 (select (content!672 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770326 () Bool)

(assert (=> d!145001 (= lt!598957 e!770326)))

(declare-fun res!902066 () Bool)

(assert (=> d!145001 (=> (not res!902066) (not e!770326))))

(assert (=> d!145001 (= res!902066 ((_ is Cons!31750) acc!759))))

(assert (=> d!145001 (= (contains!9374 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!598957)))

(declare-fun b!1357281 () Bool)

(declare-fun e!770327 () Bool)

(assert (=> b!1357281 (= e!770326 e!770327)))

(declare-fun res!902067 () Bool)

(assert (=> b!1357281 (=> res!902067 e!770327)))

(assert (=> b!1357281 (= res!902067 (= (h!32959 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357282 () Bool)

(assert (=> b!1357282 (= e!770327 (contains!9374 (t!46404 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145001 res!902066) b!1357281))

(assert (= (and b!1357281 (not res!902067)) b!1357282))

(declare-fun m!1242599 () Bool)

(assert (=> d!145001 m!1242599))

(declare-fun m!1242601 () Bool)

(assert (=> d!145001 m!1242601))

(declare-fun m!1242603 () Bool)

(assert (=> b!1357282 m!1242603))

(assert (=> b!1357132 d!145001))

(declare-fun d!145011 () Bool)

(declare-fun lt!598958 () Bool)

(assert (=> d!145011 (= lt!598958 (select (content!672 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770332 () Bool)

(assert (=> d!145011 (= lt!598958 e!770332)))

(declare-fun res!902072 () Bool)

(assert (=> d!145011 (=> (not res!902072) (not e!770332))))

(assert (=> d!145011 (= res!902072 ((_ is Cons!31750) acc!759))))

(assert (=> d!145011 (= (contains!9374 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!598958)))

(declare-fun b!1357285 () Bool)

(declare-fun e!770333 () Bool)

(assert (=> b!1357285 (= e!770332 e!770333)))

(declare-fun res!902073 () Bool)

(assert (=> b!1357285 (=> res!902073 e!770333)))

(assert (=> b!1357285 (= res!902073 (= (h!32959 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357286 () Bool)

(assert (=> b!1357286 (= e!770333 (contains!9374 (t!46404 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145011 res!902072) b!1357285))

(assert (= (and b!1357285 (not res!902073)) b!1357286))

(assert (=> d!145011 m!1242599))

(declare-fun m!1242605 () Bool)

(assert (=> d!145011 m!1242605))

(declare-fun m!1242607 () Bool)

(assert (=> b!1357286 m!1242607))

(assert (=> b!1357137 d!145011))

(declare-fun b!1357297 () Bool)

(declare-fun e!770342 () Bool)

(declare-fun call!65228 () Bool)

(assert (=> b!1357297 (= e!770342 call!65228)))

(declare-fun b!1357298 () Bool)

(assert (=> b!1357298 (= e!770342 call!65228)))

(declare-fun b!1357299 () Bool)

(declare-fun e!770340 () Bool)

(assert (=> b!1357299 (= e!770340 (contains!9374 Nil!31751 (select (arr!44635 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357300 () Bool)

(declare-fun e!770343 () Bool)

(assert (=> b!1357300 (= e!770343 e!770342)))

(declare-fun c!127052 () Bool)

(assert (=> b!1357300 (= c!127052 (validKeyInArray!0 (select (arr!44635 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357301 () Bool)

(declare-fun e!770341 () Bool)

(assert (=> b!1357301 (= e!770341 e!770343)))

(declare-fun res!902080 () Bool)

(assert (=> b!1357301 (=> (not res!902080) (not e!770343))))

(assert (=> b!1357301 (= res!902080 (not e!770340))))

(declare-fun res!902078 () Bool)

(assert (=> b!1357301 (=> (not res!902078) (not e!770340))))

(assert (=> b!1357301 (= res!902078 (validKeyInArray!0 (select (arr!44635 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65225 () Bool)

(assert (=> bm!65225 (= call!65228 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127052 (Cons!31750 (select (arr!44635 a!3742) #b00000000000000000000000000000000) Nil!31751) Nil!31751)))))

(declare-fun d!145013 () Bool)

(declare-fun res!902079 () Bool)

(assert (=> d!145013 (=> res!902079 e!770341)))

(assert (=> d!145013 (= res!902079 (bvsge #b00000000000000000000000000000000 (size!45187 a!3742)))))

(assert (=> d!145013 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31751) e!770341)))

(assert (= (and d!145013 (not res!902079)) b!1357301))

(assert (= (and b!1357301 res!902078) b!1357299))

(assert (= (and b!1357301 res!902080) b!1357300))

(assert (= (and b!1357300 c!127052) b!1357297))

(assert (= (and b!1357300 (not c!127052)) b!1357298))

(assert (= (or b!1357297 b!1357298) bm!65225))

(declare-fun m!1242613 () Bool)

(assert (=> b!1357299 m!1242613))

(assert (=> b!1357299 m!1242613))

(declare-fun m!1242615 () Bool)

(assert (=> b!1357299 m!1242615))

(assert (=> b!1357300 m!1242613))

(assert (=> b!1357300 m!1242613))

(declare-fun m!1242617 () Bool)

(assert (=> b!1357300 m!1242617))

(assert (=> b!1357301 m!1242613))

(assert (=> b!1357301 m!1242613))

(assert (=> b!1357301 m!1242617))

(assert (=> bm!65225 m!1242613))

(declare-fun m!1242619 () Bool)

(assert (=> bm!65225 m!1242619))

(assert (=> b!1357131 d!145013))

(check-sat (not bm!65225) (not b!1357300) (not bm!65223) (not b!1357224) (not b!1357286) (not b!1357218) (not b!1357223) (not d!144977) (not b!1357255) (not b!1357299) (not b!1357268) (not b!1357256) (not b!1357217) (not d!145011) (not d!145001) (not b!1357267) (not b!1357282) (not b!1357257) (not b!1357301))
(check-sat)
