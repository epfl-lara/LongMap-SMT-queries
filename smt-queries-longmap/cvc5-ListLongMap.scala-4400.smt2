; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60500 () Bool)

(assert start!60500)

(declare-fun b!680035 () Bool)

(declare-fun res!446337 () Bool)

(declare-fun e!387375 () Bool)

(assert (=> b!680035 (=> (not res!446337) (not e!387375))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680035 (= res!446337 (validKeyInArray!0 k!2843))))

(declare-fun b!680036 () Bool)

(declare-datatypes ((Unit!23838 0))(
  ( (Unit!23839) )
))
(declare-fun e!387372 () Unit!23838)

(declare-fun Unit!23840 () Unit!23838)

(assert (=> b!680036 (= e!387372 Unit!23840)))

(declare-fun b!680037 () Bool)

(declare-fun res!446346 () Bool)

(assert (=> b!680037 (=> (not res!446346) (not e!387375))))

(declare-datatypes ((array!39481 0))(
  ( (array!39482 (arr!18930 (Array (_ BitVec 32) (_ BitVec 64))) (size!19294 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39481)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12971 0))(
  ( (Nil!12968) (Cons!12967 (h!14012 (_ BitVec 64)) (t!19199 List!12971)) )
))
(declare-fun acc!681 () List!12971)

(declare-fun arrayNoDuplicates!0 (array!39481 (_ BitVec 32) List!12971) Bool)

(assert (=> b!680037 (= res!446346 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680038 () Bool)

(declare-fun res!446348 () Bool)

(assert (=> b!680038 (=> (not res!446348) (not e!387375))))

(declare-fun noDuplicate!795 (List!12971) Bool)

(assert (=> b!680038 (= res!446348 (noDuplicate!795 acc!681))))

(declare-fun b!680039 () Bool)

(declare-fun res!446347 () Bool)

(assert (=> b!680039 (=> (not res!446347) (not e!387375))))

(declare-fun contains!3548 (List!12971 (_ BitVec 64)) Bool)

(assert (=> b!680039 (= res!446347 (not (contains!3548 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680040 () Bool)

(declare-fun e!387369 () Bool)

(assert (=> b!680040 (= e!387369 (not (contains!3548 acc!681 k!2843)))))

(declare-fun b!680041 () Bool)

(declare-fun res!446342 () Bool)

(assert (=> b!680041 (=> (not res!446342) (not e!387375))))

(declare-fun arrayContainsKey!0 (array!39481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680041 (= res!446342 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!446338 () Bool)

(assert (=> start!60500 (=> (not res!446338) (not e!387375))))

(assert (=> start!60500 (= res!446338 (and (bvslt (size!19294 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19294 a!3626))))))

(assert (=> start!60500 e!387375))

(assert (=> start!60500 true))

(declare-fun array_inv!14726 (array!39481) Bool)

(assert (=> start!60500 (array_inv!14726 a!3626)))

(declare-fun b!680042 () Bool)

(declare-fun res!446345 () Bool)

(assert (=> b!680042 (=> (not res!446345) (not e!387375))))

(assert (=> b!680042 (= res!446345 (not (contains!3548 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680043 () Bool)

(declare-fun e!387370 () Bool)

(assert (=> b!680043 (= e!387370 e!387369)))

(declare-fun res!446339 () Bool)

(assert (=> b!680043 (=> (not res!446339) (not e!387369))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680043 (= res!446339 (bvsle from!3004 i!1382))))

(declare-fun b!680044 () Bool)

(declare-fun res!446340 () Bool)

(assert (=> b!680044 (=> (not res!446340) (not e!387375))))

(assert (=> b!680044 (= res!446340 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12968))))

(declare-fun b!680045 () Bool)

(declare-fun e!387373 () Bool)

(assert (=> b!680045 (= e!387375 (not e!387373))))

(declare-fun res!446349 () Bool)

(assert (=> b!680045 (=> res!446349 e!387373)))

(assert (=> b!680045 (= res!446349 (not (validKeyInArray!0 (select (arr!18930 a!3626) from!3004))))))

(declare-fun lt!313014 () Unit!23838)

(assert (=> b!680045 (= lt!313014 e!387372)))

(declare-fun c!77216 () Bool)

(assert (=> b!680045 (= c!77216 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680045 (arrayContainsKey!0 (array!39482 (store (arr!18930 a!3626) i!1382 k!2843) (size!19294 a!3626)) k!2843 from!3004)))

(declare-fun b!680046 () Bool)

(declare-fun res!446343 () Bool)

(assert (=> b!680046 (=> (not res!446343) (not e!387375))))

(assert (=> b!680046 (= res!446343 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19294 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680047 () Bool)

(declare-fun Unit!23841 () Unit!23838)

(assert (=> b!680047 (= e!387372 Unit!23841)))

(declare-fun lt!313015 () Unit!23838)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39481 (_ BitVec 64) (_ BitVec 32)) Unit!23838)

(assert (=> b!680047 (= lt!313015 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680047 false))

(declare-fun b!680048 () Bool)

(declare-fun e!387371 () Bool)

(assert (=> b!680048 (= e!387371 (contains!3548 acc!681 k!2843))))

(declare-fun b!680049 () Bool)

(assert (=> b!680049 (= e!387373 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun subseq!134 (List!12971 List!12971) Bool)

(assert (=> b!680049 (subseq!134 acc!681 acc!681)))

(declare-fun lt!313013 () Unit!23838)

(declare-fun lemmaListSubSeqRefl!0 (List!12971) Unit!23838)

(assert (=> b!680049 (= lt!313013 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680050 () Bool)

(declare-fun res!446350 () Bool)

(assert (=> b!680050 (=> (not res!446350) (not e!387375))))

(assert (=> b!680050 (= res!446350 e!387370)))

(declare-fun res!446341 () Bool)

(assert (=> b!680050 (=> res!446341 e!387370)))

(assert (=> b!680050 (= res!446341 e!387371)))

(declare-fun res!446351 () Bool)

(assert (=> b!680050 (=> (not res!446351) (not e!387371))))

(assert (=> b!680050 (= res!446351 (bvsgt from!3004 i!1382))))

(declare-fun b!680051 () Bool)

(declare-fun res!446344 () Bool)

(assert (=> b!680051 (=> (not res!446344) (not e!387375))))

(assert (=> b!680051 (= res!446344 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19294 a!3626))))))

(assert (= (and start!60500 res!446338) b!680038))

(assert (= (and b!680038 res!446348) b!680039))

(assert (= (and b!680039 res!446347) b!680042))

(assert (= (and b!680042 res!446345) b!680050))

(assert (= (and b!680050 res!446351) b!680048))

(assert (= (and b!680050 (not res!446341)) b!680043))

(assert (= (and b!680043 res!446339) b!680040))

(assert (= (and b!680050 res!446350) b!680044))

(assert (= (and b!680044 res!446340) b!680037))

(assert (= (and b!680037 res!446346) b!680051))

(assert (= (and b!680051 res!446344) b!680035))

(assert (= (and b!680035 res!446337) b!680041))

(assert (= (and b!680041 res!446342) b!680046))

(assert (= (and b!680046 res!446343) b!680045))

(assert (= (and b!680045 c!77216) b!680047))

(assert (= (and b!680045 (not c!77216)) b!680036))

(assert (= (and b!680045 (not res!446349)) b!680049))

(declare-fun m!645221 () Bool)

(assert (=> b!680049 m!645221))

(declare-fun m!645223 () Bool)

(assert (=> b!680049 m!645223))

(declare-fun m!645225 () Bool)

(assert (=> b!680042 m!645225))

(declare-fun m!645227 () Bool)

(assert (=> start!60500 m!645227))

(declare-fun m!645229 () Bool)

(assert (=> b!680040 m!645229))

(declare-fun m!645231 () Bool)

(assert (=> b!680035 m!645231))

(declare-fun m!645233 () Bool)

(assert (=> b!680038 m!645233))

(assert (=> b!680048 m!645229))

(declare-fun m!645235 () Bool)

(assert (=> b!680037 m!645235))

(declare-fun m!645237 () Bool)

(assert (=> b!680041 m!645237))

(declare-fun m!645239 () Bool)

(assert (=> b!680045 m!645239))

(declare-fun m!645241 () Bool)

(assert (=> b!680045 m!645241))

(declare-fun m!645243 () Bool)

(assert (=> b!680045 m!645243))

(assert (=> b!680045 m!645239))

(declare-fun m!645245 () Bool)

(assert (=> b!680045 m!645245))

(declare-fun m!645247 () Bool)

(assert (=> b!680045 m!645247))

(declare-fun m!645249 () Bool)

(assert (=> b!680044 m!645249))

(declare-fun m!645251 () Bool)

(assert (=> b!680047 m!645251))

(declare-fun m!645253 () Bool)

(assert (=> b!680039 m!645253))

(push 1)

