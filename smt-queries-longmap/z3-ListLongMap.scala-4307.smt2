; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59872 () Bool)

(assert start!59872)

(declare-fun b!662240 () Bool)

(declare-fun res!430276 () Bool)

(declare-fun e!380238 () Bool)

(assert (=> b!662240 (=> (not res!430276) (not e!380238))))

(declare-fun e!380237 () Bool)

(assert (=> b!662240 (= res!430276 e!380237)))

(declare-fun res!430266 () Bool)

(assert (=> b!662240 (=> res!430266 e!380237)))

(declare-fun e!380235 () Bool)

(assert (=> b!662240 (= res!430266 e!380235)))

(declare-fun res!430273 () Bool)

(assert (=> b!662240 (=> (not res!430273) (not e!380235))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662240 (= res!430273 (bvsgt from!3004 i!1382))))

(declare-fun b!662241 () Bool)

(declare-fun res!430265 () Bool)

(declare-fun e!380236 () Bool)

(assert (=> b!662241 (=> res!430265 e!380236)))

(declare-datatypes ((List!12693 0))(
  ( (Nil!12690) (Cons!12689 (h!13734 (_ BitVec 64)) (t!18921 List!12693)) )
))
(declare-fun lt!308959 () List!12693)

(declare-fun contains!3270 (List!12693 (_ BitVec 64)) Bool)

(assert (=> b!662241 (= res!430265 (contains!3270 lt!308959 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662242 () Bool)

(declare-fun res!430264 () Bool)

(assert (=> b!662242 (=> (not res!430264) (not e!380238))))

(declare-fun acc!681 () List!12693)

(assert (=> b!662242 (= res!430264 (not (contains!3270 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662243 () Bool)

(declare-fun e!380232 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!662243 (= e!380232 (not (contains!3270 acc!681 k0!2843)))))

(declare-fun res!430274 () Bool)

(assert (=> start!59872 (=> (not res!430274) (not e!380238))))

(declare-datatypes ((array!38919 0))(
  ( (array!38920 (arr!18652 (Array (_ BitVec 32) (_ BitVec 64))) (size!19016 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38919)

(assert (=> start!59872 (= res!430274 (and (bvslt (size!19016 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19016 a!3626))))))

(assert (=> start!59872 e!380238))

(assert (=> start!59872 true))

(declare-fun array_inv!14448 (array!38919) Bool)

(assert (=> start!59872 (array_inv!14448 a!3626)))

(declare-fun b!662244 () Bool)

(declare-fun res!430268 () Bool)

(assert (=> b!662244 (=> res!430268 e!380236)))

(assert (=> b!662244 (= res!430268 (contains!3270 lt!308959 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662245 () Bool)

(declare-fun res!430259 () Bool)

(assert (=> b!662245 (=> (not res!430259) (not e!380238))))

(assert (=> b!662245 (= res!430259 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19016 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662246 () Bool)

(declare-fun res!430270 () Bool)

(assert (=> b!662246 (=> (not res!430270) (not e!380238))))

(declare-fun arrayNoDuplicates!0 (array!38919 (_ BitVec 32) List!12693) Bool)

(assert (=> b!662246 (= res!430270 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12690))))

(declare-fun b!662247 () Bool)

(assert (=> b!662247 (= e!380235 (contains!3270 acc!681 k0!2843))))

(declare-fun b!662248 () Bool)

(assert (=> b!662248 (= e!380237 e!380232)))

(declare-fun res!430267 () Bool)

(assert (=> b!662248 (=> (not res!430267) (not e!380232))))

(assert (=> b!662248 (= res!430267 (bvsle from!3004 i!1382))))

(declare-fun b!662249 () Bool)

(declare-fun res!430269 () Bool)

(assert (=> b!662249 (=> (not res!430269) (not e!380238))))

(declare-fun noDuplicate!517 (List!12693) Bool)

(assert (=> b!662249 (= res!430269 (noDuplicate!517 acc!681))))

(declare-fun b!662250 () Bool)

(declare-datatypes ((Unit!23002 0))(
  ( (Unit!23003) )
))
(declare-fun e!380234 () Unit!23002)

(declare-fun Unit!23004 () Unit!23002)

(assert (=> b!662250 (= e!380234 Unit!23004)))

(declare-fun lt!308961 () Unit!23002)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38919 (_ BitVec 64) (_ BitVec 32)) Unit!23002)

(assert (=> b!662250 (= lt!308961 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662250 false))

(declare-fun b!662251 () Bool)

(declare-fun e!380231 () Bool)

(assert (=> b!662251 (= e!380231 e!380236)))

(declare-fun res!430261 () Bool)

(assert (=> b!662251 (=> res!430261 e!380236)))

(assert (=> b!662251 (= res!430261 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!141 (List!12693 (_ BitVec 64)) List!12693)

(assert (=> b!662251 (= lt!308959 ($colon$colon!141 acc!681 (select (arr!18652 a!3626) from!3004)))))

(declare-fun subseq!9 (List!12693 List!12693) Bool)

(assert (=> b!662251 (subseq!9 acc!681 acc!681)))

(declare-fun lt!308958 () Unit!23002)

(declare-fun lemmaListSubSeqRefl!0 (List!12693) Unit!23002)

(assert (=> b!662251 (= lt!308958 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662252 () Bool)

(declare-fun res!430258 () Bool)

(assert (=> b!662252 (=> (not res!430258) (not e!380238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662252 (= res!430258 (validKeyInArray!0 k0!2843))))

(declare-fun b!662253 () Bool)

(declare-fun res!430272 () Bool)

(assert (=> b!662253 (=> res!430272 e!380236)))

(assert (=> b!662253 (= res!430272 (not (subseq!9 acc!681 lt!308959)))))

(declare-fun b!662254 () Bool)

(declare-fun res!430262 () Bool)

(assert (=> b!662254 (=> (not res!430262) (not e!380238))))

(assert (=> b!662254 (= res!430262 (not (contains!3270 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662255 () Bool)

(declare-fun res!430271 () Bool)

(assert (=> b!662255 (=> (not res!430271) (not e!380238))))

(assert (=> b!662255 (= res!430271 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662256 () Bool)

(declare-fun Unit!23005 () Unit!23002)

(assert (=> b!662256 (= e!380234 Unit!23005)))

(declare-fun b!662257 () Bool)

(declare-fun res!430277 () Bool)

(assert (=> b!662257 (=> res!430277 e!380236)))

(assert (=> b!662257 (= res!430277 (not (noDuplicate!517 lt!308959)))))

(declare-fun b!662258 () Bool)

(declare-fun res!430260 () Bool)

(assert (=> b!662258 (=> (not res!430260) (not e!380238))))

(declare-fun arrayContainsKey!0 (array!38919 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662258 (= res!430260 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662259 () Bool)

(declare-fun res!430275 () Bool)

(assert (=> b!662259 (=> (not res!430275) (not e!380238))))

(assert (=> b!662259 (= res!430275 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19016 a!3626))))))

(declare-fun b!662260 () Bool)

(assert (=> b!662260 (= e!380238 (not e!380231))))

(declare-fun res!430263 () Bool)

(assert (=> b!662260 (=> res!430263 e!380231)))

(assert (=> b!662260 (= res!430263 (not (validKeyInArray!0 (select (arr!18652 a!3626) from!3004))))))

(declare-fun lt!308960 () Unit!23002)

(assert (=> b!662260 (= lt!308960 e!380234)))

(declare-fun c!76358 () Bool)

(assert (=> b!662260 (= c!76358 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662260 (arrayContainsKey!0 (array!38920 (store (arr!18652 a!3626) i!1382 k0!2843) (size!19016 a!3626)) k0!2843 from!3004)))

(declare-fun b!662261 () Bool)

(assert (=> b!662261 (= e!380236 true)))

(declare-fun lt!308962 () Bool)

(assert (=> b!662261 (= lt!308962 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308959))))

(declare-fun lt!308957 () Unit!23002)

(declare-fun noDuplicateSubseq!9 (List!12693 List!12693) Unit!23002)

(assert (=> b!662261 (= lt!308957 (noDuplicateSubseq!9 acc!681 lt!308959))))

(assert (= (and start!59872 res!430274) b!662249))

(assert (= (and b!662249 res!430269) b!662254))

(assert (= (and b!662254 res!430262) b!662242))

(assert (= (and b!662242 res!430264) b!662240))

(assert (= (and b!662240 res!430273) b!662247))

(assert (= (and b!662240 (not res!430266)) b!662248))

(assert (= (and b!662248 res!430267) b!662243))

(assert (= (and b!662240 res!430276) b!662246))

(assert (= (and b!662246 res!430270) b!662255))

(assert (= (and b!662255 res!430271) b!662259))

(assert (= (and b!662259 res!430275) b!662252))

(assert (= (and b!662252 res!430258) b!662258))

(assert (= (and b!662258 res!430260) b!662245))

(assert (= (and b!662245 res!430259) b!662260))

(assert (= (and b!662260 c!76358) b!662250))

(assert (= (and b!662260 (not c!76358)) b!662256))

(assert (= (and b!662260 (not res!430263)) b!662251))

(assert (= (and b!662251 (not res!430261)) b!662257))

(assert (= (and b!662257 (not res!430277)) b!662241))

(assert (= (and b!662241 (not res!430265)) b!662244))

(assert (= (and b!662244 (not res!430268)) b!662253))

(assert (= (and b!662253 (not res!430272)) b!662261))

(declare-fun m!634133 () Bool)

(assert (=> b!662244 m!634133))

(declare-fun m!634135 () Bool)

(assert (=> b!662254 m!634135))

(declare-fun m!634137 () Bool)

(assert (=> b!662255 m!634137))

(declare-fun m!634139 () Bool)

(assert (=> b!662253 m!634139))

(declare-fun m!634141 () Bool)

(assert (=> b!662250 m!634141))

(declare-fun m!634143 () Bool)

(assert (=> start!59872 m!634143))

(declare-fun m!634145 () Bool)

(assert (=> b!662247 m!634145))

(declare-fun m!634147 () Bool)

(assert (=> b!662251 m!634147))

(assert (=> b!662251 m!634147))

(declare-fun m!634149 () Bool)

(assert (=> b!662251 m!634149))

(declare-fun m!634151 () Bool)

(assert (=> b!662251 m!634151))

(declare-fun m!634153 () Bool)

(assert (=> b!662251 m!634153))

(declare-fun m!634155 () Bool)

(assert (=> b!662246 m!634155))

(assert (=> b!662243 m!634145))

(declare-fun m!634157 () Bool)

(assert (=> b!662257 m!634157))

(declare-fun m!634159 () Bool)

(assert (=> b!662241 m!634159))

(declare-fun m!634161 () Bool)

(assert (=> b!662249 m!634161))

(declare-fun m!634163 () Bool)

(assert (=> b!662258 m!634163))

(assert (=> b!662260 m!634147))

(declare-fun m!634165 () Bool)

(assert (=> b!662260 m!634165))

(declare-fun m!634167 () Bool)

(assert (=> b!662260 m!634167))

(assert (=> b!662260 m!634147))

(declare-fun m!634169 () Bool)

(assert (=> b!662260 m!634169))

(declare-fun m!634171 () Bool)

(assert (=> b!662260 m!634171))

(declare-fun m!634173 () Bool)

(assert (=> b!662242 m!634173))

(declare-fun m!634175 () Bool)

(assert (=> b!662261 m!634175))

(declare-fun m!634177 () Bool)

(assert (=> b!662261 m!634177))

(declare-fun m!634179 () Bool)

(assert (=> b!662252 m!634179))

(check-sat (not b!662252) (not b!662241) (not b!662242) (not b!662260) (not b!662247) (not b!662243) (not b!662250) (not b!662261) (not b!662254) (not b!662257) (not b!662253) (not b!662249) (not b!662246) (not b!662255) (not b!662251) (not start!59872) (not b!662244) (not b!662258))
(check-sat)
