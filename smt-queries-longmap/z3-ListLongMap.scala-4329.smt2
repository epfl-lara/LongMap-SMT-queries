; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60004 () Bool)

(assert start!60004)

(declare-fun b!666728 () Bool)

(declare-fun res!434065 () Bool)

(declare-fun e!381771 () Bool)

(assert (=> b!666728 (=> (not res!434065) (not e!381771))))

(declare-datatypes ((array!39051 0))(
  ( (array!39052 (arr!18718 (Array (_ BitVec 32) (_ BitVec 64))) (size!19082 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39051)

(declare-datatypes ((List!12759 0))(
  ( (Nil!12756) (Cons!12755 (h!13800 (_ BitVec 64)) (t!18987 List!12759)) )
))
(declare-fun acc!681 () List!12759)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39051 (_ BitVec 32) List!12759) Bool)

(assert (=> b!666728 (= res!434065 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666729 () Bool)

(declare-fun res!434066 () Bool)

(declare-fun e!381777 () Bool)

(assert (=> b!666729 (=> res!434066 e!381777)))

(declare-fun lt!310542 () List!12759)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3336 (List!12759 (_ BitVec 64)) Bool)

(assert (=> b!666729 (= res!434066 (not (contains!3336 lt!310542 k0!2843)))))

(declare-fun b!666730 () Bool)

(declare-fun res!434070 () Bool)

(assert (=> b!666730 (=> res!434070 e!381777)))

(declare-fun subseq!75 (List!12759 List!12759) Bool)

(assert (=> b!666730 (= res!434070 (not (subseq!75 acc!681 lt!310542)))))

(declare-fun b!666731 () Bool)

(assert (=> b!666731 (= e!381771 (not e!381777))))

(declare-fun res!434052 () Bool)

(assert (=> b!666731 (=> res!434052 e!381777)))

(assert (=> b!666731 (= res!434052 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!73 (List!12759 (_ BitVec 64)) List!12759)

(assert (=> b!666731 (= (-!73 lt!310542 k0!2843) acc!681)))

(declare-fun $colon$colon!207 (List!12759 (_ BitVec 64)) List!12759)

(assert (=> b!666731 (= lt!310542 ($colon$colon!207 acc!681 k0!2843))))

(declare-datatypes ((Unit!23315 0))(
  ( (Unit!23316) )
))
(declare-fun lt!310534 () Unit!23315)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12759) Unit!23315)

(assert (=> b!666731 (= lt!310534 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666731 (subseq!75 acc!681 acc!681)))

(declare-fun lt!310541 () Unit!23315)

(declare-fun lemmaListSubSeqRefl!0 (List!12759) Unit!23315)

(assert (=> b!666731 (= lt!310541 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666731 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310538 () Unit!23315)

(declare-fun e!381773 () Unit!23315)

(assert (=> b!666731 (= lt!310538 e!381773)))

(declare-fun c!76705 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666731 (= c!76705 (validKeyInArray!0 (select (arr!18718 a!3626) from!3004)))))

(declare-fun lt!310537 () Unit!23315)

(declare-fun e!381770 () Unit!23315)

(assert (=> b!666731 (= lt!310537 e!381770)))

(declare-fun c!76706 () Bool)

(declare-fun lt!310539 () Bool)

(assert (=> b!666731 (= c!76706 lt!310539)))

(declare-fun arrayContainsKey!0 (array!39051 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666731 (= lt!310539 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666731 (arrayContainsKey!0 (array!39052 (store (arr!18718 a!3626) i!1382 k0!2843) (size!19082 a!3626)) k0!2843 from!3004)))

(declare-fun b!666732 () Bool)

(declare-fun res!434068 () Bool)

(assert (=> b!666732 (=> res!434068 e!381777)))

(assert (=> b!666732 (= res!434068 (contains!3336 lt!310542 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666733 () Bool)

(declare-fun Unit!23317 () Unit!23315)

(assert (=> b!666733 (= e!381773 Unit!23317)))

(declare-fun b!666734 () Bool)

(declare-fun Unit!23318 () Unit!23315)

(assert (=> b!666734 (= e!381770 Unit!23318)))

(declare-fun lt!310540 () Unit!23315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39051 (_ BitVec 64) (_ BitVec 32)) Unit!23315)

(assert (=> b!666734 (= lt!310540 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666734 false))

(declare-fun b!666735 () Bool)

(declare-fun res!434063 () Bool)

(assert (=> b!666735 (=> res!434063 e!381777)))

(assert (=> b!666735 (= res!434063 lt!310539)))

(declare-fun res!434061 () Bool)

(assert (=> start!60004 (=> (not res!434061) (not e!381771))))

(assert (=> start!60004 (= res!434061 (and (bvslt (size!19082 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19082 a!3626))))))

(assert (=> start!60004 e!381771))

(assert (=> start!60004 true))

(declare-fun array_inv!14514 (array!39051) Bool)

(assert (=> start!60004 (array_inv!14514 a!3626)))

(declare-fun b!666736 () Bool)

(declare-fun e!381772 () Bool)

(assert (=> b!666736 (= e!381772 (not (contains!3336 acc!681 k0!2843)))))

(declare-fun b!666737 () Bool)

(declare-fun res!434069 () Bool)

(assert (=> b!666737 (=> (not res!434069) (not e!381771))))

(assert (=> b!666737 (= res!434069 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19082 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666738 () Bool)

(declare-fun res!434057 () Bool)

(assert (=> b!666738 (=> (not res!434057) (not e!381771))))

(assert (=> b!666738 (= res!434057 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19082 a!3626))))))

(declare-fun b!666739 () Bool)

(declare-fun res!434072 () Bool)

(assert (=> b!666739 (=> (not res!434072) (not e!381771))))

(assert (=> b!666739 (= res!434072 (not (contains!3336 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666740 () Bool)

(declare-fun res!434058 () Bool)

(assert (=> b!666740 (=> res!434058 e!381777)))

(assert (=> b!666740 (= res!434058 (contains!3336 acc!681 k0!2843))))

(declare-fun b!666741 () Bool)

(assert (=> b!666741 (= e!381777 true)))

(declare-fun lt!310543 () Bool)

(assert (=> b!666741 (= lt!310543 (contains!3336 lt!310542 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666742 () Bool)

(declare-fun res!434053 () Bool)

(assert (=> b!666742 (=> (not res!434053) (not e!381771))))

(assert (=> b!666742 (= res!434053 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666743 () Bool)

(declare-fun Unit!23319 () Unit!23315)

(assert (=> b!666743 (= e!381770 Unit!23319)))

(declare-fun b!666744 () Bool)

(declare-fun res!434055 () Bool)

(assert (=> b!666744 (=> (not res!434055) (not e!381771))))

(assert (=> b!666744 (= res!434055 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12756))))

(declare-fun b!666745 () Bool)

(declare-fun res!434064 () Bool)

(assert (=> b!666745 (=> (not res!434064) (not e!381771))))

(declare-fun e!381776 () Bool)

(assert (=> b!666745 (= res!434064 e!381776)))

(declare-fun res!434071 () Bool)

(assert (=> b!666745 (=> res!434071 e!381776)))

(declare-fun e!381775 () Bool)

(assert (=> b!666745 (= res!434071 e!381775)))

(declare-fun res!434067 () Bool)

(assert (=> b!666745 (=> (not res!434067) (not e!381775))))

(assert (=> b!666745 (= res!434067 (bvsgt from!3004 i!1382))))

(declare-fun b!666746 () Bool)

(declare-fun res!434060 () Bool)

(assert (=> b!666746 (=> res!434060 e!381777)))

(declare-fun noDuplicate!583 (List!12759) Bool)

(assert (=> b!666746 (= res!434060 (not (noDuplicate!583 lt!310542)))))

(declare-fun b!666747 () Bool)

(declare-fun res!434059 () Bool)

(assert (=> b!666747 (=> (not res!434059) (not e!381771))))

(assert (=> b!666747 (= res!434059 (noDuplicate!583 acc!681))))

(declare-fun b!666748 () Bool)

(declare-fun res!434056 () Bool)

(assert (=> b!666748 (=> (not res!434056) (not e!381771))))

(assert (=> b!666748 (= res!434056 (validKeyInArray!0 k0!2843))))

(declare-fun b!666749 () Bool)

(declare-fun res!434054 () Bool)

(assert (=> b!666749 (=> (not res!434054) (not e!381771))))

(assert (=> b!666749 (= res!434054 (not (contains!3336 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666750 () Bool)

(declare-fun lt!310536 () Unit!23315)

(assert (=> b!666750 (= e!381773 lt!310536)))

(declare-fun lt!310535 () Unit!23315)

(assert (=> b!666750 (= lt!310535 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666750 (subseq!75 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39051 List!12759 List!12759 (_ BitVec 32)) Unit!23315)

(assert (=> b!666750 (= lt!310536 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!207 acc!681 (select (arr!18718 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666750 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666751 () Bool)

(assert (=> b!666751 (= e!381775 (contains!3336 acc!681 k0!2843))))

(declare-fun b!666752 () Bool)

(assert (=> b!666752 (= e!381776 e!381772)))

(declare-fun res!434062 () Bool)

(assert (=> b!666752 (=> (not res!434062) (not e!381772))))

(assert (=> b!666752 (= res!434062 (bvsle from!3004 i!1382))))

(assert (= (and start!60004 res!434061) b!666747))

(assert (= (and b!666747 res!434059) b!666739))

(assert (= (and b!666739 res!434072) b!666749))

(assert (= (and b!666749 res!434054) b!666745))

(assert (= (and b!666745 res!434067) b!666751))

(assert (= (and b!666745 (not res!434071)) b!666752))

(assert (= (and b!666752 res!434062) b!666736))

(assert (= (and b!666745 res!434064) b!666744))

(assert (= (and b!666744 res!434055) b!666728))

(assert (= (and b!666728 res!434065) b!666738))

(assert (= (and b!666738 res!434057) b!666748))

(assert (= (and b!666748 res!434056) b!666742))

(assert (= (and b!666742 res!434053) b!666737))

(assert (= (and b!666737 res!434069) b!666731))

(assert (= (and b!666731 c!76706) b!666734))

(assert (= (and b!666731 (not c!76706)) b!666743))

(assert (= (and b!666731 c!76705) b!666750))

(assert (= (and b!666731 (not c!76705)) b!666733))

(assert (= (and b!666731 (not res!434052)) b!666746))

(assert (= (and b!666746 (not res!434060)) b!666735))

(assert (= (and b!666735 (not res!434063)) b!666740))

(assert (= (and b!666740 (not res!434058)) b!666730))

(assert (= (and b!666730 (not res!434070)) b!666729))

(assert (= (and b!666729 (not res!434066)) b!666732))

(assert (= (and b!666732 (not res!434068)) b!666741))

(declare-fun m!637453 () Bool)

(assert (=> b!666739 m!637453))

(declare-fun m!637455 () Bool)

(assert (=> b!666734 m!637455))

(declare-fun m!637457 () Bool)

(assert (=> b!666728 m!637457))

(declare-fun m!637459 () Bool)

(assert (=> b!666741 m!637459))

(declare-fun m!637461 () Bool)

(assert (=> b!666746 m!637461))

(declare-fun m!637463 () Bool)

(assert (=> b!666742 m!637463))

(declare-fun m!637465 () Bool)

(assert (=> b!666747 m!637465))

(declare-fun m!637467 () Bool)

(assert (=> start!60004 m!637467))

(declare-fun m!637469 () Bool)

(assert (=> b!666731 m!637469))

(declare-fun m!637471 () Bool)

(assert (=> b!666731 m!637471))

(declare-fun m!637473 () Bool)

(assert (=> b!666731 m!637473))

(declare-fun m!637475 () Bool)

(assert (=> b!666731 m!637475))

(declare-fun m!637477 () Bool)

(assert (=> b!666731 m!637477))

(declare-fun m!637479 () Bool)

(assert (=> b!666731 m!637479))

(assert (=> b!666731 m!637469))

(declare-fun m!637481 () Bool)

(assert (=> b!666731 m!637481))

(declare-fun m!637483 () Bool)

(assert (=> b!666731 m!637483))

(declare-fun m!637485 () Bool)

(assert (=> b!666731 m!637485))

(declare-fun m!637487 () Bool)

(assert (=> b!666731 m!637487))

(declare-fun m!637489 () Bool)

(assert (=> b!666731 m!637489))

(declare-fun m!637491 () Bool)

(assert (=> b!666749 m!637491))

(declare-fun m!637493 () Bool)

(assert (=> b!666751 m!637493))

(declare-fun m!637495 () Bool)

(assert (=> b!666744 m!637495))

(declare-fun m!637497 () Bool)

(assert (=> b!666729 m!637497))

(declare-fun m!637499 () Bool)

(assert (=> b!666748 m!637499))

(declare-fun m!637501 () Bool)

(assert (=> b!666732 m!637501))

(declare-fun m!637503 () Bool)

(assert (=> b!666730 m!637503))

(assert (=> b!666736 m!637493))

(assert (=> b!666750 m!637483))

(assert (=> b!666750 m!637469))

(declare-fun m!637505 () Bool)

(assert (=> b!666750 m!637505))

(declare-fun m!637507 () Bool)

(assert (=> b!666750 m!637507))

(assert (=> b!666750 m!637469))

(assert (=> b!666750 m!637505))

(assert (=> b!666750 m!637475))

(assert (=> b!666750 m!637489))

(assert (=> b!666740 m!637493))

(check-sat (not b!666750) (not b!666736) (not b!666728) (not b!666748) (not b!666729) (not b!666744) (not b!666747) (not b!666741) (not b!666742) (not b!666749) (not b!666751) (not b!666731) (not b!666746) (not b!666734) (not b!666730) (not start!60004) (not b!666739) (not b!666740) (not b!666732))
(check-sat)
