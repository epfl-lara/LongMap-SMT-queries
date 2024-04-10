; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114242 () Bool)

(assert start!114242)

(declare-fun res!901965 () Bool)

(declare-fun e!770272 () Bool)

(assert (=> start!114242 (=> (not res!901965) (not e!770272))))

(declare-datatypes ((array!92424 0))(
  ( (array!92425 (arr!44660 (Array (_ BitVec 32) (_ BitVec 64))) (size!45210 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92424)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114242 (= res!901965 (and (bvslt (size!45210 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45210 a!3742))))))

(assert (=> start!114242 e!770272))

(assert (=> start!114242 true))

(declare-fun array_inv!33688 (array!92424) Bool)

(assert (=> start!114242 (array_inv!33688 a!3742)))

(declare-fun b!1357200 () Bool)

(declare-fun res!901957 () Bool)

(assert (=> b!1357200 (=> (not res!901957) (not e!770272))))

(assert (=> b!1357200 (= res!901957 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45210 a!3742)))))

(declare-fun b!1357201 () Bool)

(declare-fun res!901961 () Bool)

(assert (=> b!1357201 (=> (not res!901961) (not e!770272))))

(declare-datatypes ((List!31701 0))(
  ( (Nil!31698) (Cons!31697 (h!32906 (_ BitVec 64)) (t!46359 List!31701)) )
))
(declare-fun arrayNoDuplicates!0 (array!92424 (_ BitVec 32) List!31701) Bool)

(assert (=> b!1357201 (= res!901961 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31698))))

(declare-fun b!1357202 () Bool)

(declare-fun res!901966 () Bool)

(assert (=> b!1357202 (=> (not res!901966) (not e!770272))))

(declare-fun acc!759 () List!31701)

(declare-fun contains!9410 (List!31701 (_ BitVec 64)) Bool)

(assert (=> b!1357202 (= res!901966 (not (contains!9410 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357203 () Bool)

(declare-fun res!901964 () Bool)

(assert (=> b!1357203 (=> (not res!901964) (not e!770272))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357203 (= res!901964 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45210 a!3742))))))

(declare-fun b!1357204 () Bool)

(declare-fun res!901960 () Bool)

(assert (=> b!1357204 (=> (not res!901960) (not e!770272))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357204 (= res!901960 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357205 () Bool)

(declare-fun res!901962 () Bool)

(assert (=> b!1357205 (=> (not res!901962) (not e!770272))))

(assert (=> b!1357205 (= res!901962 (validKeyInArray!0 (select (arr!44660 a!3742) from!3120)))))

(declare-fun b!1357206 () Bool)

(declare-fun e!770270 () Bool)

(assert (=> b!1357206 (= e!770272 (not e!770270))))

(declare-fun res!901963 () Bool)

(assert (=> b!1357206 (=> res!901963 e!770270)))

(assert (=> b!1357206 (= res!901963 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun subseq!812 (List!31701 List!31701) Bool)

(assert (=> b!1357206 (subseq!812 acc!759 acc!759)))

(declare-datatypes ((Unit!44655 0))(
  ( (Unit!44656) )
))
(declare-fun lt!599128 () Unit!44655)

(declare-fun lemmaListSubSeqRefl!0 (List!31701) Unit!44655)

(assert (=> b!1357206 (= lt!599128 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357207 () Bool)

(declare-fun res!901956 () Bool)

(assert (=> b!1357207 (=> (not res!901956) (not e!770272))))

(assert (=> b!1357207 (= res!901956 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357208 () Bool)

(declare-fun noDuplicate!2267 (List!31701) Bool)

(declare-fun $colon$colon!815 (List!31701 (_ BitVec 64)) List!31701)

(assert (=> b!1357208 (= e!770270 (noDuplicate!2267 ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120))))))

(declare-fun b!1357209 () Bool)

(declare-fun res!901958 () Bool)

(assert (=> b!1357209 (=> (not res!901958) (not e!770272))))

(assert (=> b!1357209 (= res!901958 (noDuplicate!2267 acc!759))))

(declare-fun b!1357210 () Bool)

(declare-fun res!901959 () Bool)

(assert (=> b!1357210 (=> (not res!901959) (not e!770272))))

(assert (=> b!1357210 (= res!901959 (not (contains!9410 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114242 res!901965) b!1357209))

(assert (= (and b!1357209 res!901958) b!1357202))

(assert (= (and b!1357202 res!901966) b!1357210))

(assert (= (and b!1357210 res!901959) b!1357201))

(assert (= (and b!1357201 res!901961) b!1357207))

(assert (= (and b!1357207 res!901956) b!1357203))

(assert (= (and b!1357203 res!901964) b!1357204))

(assert (= (and b!1357204 res!901960) b!1357200))

(assert (= (and b!1357200 res!901957) b!1357205))

(assert (= (and b!1357205 res!901962) b!1357206))

(assert (= (and b!1357206 (not res!901963)) b!1357208))

(declare-fun m!1242997 () Bool)

(assert (=> start!114242 m!1242997))

(declare-fun m!1242999 () Bool)

(assert (=> b!1357202 m!1242999))

(declare-fun m!1243001 () Bool)

(assert (=> b!1357206 m!1243001))

(declare-fun m!1243003 () Bool)

(assert (=> b!1357206 m!1243003))

(declare-fun m!1243005 () Bool)

(assert (=> b!1357201 m!1243005))

(declare-fun m!1243007 () Bool)

(assert (=> b!1357210 m!1243007))

(declare-fun m!1243009 () Bool)

(assert (=> b!1357205 m!1243009))

(assert (=> b!1357205 m!1243009))

(declare-fun m!1243011 () Bool)

(assert (=> b!1357205 m!1243011))

(declare-fun m!1243013 () Bool)

(assert (=> b!1357209 m!1243013))

(declare-fun m!1243015 () Bool)

(assert (=> b!1357207 m!1243015))

(declare-fun m!1243017 () Bool)

(assert (=> b!1357204 m!1243017))

(assert (=> b!1357208 m!1243009))

(assert (=> b!1357208 m!1243009))

(declare-fun m!1243019 () Bool)

(assert (=> b!1357208 m!1243019))

(assert (=> b!1357208 m!1243019))

(declare-fun m!1243021 () Bool)

(assert (=> b!1357208 m!1243021))

(push 1)

(assert (not b!1357206))

(assert (not b!1357208))

(assert (not b!1357202))

(assert (not b!1357201))

(assert (not b!1357210))

(assert (not b!1357207))

(assert (not b!1357209))

(assert (not b!1357204))

(assert (not start!114242))

(assert (not b!1357205))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!145099 () Bool)

(declare-fun lt!599137 () Bool)

(declare-fun content!674 (List!31701) (Set (_ BitVec 64)))

(assert (=> d!145099 (= lt!599137 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!674 acc!759)))))

(declare-fun e!770327 () Bool)

(assert (=> d!145099 (= lt!599137 e!770327)))

(declare-fun res!902067 () Bool)

(assert (=> d!145099 (=> (not res!902067) (not e!770327))))

(assert (=> d!145099 (= res!902067 (is-Cons!31697 acc!759))))

(assert (=> d!145099 (= (contains!9410 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!599137)))

(declare-fun b!1357316 () Bool)

(declare-fun e!770328 () Bool)

(assert (=> b!1357316 (= e!770327 e!770328)))

(declare-fun res!902066 () Bool)

(assert (=> b!1357316 (=> res!902066 e!770328)))

(assert (=> b!1357316 (= res!902066 (= (h!32906 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357317 () Bool)

(assert (=> b!1357317 (= e!770328 (contains!9410 (t!46359 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145099 res!902067) b!1357316))

(assert (= (and b!1357316 (not res!902066)) b!1357317))

(declare-fun m!1243087 () Bool)

(assert (=> d!145099 m!1243087))

(declare-fun m!1243089 () Bool)

(assert (=> d!145099 m!1243089))

(declare-fun m!1243091 () Bool)

(assert (=> b!1357317 m!1243091))

(assert (=> b!1357210 d!145099))

(declare-fun d!145105 () Bool)

(assert (=> d!145105 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1357204 d!145105))

(declare-fun d!145113 () Bool)

(declare-fun res!902087 () Bool)

(declare-fun e!770349 () Bool)

(assert (=> d!145113 (=> res!902087 e!770349)))

(assert (=> d!145113 (= res!902087 (is-Nil!31698 acc!759))))

(assert (=> d!145113 (= (noDuplicate!2267 acc!759) e!770349)))

(declare-fun b!1357337 () Bool)

(declare-fun e!770350 () Bool)

(assert (=> b!1357337 (= e!770349 e!770350)))

(declare-fun res!902088 () Bool)

(assert (=> b!1357337 (=> (not res!902088) (not e!770350))))

(assert (=> b!1357337 (= res!902088 (not (contains!9410 (t!46359 acc!759) (h!32906 acc!759))))))

(declare-fun b!1357338 () Bool)

(assert (=> b!1357338 (= e!770350 (noDuplicate!2267 (t!46359 acc!759)))))

(assert (= (and d!145113 (not res!902087)) b!1357337))

(assert (= (and b!1357337 res!902088) b!1357338))

(declare-fun m!1243107 () Bool)

(assert (=> b!1357337 m!1243107))

(declare-fun m!1243109 () Bool)

(assert (=> b!1357338 m!1243109))

(assert (=> b!1357209 d!145113))

(declare-fun d!145119 () Bool)

(declare-fun res!902089 () Bool)

(declare-fun e!770351 () Bool)

(assert (=> d!145119 (=> res!902089 e!770351)))

(assert (=> d!145119 (= res!902089 (is-Nil!31698 ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120))))))

(assert (=> d!145119 (= (noDuplicate!2267 ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120))) e!770351)))

(declare-fun b!1357341 () Bool)

(declare-fun e!770352 () Bool)

(assert (=> b!1357341 (= e!770351 e!770352)))

(declare-fun res!902090 () Bool)

(assert (=> b!1357341 (=> (not res!902090) (not e!770352))))

(assert (=> b!1357341 (= res!902090 (not (contains!9410 (t!46359 ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120))) (h!32906 ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120))))))))

(declare-fun b!1357342 () Bool)

(assert (=> b!1357342 (= e!770352 (noDuplicate!2267 (t!46359 ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120)))))))

(assert (= (and d!145119 (not res!902089)) b!1357341))

(assert (= (and b!1357341 res!902090) b!1357342))

(declare-fun m!1243111 () Bool)

(assert (=> b!1357341 m!1243111))

(declare-fun m!1243113 () Bool)

(assert (=> b!1357342 m!1243113))

(assert (=> b!1357208 d!145119))

(declare-fun d!145121 () Bool)

(assert (=> d!145121 (= ($colon$colon!815 acc!759 (select (arr!44660 a!3742) from!3120)) (Cons!31697 (select (arr!44660 a!3742) from!3120) acc!759))))

(assert (=> b!1357208 d!145121))

(declare-fun d!145123 () Bool)

(declare-fun lt!599141 () Bool)

(assert (=> d!145123 (= lt!599141 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!674 acc!759)))))

(declare-fun e!770353 () Bool)

(assert (=> d!145123 (= lt!599141 e!770353)))

(declare-fun res!902092 () Bool)

(assert (=> d!145123 (=> (not res!902092) (not e!770353))))

(assert (=> d!145123 (= res!902092 (is-Cons!31697 acc!759))))

(assert (=> d!145123 (= (contains!9410 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!599141)))

(declare-fun b!1357343 () Bool)

(declare-fun e!770354 () Bool)

(assert (=> b!1357343 (= e!770353 e!770354)))

(declare-fun res!902091 () Bool)

(assert (=> b!1357343 (=> res!902091 e!770354)))

(assert (=> b!1357343 (= res!902091 (= (h!32906 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1357344 () Bool)

(assert (=> b!1357344 (= e!770354 (contains!9410 (t!46359 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145123 res!902092) b!1357343))

(assert (= (and b!1357343 (not res!902091)) b!1357344))

(assert (=> d!145123 m!1243087))

(declare-fun m!1243115 () Bool)

(assert (=> d!145123 m!1243115))

(declare-fun m!1243117 () Bool)

(assert (=> b!1357344 m!1243117))

(assert (=> b!1357202 d!145123))

(declare-fun b!1357379 () Bool)

(declare-fun e!770387 () Bool)

(declare-fun call!65249 () Bool)

(assert (=> b!1357379 (= e!770387 call!65249)))

(declare-fun d!145125 () Bool)

(declare-fun res!902119 () Bool)

(declare-fun e!770385 () Bool)

(assert (=> d!145125 (=> res!902119 e!770385)))

(assert (=> d!145125 (= res!902119 (bvsge from!3120 (size!45210 a!3742)))))

(assert (=> d!145125 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!770385)))

(declare-fun b!1357380 () Bool)

(declare-fun e!770388 () Bool)

(assert (=> b!1357380 (= e!770385 e!770388)))

(declare-fun res!902120 () Bool)

(assert (=> b!1357380 (=> (not res!902120) (not e!770388))))

(declare-fun e!770386 () Bool)

(assert (=> b!1357380 (= res!902120 (not e!770386))))

(declare-fun res!902121 () Bool)

(assert (=> b!1357380 (=> (not res!902121) (not e!770386))))

(assert (=> b!1357380 (= res!902121 (validKeyInArray!0 (select (arr!44660 a!3742) from!3120)))))

(declare-fun c!127070 () Bool)

(declare-fun bm!65246 () Bool)

(assert (=> bm!65246 (= call!65249 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127070 (Cons!31697 (select (arr!44660 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1357381 () Bool)

(assert (=> b!1357381 (= e!770388 e!770387)))

(assert (=> b!1357381 (= c!127070 (validKeyInArray!0 (select (arr!44660 a!3742) from!3120)))))

(declare-fun b!1357382 () Bool)

(assert (=> b!1357382 (= e!770387 call!65249)))

(declare-fun b!1357383 () Bool)

(assert (=> b!1357383 (= e!770386 (contains!9410 acc!759 (select (arr!44660 a!3742) from!3120)))))

(assert (= (and d!145125 (not res!902119)) b!1357380))

(assert (= (and b!1357380 res!902121) b!1357383))

(assert (= (and b!1357380 res!902120) b!1357381))

(assert (= (and b!1357381 c!127070) b!1357382))

(assert (= (and b!1357381 (not c!127070)) b!1357379))

(assert (= (or b!1357382 b!1357379) bm!65246))

(assert (=> b!1357380 m!1243009))

(assert (=> b!1357380 m!1243009))

(assert (=> b!1357380 m!1243011))

(assert (=> bm!65246 m!1243009))

(declare-fun m!1243139 () Bool)

(assert (=> bm!65246 m!1243139))

(assert (=> b!1357381 m!1243009))

(assert (=> b!1357381 m!1243009))

(assert (=> b!1357381 m!1243011))

(assert (=> b!1357383 m!1243009))

(assert (=> b!1357383 m!1243009))

(declare-fun m!1243141 () Bool)

(assert (=> b!1357383 m!1243141))

(assert (=> b!1357207 d!145125))

(declare-fun d!145139 () Bool)

(assert (=> d!145139 (= (array_inv!33688 a!3742) (bvsge (size!45210 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114242 d!145139))

(declare-fun b!1357384 () Bool)

(declare-fun e!770391 () Bool)

(declare-fun call!65250 () Bool)

(assert (=> b!1357384 (= e!770391 call!65250)))

(declare-fun d!145141 () Bool)

(declare-fun res!902122 () Bool)

(declare-fun e!770389 () Bool)

(assert (=> d!145141 (=> res!902122 e!770389)))

(assert (=> d!145141 (= res!902122 (bvsge #b00000000000000000000000000000000 (size!45210 a!3742)))))

(assert (=> d!145141 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31698) e!770389)))

(declare-fun b!1357385 () Bool)

(declare-fun e!770392 () Bool)

(assert (=> b!1357385 (= e!770389 e!770392)))

(declare-fun res!902123 () Bool)

(assert (=> b!1357385 (=> (not res!902123) (not e!770392))))

(declare-fun e!770390 () Bool)

(assert (=> b!1357385 (= res!902123 (not e!770390))))

