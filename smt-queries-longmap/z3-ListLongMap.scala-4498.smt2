; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62458 () Bool)

(assert start!62458)

(declare-fun b!702227 () Bool)

(declare-fun res!466063 () Bool)

(declare-fun e!397483 () Bool)

(assert (=> b!702227 (=> (not res!466063) (not e!397483))))

(declare-datatypes ((List!13266 0))(
  ( (Nil!13263) (Cons!13262 (h!14307 (_ BitVec 64)) (t!19548 List!13266)) )
))
(declare-fun newAcc!49 () List!13266)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3843 (List!13266 (_ BitVec 64)) Bool)

(assert (=> b!702227 (= res!466063 (contains!3843 newAcc!49 k0!2824))))

(declare-fun b!702228 () Bool)

(declare-fun res!466042 () Bool)

(assert (=> b!702228 (=> (not res!466042) (not e!397483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702228 (= res!466042 (validKeyInArray!0 k0!2824))))

(declare-fun b!702229 () Bool)

(declare-fun res!466043 () Bool)

(assert (=> b!702229 (=> (not res!466043) (not e!397483))))

(declare-datatypes ((array!40137 0))(
  ( (array!40138 (arr!19225 (Array (_ BitVec 32) (_ BitVec 64))) (size!19610 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40137)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!702229 (= res!466043 (validKeyInArray!0 (select (arr!19225 a!3591) from!2969)))))

(declare-fun b!702231 () Bool)

(declare-fun res!466049 () Bool)

(declare-fun e!397482 () Bool)

(assert (=> b!702231 (=> (not res!466049) (not e!397482))))

(declare-fun lt!317677 () List!13266)

(declare-fun lt!317679 () List!13266)

(declare-fun subseq!288 (List!13266 List!13266) Bool)

(assert (=> b!702231 (= res!466049 (subseq!288 lt!317677 lt!317679))))

(declare-fun b!702232 () Bool)

(declare-fun res!466064 () Bool)

(assert (=> b!702232 (=> (not res!466064) (not e!397482))))

(assert (=> b!702232 (= res!466064 (contains!3843 lt!317679 k0!2824))))

(declare-fun b!702233 () Bool)

(declare-fun res!466060 () Bool)

(assert (=> b!702233 (=> (not res!466060) (not e!397482))))

(assert (=> b!702233 (= res!466060 (not (contains!3843 lt!317679 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702234 () Bool)

(declare-fun res!466047 () Bool)

(assert (=> b!702234 (=> (not res!466047) (not e!397482))))

(assert (=> b!702234 (= res!466047 (not (contains!3843 lt!317677 k0!2824)))))

(declare-fun b!702235 () Bool)

(declare-fun res!466061 () Bool)

(assert (=> b!702235 (=> (not res!466061) (not e!397483))))

(declare-fun acc!652 () List!13266)

(assert (=> b!702235 (= res!466061 (subseq!288 acc!652 newAcc!49))))

(declare-fun b!702236 () Bool)

(declare-fun res!466058 () Bool)

(assert (=> b!702236 (=> (not res!466058) (not e!397482))))

(declare-fun noDuplicate!1090 (List!13266) Bool)

(assert (=> b!702236 (= res!466058 (noDuplicate!1090 lt!317679))))

(declare-fun b!702237 () Bool)

(declare-fun res!466053 () Bool)

(assert (=> b!702237 (=> (not res!466053) (not e!397482))))

(declare-fun arrayContainsKey!0 (array!40137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702237 (= res!466053 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702238 () Bool)

(declare-fun res!466037 () Bool)

(assert (=> b!702238 (=> (not res!466037) (not e!397482))))

(assert (=> b!702238 (= res!466037 (not (contains!3843 lt!317677 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702239 () Bool)

(assert (=> b!702239 (= e!397483 e!397482)))

(declare-fun res!466056 () Bool)

(assert (=> b!702239 (=> (not res!466056) (not e!397482))))

(assert (=> b!702239 (= res!466056 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!486 (List!13266 (_ BitVec 64)) List!13266)

(assert (=> b!702239 (= lt!317679 ($colon$colon!486 newAcc!49 (select (arr!19225 a!3591) from!2969)))))

(assert (=> b!702239 (= lt!317677 ($colon$colon!486 acc!652 (select (arr!19225 a!3591) from!2969)))))

(declare-fun b!702240 () Bool)

(declare-fun res!466048 () Bool)

(assert (=> b!702240 (=> (not res!466048) (not e!397483))))

(assert (=> b!702240 (= res!466048 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19610 a!3591)))))

(declare-fun b!702241 () Bool)

(declare-fun res!466054 () Bool)

(assert (=> b!702241 (=> (not res!466054) (not e!397482))))

(assert (=> b!702241 (= res!466054 (not (contains!3843 lt!317677 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702242 () Bool)

(declare-fun res!466062 () Bool)

(assert (=> b!702242 (=> (not res!466062) (not e!397483))))

(assert (=> b!702242 (= res!466062 (not (contains!3843 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702243 () Bool)

(declare-fun res!466057 () Bool)

(assert (=> b!702243 (=> (not res!466057) (not e!397483))))

(declare-fun -!253 (List!13266 (_ BitVec 64)) List!13266)

(assert (=> b!702243 (= res!466057 (= (-!253 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702230 () Bool)

(declare-fun res!466045 () Bool)

(assert (=> b!702230 (=> (not res!466045) (not e!397483))))

(declare-fun arrayNoDuplicates!0 (array!40137 (_ BitVec 32) List!13266) Bool)

(assert (=> b!702230 (= res!466045 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!466038 () Bool)

(assert (=> start!62458 (=> (not res!466038) (not e!397483))))

(assert (=> start!62458 (= res!466038 (and (bvslt (size!19610 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19610 a!3591))))))

(assert (=> start!62458 e!397483))

(assert (=> start!62458 true))

(declare-fun array_inv!15021 (array!40137) Bool)

(assert (=> start!62458 (array_inv!15021 a!3591)))

(declare-fun b!702244 () Bool)

(assert (=> b!702244 (= e!397482 (not (bvsle from!2969 (size!19610 a!3591))))))

(assert (=> b!702244 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317679)))

(declare-datatypes ((Unit!24584 0))(
  ( (Unit!24585) )
))
(declare-fun lt!317678 () Unit!24584)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40137 (_ BitVec 64) (_ BitVec 32) List!13266 List!13266) Unit!24584)

(assert (=> b!702244 (= lt!317678 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317677 lt!317679))))

(declare-fun b!702245 () Bool)

(declare-fun res!466065 () Bool)

(assert (=> b!702245 (=> (not res!466065) (not e!397482))))

(assert (=> b!702245 (= res!466065 (noDuplicate!1090 lt!317677))))

(declare-fun b!702246 () Bool)

(declare-fun res!466046 () Bool)

(assert (=> b!702246 (=> (not res!466046) (not e!397483))))

(assert (=> b!702246 (= res!466046 (not (contains!3843 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702247 () Bool)

(declare-fun res!466052 () Bool)

(assert (=> b!702247 (=> (not res!466052) (not e!397483))))

(assert (=> b!702247 (= res!466052 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702248 () Bool)

(declare-fun res!466040 () Bool)

(assert (=> b!702248 (=> (not res!466040) (not e!397483))))

(assert (=> b!702248 (= res!466040 (noDuplicate!1090 newAcc!49))))

(declare-fun b!702249 () Bool)

(declare-fun res!466055 () Bool)

(assert (=> b!702249 (=> (not res!466055) (not e!397482))))

(assert (=> b!702249 (= res!466055 (not (contains!3843 lt!317679 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702250 () Bool)

(declare-fun res!466059 () Bool)

(assert (=> b!702250 (=> (not res!466059) (not e!397483))))

(assert (=> b!702250 (= res!466059 (noDuplicate!1090 acc!652))))

(declare-fun b!702251 () Bool)

(declare-fun res!466039 () Bool)

(assert (=> b!702251 (=> (not res!466039) (not e!397483))))

(assert (=> b!702251 (= res!466039 (not (contains!3843 acc!652 k0!2824)))))

(declare-fun b!702252 () Bool)

(declare-fun res!466050 () Bool)

(assert (=> b!702252 (=> (not res!466050) (not e!397483))))

(assert (=> b!702252 (= res!466050 (not (contains!3843 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702253 () Bool)

(declare-fun res!466051 () Bool)

(assert (=> b!702253 (=> (not res!466051) (not e!397482))))

(assert (=> b!702253 (= res!466051 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317677))))

(declare-fun b!702254 () Bool)

(declare-fun res!466044 () Bool)

(assert (=> b!702254 (=> (not res!466044) (not e!397483))))

(assert (=> b!702254 (= res!466044 (not (contains!3843 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702255 () Bool)

(declare-fun res!466041 () Bool)

(assert (=> b!702255 (=> (not res!466041) (not e!397482))))

(assert (=> b!702255 (= res!466041 (= (-!253 lt!317679 k0!2824) lt!317677))))

(assert (= (and start!62458 res!466038) b!702250))

(assert (= (and b!702250 res!466059) b!702248))

(assert (= (and b!702248 res!466040) b!702242))

(assert (= (and b!702242 res!466062) b!702252))

(assert (= (and b!702252 res!466050) b!702247))

(assert (= (and b!702247 res!466052) b!702251))

(assert (= (and b!702251 res!466039) b!702228))

(assert (= (and b!702228 res!466042) b!702230))

(assert (= (and b!702230 res!466045) b!702235))

(assert (= (and b!702235 res!466061) b!702227))

(assert (= (and b!702227 res!466063) b!702243))

(assert (= (and b!702243 res!466057) b!702246))

(assert (= (and b!702246 res!466046) b!702254))

(assert (= (and b!702254 res!466044) b!702240))

(assert (= (and b!702240 res!466048) b!702229))

(assert (= (and b!702229 res!466043) b!702239))

(assert (= (and b!702239 res!466056) b!702245))

(assert (= (and b!702245 res!466065) b!702236))

(assert (= (and b!702236 res!466058) b!702241))

(assert (= (and b!702241 res!466054) b!702238))

(assert (= (and b!702238 res!466037) b!702237))

(assert (= (and b!702237 res!466053) b!702234))

(assert (= (and b!702234 res!466047) b!702253))

(assert (= (and b!702253 res!466051) b!702231))

(assert (= (and b!702231 res!466049) b!702232))

(assert (= (and b!702232 res!466064) b!702255))

(assert (= (and b!702255 res!466041) b!702233))

(assert (= (and b!702233 res!466060) b!702249))

(assert (= (and b!702249 res!466055) b!702244))

(declare-fun m!661379 () Bool)

(assert (=> start!62458 m!661379))

(declare-fun m!661381 () Bool)

(assert (=> b!702235 m!661381))

(declare-fun m!661383 () Bool)

(assert (=> b!702249 m!661383))

(declare-fun m!661385 () Bool)

(assert (=> b!702237 m!661385))

(declare-fun m!661387 () Bool)

(assert (=> b!702255 m!661387))

(declare-fun m!661389 () Bool)

(assert (=> b!702244 m!661389))

(declare-fun m!661391 () Bool)

(assert (=> b!702244 m!661391))

(declare-fun m!661393 () Bool)

(assert (=> b!702228 m!661393))

(declare-fun m!661395 () Bool)

(assert (=> b!702233 m!661395))

(declare-fun m!661397 () Bool)

(assert (=> b!702232 m!661397))

(declare-fun m!661399 () Bool)

(assert (=> b!702229 m!661399))

(assert (=> b!702229 m!661399))

(declare-fun m!661401 () Bool)

(assert (=> b!702229 m!661401))

(declare-fun m!661403 () Bool)

(assert (=> b!702251 m!661403))

(declare-fun m!661405 () Bool)

(assert (=> b!702231 m!661405))

(assert (=> b!702239 m!661399))

(assert (=> b!702239 m!661399))

(declare-fun m!661407 () Bool)

(assert (=> b!702239 m!661407))

(assert (=> b!702239 m!661399))

(declare-fun m!661409 () Bool)

(assert (=> b!702239 m!661409))

(declare-fun m!661411 () Bool)

(assert (=> b!702250 m!661411))

(declare-fun m!661413 () Bool)

(assert (=> b!702247 m!661413))

(declare-fun m!661415 () Bool)

(assert (=> b!702242 m!661415))

(declare-fun m!661417 () Bool)

(assert (=> b!702243 m!661417))

(declare-fun m!661419 () Bool)

(assert (=> b!702245 m!661419))

(declare-fun m!661421 () Bool)

(assert (=> b!702230 m!661421))

(declare-fun m!661423 () Bool)

(assert (=> b!702246 m!661423))

(declare-fun m!661425 () Bool)

(assert (=> b!702236 m!661425))

(declare-fun m!661427 () Bool)

(assert (=> b!702248 m!661427))

(declare-fun m!661429 () Bool)

(assert (=> b!702241 m!661429))

(declare-fun m!661431 () Bool)

(assert (=> b!702254 m!661431))

(declare-fun m!661433 () Bool)

(assert (=> b!702253 m!661433))

(declare-fun m!661435 () Bool)

(assert (=> b!702227 m!661435))

(declare-fun m!661437 () Bool)

(assert (=> b!702238 m!661437))

(declare-fun m!661439 () Bool)

(assert (=> b!702252 m!661439))

(declare-fun m!661441 () Bool)

(assert (=> b!702234 m!661441))

(check-sat (not b!702255) (not b!702238) (not b!702246) (not b!702228) (not b!702229) (not b!702251) (not b!702254) (not b!702250) (not b!702242) (not b!702252) (not b!702241) (not b!702247) (not b!702227) (not b!702248) (not b!702235) (not b!702237) (not b!702234) (not b!702249) (not b!702243) (not b!702230) (not b!702245) (not b!702232) (not b!702231) (not start!62458) (not b!702244) (not b!702239) (not b!702236) (not b!702253) (not b!702233))
(check-sat)
