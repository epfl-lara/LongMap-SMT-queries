; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114244 () Bool)

(assert start!114244)

(declare-fun b!1357233 () Bool)

(declare-fun res!901993 () Bool)

(declare-fun e!770281 () Bool)

(assert (=> b!1357233 (=> (not res!901993) (not e!770281))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357233 (= res!901993 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357234 () Bool)

(declare-fun res!901991 () Bool)

(assert (=> b!1357234 (=> (not res!901991) (not e!770281))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92426 0))(
  ( (array!92427 (arr!44661 (Array (_ BitVec 32) (_ BitVec 64))) (size!45211 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92426)

(assert (=> b!1357234 (= res!901991 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45211 a!3742)))))

(declare-fun res!901990 () Bool)

(assert (=> start!114244 (=> (not res!901990) (not e!770281))))

(assert (=> start!114244 (= res!901990 (and (bvslt (size!45211 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45211 a!3742))))))

(assert (=> start!114244 e!770281))

(assert (=> start!114244 true))

(declare-fun array_inv!33689 (array!92426) Bool)

(assert (=> start!114244 (array_inv!33689 a!3742)))

(declare-fun b!1357235 () Bool)

(declare-fun res!901992 () Bool)

(assert (=> b!1357235 (=> (not res!901992) (not e!770281))))

(declare-datatypes ((List!31702 0))(
  ( (Nil!31699) (Cons!31698 (h!32907 (_ BitVec 64)) (t!46360 List!31702)) )
))
(declare-fun acc!759 () List!31702)

(declare-fun noDuplicate!2268 (List!31702) Bool)

(assert (=> b!1357235 (= res!901992 (noDuplicate!2268 acc!759))))

(declare-fun b!1357236 () Bool)

(declare-fun res!901998 () Bool)

(assert (=> b!1357236 (=> (not res!901998) (not e!770281))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357236 (= res!901998 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45211 a!3742))))))

(declare-fun b!1357237 () Bool)

(declare-fun e!770280 () Bool)

(assert (=> b!1357237 (= e!770281 (not e!770280))))

(declare-fun res!901989 () Bool)

(assert (=> b!1357237 (=> res!901989 e!770280)))

(assert (=> b!1357237 (= res!901989 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun subseq!813 (List!31702 List!31702) Bool)

(assert (=> b!1357237 (subseq!813 acc!759 acc!759)))

(declare-datatypes ((Unit!44657 0))(
  ( (Unit!44658) )
))
(declare-fun lt!599131 () Unit!44657)

(declare-fun lemmaListSubSeqRefl!0 (List!31702) Unit!44657)

(assert (=> b!1357237 (= lt!599131 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357238 () Bool)

(declare-fun res!901997 () Bool)

(assert (=> b!1357238 (=> (not res!901997) (not e!770281))))

(declare-fun arrayNoDuplicates!0 (array!92426 (_ BitVec 32) List!31702) Bool)

(assert (=> b!1357238 (= res!901997 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357239 () Bool)

(declare-fun res!901994 () Bool)

(assert (=> b!1357239 (=> (not res!901994) (not e!770281))))

(assert (=> b!1357239 (= res!901994 (validKeyInArray!0 (select (arr!44661 a!3742) from!3120)))))

(declare-fun b!1357240 () Bool)

(declare-fun res!901996 () Bool)

(assert (=> b!1357240 (=> (not res!901996) (not e!770281))))

(declare-fun contains!9411 (List!31702 (_ BitVec 64)) Bool)

(assert (=> b!1357240 (= res!901996 (not (contains!9411 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357241 () Bool)

(declare-fun res!901999 () Bool)

(assert (=> b!1357241 (=> (not res!901999) (not e!770281))))

(assert (=> b!1357241 (= res!901999 (not (contains!9411 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357242 () Bool)

(declare-fun res!901995 () Bool)

(assert (=> b!1357242 (=> (not res!901995) (not e!770281))))

(assert (=> b!1357242 (= res!901995 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31699))))

(declare-fun b!1357243 () Bool)

(declare-fun $colon$colon!816 (List!31702 (_ BitVec 64)) List!31702)

(assert (=> b!1357243 (= e!770280 (noDuplicate!2268 ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120))))))

(assert (= (and start!114244 res!901990) b!1357235))

(assert (= (and b!1357235 res!901992) b!1357241))

(assert (= (and b!1357241 res!901999) b!1357240))

(assert (= (and b!1357240 res!901996) b!1357242))

(assert (= (and b!1357242 res!901995) b!1357238))

(assert (= (and b!1357238 res!901997) b!1357236))

(assert (= (and b!1357236 res!901998) b!1357233))

(assert (= (and b!1357233 res!901993) b!1357234))

(assert (= (and b!1357234 res!901991) b!1357239))

(assert (= (and b!1357239 res!901994) b!1357237))

(assert (= (and b!1357237 (not res!901989)) b!1357243))

(declare-fun m!1243023 () Bool)

(assert (=> b!1357237 m!1243023))

(declare-fun m!1243025 () Bool)

(assert (=> b!1357237 m!1243025))

(declare-fun m!1243027 () Bool)

(assert (=> b!1357242 m!1243027))

(declare-fun m!1243029 () Bool)

(assert (=> b!1357239 m!1243029))

(assert (=> b!1357239 m!1243029))

(declare-fun m!1243031 () Bool)

(assert (=> b!1357239 m!1243031))

(declare-fun m!1243033 () Bool)

(assert (=> b!1357238 m!1243033))

(declare-fun m!1243035 () Bool)

(assert (=> b!1357235 m!1243035))

(assert (=> b!1357243 m!1243029))

(assert (=> b!1357243 m!1243029))

(declare-fun m!1243037 () Bool)

(assert (=> b!1357243 m!1243037))

(assert (=> b!1357243 m!1243037))

(declare-fun m!1243039 () Bool)

(assert (=> b!1357243 m!1243039))

(declare-fun m!1243041 () Bool)

(assert (=> b!1357240 m!1243041))

(declare-fun m!1243043 () Bool)

(assert (=> b!1357241 m!1243043))

(declare-fun m!1243045 () Bool)

(assert (=> b!1357233 m!1243045))

(declare-fun m!1243047 () Bool)

(assert (=> start!114244 m!1243047))

(check-sat (not b!1357233) (not b!1357239) (not b!1357237) (not b!1357242) (not b!1357240) (not b!1357235) (not b!1357241) (not b!1357243) (not start!114244) (not b!1357238))
(check-sat)
(get-model)

(declare-fun d!145087 () Bool)

(assert (=> d!145087 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357233 d!145087))

(declare-fun b!1357287 () Bool)

(declare-fun e!770301 () Bool)

(declare-fun call!65243 () Bool)

(assert (=> b!1357287 (= e!770301 call!65243)))

(declare-fun e!770299 () Bool)

(declare-fun b!1357288 () Bool)

(assert (=> b!1357288 (= e!770299 (contains!9411 acc!759 (select (arr!44661 a!3742) from!3120)))))

(declare-fun b!1357289 () Bool)

(assert (=> b!1357289 (= e!770301 call!65243)))

(declare-fun c!127064 () Bool)

(declare-fun bm!65240 () Bool)

(assert (=> bm!65240 (= call!65243 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127064 (Cons!31698 (select (arr!44661 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1357290 () Bool)

(declare-fun e!770300 () Bool)

(declare-fun e!770302 () Bool)

(assert (=> b!1357290 (= e!770300 e!770302)))

(declare-fun res!902041 () Bool)

(assert (=> b!1357290 (=> (not res!902041) (not e!770302))))

(assert (=> b!1357290 (= res!902041 (not e!770299))))

(declare-fun res!902039 () Bool)

(assert (=> b!1357290 (=> (not res!902039) (not e!770299))))

(assert (=> b!1357290 (= res!902039 (validKeyInArray!0 (select (arr!44661 a!3742) from!3120)))))

(declare-fun b!1357291 () Bool)

(assert (=> b!1357291 (= e!770302 e!770301)))

(assert (=> b!1357291 (= c!127064 (validKeyInArray!0 (select (arr!44661 a!3742) from!3120)))))

(declare-fun d!145089 () Bool)

(declare-fun res!902040 () Bool)

(assert (=> d!145089 (=> res!902040 e!770300)))

(assert (=> d!145089 (= res!902040 (bvsge from!3120 (size!45211 a!3742)))))

(assert (=> d!145089 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770300)))

(assert (= (and d!145089 (not res!902040)) b!1357290))

(assert (= (and b!1357290 res!902039) b!1357288))

(assert (= (and b!1357290 res!902041) b!1357291))

(assert (= (and b!1357291 c!127064) b!1357287))

(assert (= (and b!1357291 (not c!127064)) b!1357289))

(assert (= (or b!1357287 b!1357289) bm!65240))

(assert (=> b!1357288 m!1243029))

(assert (=> b!1357288 m!1243029))

(declare-fun m!1243075 () Bool)

(assert (=> b!1357288 m!1243075))

(assert (=> bm!65240 m!1243029))

(declare-fun m!1243077 () Bool)

(assert (=> bm!65240 m!1243077))

(assert (=> b!1357290 m!1243029))

(assert (=> b!1357290 m!1243029))

(assert (=> b!1357290 m!1243031))

(assert (=> b!1357291 m!1243029))

(assert (=> b!1357291 m!1243029))

(assert (=> b!1357291 m!1243031))

(assert (=> b!1357238 d!145089))

(declare-fun d!145091 () Bool)

(declare-fun res!902046 () Bool)

(declare-fun e!770307 () Bool)

(assert (=> d!145091 (=> res!902046 e!770307)))

(get-info :version)

(assert (=> d!145091 (= res!902046 ((_ is Nil!31699) ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120))))))

(assert (=> d!145091 (= (noDuplicate!2268 ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120))) e!770307)))

(declare-fun b!1357296 () Bool)

(declare-fun e!770308 () Bool)

(assert (=> b!1357296 (= e!770307 e!770308)))

(declare-fun res!902047 () Bool)

(assert (=> b!1357296 (=> (not res!902047) (not e!770308))))

(assert (=> b!1357296 (= res!902047 (not (contains!9411 (t!46360 ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120))) (h!32907 ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120))))))))

(declare-fun b!1357297 () Bool)

(assert (=> b!1357297 (= e!770308 (noDuplicate!2268 (t!46360 ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120)))))))

(assert (= (and d!145091 (not res!902046)) b!1357296))

(assert (= (and b!1357296 res!902047) b!1357297))

(declare-fun m!1243079 () Bool)

(assert (=> b!1357296 m!1243079))

(declare-fun m!1243081 () Bool)

(assert (=> b!1357297 m!1243081))

(assert (=> b!1357243 d!145091))

(declare-fun d!145093 () Bool)

(assert (=> d!145093 (= ($colon$colon!816 acc!759 (select (arr!44661 a!3742) from!3120)) (Cons!31698 (select (arr!44661 a!3742) from!3120) acc!759))))

(assert (=> b!1357243 d!145093))

(declare-fun b!1357320 () Bool)

(declare-fun e!770330 () Bool)

(assert (=> b!1357320 (= e!770330 (subseq!813 (t!46360 acc!759) (t!46360 acc!759)))))

(declare-fun d!145095 () Bool)

(declare-fun res!902071 () Bool)

(declare-fun e!770332 () Bool)

(assert (=> d!145095 (=> res!902071 e!770332)))

(assert (=> d!145095 (= res!902071 ((_ is Nil!31699) acc!759))))

(assert (=> d!145095 (= (subseq!813 acc!759 acc!759) e!770332)))

(declare-fun b!1357321 () Bool)

(declare-fun e!770331 () Bool)

(assert (=> b!1357321 (= e!770331 (subseq!813 acc!759 (t!46360 acc!759)))))

(declare-fun b!1357318 () Bool)

(declare-fun e!770329 () Bool)

(assert (=> b!1357318 (= e!770332 e!770329)))

(declare-fun res!902070 () Bool)

(assert (=> b!1357318 (=> (not res!902070) (not e!770329))))

(assert (=> b!1357318 (= res!902070 ((_ is Cons!31698) acc!759))))

(declare-fun b!1357319 () Bool)

(assert (=> b!1357319 (= e!770329 e!770331)))

(declare-fun res!902068 () Bool)

(assert (=> b!1357319 (=> res!902068 e!770331)))

(assert (=> b!1357319 (= res!902068 e!770330)))

(declare-fun res!902069 () Bool)

(assert (=> b!1357319 (=> (not res!902069) (not e!770330))))

(assert (=> b!1357319 (= res!902069 (= (h!32907 acc!759) (h!32907 acc!759)))))

(assert (= (and d!145095 (not res!902071)) b!1357318))

(assert (= (and b!1357318 res!902070) b!1357319))

(assert (= (and b!1357319 res!902069) b!1357320))

(assert (= (and b!1357319 (not res!902068)) b!1357321))

(declare-fun m!1243093 () Bool)

(assert (=> b!1357320 m!1243093))

(declare-fun m!1243095 () Bool)

(assert (=> b!1357321 m!1243095))

(assert (=> b!1357237 d!145095))

(declare-fun d!145107 () Bool)

(assert (=> d!145107 (subseq!813 acc!759 acc!759)))

(declare-fun lt!599140 () Unit!44657)

(declare-fun choose!36 (List!31702) Unit!44657)

(assert (=> d!145107 (= lt!599140 (choose!36 acc!759))))

(assert (=> d!145107 (= (lemmaListSubSeqRefl!0 acc!759) lt!599140)))

(declare-fun bs!38928 () Bool)

(assert (= bs!38928 d!145107))

(assert (=> bs!38928 m!1243023))

(declare-fun m!1243097 () Bool)

(assert (=> bs!38928 m!1243097))

(assert (=> b!1357237 d!145107))

(declare-fun b!1357322 () Bool)

(declare-fun e!770335 () Bool)

(declare-fun call!65244 () Bool)

(assert (=> b!1357322 (= e!770335 call!65244)))

(declare-fun b!1357323 () Bool)

(declare-fun e!770333 () Bool)

(assert (=> b!1357323 (= e!770333 (contains!9411 Nil!31699 (select (arr!44661 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357324 () Bool)

(assert (=> b!1357324 (= e!770335 call!65244)))

(declare-fun bm!65241 () Bool)

(declare-fun c!127065 () Bool)

(assert (=> bm!65241 (= call!65244 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127065 (Cons!31698 (select (arr!44661 a!3742) #b00000000000000000000000000000000) Nil!31699) Nil!31699)))))

(declare-fun b!1357325 () Bool)

(declare-fun e!770334 () Bool)

(declare-fun e!770336 () Bool)

(assert (=> b!1357325 (= e!770334 e!770336)))

(declare-fun res!902074 () Bool)

(assert (=> b!1357325 (=> (not res!902074) (not e!770336))))

(assert (=> b!1357325 (= res!902074 (not e!770333))))

(declare-fun res!902072 () Bool)

(assert (=> b!1357325 (=> (not res!902072) (not e!770333))))

(assert (=> b!1357325 (= res!902072 (validKeyInArray!0 (select (arr!44661 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1357326 () Bool)

(assert (=> b!1357326 (= e!770336 e!770335)))

(assert (=> b!1357326 (= c!127065 (validKeyInArray!0 (select (arr!44661 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145115 () Bool)

(declare-fun res!902073 () Bool)

(assert (=> d!145115 (=> res!902073 e!770334)))

(assert (=> d!145115 (= res!902073 (bvsge #b00000000000000000000000000000000 (size!45211 a!3742)))))

(assert (=> d!145115 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31699) e!770334)))

(assert (= (and d!145115 (not res!902073)) b!1357325))

(assert (= (and b!1357325 res!902072) b!1357323))

(assert (= (and b!1357325 res!902074) b!1357326))

(assert (= (and b!1357326 c!127065) b!1357322))

(assert (= (and b!1357326 (not c!127065)) b!1357324))

(assert (= (or b!1357322 b!1357324) bm!65241))

(declare-fun m!1243099 () Bool)

(assert (=> b!1357323 m!1243099))

(assert (=> b!1357323 m!1243099))

(declare-fun m!1243101 () Bool)

(assert (=> b!1357323 m!1243101))

(assert (=> bm!65241 m!1243099))

(declare-fun m!1243103 () Bool)

(assert (=> bm!65241 m!1243103))

(assert (=> b!1357325 m!1243099))

(assert (=> b!1357325 m!1243099))

(declare-fun m!1243105 () Bool)

(assert (=> b!1357325 m!1243105))

(assert (=> b!1357326 m!1243099))

(assert (=> b!1357326 m!1243099))

(assert (=> b!1357326 m!1243105))

(assert (=> b!1357242 d!145115))

(declare-fun d!145117 () Bool)

(declare-fun lt!599146 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!675 (List!31702) (InoxSet (_ BitVec 64)))

(assert (=> d!145117 (= lt!599146 (select (content!675 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770363 () Bool)

(assert (=> d!145117 (= lt!599146 e!770363)))

(declare-fun res!902101 () Bool)

(assert (=> d!145117 (=> (not res!902101) (not e!770363))))

(assert (=> d!145117 (= res!902101 ((_ is Cons!31698) acc!759))))

(assert (=> d!145117 (= (contains!9411 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599146)))

(declare-fun b!1357353 () Bool)

(declare-fun e!770364 () Bool)

(assert (=> b!1357353 (= e!770363 e!770364)))

(declare-fun res!902102 () Bool)

(assert (=> b!1357353 (=> res!902102 e!770364)))

(assert (=> b!1357353 (= res!902102 (= (h!32907 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357354 () Bool)

(assert (=> b!1357354 (= e!770364 (contains!9411 (t!46360 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145117 res!902101) b!1357353))

(assert (= (and b!1357353 (not res!902102)) b!1357354))

(declare-fun m!1243123 () Bool)

(assert (=> d!145117 m!1243123))

(declare-fun m!1243125 () Bool)

(assert (=> d!145117 m!1243125))

(declare-fun m!1243129 () Bool)

(assert (=> b!1357354 m!1243129))

(assert (=> b!1357241 d!145117))

(declare-fun d!145131 () Bool)

(declare-fun res!902103 () Bool)

(declare-fun e!770365 () Bool)

(assert (=> d!145131 (=> res!902103 e!770365)))

(assert (=> d!145131 (= res!902103 ((_ is Nil!31699) acc!759))))

(assert (=> d!145131 (= (noDuplicate!2268 acc!759) e!770365)))

(declare-fun b!1357355 () Bool)

(declare-fun e!770366 () Bool)

(assert (=> b!1357355 (= e!770365 e!770366)))

(declare-fun res!902104 () Bool)

(assert (=> b!1357355 (=> (not res!902104) (not e!770366))))

(assert (=> b!1357355 (= res!902104 (not (contains!9411 (t!46360 acc!759) (h!32907 acc!759))))))

(declare-fun b!1357356 () Bool)

(assert (=> b!1357356 (= e!770366 (noDuplicate!2268 (t!46360 acc!759)))))

(assert (= (and d!145131 (not res!902103)) b!1357355))

(assert (= (and b!1357355 res!902104) b!1357356))

(declare-fun m!1243131 () Bool)

(assert (=> b!1357355 m!1243131))

(declare-fun m!1243133 () Bool)

(assert (=> b!1357356 m!1243133))

(assert (=> b!1357235 d!145131))

(declare-fun d!145133 () Bool)

(declare-fun lt!599148 () Bool)

(assert (=> d!145133 (= lt!599148 (select (content!675 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!770367 () Bool)

(assert (=> d!145133 (= lt!599148 e!770367)))

(declare-fun res!902105 () Bool)

(assert (=> d!145133 (=> (not res!902105) (not e!770367))))

(assert (=> d!145133 (= res!902105 ((_ is Cons!31698) acc!759))))

(assert (=> d!145133 (= (contains!9411 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599148)))

(declare-fun b!1357357 () Bool)

(declare-fun e!770368 () Bool)

(assert (=> b!1357357 (= e!770367 e!770368)))

(declare-fun res!902106 () Bool)

(assert (=> b!1357357 (=> res!902106 e!770368)))

(assert (=> b!1357357 (= res!902106 (= (h!32907 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357358 () Bool)

(assert (=> b!1357358 (= e!770368 (contains!9411 (t!46360 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145133 res!902105) b!1357357))

(assert (= (and b!1357357 (not res!902106)) b!1357358))

(assert (=> d!145133 m!1243123))

(declare-fun m!1243135 () Bool)

(assert (=> d!145133 m!1243135))

(declare-fun m!1243137 () Bool)

(assert (=> b!1357358 m!1243137))

(assert (=> b!1357240 d!145133))

(declare-fun d!145135 () Bool)

(assert (=> d!145135 (= (array_inv!33689 a!3742) (bvsge (size!45211 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114244 d!145135))

(declare-fun d!145137 () Bool)

(assert (=> d!145137 (= (validKeyInArray!0 (select (arr!44661 a!3742) from!3120)) (and (not (= (select (arr!44661 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44661 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357239 d!145137))

(check-sat (not b!1357288) (not b!1357325) (not b!1357355) (not d!145107) (not b!1357290) (not d!145133) (not bm!65241) (not d!145117) (not b!1357354) (not b!1357321) (not b!1357358) (not b!1357323) (not b!1357291) (not bm!65240) (not b!1357320) (not b!1357296) (not b!1357297) (not b!1357326) (not b!1357356))
(check-sat)
