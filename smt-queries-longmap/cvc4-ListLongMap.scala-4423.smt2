; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61266 () Bool)

(assert start!61266)

(declare-fun b!686271 () Bool)

(declare-fun res!451451 () Bool)

(declare-fun e!390840 () Bool)

(assert (=> b!686271 (=> (not res!451451) (not e!390840))))

(declare-datatypes ((array!39650 0))(
  ( (array!39651 (arr!19001 (Array (_ BitVec 32) (_ BitVec 64))) (size!19375 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39650)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39650 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686271 (= res!451451 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686272 () Bool)

(declare-fun e!390843 () Bool)

(declare-fun e!390844 () Bool)

(assert (=> b!686272 (= e!390843 e!390844)))

(declare-fun res!451447 () Bool)

(assert (=> b!686272 (=> (not res!451447) (not e!390844))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686272 (= res!451447 (bvsle from!3004 i!1382))))

(declare-fun b!686273 () Bool)

(declare-datatypes ((Unit!24172 0))(
  ( (Unit!24173) )
))
(declare-fun e!390841 () Unit!24172)

(declare-fun Unit!24174 () Unit!24172)

(assert (=> b!686273 (= e!390841 Unit!24174)))

(declare-fun b!686275 () Bool)

(declare-fun lt!314959 () Unit!24172)

(assert (=> b!686275 (= e!390841 lt!314959)))

(declare-fun lt!314956 () Unit!24172)

(declare-datatypes ((List!13042 0))(
  ( (Nil!13039) (Cons!13038 (h!14083 (_ BitVec 64)) (t!19297 List!13042)) )
))
(declare-fun acc!681 () List!13042)

(declare-fun lemmaListSubSeqRefl!0 (List!13042) Unit!24172)

(assert (=> b!686275 (= lt!314956 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!205 (List!13042 List!13042) Bool)

(assert (=> b!686275 (subseq!205 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39650 List!13042 List!13042 (_ BitVec 32)) Unit!24172)

(declare-fun $colon$colon!370 (List!13042 (_ BitVec 64)) List!13042)

(assert (=> b!686275 (= lt!314959 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!370 acc!681 (select (arr!19001 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39650 (_ BitVec 32) List!13042) Bool)

(assert (=> b!686275 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686276 () Bool)

(declare-fun res!451459 () Bool)

(assert (=> b!686276 (=> (not res!451459) (not e!390840))))

(assert (=> b!686276 (= res!451459 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686277 () Bool)

(declare-fun res!451457 () Bool)

(assert (=> b!686277 (=> (not res!451457) (not e!390840))))

(assert (=> b!686277 (= res!451457 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13039))))

(declare-fun b!686278 () Bool)

(declare-fun res!451452 () Bool)

(assert (=> b!686278 (=> (not res!451452) (not e!390840))))

(assert (=> b!686278 (= res!451452 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19375 a!3626))))))

(declare-fun b!686279 () Bool)

(declare-fun e!390846 () Unit!24172)

(declare-fun Unit!24175 () Unit!24172)

(assert (=> b!686279 (= e!390846 Unit!24175)))

(declare-fun b!686280 () Bool)

(assert (=> b!686280 (= e!390840 (not true))))

(declare-fun lt!314954 () List!13042)

(assert (=> b!686280 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314954)))

(declare-fun lt!314962 () Unit!24172)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39650 (_ BitVec 64) (_ BitVec 32) List!13042 List!13042) Unit!24172)

(assert (=> b!686280 (= lt!314962 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314954))))

(declare-fun -!170 (List!13042 (_ BitVec 64)) List!13042)

(assert (=> b!686280 (= (-!170 lt!314954 k!2843) acc!681)))

(assert (=> b!686280 (= lt!314954 ($colon$colon!370 acc!681 k!2843))))

(declare-fun lt!314955 () Unit!24172)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13042) Unit!24172)

(assert (=> b!686280 (= lt!314955 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!686280 (subseq!205 acc!681 acc!681)))

(declare-fun lt!314960 () Unit!24172)

(assert (=> b!686280 (= lt!314960 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686280 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314958 () Unit!24172)

(assert (=> b!686280 (= lt!314958 e!390841)))

(declare-fun c!77780 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686280 (= c!77780 (validKeyInArray!0 (select (arr!19001 a!3626) from!3004)))))

(declare-fun lt!314961 () Unit!24172)

(assert (=> b!686280 (= lt!314961 e!390846)))

(declare-fun c!77779 () Bool)

(assert (=> b!686280 (= c!77779 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686280 (arrayContainsKey!0 (array!39651 (store (arr!19001 a!3626) i!1382 k!2843) (size!19375 a!3626)) k!2843 from!3004)))

(declare-fun b!686281 () Bool)

(declare-fun res!451460 () Bool)

(assert (=> b!686281 (=> (not res!451460) (not e!390840))))

(assert (=> b!686281 (= res!451460 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19375 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686282 () Bool)

(declare-fun res!451458 () Bool)

(assert (=> b!686282 (=> (not res!451458) (not e!390840))))

(declare-fun noDuplicate!866 (List!13042) Bool)

(assert (=> b!686282 (= res!451458 (noDuplicate!866 acc!681))))

(declare-fun b!686283 () Bool)

(declare-fun res!451455 () Bool)

(assert (=> b!686283 (=> (not res!451455) (not e!390840))))

(assert (=> b!686283 (= res!451455 e!390843)))

(declare-fun res!451449 () Bool)

(assert (=> b!686283 (=> res!451449 e!390843)))

(declare-fun e!390842 () Bool)

(assert (=> b!686283 (= res!451449 e!390842)))

(declare-fun res!451453 () Bool)

(assert (=> b!686283 (=> (not res!451453) (not e!390842))))

(assert (=> b!686283 (= res!451453 (bvsgt from!3004 i!1382))))

(declare-fun b!686284 () Bool)

(declare-fun res!451450 () Bool)

(assert (=> b!686284 (=> (not res!451450) (not e!390840))))

(declare-fun contains!3619 (List!13042 (_ BitVec 64)) Bool)

(assert (=> b!686284 (= res!451450 (not (contains!3619 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686274 () Bool)

(assert (=> b!686274 (= e!390844 (not (contains!3619 acc!681 k!2843)))))

(declare-fun res!451448 () Bool)

(assert (=> start!61266 (=> (not res!451448) (not e!390840))))

(assert (=> start!61266 (= res!451448 (and (bvslt (size!19375 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19375 a!3626))))))

(assert (=> start!61266 e!390840))

(assert (=> start!61266 true))

(declare-fun array_inv!14797 (array!39650) Bool)

(assert (=> start!61266 (array_inv!14797 a!3626)))

(declare-fun b!686285 () Bool)

(assert (=> b!686285 (= e!390842 (contains!3619 acc!681 k!2843))))

(declare-fun b!686286 () Bool)

(declare-fun res!451454 () Bool)

(assert (=> b!686286 (=> (not res!451454) (not e!390840))))

(assert (=> b!686286 (= res!451454 (validKeyInArray!0 k!2843))))

(declare-fun b!686287 () Bool)

(declare-fun res!451456 () Bool)

(assert (=> b!686287 (=> (not res!451456) (not e!390840))))

(assert (=> b!686287 (= res!451456 (not (contains!3619 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686288 () Bool)

(declare-fun Unit!24176 () Unit!24172)

(assert (=> b!686288 (= e!390846 Unit!24176)))

(declare-fun lt!314957 () Unit!24172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39650 (_ BitVec 64) (_ BitVec 32)) Unit!24172)

(assert (=> b!686288 (= lt!314957 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686288 false))

(assert (= (and start!61266 res!451448) b!686282))

(assert (= (and b!686282 res!451458) b!686284))

(assert (= (and b!686284 res!451450) b!686287))

(assert (= (and b!686287 res!451456) b!686283))

(assert (= (and b!686283 res!451453) b!686285))

(assert (= (and b!686283 (not res!451449)) b!686272))

(assert (= (and b!686272 res!451447) b!686274))

(assert (= (and b!686283 res!451455) b!686277))

(assert (= (and b!686277 res!451457) b!686276))

(assert (= (and b!686276 res!451459) b!686278))

(assert (= (and b!686278 res!451452) b!686286))

(assert (= (and b!686286 res!451454) b!686271))

(assert (= (and b!686271 res!451451) b!686281))

(assert (= (and b!686281 res!451460) b!686280))

(assert (= (and b!686280 c!77779) b!686288))

(assert (= (and b!686280 (not c!77779)) b!686279))

(assert (= (and b!686280 c!77780) b!686275))

(assert (= (and b!686280 (not c!77780)) b!686273))

(declare-fun m!650379 () Bool)

(assert (=> b!686284 m!650379))

(declare-fun m!650381 () Bool)

(assert (=> b!686276 m!650381))

(declare-fun m!650383 () Bool)

(assert (=> b!686280 m!650383))

(declare-fun m!650385 () Bool)

(assert (=> b!686280 m!650385))

(declare-fun m!650387 () Bool)

(assert (=> b!686280 m!650387))

(declare-fun m!650389 () Bool)

(assert (=> b!686280 m!650389))

(declare-fun m!650391 () Bool)

(assert (=> b!686280 m!650391))

(declare-fun m!650393 () Bool)

(assert (=> b!686280 m!650393))

(declare-fun m!650395 () Bool)

(assert (=> b!686280 m!650395))

(declare-fun m!650397 () Bool)

(assert (=> b!686280 m!650397))

(assert (=> b!686280 m!650385))

(declare-fun m!650399 () Bool)

(assert (=> b!686280 m!650399))

(declare-fun m!650401 () Bool)

(assert (=> b!686280 m!650401))

(declare-fun m!650403 () Bool)

(assert (=> b!686280 m!650403))

(declare-fun m!650405 () Bool)

(assert (=> b!686280 m!650405))

(declare-fun m!650407 () Bool)

(assert (=> b!686280 m!650407))

(declare-fun m!650409 () Bool)

(assert (=> b!686282 m!650409))

(declare-fun m!650411 () Bool)

(assert (=> start!61266 m!650411))

(declare-fun m!650413 () Bool)

(assert (=> b!686277 m!650413))

(declare-fun m!650415 () Bool)

(assert (=> b!686288 m!650415))

(declare-fun m!650417 () Bool)

(assert (=> b!686271 m!650417))

(declare-fun m!650419 () Bool)

(assert (=> b!686286 m!650419))

(assert (=> b!686275 m!650383))

(assert (=> b!686275 m!650385))

(declare-fun m!650421 () Bool)

(assert (=> b!686275 m!650421))

(declare-fun m!650423 () Bool)

(assert (=> b!686275 m!650423))

(assert (=> b!686275 m!650385))

(assert (=> b!686275 m!650421))

(assert (=> b!686275 m!650393))

(assert (=> b!686275 m!650407))

(declare-fun m!650425 () Bool)

(assert (=> b!686287 m!650425))

(declare-fun m!650427 () Bool)

(assert (=> b!686285 m!650427))

(assert (=> b!686274 m!650427))

(push 1)

(assert (not b!686288))

(assert (not b!686276))

(assert (not start!61266))

(assert (not b!686282))

(assert (not b!686274))

(assert (not b!686287))

(assert (not b!686284))

(assert (not b!686277))

(assert (not b!686275))

(assert (not b!686271))

(assert (not b!686280))

(assert (not b!686285))

(assert (not b!686286))

(check-sat)

(pop 1)

