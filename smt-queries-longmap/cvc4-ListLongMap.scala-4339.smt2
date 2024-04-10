; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60066 () Bool)

(assert start!60066)

(declare-fun b!669053 () Bool)

(declare-fun e!382732 () Bool)

(declare-fun e!382736 () Bool)

(assert (=> b!669053 (= e!382732 (not e!382736))))

(declare-fun res!436009 () Bool)

(assert (=> b!669053 (=> res!436009 e!382736)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!669053 (= res!436009 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39113 0))(
  ( (array!39114 (arr!18749 (Array (_ BitVec 32) (_ BitVec 64))) (size!19113 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39113)

(declare-datatypes ((List!12790 0))(
  ( (Nil!12787) (Cons!12786 (h!13831 (_ BitVec 64)) (t!19018 List!12790)) )
))
(declare-fun lt!311464 () List!12790)

(declare-fun arrayNoDuplicates!0 (array!39113 (_ BitVec 32) List!12790) Bool)

(assert (=> b!669053 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311464)))

(declare-fun acc!681 () List!12790)

(declare-datatypes ((Unit!23470 0))(
  ( (Unit!23471) )
))
(declare-fun lt!311470 () Unit!23470)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39113 (_ BitVec 64) (_ BitVec 32) List!12790 List!12790) Unit!23470)

(assert (=> b!669053 (= lt!311470 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311464))))

(declare-fun -!104 (List!12790 (_ BitVec 64)) List!12790)

(assert (=> b!669053 (= (-!104 lt!311464 k!2843) acc!681)))

(declare-fun $colon$colon!238 (List!12790 (_ BitVec 64)) List!12790)

(assert (=> b!669053 (= lt!311464 ($colon$colon!238 acc!681 k!2843))))

(declare-fun lt!311472 () Unit!23470)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12790) Unit!23470)

(assert (=> b!669053 (= lt!311472 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!106 (List!12790 List!12790) Bool)

(assert (=> b!669053 (subseq!106 acc!681 acc!681)))

(declare-fun lt!311465 () Unit!23470)

(declare-fun lemmaListSubSeqRefl!0 (List!12790) Unit!23470)

(assert (=> b!669053 (= lt!311465 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669053 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311468 () Unit!23470)

(declare-fun e!382735 () Unit!23470)

(assert (=> b!669053 (= lt!311468 e!382735)))

(declare-fun c!76891 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669053 (= c!76891 (validKeyInArray!0 (select (arr!18749 a!3626) from!3004)))))

(declare-fun lt!311469 () Unit!23470)

(declare-fun e!382730 () Unit!23470)

(assert (=> b!669053 (= lt!311469 e!382730)))

(declare-fun c!76892 () Bool)

(declare-fun arrayContainsKey!0 (array!39113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669053 (= c!76892 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669053 (arrayContainsKey!0 (array!39114 (store (arr!18749 a!3626) i!1382 k!2843) (size!19113 a!3626)) k!2843 from!3004)))

(declare-fun b!669054 () Bool)

(declare-fun e!382731 () Bool)

(declare-fun contains!3367 (List!12790 (_ BitVec 64)) Bool)

(assert (=> b!669054 (= e!382731 (not (contains!3367 acc!681 k!2843)))))

(declare-fun b!669055 () Bool)

(declare-fun res!436011 () Bool)

(assert (=> b!669055 (=> (not res!436011) (not e!382732))))

(assert (=> b!669055 (= res!436011 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12787))))

(declare-fun b!669056 () Bool)

(declare-fun res!436019 () Bool)

(assert (=> b!669056 (=> (not res!436019) (not e!382732))))

(assert (=> b!669056 (= res!436019 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669057 () Bool)

(declare-fun res!436016 () Bool)

(assert (=> b!669057 (=> res!436016 e!382736)))

(assert (=> b!669057 (= res!436016 (contains!3367 lt!311464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669058 () Bool)

(declare-fun res!436014 () Bool)

(assert (=> b!669058 (=> (not res!436014) (not e!382732))))

(assert (=> b!669058 (= res!436014 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19113 a!3626))))))

(declare-fun b!669059 () Bool)

(declare-fun e!382733 () Bool)

(assert (=> b!669059 (= e!382733 (not (contains!3367 lt!311464 k!2843)))))

(declare-fun b!669060 () Bool)

(declare-fun Unit!23472 () Unit!23470)

(assert (=> b!669060 (= e!382735 Unit!23472)))

(declare-fun b!669062 () Bool)

(declare-fun res!436022 () Bool)

(assert (=> b!669062 (=> res!436022 e!382736)))

(assert (=> b!669062 (= res!436022 (contains!3367 lt!311464 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669063 () Bool)

(declare-fun e!382729 () Bool)

(assert (=> b!669063 (= e!382729 (contains!3367 lt!311464 k!2843))))

(declare-fun b!669064 () Bool)

(declare-fun Unit!23473 () Unit!23470)

(assert (=> b!669064 (= e!382730 Unit!23473)))

(declare-fun b!669065 () Bool)

(declare-fun e!382728 () Bool)

(assert (=> b!669065 (= e!382728 e!382733)))

(declare-fun res!436015 () Bool)

(assert (=> b!669065 (=> (not res!436015) (not e!382733))))

(assert (=> b!669065 (= res!436015 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669066 () Bool)

(declare-fun res!436007 () Bool)

(assert (=> b!669066 (=> (not res!436007) (not e!382732))))

(declare-fun noDuplicate!614 (List!12790) Bool)

(assert (=> b!669066 (= res!436007 (noDuplicate!614 acc!681))))

(declare-fun b!669067 () Bool)

(declare-fun e!382727 () Bool)

(assert (=> b!669067 (= e!382727 e!382731)))

(declare-fun res!436025 () Bool)

(assert (=> b!669067 (=> (not res!436025) (not e!382731))))

(assert (=> b!669067 (= res!436025 (bvsle from!3004 i!1382))))

(declare-fun b!669068 () Bool)

(declare-fun res!436012 () Bool)

(assert (=> b!669068 (=> (not res!436012) (not e!382732))))

(assert (=> b!669068 (= res!436012 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19113 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669069 () Bool)

(declare-fun Unit!23474 () Unit!23470)

(assert (=> b!669069 (= e!382730 Unit!23474)))

(declare-fun lt!311466 () Unit!23470)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39113 (_ BitVec 64) (_ BitVec 32)) Unit!23470)

(assert (=> b!669069 (= lt!311466 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669069 false))

(declare-fun b!669070 () Bool)

(declare-fun res!436010 () Bool)

(assert (=> b!669070 (=> res!436010 e!382736)))

(assert (=> b!669070 (= res!436010 (not (noDuplicate!614 lt!311464)))))

(declare-fun b!669071 () Bool)

(declare-fun res!436018 () Bool)

(assert (=> b!669071 (=> (not res!436018) (not e!382732))))

(assert (=> b!669071 (= res!436018 e!382727)))

(declare-fun res!436023 () Bool)

(assert (=> b!669071 (=> res!436023 e!382727)))

(declare-fun e!382737 () Bool)

(assert (=> b!669071 (= res!436023 e!382737)))

(declare-fun res!436005 () Bool)

(assert (=> b!669071 (=> (not res!436005) (not e!382737))))

(assert (=> b!669071 (= res!436005 (bvsgt from!3004 i!1382))))

(declare-fun b!669072 () Bool)

(declare-fun res!436013 () Bool)

(assert (=> b!669072 (=> (not res!436013) (not e!382732))))

(assert (=> b!669072 (= res!436013 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669073 () Bool)

(declare-fun res!436024 () Bool)

(assert (=> b!669073 (=> (not res!436024) (not e!382732))))

(assert (=> b!669073 (= res!436024 (validKeyInArray!0 k!2843))))

(declare-fun b!669074 () Bool)

(assert (=> b!669074 (= e!382737 (contains!3367 acc!681 k!2843))))

(declare-fun b!669075 () Bool)

(declare-fun lt!311471 () Unit!23470)

(assert (=> b!669075 (= e!382735 lt!311471)))

(declare-fun lt!311467 () Unit!23470)

(assert (=> b!669075 (= lt!311467 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669075 (subseq!106 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39113 List!12790 List!12790 (_ BitVec 32)) Unit!23470)

(assert (=> b!669075 (= lt!311471 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!238 acc!681 (select (arr!18749 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669075 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669061 () Bool)

(assert (=> b!669061 (= e!382736 true)))

(declare-fun lt!311473 () Bool)

(assert (=> b!669061 (= lt!311473 e!382728)))

(declare-fun res!436020 () Bool)

(assert (=> b!669061 (=> res!436020 e!382728)))

(assert (=> b!669061 (= res!436020 e!382729)))

(declare-fun res!436008 () Bool)

(assert (=> b!669061 (=> (not res!436008) (not e!382729))))

(assert (=> b!669061 (= res!436008 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!436021 () Bool)

(assert (=> start!60066 (=> (not res!436021) (not e!382732))))

(assert (=> start!60066 (= res!436021 (and (bvslt (size!19113 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19113 a!3626))))))

(assert (=> start!60066 e!382732))

(assert (=> start!60066 true))

(declare-fun array_inv!14545 (array!39113) Bool)

(assert (=> start!60066 (array_inv!14545 a!3626)))

(declare-fun b!669076 () Bool)

(declare-fun res!436017 () Bool)

(assert (=> b!669076 (=> (not res!436017) (not e!382732))))

(assert (=> b!669076 (= res!436017 (not (contains!3367 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669077 () Bool)

(declare-fun res!436006 () Bool)

(assert (=> b!669077 (=> (not res!436006) (not e!382732))))

(assert (=> b!669077 (= res!436006 (not (contains!3367 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60066 res!436021) b!669066))

(assert (= (and b!669066 res!436007) b!669076))

(assert (= (and b!669076 res!436017) b!669077))

(assert (= (and b!669077 res!436006) b!669071))

(assert (= (and b!669071 res!436005) b!669074))

(assert (= (and b!669071 (not res!436023)) b!669067))

(assert (= (and b!669067 res!436025) b!669054))

(assert (= (and b!669071 res!436018) b!669055))

(assert (= (and b!669055 res!436011) b!669056))

(assert (= (and b!669056 res!436019) b!669058))

(assert (= (and b!669058 res!436014) b!669073))

(assert (= (and b!669073 res!436024) b!669072))

(assert (= (and b!669072 res!436013) b!669068))

(assert (= (and b!669068 res!436012) b!669053))

(assert (= (and b!669053 c!76892) b!669069))

(assert (= (and b!669053 (not c!76892)) b!669064))

(assert (= (and b!669053 c!76891) b!669075))

(assert (= (and b!669053 (not c!76891)) b!669060))

(assert (= (and b!669053 (not res!436009)) b!669070))

(assert (= (and b!669070 (not res!436010)) b!669057))

(assert (= (and b!669057 (not res!436016)) b!669062))

(assert (= (and b!669062 (not res!436022)) b!669061))

(assert (= (and b!669061 res!436008) b!669063))

(assert (= (and b!669061 (not res!436020)) b!669065))

(assert (= (and b!669065 res!436015) b!669059))

(declare-fun m!639235 () Bool)

(assert (=> b!669073 m!639235))

(declare-fun m!639237 () Bool)

(assert (=> b!669075 m!639237))

(declare-fun m!639239 () Bool)

(assert (=> b!669075 m!639239))

(declare-fun m!639241 () Bool)

(assert (=> b!669075 m!639241))

(declare-fun m!639243 () Bool)

(assert (=> b!669075 m!639243))

(assert (=> b!669075 m!639239))

(assert (=> b!669075 m!639241))

(declare-fun m!639245 () Bool)

(assert (=> b!669075 m!639245))

(declare-fun m!639247 () Bool)

(assert (=> b!669075 m!639247))

(declare-fun m!639249 () Bool)

(assert (=> b!669055 m!639249))

(declare-fun m!639251 () Bool)

(assert (=> b!669077 m!639251))

(declare-fun m!639253 () Bool)

(assert (=> b!669054 m!639253))

(assert (=> b!669074 m!639253))

(declare-fun m!639255 () Bool)

(assert (=> start!60066 m!639255))

(declare-fun m!639257 () Bool)

(assert (=> b!669062 m!639257))

(declare-fun m!639259 () Bool)

(assert (=> b!669076 m!639259))

(declare-fun m!639261 () Bool)

(assert (=> b!669063 m!639261))

(declare-fun m!639263 () Bool)

(assert (=> b!669056 m!639263))

(declare-fun m!639265 () Bool)

(assert (=> b!669070 m!639265))

(declare-fun m!639267 () Bool)

(assert (=> b!669066 m!639267))

(assert (=> b!669059 m!639261))

(declare-fun m!639269 () Bool)

(assert (=> b!669057 m!639269))

(declare-fun m!639271 () Bool)

(assert (=> b!669069 m!639271))

(assert (=> b!669053 m!639239))

(declare-fun m!639273 () Bool)

(assert (=> b!669053 m!639273))

(declare-fun m!639275 () Bool)

(assert (=> b!669053 m!639275))

(declare-fun m!639277 () Bool)

(assert (=> b!669053 m!639277))

(declare-fun m!639279 () Bool)

(assert (=> b!669053 m!639279))

(assert (=> b!669053 m!639245))

(declare-fun m!639281 () Bool)

(assert (=> b!669053 m!639281))

(declare-fun m!639283 () Bool)

(assert (=> b!669053 m!639283))

(assert (=> b!669053 m!639239))

(declare-fun m!639285 () Bool)

(assert (=> b!669053 m!639285))

(declare-fun m!639287 () Bool)

(assert (=> b!669053 m!639287))

(assert (=> b!669053 m!639237))

(declare-fun m!639289 () Bool)

(assert (=> b!669053 m!639289))

(assert (=> b!669053 m!639247))

(declare-fun m!639291 () Bool)

(assert (=> b!669072 m!639291))

(push 1)

(assert (not b!669057))

(assert (not b!669074))

(assert (not b!669063))

(assert (not b!669076))

(assert (not b!669066))

(assert (not b!669062))

(assert (not b!669075))

(assert (not b!669056))

(assert (not b!669072))

(assert (not b!669053))

(assert (not b!669055))

(assert (not b!669054))

(assert (not b!669069))

(assert (not b!669077))

(assert (not b!669059))

(assert (not b!669070))

(assert (not b!669073))

(assert (not start!60066))

(check-sat)

(pop 1)

