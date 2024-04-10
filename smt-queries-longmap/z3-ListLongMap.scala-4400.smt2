; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60502 () Bool)

(assert start!60502)

(declare-fun b!680086 () Bool)

(declare-fun res!446384 () Bool)

(declare-fun e!387395 () Bool)

(assert (=> b!680086 (=> (not res!446384) (not e!387395))))

(declare-datatypes ((array!39483 0))(
  ( (array!39484 (arr!18931 (Array (_ BitVec 32) (_ BitVec 64))) (size!19295 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39483)

(declare-datatypes ((List!12972 0))(
  ( (Nil!12969) (Cons!12968 (h!14013 (_ BitVec 64)) (t!19200 List!12972)) )
))
(declare-fun arrayNoDuplicates!0 (array!39483 (_ BitVec 32) List!12972) Bool)

(assert (=> b!680086 (= res!446384 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12969))))

(declare-fun b!680087 () Bool)

(declare-fun res!446393 () Bool)

(assert (=> b!680087 (=> (not res!446393) (not e!387395))))

(declare-fun acc!681 () List!12972)

(declare-fun contains!3549 (List!12972 (_ BitVec 64)) Bool)

(assert (=> b!680087 (= res!446393 (not (contains!3549 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!446396 () Bool)

(assert (=> start!60502 (=> (not res!446396) (not e!387395))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60502 (= res!446396 (and (bvslt (size!19295 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19295 a!3626))))))

(assert (=> start!60502 e!387395))

(assert (=> start!60502 true))

(declare-fun array_inv!14727 (array!39483) Bool)

(assert (=> start!60502 (array_inv!14727 a!3626)))

(declare-fun b!680088 () Bool)

(declare-datatypes ((Unit!23842 0))(
  ( (Unit!23843) )
))
(declare-fun e!387396 () Unit!23842)

(declare-fun Unit!23844 () Unit!23842)

(assert (=> b!680088 (= e!387396 Unit!23844)))

(declare-fun b!680089 () Bool)

(declare-fun res!446395 () Bool)

(assert (=> b!680089 (=> (not res!446395) (not e!387395))))

(assert (=> b!680089 (= res!446395 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680090 () Bool)

(declare-fun res!446388 () Bool)

(assert (=> b!680090 (=> (not res!446388) (not e!387395))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680090 (= res!446388 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680091 () Bool)

(declare-fun e!387393 () Bool)

(assert (=> b!680091 (= e!387393 (contains!3549 acc!681 k0!2843))))

(declare-fun b!680092 () Bool)

(declare-fun res!446394 () Bool)

(assert (=> b!680092 (=> (not res!446394) (not e!387395))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680092 (= res!446394 (validKeyInArray!0 k0!2843))))

(declare-fun b!680093 () Bool)

(declare-fun res!446391 () Bool)

(assert (=> b!680093 (=> (not res!446391) (not e!387395))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680093 (= res!446391 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19295 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680094 () Bool)

(declare-fun res!446386 () Bool)

(assert (=> b!680094 (=> (not res!446386) (not e!387395))))

(declare-fun e!387392 () Bool)

(assert (=> b!680094 (= res!446386 e!387392)))

(declare-fun res!446392 () Bool)

(assert (=> b!680094 (=> res!446392 e!387392)))

(assert (=> b!680094 (= res!446392 e!387393)))

(declare-fun res!446383 () Bool)

(assert (=> b!680094 (=> (not res!446383) (not e!387393))))

(assert (=> b!680094 (= res!446383 (bvsgt from!3004 i!1382))))

(declare-fun b!680095 () Bool)

(declare-fun Unit!23845 () Unit!23842)

(assert (=> b!680095 (= e!387396 Unit!23845)))

(declare-fun lt!313023 () Unit!23842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39483 (_ BitVec 64) (_ BitVec 32)) Unit!23842)

(assert (=> b!680095 (= lt!313023 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680095 false))

(declare-fun b!680096 () Bool)

(declare-fun res!446389 () Bool)

(assert (=> b!680096 (=> (not res!446389) (not e!387395))))

(declare-fun noDuplicate!796 (List!12972) Bool)

(assert (=> b!680096 (= res!446389 (noDuplicate!796 acc!681))))

(declare-fun b!680097 () Bool)

(declare-fun e!387391 () Bool)

(assert (=> b!680097 (= e!387391 (not (contains!3549 acc!681 k0!2843)))))

(declare-fun b!680098 () Bool)

(assert (=> b!680098 (= e!387392 e!387391)))

(declare-fun res!446385 () Bool)

(assert (=> b!680098 (=> (not res!446385) (not e!387391))))

(assert (=> b!680098 (= res!446385 (bvsle from!3004 i!1382))))

(declare-fun b!680099 () Bool)

(declare-fun e!387390 () Bool)

(assert (=> b!680099 (= e!387390 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!135 (List!12972 List!12972) Bool)

(assert (=> b!680099 (subseq!135 acc!681 acc!681)))

(declare-fun lt!313024 () Unit!23842)

(declare-fun lemmaListSubSeqRefl!0 (List!12972) Unit!23842)

(assert (=> b!680099 (= lt!313024 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680100 () Bool)

(assert (=> b!680100 (= e!387395 (not e!387390))))

(declare-fun res!446382 () Bool)

(assert (=> b!680100 (=> res!446382 e!387390)))

(assert (=> b!680100 (= res!446382 (not (validKeyInArray!0 (select (arr!18931 a!3626) from!3004))))))

(declare-fun lt!313022 () Unit!23842)

(assert (=> b!680100 (= lt!313022 e!387396)))

(declare-fun c!77219 () Bool)

(assert (=> b!680100 (= c!77219 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680100 (arrayContainsKey!0 (array!39484 (store (arr!18931 a!3626) i!1382 k0!2843) (size!19295 a!3626)) k0!2843 from!3004)))

(declare-fun b!680101 () Bool)

(declare-fun res!446387 () Bool)

(assert (=> b!680101 (=> (not res!446387) (not e!387395))))

(assert (=> b!680101 (= res!446387 (not (contains!3549 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680102 () Bool)

(declare-fun res!446390 () Bool)

(assert (=> b!680102 (=> (not res!446390) (not e!387395))))

(assert (=> b!680102 (= res!446390 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19295 a!3626))))))

(assert (= (and start!60502 res!446396) b!680096))

(assert (= (and b!680096 res!446389) b!680101))

(assert (= (and b!680101 res!446387) b!680087))

(assert (= (and b!680087 res!446393) b!680094))

(assert (= (and b!680094 res!446383) b!680091))

(assert (= (and b!680094 (not res!446392)) b!680098))

(assert (= (and b!680098 res!446385) b!680097))

(assert (= (and b!680094 res!446386) b!680086))

(assert (= (and b!680086 res!446384) b!680089))

(assert (= (and b!680089 res!446395) b!680102))

(assert (= (and b!680102 res!446390) b!680092))

(assert (= (and b!680092 res!446394) b!680090))

(assert (= (and b!680090 res!446388) b!680093))

(assert (= (and b!680093 res!446391) b!680100))

(assert (= (and b!680100 c!77219) b!680095))

(assert (= (and b!680100 (not c!77219)) b!680088))

(assert (= (and b!680100 (not res!446382)) b!680099))

(declare-fun m!645255 () Bool)

(assert (=> b!680091 m!645255))

(assert (=> b!680097 m!645255))

(declare-fun m!645257 () Bool)

(assert (=> b!680099 m!645257))

(declare-fun m!645259 () Bool)

(assert (=> b!680099 m!645259))

(declare-fun m!645261 () Bool)

(assert (=> b!680090 m!645261))

(declare-fun m!645263 () Bool)

(assert (=> b!680087 m!645263))

(declare-fun m!645265 () Bool)

(assert (=> b!680100 m!645265))

(declare-fun m!645267 () Bool)

(assert (=> b!680100 m!645267))

(declare-fun m!645269 () Bool)

(assert (=> b!680100 m!645269))

(assert (=> b!680100 m!645265))

(declare-fun m!645271 () Bool)

(assert (=> b!680100 m!645271))

(declare-fun m!645273 () Bool)

(assert (=> b!680100 m!645273))

(declare-fun m!645275 () Bool)

(assert (=> b!680101 m!645275))

(declare-fun m!645277 () Bool)

(assert (=> b!680092 m!645277))

(declare-fun m!645279 () Bool)

(assert (=> b!680089 m!645279))

(declare-fun m!645281 () Bool)

(assert (=> start!60502 m!645281))

(declare-fun m!645283 () Bool)

(assert (=> b!680095 m!645283))

(declare-fun m!645285 () Bool)

(assert (=> b!680086 m!645285))

(declare-fun m!645287 () Bool)

(assert (=> b!680096 m!645287))

(check-sat (not b!680097) (not b!680089) (not b!680090) (not b!680100) (not b!680086) (not b!680099) (not b!680101) (not start!60502) (not b!680091) (not b!680092) (not b!680087) (not b!680095) (not b!680096))
(check-sat)
