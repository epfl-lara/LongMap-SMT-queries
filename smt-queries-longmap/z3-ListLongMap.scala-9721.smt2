; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115000 () Bool)

(assert start!115000)

(declare-fun e!773097 () Bool)

(declare-datatypes ((List!31813 0))(
  ( (Nil!31810) (Cons!31809 (h!33018 (_ BitVec 64)) (t!46501 List!31813)) )
))
(declare-fun acc!759 () List!31813)

(declare-fun b!1363205 () Bool)

(declare-datatypes ((array!92678 0))(
  ( (array!92679 (arr!44772 (Array (_ BitVec 32) (_ BitVec 64))) (size!45322 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92678)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92678 (_ BitVec 32) List!31813) Bool)

(assert (=> b!1363205 (= e!773097 (not (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))))

(declare-fun b!1363206 () Bool)

(declare-fun res!907060 () Bool)

(declare-fun e!773098 () Bool)

(assert (=> b!1363206 (=> (not res!907060) (not e!773098))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1363206 (= res!907060 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1363207 () Bool)

(declare-fun res!907058 () Bool)

(assert (=> b!1363207 (=> (not res!907058) (not e!773098))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1363207 (= res!907058 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45322 a!3742))))))

(declare-fun b!1363209 () Bool)

(declare-datatypes ((Unit!44976 0))(
  ( (Unit!44977) )
))
(declare-fun e!773096 () Unit!44976)

(declare-fun lt!600707 () Unit!44976)

(assert (=> b!1363209 (= e!773096 lt!600707)))

(declare-fun lt!600706 () Unit!44976)

(declare-fun lemmaListSubSeqRefl!0 (List!31813) Unit!44976)

(assert (=> b!1363209 (= lt!600706 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!924 (List!31813 List!31813) Bool)

(assert (=> b!1363209 (subseq!924 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92678 List!31813 List!31813 (_ BitVec 32)) Unit!44976)

(declare-fun $colon$colon!927 (List!31813 (_ BitVec 64)) List!31813)

(assert (=> b!1363209 (= lt!600707 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!927 acc!759 (select (arr!44772 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1363209 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1363210 () Bool)

(declare-fun Unit!44978 () Unit!44976)

(assert (=> b!1363210 (= e!773096 Unit!44978)))

(declare-fun b!1363211 () Bool)

(declare-fun res!907059 () Bool)

(assert (=> b!1363211 (=> (not res!907059) (not e!773098))))

(assert (=> b!1363211 (= res!907059 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31810))))

(declare-fun b!1363212 () Bool)

(declare-fun res!907063 () Bool)

(assert (=> b!1363212 (=> (not res!907063) (not e!773098))))

(declare-fun contains!9522 (List!31813 (_ BitVec 64)) Bool)

(assert (=> b!1363212 (= res!907063 (not (contains!9522 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363213 () Bool)

(declare-fun res!907064 () Bool)

(assert (=> b!1363213 (=> (not res!907064) (not e!773098))))

(assert (=> b!1363213 (= res!907064 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45322 a!3742)))))

(declare-fun b!1363214 () Bool)

(declare-fun res!907066 () Bool)

(assert (=> b!1363214 (=> (not res!907066) (not e!773098))))

(assert (=> b!1363214 (= res!907066 (not (contains!9522 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1363215 () Bool)

(declare-fun res!907061 () Bool)

(assert (=> b!1363215 (=> (not res!907061) (not e!773098))))

(assert (=> b!1363215 (= res!907061 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1363216 () Bool)

(assert (=> b!1363216 (= e!773098 e!773097)))

(declare-fun res!907057 () Bool)

(assert (=> b!1363216 (=> (not res!907057) (not e!773097))))

(declare-fun lt!600709 () Bool)

(assert (=> b!1363216 (= res!907057 (and (not (= from!3120 i!1404)) (not lt!600709) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-fun lt!600708 () Unit!44976)

(assert (=> b!1363216 (= lt!600708 e!773096)))

(declare-fun c!127514 () Bool)

(assert (=> b!1363216 (= c!127514 lt!600709)))

(assert (=> b!1363216 (= lt!600709 (validKeyInArray!0 (select (arr!44772 a!3742) from!3120)))))

(declare-fun b!1363208 () Bool)

(declare-fun res!907062 () Bool)

(assert (=> b!1363208 (=> (not res!907062) (not e!773098))))

(declare-fun noDuplicate!2379 (List!31813) Bool)

(assert (=> b!1363208 (= res!907062 (noDuplicate!2379 acc!759))))

(declare-fun res!907065 () Bool)

(assert (=> start!115000 (=> (not res!907065) (not e!773098))))

(assert (=> start!115000 (= res!907065 (and (bvslt (size!45322 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45322 a!3742))))))

(assert (=> start!115000 e!773098))

(assert (=> start!115000 true))

(declare-fun array_inv!33800 (array!92678) Bool)

(assert (=> start!115000 (array_inv!33800 a!3742)))

(assert (= (and start!115000 res!907065) b!1363208))

(assert (= (and b!1363208 res!907062) b!1363212))

(assert (= (and b!1363212 res!907063) b!1363214))

(assert (= (and b!1363214 res!907066) b!1363211))

(assert (= (and b!1363211 res!907059) b!1363215))

(assert (= (and b!1363215 res!907061) b!1363207))

(assert (= (and b!1363207 res!907058) b!1363206))

(assert (= (and b!1363206 res!907060) b!1363213))

(assert (= (and b!1363213 res!907064) b!1363216))

(assert (= (and b!1363216 c!127514) b!1363209))

(assert (= (and b!1363216 (not c!127514)) b!1363210))

(assert (= (and b!1363216 res!907057) b!1363205))

(declare-fun m!1248059 () Bool)

(assert (=> b!1363208 m!1248059))

(declare-fun m!1248061 () Bool)

(assert (=> b!1363214 m!1248061))

(declare-fun m!1248063 () Bool)

(assert (=> b!1363209 m!1248063))

(declare-fun m!1248065 () Bool)

(assert (=> b!1363209 m!1248065))

(declare-fun m!1248067 () Bool)

(assert (=> b!1363209 m!1248067))

(declare-fun m!1248069 () Bool)

(assert (=> b!1363209 m!1248069))

(declare-fun m!1248071 () Bool)

(assert (=> b!1363209 m!1248071))

(assert (=> b!1363209 m!1248065))

(assert (=> b!1363209 m!1248067))

(declare-fun m!1248073 () Bool)

(assert (=> b!1363209 m!1248073))

(declare-fun m!1248075 () Bool)

(assert (=> start!115000 m!1248075))

(declare-fun m!1248077 () Bool)

(assert (=> b!1363212 m!1248077))

(assert (=> b!1363205 m!1248071))

(declare-fun m!1248079 () Bool)

(assert (=> b!1363206 m!1248079))

(declare-fun m!1248081 () Bool)

(assert (=> b!1363211 m!1248081))

(declare-fun m!1248083 () Bool)

(assert (=> b!1363215 m!1248083))

(assert (=> b!1363216 m!1248065))

(assert (=> b!1363216 m!1248065))

(declare-fun m!1248085 () Bool)

(assert (=> b!1363216 m!1248085))

(check-sat (not b!1363209) (not b!1363214) (not b!1363206) (not b!1363216) (not b!1363215) (not b!1363205) (not start!115000) (not b!1363208) (not b!1363211) (not b!1363212))
(check-sat)
(get-model)

(declare-fun d!146085 () Bool)

(declare-fun lt!600724 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!702 (List!31813) (InoxSet (_ BitVec 64)))

(assert (=> d!146085 (= lt!600724 (select (content!702 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773116 () Bool)

(assert (=> d!146085 (= lt!600724 e!773116)))

(declare-fun res!907101 () Bool)

(assert (=> d!146085 (=> (not res!907101) (not e!773116))))

(get-info :version)

(assert (=> d!146085 (= res!907101 ((_ is Cons!31809) acc!759))))

(assert (=> d!146085 (= (contains!9522 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000) lt!600724)))

(declare-fun b!1363257 () Bool)

(declare-fun e!773115 () Bool)

(assert (=> b!1363257 (= e!773116 e!773115)))

(declare-fun res!907102 () Bool)

(assert (=> b!1363257 (=> res!907102 e!773115)))

(assert (=> b!1363257 (= res!907102 (= (h!33018 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363258 () Bool)

(assert (=> b!1363258 (= e!773115 (contains!9522 (t!46501 acc!759) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146085 res!907101) b!1363257))

(assert (= (and b!1363257 (not res!907102)) b!1363258))

(declare-fun m!1248115 () Bool)

(assert (=> d!146085 m!1248115))

(declare-fun m!1248117 () Bool)

(assert (=> d!146085 m!1248117))

(declare-fun m!1248119 () Bool)

(assert (=> b!1363258 m!1248119))

(assert (=> b!1363212 d!146085))

(declare-fun d!146087 () Bool)

(assert (=> d!146087 (= (validKeyInArray!0 l!3587) (and (not (= l!3587 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= l!3587 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363206 d!146087))

(declare-fun d!146089 () Bool)

(declare-fun res!907107 () Bool)

(declare-fun e!773121 () Bool)

(assert (=> d!146089 (=> res!907107 e!773121)))

(assert (=> d!146089 (= res!907107 ((_ is Nil!31810) acc!759))))

(assert (=> d!146089 (= (noDuplicate!2379 acc!759) e!773121)))

(declare-fun b!1363263 () Bool)

(declare-fun e!773122 () Bool)

(assert (=> b!1363263 (= e!773121 e!773122)))

(declare-fun res!907108 () Bool)

(assert (=> b!1363263 (=> (not res!907108) (not e!773122))))

(assert (=> b!1363263 (= res!907108 (not (contains!9522 (t!46501 acc!759) (h!33018 acc!759))))))

(declare-fun b!1363264 () Bool)

(assert (=> b!1363264 (= e!773122 (noDuplicate!2379 (t!46501 acc!759)))))

(assert (= (and d!146089 (not res!907107)) b!1363263))

(assert (= (and b!1363263 res!907108) b!1363264))

(declare-fun m!1248121 () Bool)

(assert (=> b!1363263 m!1248121))

(declare-fun m!1248123 () Bool)

(assert (=> b!1363264 m!1248123))

(assert (=> b!1363208 d!146089))

(declare-fun d!146093 () Bool)

(assert (=> d!146093 (= (array_inv!33800 a!3742) (bvsge (size!45322 a!3742) #b00000000000000000000000000000000))))

(assert (=> start!115000 d!146093))

(declare-fun b!1363296 () Bool)

(declare-fun e!773151 () Bool)

(declare-fun call!65405 () Bool)

(assert (=> b!1363296 (= e!773151 call!65405)))

(declare-fun b!1363298 () Bool)

(declare-fun e!773149 () Bool)

(assert (=> b!1363298 (= e!773149 (contains!9522 acc!759 (select (arr!44772 a!3742) from!3120)))))

(declare-fun bm!65402 () Bool)

(declare-fun c!127523 () Bool)

(assert (=> bm!65402 (= call!65405 (arrayNoDuplicates!0 a!3742 (bvadd from!3120 #b00000000000000000000000000000001) (ite c!127523 (Cons!31809 (select (arr!44772 a!3742) from!3120) acc!759) acc!759)))))

(declare-fun b!1363299 () Bool)

(assert (=> b!1363299 (= e!773151 call!65405)))

(declare-fun b!1363300 () Bool)

(declare-fun e!773150 () Bool)

(declare-fun e!773152 () Bool)

(assert (=> b!1363300 (= e!773150 e!773152)))

(declare-fun res!907130 () Bool)

(assert (=> b!1363300 (=> (not res!907130) (not e!773152))))

(assert (=> b!1363300 (= res!907130 (not e!773149))))

(declare-fun res!907131 () Bool)

(assert (=> b!1363300 (=> (not res!907131) (not e!773149))))

(assert (=> b!1363300 (= res!907131 (validKeyInArray!0 (select (arr!44772 a!3742) from!3120)))))

(declare-fun b!1363297 () Bool)

(assert (=> b!1363297 (= e!773152 e!773151)))

(assert (=> b!1363297 (= c!127523 (validKeyInArray!0 (select (arr!44772 a!3742) from!3120)))))

(declare-fun d!146095 () Bool)

(declare-fun res!907132 () Bool)

(assert (=> d!146095 (=> res!907132 e!773150)))

(assert (=> d!146095 (= res!907132 (bvsge from!3120 (size!45322 a!3742)))))

(assert (=> d!146095 (= (arrayNoDuplicates!0 a!3742 from!3120 acc!759) e!773150)))

(assert (= (and d!146095 (not res!907132)) b!1363300))

(assert (= (and b!1363300 res!907131) b!1363298))

(assert (= (and b!1363300 res!907130) b!1363297))

(assert (= (and b!1363297 c!127523) b!1363299))

(assert (= (and b!1363297 (not c!127523)) b!1363296))

(assert (= (or b!1363299 b!1363296) bm!65402))

(assert (=> b!1363298 m!1248065))

(assert (=> b!1363298 m!1248065))

(declare-fun m!1248135 () Bool)

(assert (=> b!1363298 m!1248135))

(assert (=> bm!65402 m!1248065))

(declare-fun m!1248137 () Bool)

(assert (=> bm!65402 m!1248137))

(assert (=> b!1363300 m!1248065))

(assert (=> b!1363300 m!1248065))

(assert (=> b!1363300 m!1248085))

(assert (=> b!1363297 m!1248065))

(assert (=> b!1363297 m!1248065))

(assert (=> b!1363297 m!1248085))

(assert (=> b!1363215 d!146095))

(declare-fun d!146107 () Bool)

(declare-fun lt!600728 () Bool)

(assert (=> d!146107 (= lt!600728 (select (content!702 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!773154 () Bool)

(assert (=> d!146107 (= lt!600728 e!773154)))

(declare-fun res!907133 () Bool)

(assert (=> d!146107 (=> (not res!907133) (not e!773154))))

(assert (=> d!146107 (= res!907133 ((_ is Cons!31809) acc!759))))

(assert (=> d!146107 (= (contains!9522 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000) lt!600728)))

(declare-fun b!1363301 () Bool)

(declare-fun e!773153 () Bool)

(assert (=> b!1363301 (= e!773154 e!773153)))

(declare-fun res!907134 () Bool)

(assert (=> b!1363301 (=> res!907134 e!773153)))

(assert (=> b!1363301 (= res!907134 (= (h!33018 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1363302 () Bool)

(assert (=> b!1363302 (= e!773153 (contains!9522 (t!46501 acc!759) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!146107 res!907133) b!1363301))

(assert (= (and b!1363301 (not res!907134)) b!1363302))

(assert (=> d!146107 m!1248115))

(declare-fun m!1248139 () Bool)

(assert (=> d!146107 m!1248139))

(declare-fun m!1248141 () Bool)

(assert (=> b!1363302 m!1248141))

(assert (=> b!1363214 d!146107))

(declare-fun d!146109 () Bool)

(assert (=> d!146109 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun lt!600731 () Unit!44976)

(declare-fun choose!80 (array!92678 List!31813 List!31813 (_ BitVec 32)) Unit!44976)

(assert (=> d!146109 (= lt!600731 (choose!80 a!3742 ($colon$colon!927 acc!759 (select (arr!44772 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> d!146109 (bvslt (size!45322 a!3742) #b01111111111111111111111111111111)))

(assert (=> d!146109 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!927 acc!759 (select (arr!44772 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)) lt!600731)))

(declare-fun bs!39087 () Bool)

(assert (= bs!39087 d!146109))

(assert (=> bs!39087 m!1248071))

(assert (=> bs!39087 m!1248067))

(declare-fun m!1248147 () Bool)

(assert (=> bs!39087 m!1248147))

(assert (=> b!1363209 d!146109))

(declare-fun b!1363346 () Bool)

(declare-fun e!773196 () Bool)

(declare-fun e!773195 () Bool)

(assert (=> b!1363346 (= e!773196 e!773195)))

(declare-fun res!907169 () Bool)

(assert (=> b!1363346 (=> res!907169 e!773195)))

(declare-fun e!773193 () Bool)

(assert (=> b!1363346 (= res!907169 e!773193)))

(declare-fun res!907172 () Bool)

(assert (=> b!1363346 (=> (not res!907172) (not e!773193))))

(assert (=> b!1363346 (= res!907172 (= (h!33018 acc!759) (h!33018 acc!759)))))

(declare-fun b!1363347 () Bool)

(assert (=> b!1363347 (= e!773193 (subseq!924 (t!46501 acc!759) (t!46501 acc!759)))))

(declare-fun b!1363348 () Bool)

(assert (=> b!1363348 (= e!773195 (subseq!924 acc!759 (t!46501 acc!759)))))

(declare-fun b!1363345 () Bool)

(declare-fun e!773194 () Bool)

(assert (=> b!1363345 (= e!773194 e!773196)))

(declare-fun res!907170 () Bool)

(assert (=> b!1363345 (=> (not res!907170) (not e!773196))))

(assert (=> b!1363345 (= res!907170 ((_ is Cons!31809) acc!759))))

(declare-fun d!146113 () Bool)

(declare-fun res!907171 () Bool)

(assert (=> d!146113 (=> res!907171 e!773194)))

(assert (=> d!146113 (= res!907171 ((_ is Nil!31810) acc!759))))

(assert (=> d!146113 (= (subseq!924 acc!759 acc!759) e!773194)))

(assert (= (and d!146113 (not res!907171)) b!1363345))

(assert (= (and b!1363345 res!907170) b!1363346))

(assert (= (and b!1363346 res!907172) b!1363347))

(assert (= (and b!1363346 (not res!907169)) b!1363348))

(declare-fun m!1248175 () Bool)

(assert (=> b!1363347 m!1248175))

(declare-fun m!1248177 () Bool)

(assert (=> b!1363348 m!1248177))

(assert (=> b!1363209 d!146113))

(declare-fun b!1363359 () Bool)

(declare-fun e!773207 () Bool)

(declare-fun call!65412 () Bool)

(assert (=> b!1363359 (= e!773207 call!65412)))

(declare-fun b!1363361 () Bool)

(declare-fun e!773205 () Bool)

(assert (=> b!1363361 (= e!773205 (contains!9522 acc!759 (select (arr!44772 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun bm!65409 () Bool)

(declare-fun c!127530 () Bool)

(assert (=> bm!65409 (= call!65412 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120 #b00000000000000000000000000000001) (ite c!127530 (Cons!31809 (select (arr!44772 a!3742) (bvadd #b00000000000000000000000000000001 from!3120)) acc!759) acc!759)))))

(declare-fun b!1363362 () Bool)

(assert (=> b!1363362 (= e!773207 call!65412)))

(declare-fun b!1363363 () Bool)

(declare-fun e!773206 () Bool)

(declare-fun e!773208 () Bool)

(assert (=> b!1363363 (= e!773206 e!773208)))

(declare-fun res!907179 () Bool)

(assert (=> b!1363363 (=> (not res!907179) (not e!773208))))

(assert (=> b!1363363 (= res!907179 (not e!773205))))

(declare-fun res!907180 () Bool)

(assert (=> b!1363363 (=> (not res!907180) (not e!773205))))

(assert (=> b!1363363 (= res!907180 (validKeyInArray!0 (select (arr!44772 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun b!1363360 () Bool)

(assert (=> b!1363360 (= e!773208 e!773207)))

(assert (=> b!1363360 (= c!127530 (validKeyInArray!0 (select (arr!44772 a!3742) (bvadd #b00000000000000000000000000000001 from!3120))))))

(declare-fun d!146127 () Bool)

(declare-fun res!907181 () Bool)

(assert (=> d!146127 (=> res!907181 e!773206)))

(assert (=> d!146127 (= res!907181 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) (size!45322 a!3742)))))

(assert (=> d!146127 (= (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759) e!773206)))

(assert (= (and d!146127 (not res!907181)) b!1363363))

(assert (= (and b!1363363 res!907180) b!1363361))

(assert (= (and b!1363363 res!907179) b!1363360))

(assert (= (and b!1363360 c!127530) b!1363362))

(assert (= (and b!1363360 (not c!127530)) b!1363359))

(assert (= (or b!1363362 b!1363359) bm!65409))

(declare-fun m!1248191 () Bool)

(assert (=> b!1363361 m!1248191))

(assert (=> b!1363361 m!1248191))

(declare-fun m!1248195 () Bool)

(assert (=> b!1363361 m!1248195))

(assert (=> bm!65409 m!1248191))

(declare-fun m!1248197 () Bool)

(assert (=> bm!65409 m!1248197))

(assert (=> b!1363363 m!1248191))

(assert (=> b!1363363 m!1248191))

(declare-fun m!1248201 () Bool)

(assert (=> b!1363363 m!1248201))

(assert (=> b!1363360 m!1248191))

(assert (=> b!1363360 m!1248191))

(assert (=> b!1363360 m!1248201))

(assert (=> b!1363209 d!146127))

(declare-fun d!146133 () Bool)

(assert (=> d!146133 (= ($colon$colon!927 acc!759 (select (arr!44772 a!3742) from!3120)) (Cons!31809 (select (arr!44772 a!3742) from!3120) acc!759))))

(assert (=> b!1363209 d!146133))

(declare-fun d!146137 () Bool)

(assert (=> d!146137 (subseq!924 acc!759 acc!759)))

(declare-fun lt!600739 () Unit!44976)

(declare-fun choose!36 (List!31813) Unit!44976)

(assert (=> d!146137 (= lt!600739 (choose!36 acc!759))))

(assert (=> d!146137 (= (lemmaListSubSeqRefl!0 acc!759) lt!600739)))

(declare-fun bs!39088 () Bool)

(assert (= bs!39088 d!146137))

(assert (=> bs!39088 m!1248073))

(declare-fun m!1248207 () Bool)

(assert (=> bs!39088 m!1248207))

(assert (=> b!1363209 d!146137))

(declare-fun d!146143 () Bool)

(assert (=> d!146143 (= (validKeyInArray!0 (select (arr!44772 a!3742) from!3120)) (and (not (= (select (arr!44772 a!3742) from!3120) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44772 a!3742) from!3120) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1363216 d!146143))

(declare-fun b!1363372 () Bool)

(declare-fun e!773219 () Bool)

(declare-fun call!65413 () Bool)

(assert (=> b!1363372 (= e!773219 call!65413)))

(declare-fun b!1363374 () Bool)

(declare-fun e!773217 () Bool)

(assert (=> b!1363374 (= e!773217 (contains!9522 Nil!31810 (select (arr!44772 a!3742) #b00000000000000000000000000000000)))))

(declare-fun bm!65410 () Bool)

(declare-fun c!127531 () Bool)

(assert (=> bm!65410 (= call!65413 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!127531 (Cons!31809 (select (arr!44772 a!3742) #b00000000000000000000000000000000) Nil!31810) Nil!31810)))))

(declare-fun b!1363375 () Bool)

(assert (=> b!1363375 (= e!773219 call!65413)))

(declare-fun b!1363376 () Bool)

(declare-fun e!773218 () Bool)

(declare-fun e!773220 () Bool)

(assert (=> b!1363376 (= e!773218 e!773220)))

(declare-fun res!907190 () Bool)

(assert (=> b!1363376 (=> (not res!907190) (not e!773220))))

(assert (=> b!1363376 (= res!907190 (not e!773217))))

(declare-fun res!907191 () Bool)

(assert (=> b!1363376 (=> (not res!907191) (not e!773217))))

(assert (=> b!1363376 (= res!907191 (validKeyInArray!0 (select (arr!44772 a!3742) #b00000000000000000000000000000000)))))

(declare-fun b!1363373 () Bool)

(assert (=> b!1363373 (= e!773220 e!773219)))

(assert (=> b!1363373 (= c!127531 (validKeyInArray!0 (select (arr!44772 a!3742) #b00000000000000000000000000000000)))))

(declare-fun d!146145 () Bool)

(declare-fun res!907192 () Bool)

(assert (=> d!146145 (=> res!907192 e!773218)))

(assert (=> d!146145 (= res!907192 (bvsge #b00000000000000000000000000000000 (size!45322 a!3742)))))

(assert (=> d!146145 (= (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31810) e!773218)))

(assert (= (and d!146145 (not res!907192)) b!1363376))

(assert (= (and b!1363376 res!907191) b!1363374))

(assert (= (and b!1363376 res!907190) b!1363373))

(assert (= (and b!1363373 c!127531) b!1363375))

(assert (= (and b!1363373 (not c!127531)) b!1363372))

(assert (= (or b!1363375 b!1363372) bm!65410))

(declare-fun m!1248213 () Bool)

(assert (=> b!1363374 m!1248213))

(assert (=> b!1363374 m!1248213))

(declare-fun m!1248215 () Bool)

(assert (=> b!1363374 m!1248215))

(assert (=> bm!65410 m!1248213))

(declare-fun m!1248217 () Bool)

(assert (=> bm!65410 m!1248217))

(assert (=> b!1363376 m!1248213))

(assert (=> b!1363376 m!1248213))

(declare-fun m!1248219 () Bool)

(assert (=> b!1363376 m!1248219))

(assert (=> b!1363373 m!1248213))

(assert (=> b!1363373 m!1248213))

(assert (=> b!1363373 m!1248219))

(assert (=> b!1363211 d!146145))

(assert (=> b!1363205 d!146127))

(check-sat (not bm!65402) (not d!146109) (not b!1363300) (not b!1363373) (not bm!65409) (not b!1363376) (not d!146137) (not b!1363297) (not d!146085) (not b!1363348) (not b!1363361) (not b!1363263) (not b!1363264) (not b!1363298) (not b!1363302) (not d!146107) (not b!1363360) (not b!1363258) (not b!1363363) (not bm!65410) (not b!1363374) (not b!1363347))
(check-sat)
