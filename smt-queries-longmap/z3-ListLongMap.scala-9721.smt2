; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114998 () Bool)

(assert start!114998)

(declare-fun b!1363099 () Bool)

(declare-fun res!907006 () Bool)

(declare-fun e!773050 () Bool)

(assert (=> b!1363099 (=> (not res!907006) (not e!773050))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92625 0))(
  ( (array!92626 (arr!44746 (Array (_ BitVec 32) (_ BitVec 64))) (size!45298 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92625)

(assert (=> b!1363099 (= res!907006 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45298 a!3742)))))

(declare-fun b!1363101 () Bool)

(declare-fun res!906999 () Bool)

(assert (=> b!1363101 (=> (not res!906999) (not e!773050))))

(declare-datatypes ((List!31865 0))(
  ( (Nil!31862) (Cons!31861 (h!33070 (_ BitVec 64)) (t!46545 List!31865)) )
))
(declare-fun acc!759 () List!31865)

(declare-fun contains!9485 (List!31865 (_ BitVec 64)) Bool)

(assert (=> b!1363101 (= res!906999 (not (contains!9485 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363102 () Bool)

(declare-fun res!907004 () Bool)

(assert (=> b!1363102 (=> (not res!907004) (not e!773050))))

(declare-fun arrayNoDuplicates!0 (array!92625 (_ BitVec 32) List!31865) Bool)

(assert (=> b!1363102 (= res!907004 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363103 () Bool)

(declare-fun res!907005 () Bool)

(assert (=> b!1363103 (=> (not res!907005) (not e!773050))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363103 (= res!907005 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363104 () Bool)

(declare-fun res!906998 () Bool)

(assert (=> b!1363104 (=> (not res!906998) (not e!773050))))

(declare-fun noDuplicate!2400 (List!31865) Bool)

(assert (=> b!1363104 (= res!906998 (noDuplicate!2400 acc!759))))

(declare-fun b!1363105 () Bool)

(declare-fun res!907007 () Bool)

(assert (=> b!1363105 (=> (not res!907007) (not e!773050))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363105 (= res!907007 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45298 a!3742))))))

(declare-fun b!1363106 () Bool)

(declare-fun e!773052 () Bool)

(assert (=> b!1363106 (= e!773050 e!773052)))

(declare-fun res!907000 () Bool)

(assert (=> b!1363106 (=> (not res!907000) (not e!773052))))

(declare-fun lt!600509 () Bool)

(assert (=> b!1363106 (= res!907000 (and (not (= from!3120 i!1404)) (not lt!600509) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44814 0))(
  ( (Unit!44815) )
))
(declare-fun lt!600508 () Unit!44814)

(declare-fun e!773051 () Unit!44814)

(assert (=> b!1363106 (= lt!600508 e!773051)))

(declare-fun c!127493 () Bool)

(assert (=> b!1363106 (= c!127493 lt!600509)))

(assert (=> b!1363106 (= lt!600509 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun res!907003 () Bool)

(assert (=> start!114998 (=> (not res!907003) (not e!773050))))

(assert (=> start!114998 (= res!907003 (and (bvslt (size!45298 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45298 a!3742))))))

(assert (=> start!114998 e!773050))

(assert (=> start!114998 true))

(declare-fun array_inv!33979 (array!92625) Bool)

(assert (=> start!114998 (array_inv!33979 a!3742)))

(declare-fun b!1363100 () Bool)

(declare-fun res!907001 () Bool)

(assert (=> b!1363100 (=> (not res!907001) (not e!773050))))

(assert (=> b!1363100 (= res!907001 (not (contains!9485 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363107 () Bool)

(assert (=> b!1363107 (= e!773052 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1363108 () Bool)

(declare-fun Unit!44816 () Unit!44814)

(assert (=> b!1363108 (= e!773051 Unit!44816)))

(declare-fun b!1363109 () Bool)

(declare-fun lt!600511 () Unit!44814)

(assert (=> b!1363109 (= e!773051 lt!600511)))

(declare-fun lt!600510 () Unit!44814)

(declare-fun lemmaListSubSeqRefl!0 (List!31865) Unit!44814)

(assert (=> b!1363109 (= lt!600510 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!923 (List!31865 List!31865) Bool)

(assert (=> b!1363109 (subseq!923 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92625 List!31865 List!31865 (_ BitVec 32)) Unit!44814)

(declare-fun $colon$colon!928 (List!31865 (_ BitVec 64)) List!31865)

(assert (=> b!1363109 (= lt!600511 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!928 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363109 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363110 () Bool)

(declare-fun res!907002 () Bool)

(assert (=> b!1363110 (=> (not res!907002) (not e!773050))))

(assert (=> b!1363110 (= res!907002 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31862))))

(assert (= (and start!114998 res!907003) b!1363104))

(assert (= (and b!1363104 res!906998) b!1363101))

(assert (= (and b!1363101 res!906999) b!1363100))

(assert (= (and b!1363100 res!907001) b!1363110))

(assert (= (and b!1363110 res!907002) b!1363102))

(assert (= (and b!1363102 res!907004) b!1363105))

(assert (= (and b!1363105 res!907007) b!1363103))

(assert (= (and b!1363103 res!907005) b!1363099))

(assert (= (and b!1363099 res!907006) b!1363106))

(assert (= (and b!1363106 c!127493) b!1363109))

(assert (= (and b!1363106 (not c!127493)) b!1363108))

(assert (= (and b!1363106 res!907000) b!1363107))

(declare-fun m!1247515 () Bool)

(assert (=> b!1363101 m!1247515))

(declare-fun m!1247517 () Bool)

(assert (=> b!1363109 m!1247517))

(declare-fun m!1247519 () Bool)

(assert (=> b!1363109 m!1247519))

(declare-fun m!1247521 () Bool)

(assert (=> b!1363109 m!1247521))

(declare-fun m!1247523 () Bool)

(assert (=> b!1363109 m!1247523))

(declare-fun m!1247525 () Bool)

(assert (=> b!1363109 m!1247525))

(assert (=> b!1363109 m!1247519))

(assert (=> b!1363109 m!1247521))

(declare-fun m!1247527 () Bool)

(assert (=> b!1363109 m!1247527))

(declare-fun m!1247529 () Bool)

(assert (=> b!1363102 m!1247529))

(assert (=> b!1363106 m!1247519))

(assert (=> b!1363106 m!1247519))

(declare-fun m!1247531 () Bool)

(assert (=> b!1363106 m!1247531))

(assert (=> b!1363107 m!1247525))

(declare-fun m!1247533 () Bool)

(assert (=> b!1363103 m!1247533))

(declare-fun m!1247535 () Bool)

(assert (=> b!1363104 m!1247535))

(declare-fun m!1247537 () Bool)

(assert (=> start!114998 m!1247537))

(declare-fun m!1247539 () Bool)

(assert (=> b!1363110 m!1247539))

(declare-fun m!1247541 () Bool)

(assert (=> b!1363100 m!1247541))

(check-sat (not b!1363101) (not b!1363109) (not b!1363100) (not b!1363110) (not start!114998) (not b!1363106) (not b!1363107) (not b!1363104) (not b!1363102) (not b!1363103))
(check-sat)
(get-model)

(declare-fun d!145969 () Bool)

(declare-fun lt!600538 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!698 (List!31865) (InoxSet (_ BitVec 64)))

(assert (=> d!145969 (= lt!600538 (select (content!698 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773082 () Bool)

(assert (=> d!145969 (= lt!600538 e!773082)))

(declare-fun res!907073 () Bool)

(assert (=> d!145969 (=> (not res!907073) (not e!773082))))

(get-info :version)

(assert (=> d!145969 (= res!907073 ((_ is Cons!31861) acc!759))))

(assert (=> d!145969 (= (contains!9485 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600538)))

(declare-fun b!1363187 () Bool)

(declare-fun e!773083 () Bool)

(assert (=> b!1363187 (= e!773082 e!773083)))

(declare-fun res!907072 () Bool)

(assert (=> b!1363187 (=> res!907072 e!773083)))

(assert (=> b!1363187 (= res!907072 (= (h!33070 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363188 () Bool)

(assert (=> b!1363188 (= e!773083 (contains!9485 (t!46545 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145969 res!907073) b!1363187))

(assert (= (and b!1363187 (not res!907072)) b!1363188))

(declare-fun m!1247599 () Bool)

(assert (=> d!145969 m!1247599))

(declare-fun m!1247601 () Bool)

(assert (=> d!145969 m!1247601))

(declare-fun m!1247603 () Bool)

(assert (=> b!1363188 m!1247603))

(assert (=> b!1363100 d!145969))

(declare-fun bm!65380 () Bool)

(declare-fun call!65383 () Bool)

(declare-fun c!127502 () Bool)

(assert (=> bm!65380 (= call!65383 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127502 (Cons!31861 (select (arr!44746 a!3742) #b00000000000000000000000000000000) Nil!31862) Nil!31862)))))

(declare-fun b!1363199 () Bool)

(declare-fun e!773092 () Bool)

(declare-fun e!773093 () Bool)

(assert (=> b!1363199 (= e!773092 e!773093)))

(declare-fun res!907082 () Bool)

(assert (=> b!1363199 (=> (not res!907082) (not e!773093))))

(declare-fun e!773095 () Bool)

(assert (=> b!1363199 (= res!907082 (not e!773095))))

(declare-fun res!907080 () Bool)

(assert (=> b!1363199 (=> (not res!907080) (not e!773095))))

(assert (=> b!1363199 (= res!907080 (validKeyInArray!0 (select (arr!44746 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!145971 () Bool)

(declare-fun res!907081 () Bool)

(assert (=> d!145971 (=> res!907081 e!773092)))

(assert (=> d!145971 (= res!907081 (bvsge #b00000000000000000000000000000000 (size!45298 a!3742)))))

(assert (=> d!145971 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31862) e!773092)))

(declare-fun b!1363200 () Bool)

(declare-fun e!773094 () Bool)

(assert (=> b!1363200 (= e!773094 call!65383)))

(declare-fun b!1363201 () Bool)

(assert (=> b!1363201 (= e!773093 e!773094)))

(assert (=> b!1363201 (= c!127502 (validKeyInArray!0 (select (arr!44746 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363202 () Bool)

(assert (=> b!1363202 (= e!773095 (contains!9485 Nil!31862 (select (arr!44746 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363203 () Bool)

(assert (=> b!1363203 (= e!773094 call!65383)))

(assert (= (and d!145971 (not res!907081)) b!1363199))

(assert (= (and b!1363199 res!907080) b!1363202))

(assert (= (and b!1363199 res!907082) b!1363201))

(assert (= (and b!1363201 c!127502) b!1363203))

(assert (= (and b!1363201 (not c!127502)) b!1363200))

(assert (= (or b!1363203 b!1363200) bm!65380))

(declare-fun m!1247605 () Bool)

(assert (=> bm!65380 m!1247605))

(declare-fun m!1247607 () Bool)

(assert (=> bm!65380 m!1247607))

(assert (=> b!1363199 m!1247605))

(assert (=> b!1363199 m!1247605))

(declare-fun m!1247609 () Bool)

(assert (=> b!1363199 m!1247609))

(assert (=> b!1363201 m!1247605))

(assert (=> b!1363201 m!1247605))

(assert (=> b!1363201 m!1247609))

(assert (=> b!1363202 m!1247605))

(assert (=> b!1363202 m!1247605))

(declare-fun m!1247611 () Bool)

(assert (=> b!1363202 m!1247611))

(assert (=> b!1363110 d!145971))

(declare-fun call!65384 () Bool)

(declare-fun bm!65381 () Bool)

(declare-fun c!127503 () Bool)

(assert (=> bm!65381 (= call!65384 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127503 (Cons!31861 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1363204 () Bool)

(declare-fun e!773096 () Bool)

(declare-fun e!773097 () Bool)

(assert (=> b!1363204 (= e!773096 e!773097)))

(declare-fun res!907085 () Bool)

(assert (=> b!1363204 (=> (not res!907085) (not e!773097))))

(declare-fun e!773099 () Bool)

(assert (=> b!1363204 (= res!907085 (not e!773099))))

(declare-fun res!907083 () Bool)

(assert (=> b!1363204 (=> (not res!907083) (not e!773099))))

(assert (=> b!1363204 (= res!907083 (validKeyInArray!0 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!145975 () Bool)

(declare-fun res!907084 () Bool)

(assert (=> d!145975 (=> res!907084 e!773096)))

(assert (=> d!145975 (= res!907084 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45298 a!3742)))))

(assert (=> d!145975 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773096)))

(declare-fun b!1363205 () Bool)

(declare-fun e!773098 () Bool)

(assert (=> b!1363205 (= e!773098 call!65384)))

(declare-fun b!1363206 () Bool)

(assert (=> b!1363206 (= e!773097 e!773098)))

(assert (=> b!1363206 (= c!127503 (validKeyInArray!0 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363207 () Bool)

(assert (=> b!1363207 (= e!773099 (contains!9485 acc!759 (select (arr!44746 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363208 () Bool)

(assert (=> b!1363208 (= e!773098 call!65384)))

(assert (= (and d!145975 (not res!907084)) b!1363204))

(assert (= (and b!1363204 res!907083) b!1363207))

(assert (= (and b!1363204 res!907085) b!1363206))

(assert (= (and b!1363206 c!127503) b!1363208))

(assert (= (and b!1363206 (not c!127503)) b!1363205))

(assert (= (or b!1363208 b!1363205) bm!65381))

(declare-fun m!1247613 () Bool)

(assert (=> bm!65381 m!1247613))

(declare-fun m!1247615 () Bool)

(assert (=> bm!65381 m!1247615))

(assert (=> b!1363204 m!1247613))

(assert (=> b!1363204 m!1247613))

(declare-fun m!1247617 () Bool)

(assert (=> b!1363204 m!1247617))

(assert (=> b!1363206 m!1247613))

(assert (=> b!1363206 m!1247613))

(assert (=> b!1363206 m!1247617))

(assert (=> b!1363207 m!1247613))

(assert (=> b!1363207 m!1247613))

(declare-fun m!1247619 () Bool)

(assert (=> b!1363207 m!1247619))

(assert (=> b!1363107 d!145975))

(declare-fun d!145977 () Bool)

(declare-fun lt!600539 () Bool)

(assert (=> d!145977 (= lt!600539 (select (content!698 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773100 () Bool)

(assert (=> d!145977 (= lt!600539 e!773100)))

(declare-fun res!907087 () Bool)

(assert (=> d!145977 (=> (not res!907087) (not e!773100))))

(assert (=> d!145977 (= res!907087 ((_ is Cons!31861) acc!759))))

(assert (=> d!145977 (= (contains!9485 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600539)))

(declare-fun b!1363209 () Bool)

(declare-fun e!773101 () Bool)

(assert (=> b!1363209 (= e!773100 e!773101)))

(declare-fun res!907086 () Bool)

(assert (=> b!1363209 (=> res!907086 e!773101)))

(assert (=> b!1363209 (= res!907086 (= (h!33070 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363210 () Bool)

(assert (=> b!1363210 (= e!773101 (contains!9485 (t!46545 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!145977 res!907087) b!1363209))

(assert (= (and b!1363209 (not res!907086)) b!1363210))

(assert (=> d!145977 m!1247599))

(declare-fun m!1247621 () Bool)

(assert (=> d!145977 m!1247621))

(declare-fun m!1247623 () Bool)

(assert (=> b!1363210 m!1247623))

(assert (=> b!1363101 d!145977))

(declare-fun d!145979 () Bool)

(assert (=> d!145979 (= (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)) (and (not (= (select (arr!44746 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44746 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363106 d!145979))

(declare-fun d!145981 () Bool)

(assert (=> d!145981 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363103 d!145981))

(declare-fun d!145983 () Bool)

(assert (=> d!145983 (= (array_inv!33979 a!3742) (bvsge (size!45298 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!114998 d!145983))

(declare-fun c!127506 () Bool)

(declare-fun bm!65382 () Bool)

(declare-fun call!65385 () Bool)

(assert (=> bm!65382 (= call!65385 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127506 (Cons!31861 (select (arr!44746 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1363221 () Bool)

(declare-fun e!773110 () Bool)

(declare-fun e!773111 () Bool)

(assert (=> b!1363221 (= e!773110 e!773111)))

(declare-fun res!907096 () Bool)

(assert (=> b!1363221 (=> (not res!907096) (not e!773111))))

(declare-fun e!773113 () Bool)

(assert (=> b!1363221 (= res!907096 (not e!773113))))

(declare-fun res!907094 () Bool)

(assert (=> b!1363221 (=> (not res!907094) (not e!773113))))

(assert (=> b!1363221 (= res!907094 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun d!145987 () Bool)

(declare-fun res!907095 () Bool)

(assert (=> d!145987 (=> res!907095 e!773110)))

(assert (=> d!145987 (= res!907095 (bvsge from!3120 (size!45298 a!3742)))))

(assert (=> d!145987 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773110)))

(declare-fun b!1363222 () Bool)

(declare-fun e!773112 () Bool)

(assert (=> b!1363222 (= e!773112 call!65385)))

(declare-fun b!1363223 () Bool)

(assert (=> b!1363223 (= e!773111 e!773112)))

(assert (=> b!1363223 (= c!127506 (validKeyInArray!0 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1363224 () Bool)

(assert (=> b!1363224 (= e!773113 (contains!9485 acc!759 (select (arr!44746 a!3742) from!3120)))))

(declare-fun b!1363225 () Bool)

(assert (=> b!1363225 (= e!773112 call!65385)))

(assert (= (and d!145987 (not res!907095)) b!1363221))

(assert (= (and b!1363221 res!907094) b!1363224))

(assert (= (and b!1363221 res!907096) b!1363223))

(assert (= (and b!1363223 c!127506) b!1363225))

(assert (= (and b!1363223 (not c!127506)) b!1363222))

(assert (= (or b!1363225 b!1363222) bm!65382))

(assert (=> bm!65382 m!1247519))

(declare-fun m!1247625 () Bool)

(assert (=> bm!65382 m!1247625))

(assert (=> b!1363221 m!1247519))

(assert (=> b!1363221 m!1247519))

(assert (=> b!1363221 m!1247531))

(assert (=> b!1363223 m!1247519))

(assert (=> b!1363223 m!1247519))

(assert (=> b!1363223 m!1247531))

(assert (=> b!1363224 m!1247519))

(assert (=> b!1363224 m!1247519))

(declare-fun m!1247627 () Bool)

(assert (=> b!1363224 m!1247627))

(assert (=> b!1363102 d!145987))

(declare-fun d!145989 () Bool)

(declare-fun res!907101 () Bool)

(declare-fun e!773118 () Bool)

(assert (=> d!145989 (=> res!907101 e!773118)))

(assert (=> d!145989 (= res!907101 ((_ is Nil!31862) acc!759))))

(assert (=> d!145989 (= (noDuplicate!2400 acc!759) e!773118)))

(declare-fun b!1363230 () Bool)

(declare-fun e!773119 () Bool)

(assert (=> b!1363230 (= e!773118 e!773119)))

(declare-fun res!907102 () Bool)

(assert (=> b!1363230 (=> (not res!907102) (not e!773119))))

(assert (=> b!1363230 (= res!907102 (not (contains!9485 (t!46545 acc!759) (h!33070 acc!759))))))

(declare-fun b!1363231 () Bool)

(assert (=> b!1363231 (= e!773119 (noDuplicate!2400 (t!46545 acc!759)))))

(assert (= (and d!145989 (not res!907101)) b!1363230))

(assert (= (and b!1363230 res!907102) b!1363231))

(declare-fun m!1247629 () Bool)

(assert (=> b!1363230 m!1247629))

(declare-fun m!1247631 () Bool)

(assert (=> b!1363231 m!1247631))

(assert (=> b!1363104 d!145989))

(declare-fun d!145993 () Bool)

(assert (=> d!145993 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600545 () Unit!44814)

(declare-fun choose!80 (array!92625 List!31865 List!31865 (_ BitVec 32)) Unit!44814)

(assert (=> d!145993 (= lt!600545 (choose!80 a!3742 ($colon$colon!928 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!145993 (bvslt (size!45298 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!145993 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!928 acc!759 (select (arr!44746 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600545)))

(declare-fun bs!39060 () Bool)

(assert (= bs!39060 d!145993))

(assert (=> bs!39060 m!1247525))

(assert (=> bs!39060 m!1247521))

(declare-fun m!1247647 () Bool)

(assert (=> bs!39060 m!1247647))

(assert (=> b!1363109 d!145993))

(declare-fun b!1363263 () Bool)

(declare-fun e!773153 () Bool)

(assert (=> b!1363263 (= e!773153 (subseq!923 (t!46545 acc!759) (t!46545 acc!759)))))

(declare-fun b!1363261 () Bool)

(declare-fun e!773150 () Bool)

(declare-fun e!773152 () Bool)

(assert (=> b!1363261 (= e!773150 e!773152)))

(declare-fun res!907132 () Bool)

(assert (=> b!1363261 (=> (not res!907132) (not e!773152))))

(assert (=> b!1363261 (= res!907132 ((_ is Cons!31861) acc!759))))

(declare-fun b!1363264 () Bool)

(declare-fun e!773151 () Bool)

(assert (=> b!1363264 (= e!773151 (subseq!923 acc!759 (t!46545 acc!759)))))

(declare-fun b!1363262 () Bool)

(assert (=> b!1363262 (= e!773152 e!773151)))

(declare-fun res!907133 () Bool)

(assert (=> b!1363262 (=> res!907133 e!773151)))

(assert (=> b!1363262 (= res!907133 e!773153)))

(declare-fun res!907134 () Bool)

(assert (=> b!1363262 (=> (not res!907134) (not e!773153))))

(assert (=> b!1363262 (= res!907134 (= (h!33070 acc!759) (h!33070 acc!759)))))

(declare-fun d!145999 () Bool)

(declare-fun res!907135 () Bool)

(assert (=> d!145999 (=> res!907135 e!773150)))

(assert (=> d!145999 (= res!907135 ((_ is Nil!31862) acc!759))))

(assert (=> d!145999 (= (subseq!923 acc!759 acc!759) e!773150)))

(assert (= (and d!145999 (not res!907135)) b!1363261))

(assert (= (and b!1363261 res!907132) b!1363262))

(assert (= (and b!1363262 res!907134) b!1363263))

(assert (= (and b!1363262 (not res!907133)) b!1363264))

(declare-fun m!1247655 () Bool)

(assert (=> b!1363263 m!1247655))

(declare-fun m!1247657 () Bool)

(assert (=> b!1363264 m!1247657))

(assert (=> b!1363109 d!145999))

(assert (=> b!1363109 d!145975))

(declare-fun d!146005 () Bool)

(assert (=> d!146005 (= ($colon$colon!928 acc!759 (select (arr!44746 a!3742) from!3120)) (Cons!31861 (select (arr!44746 a!3742) from!3120) acc!759))))

(assert (=> b!1363109 d!146005))

(declare-fun d!146007 () Bool)

(assert (=> d!146007 (subseq!923 acc!759 acc!759)))

(declare-fun lt!600551 () Unit!44814)

(declare-fun choose!36 (List!31865) Unit!44814)

(assert (=> d!146007 (= lt!600551 (choose!36 acc!759))))

(assert (=> d!146007 (= (lemmaListSubSeqRefl!0 acc!759) lt!600551)))

(declare-fun bs!39061 () Bool)

(assert (= bs!39061 d!146007))

(assert (=> bs!39061 m!1247527))

(declare-fun m!1247663 () Bool)

(assert (=> bs!39061 m!1247663))

(assert (=> b!1363109 d!146007))

(check-sat (not d!145977) (not b!1363201) (not b!1363206) (not b!1363199) (not bm!65381) (not b!1363202) (not b!1363221) (not d!146007) (not bm!65380) (not b!1363210) (not b!1363231) (not b!1363207) (not bm!65382) (not d!145993) (not b!1363204) (not b!1363264) (not b!1363263) (not b!1363230) (not b!1363223) (not d!145969) (not b!1363188) (not b!1363224))
(check-sat)
