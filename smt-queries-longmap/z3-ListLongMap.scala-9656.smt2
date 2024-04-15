; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114074 () Bool)

(assert start!114074)

(declare-fun b!1354260 () Bool)

(declare-fun res!899380 () Bool)

(declare-fun e!769370 () Bool)

(assert (=> b!1354260 (=> (not res!899380) (not e!769370))))

(declare-datatypes ((List!31670 0))(
  ( (Nil!31667) (Cons!31666 (h!32875 (_ BitVec 64)) (t!46320 List!31670)) )
))
(declare-fun lt!598030 () List!31670)

(declare-fun contains!9290 (List!31670 (_ BitVec 64)) Bool)

(assert (=> b!1354260 (= res!899380 (not (contains!9290 lt!598030 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354261 () Bool)

(assert (=> b!1354261 (= e!769370 false)))

(declare-fun lt!598025 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92205 0))(
  ( (array!92206 (arr!44551 (Array (_ BitVec 32) (_ BitVec 64))) (size!45103 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92205)

(declare-fun arrayNoDuplicates!0 (array!92205 (_ BitVec 32) List!31670) Bool)

(assert (=> b!1354261 (= lt!598025 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598030))))

(declare-fun b!1354262 () Bool)

(declare-fun res!899385 () Bool)

(declare-fun e!769371 () Bool)

(assert (=> b!1354262 (=> (not res!899385) (not e!769371))))

(declare-fun acc!759 () List!31670)

(assert (=> b!1354262 (= res!899385 (not (contains!9290 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354263 () Bool)

(declare-fun res!899383 () Bool)

(assert (=> b!1354263 (=> (not res!899383) (not e!769370))))

(declare-fun noDuplicate!2205 (List!31670) Bool)

(assert (=> b!1354263 (= res!899383 (noDuplicate!2205 lt!598030))))

(declare-fun b!1354264 () Bool)

(declare-fun res!899381 () Bool)

(assert (=> b!1354264 (=> (not res!899381) (not e!769371))))

(assert (=> b!1354264 (= res!899381 (noDuplicate!2205 acc!759))))

(declare-fun b!1354265 () Bool)

(declare-fun res!899377 () Bool)

(assert (=> b!1354265 (=> (not res!899377) (not e!769371))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354265 (= res!899377 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354266 () Bool)

(declare-datatypes ((Unit!44310 0))(
  ( (Unit!44311) )
))
(declare-fun e!769372 () Unit!44310)

(declare-fun Unit!44312 () Unit!44310)

(assert (=> b!1354266 (= e!769372 Unit!44312)))

(declare-fun b!1354267 () Bool)

(declare-fun res!899390 () Bool)

(assert (=> b!1354267 (=> (not res!899390) (not e!769371))))

(assert (=> b!1354267 (= res!899390 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354268 () Bool)

(declare-fun res!899386 () Bool)

(assert (=> b!1354268 (=> (not res!899386) (not e!769371))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354268 (= res!899386 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45103 a!3742))))))

(declare-fun b!1354269 () Bool)

(declare-fun e!769368 () Bool)

(assert (=> b!1354269 (= e!769371 e!769368)))

(declare-fun res!899384 () Bool)

(assert (=> b!1354269 (=> (not res!899384) (not e!769368))))

(declare-fun lt!598026 () Bool)

(assert (=> b!1354269 (= res!899384 (and (not (= from!3120 i!1404)) lt!598026))))

(declare-fun lt!598027 () Unit!44310)

(assert (=> b!1354269 (= lt!598027 e!769372)))

(declare-fun c!126884 () Bool)

(assert (=> b!1354269 (= c!126884 lt!598026)))

(assert (=> b!1354269 (= lt!598026 (validKeyInArray!0 (select (arr!44551 a!3742) from!3120)))))

(declare-fun res!899387 () Bool)

(assert (=> start!114074 (=> (not res!899387) (not e!769371))))

(assert (=> start!114074 (= res!899387 (and (bvslt (size!45103 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45103 a!3742))))))

(assert (=> start!114074 e!769371))

(assert (=> start!114074 true))

(declare-fun array_inv!33784 (array!92205) Bool)

(assert (=> start!114074 (array_inv!33784 a!3742)))

(declare-fun b!1354270 () Bool)

(declare-fun res!899379 () Bool)

(assert (=> b!1354270 (=> (not res!899379) (not e!769371))))

(assert (=> b!1354270 (= res!899379 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31667))))

(declare-fun b!1354271 () Bool)

(assert (=> b!1354271 (= e!769368 e!769370)))

(declare-fun res!899378 () Bool)

(assert (=> b!1354271 (=> (not res!899378) (not e!769370))))

(assert (=> b!1354271 (= res!899378 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!763 (List!31670 (_ BitVec 64)) List!31670)

(assert (=> b!1354271 (= lt!598030 ($colon$colon!763 acc!759 (select (arr!44551 a!3742) from!3120)))))

(declare-fun b!1354272 () Bool)

(declare-fun res!899382 () Bool)

(assert (=> b!1354272 (=> (not res!899382) (not e!769371))))

(assert (=> b!1354272 (= res!899382 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45103 a!3742)))))

(declare-fun b!1354273 () Bool)

(declare-fun lt!598028 () Unit!44310)

(assert (=> b!1354273 (= e!769372 lt!598028)))

(declare-fun lt!598029 () Unit!44310)

(declare-fun lemmaListSubSeqRefl!0 (List!31670) Unit!44310)

(assert (=> b!1354273 (= lt!598029 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!746 (List!31670 List!31670) Bool)

(assert (=> b!1354273 (subseq!746 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92205 List!31670 List!31670 (_ BitVec 32)) Unit!44310)

(assert (=> b!1354273 (= lt!598028 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!763 acc!759 (select (arr!44551 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354273 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354274 () Bool)

(declare-fun res!899389 () Bool)

(assert (=> b!1354274 (=> (not res!899389) (not e!769370))))

(assert (=> b!1354274 (= res!899389 (not (contains!9290 lt!598030 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354275 () Bool)

(declare-fun res!899388 () Bool)

(assert (=> b!1354275 (=> (not res!899388) (not e!769371))))

(assert (=> b!1354275 (= res!899388 (not (contains!9290 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114074 res!899387) b!1354264))

(assert (= (and b!1354264 res!899381) b!1354275))

(assert (= (and b!1354275 res!899388) b!1354262))

(assert (= (and b!1354262 res!899385) b!1354270))

(assert (= (and b!1354270 res!899379) b!1354267))

(assert (= (and b!1354267 res!899390) b!1354268))

(assert (= (and b!1354268 res!899386) b!1354265))

(assert (= (and b!1354265 res!899377) b!1354272))

(assert (= (and b!1354272 res!899382) b!1354269))

(assert (= (and b!1354269 c!126884) b!1354273))

(assert (= (and b!1354269 (not c!126884)) b!1354266))

(assert (= (and b!1354269 res!899384) b!1354271))

(assert (= (and b!1354271 res!899378) b!1354263))

(assert (= (and b!1354263 res!899383) b!1354274))

(assert (= (and b!1354274 res!899389) b!1354260))

(assert (= (and b!1354260 res!899380) b!1354261))

(declare-fun m!1240213 () Bool)

(assert (=> b!1354269 m!1240213))

(assert (=> b!1354269 m!1240213))

(declare-fun m!1240215 () Bool)

(assert (=> b!1354269 m!1240215))

(declare-fun m!1240217 () Bool)

(assert (=> b!1354267 m!1240217))

(declare-fun m!1240219 () Bool)

(assert (=> b!1354273 m!1240219))

(assert (=> b!1354273 m!1240213))

(declare-fun m!1240221 () Bool)

(assert (=> b!1354273 m!1240221))

(declare-fun m!1240223 () Bool)

(assert (=> b!1354273 m!1240223))

(declare-fun m!1240225 () Bool)

(assert (=> b!1354273 m!1240225))

(assert (=> b!1354273 m!1240213))

(assert (=> b!1354273 m!1240221))

(declare-fun m!1240227 () Bool)

(assert (=> b!1354273 m!1240227))

(declare-fun m!1240229 () Bool)

(assert (=> b!1354275 m!1240229))

(declare-fun m!1240231 () Bool)

(assert (=> b!1354263 m!1240231))

(declare-fun m!1240233 () Bool)

(assert (=> b!1354265 m!1240233))

(assert (=> b!1354271 m!1240213))

(assert (=> b!1354271 m!1240213))

(assert (=> b!1354271 m!1240221))

(declare-fun m!1240235 () Bool)

(assert (=> b!1354270 m!1240235))

(declare-fun m!1240237 () Bool)

(assert (=> b!1354262 m!1240237))

(declare-fun m!1240239 () Bool)

(assert (=> start!114074 m!1240239))

(declare-fun m!1240241 () Bool)

(assert (=> b!1354260 m!1240241))

(declare-fun m!1240243 () Bool)

(assert (=> b!1354274 m!1240243))

(declare-fun m!1240245 () Bool)

(assert (=> b!1354264 m!1240245))

(declare-fun m!1240247 () Bool)

(assert (=> b!1354261 m!1240247))

(check-sat (not b!1354270) (not b!1354271) (not b!1354269) (not b!1354260) (not b!1354261) (not b!1354273) (not b!1354263) (not b!1354264) (not b!1354262) (not start!114074) (not b!1354265) (not b!1354267) (not b!1354275) (not b!1354274))
(check-sat)
