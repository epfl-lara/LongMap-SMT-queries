; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61562 () Bool)

(assert start!61562)

(declare-fun b!688493 () Bool)

(declare-fun res!453199 () Bool)

(declare-fun e!392135 () Bool)

(assert (=> b!688493 (=> (not res!453199) (not e!392135))))

(declare-fun e!392136 () Bool)

(assert (=> b!688493 (= res!453199 e!392136)))

(declare-fun res!453209 () Bool)

(assert (=> b!688493 (=> res!453209 e!392136)))

(declare-fun e!392139 () Bool)

(assert (=> b!688493 (= res!453209 e!392139)))

(declare-fun res!453198 () Bool)

(assert (=> b!688493 (=> (not res!453198) (not e!392139))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688493 (= res!453198 (bvsgt from!3004 i!1382))))

(declare-fun b!688494 () Bool)

(declare-fun e!392142 () Bool)

(assert (=> b!688494 (= e!392136 e!392142)))

(declare-fun res!453204 () Bool)

(assert (=> b!688494 (=> (not res!453204) (not e!392142))))

(assert (=> b!688494 (= res!453204 (bvsle from!3004 i!1382))))

(declare-fun b!688495 () Bool)

(declare-datatypes ((Unit!24282 0))(
  ( (Unit!24283) )
))
(declare-fun e!392133 () Unit!24282)

(declare-fun Unit!24284 () Unit!24282)

(assert (=> b!688495 (= e!392133 Unit!24284)))

(declare-fun b!688496 () Bool)

(declare-fun e!392141 () Bool)

(declare-datatypes ((List!13064 0))(
  ( (Nil!13061) (Cons!13060 (h!14105 (_ BitVec 64)) (t!19328 List!13064)) )
))
(declare-fun lt!315799 () List!13064)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3641 (List!13064 (_ BitVec 64)) Bool)

(assert (=> b!688496 (= e!392141 (not (contains!3641 lt!315799 k!2843)))))

(declare-fun b!688497 () Bool)

(declare-fun acc!681 () List!13064)

(assert (=> b!688497 (= e!392139 (contains!3641 acc!681 k!2843))))

(declare-fun b!688498 () Bool)

(declare-fun res!453195 () Bool)

(assert (=> b!688498 (=> (not res!453195) (not e!392135))))

(declare-fun noDuplicate!888 (List!13064) Bool)

(assert (=> b!688498 (= res!453195 (noDuplicate!888 acc!681))))

(declare-fun b!688499 () Bool)

(declare-fun e!392137 () Bool)

(assert (=> b!688499 (= e!392137 e!392141)))

(declare-fun res!453200 () Bool)

(assert (=> b!688499 (=> (not res!453200) (not e!392141))))

(assert (=> b!688499 (= res!453200 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688500 () Bool)

(declare-fun res!453205 () Bool)

(assert (=> b!688500 (=> (not res!453205) (not e!392135))))

(assert (=> b!688500 (= res!453205 (not (contains!3641 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688501 () Bool)

(declare-fun lt!315798 () Unit!24282)

(assert (=> b!688501 (= e!392133 lt!315798)))

(declare-fun lt!315792 () Unit!24282)

(declare-fun lemmaListSubSeqRefl!0 (List!13064) Unit!24282)

(assert (=> b!688501 (= lt!315792 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!227 (List!13064 List!13064) Bool)

(assert (=> b!688501 (subseq!227 acc!681 acc!681)))

(declare-datatypes ((array!39703 0))(
  ( (array!39704 (arr!19023 (Array (_ BitVec 32) (_ BitVec 64))) (size!19405 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39703)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39703 List!13064 List!13064 (_ BitVec 32)) Unit!24282)

(declare-fun $colon$colon!392 (List!13064 (_ BitVec 64)) List!13064)

(assert (=> b!688501 (= lt!315798 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!392 acc!681 (select (arr!19023 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39703 (_ BitVec 32) List!13064) Bool)

(assert (=> b!688501 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688502 () Bool)

(declare-fun res!453193 () Bool)

(assert (=> b!688502 (=> (not res!453193) (not e!392135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688502 (= res!453193 (validKeyInArray!0 k!2843))))

(declare-fun res!453203 () Bool)

(assert (=> start!61562 (=> (not res!453203) (not e!392135))))

(assert (=> start!61562 (= res!453203 (and (bvslt (size!19405 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19405 a!3626))))))

(assert (=> start!61562 e!392135))

(assert (=> start!61562 true))

(declare-fun array_inv!14819 (array!39703) Bool)

(assert (=> start!61562 (array_inv!14819 a!3626)))

(declare-fun b!688503 () Bool)

(declare-fun res!453207 () Bool)

(assert (=> b!688503 (=> (not res!453207) (not e!392135))))

(assert (=> b!688503 (= res!453207 (not (contains!3641 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688504 () Bool)

(declare-fun e!392140 () Bool)

(assert (=> b!688504 (= e!392135 (not e!392140))))

(declare-fun res!453189 () Bool)

(assert (=> b!688504 (=> res!453189 e!392140)))

(assert (=> b!688504 (= res!453189 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688504 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315799)))

(declare-fun lt!315794 () Unit!24282)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39703 (_ BitVec 64) (_ BitVec 32) List!13064 List!13064) Unit!24282)

(assert (=> b!688504 (= lt!315794 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315799))))

(declare-fun -!192 (List!13064 (_ BitVec 64)) List!13064)

(assert (=> b!688504 (= (-!192 lt!315799 k!2843) acc!681)))

(assert (=> b!688504 (= lt!315799 ($colon$colon!392 acc!681 k!2843))))

(declare-fun lt!315797 () Unit!24282)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13064) Unit!24282)

(assert (=> b!688504 (= lt!315797 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!688504 (subseq!227 acc!681 acc!681)))

(declare-fun lt!315795 () Unit!24282)

(assert (=> b!688504 (= lt!315795 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688504 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315790 () Unit!24282)

(assert (=> b!688504 (= lt!315790 e!392133)))

(declare-fun c!78019 () Bool)

(assert (=> b!688504 (= c!78019 (validKeyInArray!0 (select (arr!19023 a!3626) from!3004)))))

(declare-fun lt!315796 () Unit!24282)

(declare-fun e!392132 () Unit!24282)

(assert (=> b!688504 (= lt!315796 e!392132)))

(declare-fun c!78020 () Bool)

(declare-fun arrayContainsKey!0 (array!39703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688504 (= c!78020 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688504 (arrayContainsKey!0 (array!39704 (store (arr!19023 a!3626) i!1382 k!2843) (size!19405 a!3626)) k!2843 from!3004)))

(declare-fun b!688505 () Bool)

(declare-fun res!453197 () Bool)

(assert (=> b!688505 (=> (not res!453197) (not e!392135))))

(assert (=> b!688505 (= res!453197 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13061))))

(declare-fun b!688506 () Bool)

(declare-fun res!453206 () Bool)

(assert (=> b!688506 (=> res!453206 e!392140)))

(assert (=> b!688506 (= res!453206 (contains!3641 lt!315799 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688507 () Bool)

(declare-fun Unit!24285 () Unit!24282)

(assert (=> b!688507 (= e!392132 Unit!24285)))

(declare-fun b!688508 () Bool)

(declare-fun res!453196 () Bool)

(assert (=> b!688508 (=> (not res!453196) (not e!392135))))

(assert (=> b!688508 (= res!453196 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688509 () Bool)

(declare-fun res!453190 () Bool)

(assert (=> b!688509 (=> (not res!453190) (not e!392135))))

(assert (=> b!688509 (= res!453190 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19405 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688510 () Bool)

(assert (=> b!688510 (= e!392140 true)))

(declare-fun lt!315793 () Bool)

(assert (=> b!688510 (= lt!315793 e!392137)))

(declare-fun res!453202 () Bool)

(assert (=> b!688510 (=> res!453202 e!392137)))

(declare-fun e!392134 () Bool)

(assert (=> b!688510 (= res!453202 e!392134)))

(declare-fun res!453194 () Bool)

(assert (=> b!688510 (=> (not res!453194) (not e!392134))))

(assert (=> b!688510 (= res!453194 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688511 () Bool)

(assert (=> b!688511 (= e!392134 (contains!3641 lt!315799 k!2843))))

(declare-fun b!688512 () Bool)

(declare-fun res!453201 () Bool)

(assert (=> b!688512 (=> (not res!453201) (not e!392135))))

(assert (=> b!688512 (= res!453201 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19405 a!3626))))))

(declare-fun b!688513 () Bool)

(declare-fun res!453192 () Bool)

(assert (=> b!688513 (=> (not res!453192) (not e!392135))))

(assert (=> b!688513 (= res!453192 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688514 () Bool)

(declare-fun Unit!24286 () Unit!24282)

(assert (=> b!688514 (= e!392132 Unit!24286)))

(declare-fun lt!315791 () Unit!24282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39703 (_ BitVec 64) (_ BitVec 32)) Unit!24282)

(assert (=> b!688514 (= lt!315791 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688514 false))

(declare-fun b!688515 () Bool)

(assert (=> b!688515 (= e!392142 (not (contains!3641 acc!681 k!2843)))))

(declare-fun b!688516 () Bool)

(declare-fun res!453208 () Bool)

(assert (=> b!688516 (=> res!453208 e!392140)))

(assert (=> b!688516 (= res!453208 (contains!3641 lt!315799 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688517 () Bool)

(declare-fun res!453191 () Bool)

(assert (=> b!688517 (=> res!453191 e!392140)))

(assert (=> b!688517 (= res!453191 (not (noDuplicate!888 lt!315799)))))

(assert (= (and start!61562 res!453203) b!688498))

(assert (= (and b!688498 res!453195) b!688503))

(assert (= (and b!688503 res!453207) b!688500))

(assert (= (and b!688500 res!453205) b!688493))

(assert (= (and b!688493 res!453198) b!688497))

(assert (= (and b!688493 (not res!453209)) b!688494))

(assert (= (and b!688494 res!453204) b!688515))

(assert (= (and b!688493 res!453199) b!688505))

(assert (= (and b!688505 res!453197) b!688508))

(assert (= (and b!688508 res!453196) b!688512))

(assert (= (and b!688512 res!453201) b!688502))

(assert (= (and b!688502 res!453193) b!688513))

(assert (= (and b!688513 res!453192) b!688509))

(assert (= (and b!688509 res!453190) b!688504))

(assert (= (and b!688504 c!78020) b!688514))

(assert (= (and b!688504 (not c!78020)) b!688507))

(assert (= (and b!688504 c!78019) b!688501))

(assert (= (and b!688504 (not c!78019)) b!688495))

(assert (= (and b!688504 (not res!453189)) b!688517))

(assert (= (and b!688517 (not res!453191)) b!688516))

(assert (= (and b!688516 (not res!453208)) b!688506))

(assert (= (and b!688506 (not res!453206)) b!688510))

(assert (= (and b!688510 res!453194) b!688511))

(assert (= (and b!688510 (not res!453202)) b!688499))

(assert (= (and b!688499 res!453200) b!688496))

(declare-fun m!652373 () Bool)

(assert (=> b!688508 m!652373))

(declare-fun m!652375 () Bool)

(assert (=> b!688511 m!652375))

(declare-fun m!652377 () Bool)

(assert (=> b!688502 m!652377))

(declare-fun m!652379 () Bool)

(assert (=> b!688503 m!652379))

(declare-fun m!652381 () Bool)

(assert (=> b!688514 m!652381))

(declare-fun m!652383 () Bool)

(assert (=> b!688513 m!652383))

(declare-fun m!652385 () Bool)

(assert (=> b!688497 m!652385))

(assert (=> b!688515 m!652385))

(declare-fun m!652387 () Bool)

(assert (=> b!688516 m!652387))

(declare-fun m!652389 () Bool)

(assert (=> b!688500 m!652389))

(assert (=> b!688496 m!652375))

(declare-fun m!652391 () Bool)

(assert (=> start!61562 m!652391))

(declare-fun m!652393 () Bool)

(assert (=> b!688501 m!652393))

(declare-fun m!652395 () Bool)

(assert (=> b!688501 m!652395))

(declare-fun m!652397 () Bool)

(assert (=> b!688501 m!652397))

(declare-fun m!652399 () Bool)

(assert (=> b!688501 m!652399))

(assert (=> b!688501 m!652395))

(assert (=> b!688501 m!652397))

(declare-fun m!652401 () Bool)

(assert (=> b!688501 m!652401))

(declare-fun m!652403 () Bool)

(assert (=> b!688501 m!652403))

(declare-fun m!652405 () Bool)

(assert (=> b!688498 m!652405))

(declare-fun m!652407 () Bool)

(assert (=> b!688504 m!652407))

(assert (=> b!688504 m!652393))

(assert (=> b!688504 m!652395))

(declare-fun m!652409 () Bool)

(assert (=> b!688504 m!652409))

(declare-fun m!652411 () Bool)

(assert (=> b!688504 m!652411))

(declare-fun m!652413 () Bool)

(assert (=> b!688504 m!652413))

(declare-fun m!652415 () Bool)

(assert (=> b!688504 m!652415))

(assert (=> b!688504 m!652401))

(declare-fun m!652417 () Bool)

(assert (=> b!688504 m!652417))

(declare-fun m!652419 () Bool)

(assert (=> b!688504 m!652419))

(assert (=> b!688504 m!652395))

(declare-fun m!652421 () Bool)

(assert (=> b!688504 m!652421))

(declare-fun m!652423 () Bool)

(assert (=> b!688504 m!652423))

(assert (=> b!688504 m!652403))

(declare-fun m!652425 () Bool)

(assert (=> b!688505 m!652425))

(declare-fun m!652427 () Bool)

(assert (=> b!688517 m!652427))

(declare-fun m!652429 () Bool)

(assert (=> b!688506 m!652429))

(push 1)

(assert (not b!688505))

(assert (not b!688497))

(assert (not b!688501))

(assert (not b!688511))

(assert (not b!688514))

(assert (not b!688498))

(assert (not b!688496))

(assert (not b!688504))

(assert (not b!688506))

(assert (not b!688517))

(assert (not start!61562))

(assert (not b!688513))

(assert (not b!688515))

(assert (not b!688516))

(assert (not b!688508))

(assert (not b!688500))

(assert (not b!688502))

(assert (not b!688503))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

