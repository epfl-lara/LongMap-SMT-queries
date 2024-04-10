; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59944 () Bool)

(assert start!59944)

(declare-fun b!664478 () Bool)

(declare-fun e!381054 () Bool)

(declare-fun e!381050 () Bool)

(assert (=> b!664478 (= e!381054 (not e!381050))))

(declare-fun res!432168 () Bool)

(assert (=> b!664478 (=> res!432168 e!381050)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664478 (= res!432168 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12729 0))(
  ( (Nil!12726) (Cons!12725 (h!13770 (_ BitVec 64)) (t!18957 List!12729)) )
))
(declare-fun lt!309635 () List!12729)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12729)

(declare-fun -!43 (List!12729 (_ BitVec 64)) List!12729)

(assert (=> b!664478 (= (-!43 lt!309635 k0!2843) acc!681)))

(declare-fun $colon$colon!177 (List!12729 (_ BitVec 64)) List!12729)

(assert (=> b!664478 (= lt!309635 ($colon$colon!177 acc!681 k0!2843))))

(declare-datatypes ((Unit!23165 0))(
  ( (Unit!23166) )
))
(declare-fun lt!309641 () Unit!23165)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12729) Unit!23165)

(assert (=> b!664478 (= lt!309641 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!45 (List!12729 List!12729) Bool)

(assert (=> b!664478 (subseq!45 acc!681 acc!681)))

(declare-fun lt!309640 () Unit!23165)

(declare-fun lemmaListSubSeqRefl!0 (List!12729) Unit!23165)

(assert (=> b!664478 (= lt!309640 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!38991 0))(
  ( (array!38992 (arr!18688 (Array (_ BitVec 32) (_ BitVec 64))) (size!19052 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38991)

(declare-fun arrayNoDuplicates!0 (array!38991 (_ BitVec 32) List!12729) Bool)

(assert (=> b!664478 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309639 () Unit!23165)

(declare-fun e!381056 () Unit!23165)

(assert (=> b!664478 (= lt!309639 e!381056)))

(declare-fun c!76525 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664478 (= c!76525 (validKeyInArray!0 (select (arr!18688 a!3626) from!3004)))))

(declare-fun lt!309642 () Unit!23165)

(declare-fun e!381057 () Unit!23165)

(assert (=> b!664478 (= lt!309642 e!381057)))

(declare-fun c!76526 () Bool)

(declare-fun lt!309634 () Bool)

(assert (=> b!664478 (= c!76526 lt!309634)))

(declare-fun arrayContainsKey!0 (array!38991 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664478 (= lt!309634 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664478 (arrayContainsKey!0 (array!38992 (store (arr!18688 a!3626) i!1382 k0!2843) (size!19052 a!3626)) k0!2843 from!3004)))

(declare-fun b!664479 () Bool)

(declare-fun res!432164 () Bool)

(assert (=> b!664479 (=> (not res!432164) (not e!381054))))

(assert (=> b!664479 (= res!432164 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19052 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664480 () Bool)

(declare-fun res!432182 () Bool)

(assert (=> b!664480 (=> (not res!432182) (not e!381054))))

(assert (=> b!664480 (= res!432182 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664481 () Bool)

(declare-fun lt!309637 () Unit!23165)

(assert (=> b!664481 (= e!381056 lt!309637)))

(declare-fun lt!309636 () Unit!23165)

(assert (=> b!664481 (= lt!309636 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664481 (subseq!45 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38991 List!12729 List!12729 (_ BitVec 32)) Unit!23165)

(assert (=> b!664481 (= lt!309637 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!177 acc!681 (select (arr!18688 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664481 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664482 () Bool)

(declare-fun e!381055 () Bool)

(declare-fun contains!3306 (List!12729 (_ BitVec 64)) Bool)

(assert (=> b!664482 (= e!381055 (not (contains!3306 acc!681 k0!2843)))))

(declare-fun b!664483 () Bool)

(declare-fun Unit!23167 () Unit!23165)

(assert (=> b!664483 (= e!381057 Unit!23167)))

(declare-fun b!664484 () Bool)

(declare-fun res!432181 () Bool)

(assert (=> b!664484 (=> (not res!432181) (not e!381054))))

(assert (=> b!664484 (= res!432181 (not (contains!3306 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664485 () Bool)

(declare-fun res!432176 () Bool)

(assert (=> b!664485 (=> (not res!432176) (not e!381054))))

(declare-fun noDuplicate!553 (List!12729) Bool)

(assert (=> b!664485 (= res!432176 (noDuplicate!553 acc!681))))

(declare-fun b!664486 () Bool)

(declare-fun Unit!23168 () Unit!23165)

(assert (=> b!664486 (= e!381056 Unit!23168)))

(declare-fun b!664487 () Bool)

(declare-fun res!432178 () Bool)

(assert (=> b!664487 (=> (not res!432178) (not e!381054))))

(assert (=> b!664487 (= res!432178 (not (contains!3306 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664488 () Bool)

(declare-fun e!381053 () Bool)

(assert (=> b!664488 (= e!381053 (contains!3306 acc!681 k0!2843))))

(declare-fun b!664489 () Bool)

(declare-fun res!432166 () Bool)

(assert (=> b!664489 (=> res!432166 e!381050)))

(assert (=> b!664489 (= res!432166 (not (contains!3306 lt!309635 k0!2843)))))

(declare-fun b!664491 () Bool)

(declare-fun res!432180 () Bool)

(assert (=> b!664491 (=> (not res!432180) (not e!381054))))

(assert (=> b!664491 (= res!432180 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12726))))

(declare-fun b!664492 () Bool)

(declare-fun res!432177 () Bool)

(assert (=> b!664492 (=> res!432177 e!381050)))

(assert (=> b!664492 (= res!432177 (not (subseq!45 acc!681 lt!309635)))))

(declare-fun b!664493 () Bool)

(declare-fun res!432172 () Bool)

(assert (=> b!664493 (=> (not res!432172) (not e!381054))))

(assert (=> b!664493 (= res!432172 (validKeyInArray!0 k0!2843))))

(declare-fun b!664494 () Bool)

(declare-fun res!432175 () Bool)

(assert (=> b!664494 (=> res!432175 e!381050)))

(assert (=> b!664494 (= res!432175 lt!309634)))

(declare-fun b!664495 () Bool)

(declare-fun res!432171 () Bool)

(assert (=> b!664495 (=> res!432171 e!381050)))

(assert (=> b!664495 (= res!432171 (contains!3306 acc!681 k0!2843))))

(declare-fun b!664496 () Bool)

(assert (=> b!664496 (= e!381050 true)))

(declare-fun lt!309643 () Bool)

(assert (=> b!664496 (= lt!309643 (contains!3306 lt!309635 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664497 () Bool)

(declare-fun res!432179 () Bool)

(assert (=> b!664497 (=> (not res!432179) (not e!381054))))

(declare-fun e!381052 () Bool)

(assert (=> b!664497 (= res!432179 e!381052)))

(declare-fun res!432165 () Bool)

(assert (=> b!664497 (=> res!432165 e!381052)))

(assert (=> b!664497 (= res!432165 e!381053)))

(declare-fun res!432162 () Bool)

(assert (=> b!664497 (=> (not res!432162) (not e!381053))))

(assert (=> b!664497 (= res!432162 (bvsgt from!3004 i!1382))))

(declare-fun b!664498 () Bool)

(declare-fun res!432170 () Bool)

(assert (=> b!664498 (=> res!432170 e!381050)))

(assert (=> b!664498 (= res!432170 (contains!3306 lt!309635 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664499 () Bool)

(assert (=> b!664499 (= e!381052 e!381055)))

(declare-fun res!432174 () Bool)

(assert (=> b!664499 (=> (not res!432174) (not e!381055))))

(assert (=> b!664499 (= res!432174 (bvsle from!3004 i!1382))))

(declare-fun b!664500 () Bool)

(declare-fun Unit!23169 () Unit!23165)

(assert (=> b!664500 (= e!381057 Unit!23169)))

(declare-fun lt!309638 () Unit!23165)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38991 (_ BitVec 64) (_ BitVec 32)) Unit!23165)

(assert (=> b!664500 (= lt!309638 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664500 false))

(declare-fun b!664501 () Bool)

(declare-fun res!432169 () Bool)

(assert (=> b!664501 (=> res!432169 e!381050)))

(assert (=> b!664501 (= res!432169 (not (noDuplicate!553 lt!309635)))))

(declare-fun b!664502 () Bool)

(declare-fun res!432163 () Bool)

(assert (=> b!664502 (=> (not res!432163) (not e!381054))))

(assert (=> b!664502 (= res!432163 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!432167 () Bool)

(assert (=> start!59944 (=> (not res!432167) (not e!381054))))

(assert (=> start!59944 (= res!432167 (and (bvslt (size!19052 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19052 a!3626))))))

(assert (=> start!59944 e!381054))

(assert (=> start!59944 true))

(declare-fun array_inv!14484 (array!38991) Bool)

(assert (=> start!59944 (array_inv!14484 a!3626)))

(declare-fun b!664490 () Bool)

(declare-fun res!432173 () Bool)

(assert (=> b!664490 (=> (not res!432173) (not e!381054))))

(assert (=> b!664490 (= res!432173 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19052 a!3626))))))

(assert (= (and start!59944 res!432167) b!664485))

(assert (= (and b!664485 res!432176) b!664484))

(assert (= (and b!664484 res!432181) b!664487))

(assert (= (and b!664487 res!432178) b!664497))

(assert (= (and b!664497 res!432162) b!664488))

(assert (= (and b!664497 (not res!432165)) b!664499))

(assert (= (and b!664499 res!432174) b!664482))

(assert (= (and b!664497 res!432179) b!664491))

(assert (= (and b!664491 res!432180) b!664502))

(assert (= (and b!664502 res!432163) b!664490))

(assert (= (and b!664490 res!432173) b!664493))

(assert (= (and b!664493 res!432172) b!664480))

(assert (= (and b!664480 res!432182) b!664479))

(assert (= (and b!664479 res!432164) b!664478))

(assert (= (and b!664478 c!76526) b!664500))

(assert (= (and b!664478 (not c!76526)) b!664483))

(assert (= (and b!664478 c!76525) b!664481))

(assert (= (and b!664478 (not c!76525)) b!664486))

(assert (= (and b!664478 (not res!432168)) b!664501))

(assert (= (and b!664501 (not res!432169)) b!664494))

(assert (= (and b!664494 (not res!432175)) b!664495))

(assert (= (and b!664495 (not res!432171)) b!664492))

(assert (= (and b!664492 (not res!432177)) b!664489))

(assert (= (and b!664489 (not res!432166)) b!664498))

(assert (= (and b!664498 (not res!432170)) b!664496))

(declare-fun m!635773 () Bool)

(assert (=> b!664487 m!635773))

(declare-fun m!635775 () Bool)

(assert (=> b!664478 m!635775))

(declare-fun m!635777 () Bool)

(assert (=> b!664478 m!635777))

(declare-fun m!635779 () Bool)

(assert (=> b!664478 m!635779))

(declare-fun m!635781 () Bool)

(assert (=> b!664478 m!635781))

(declare-fun m!635783 () Bool)

(assert (=> b!664478 m!635783))

(declare-fun m!635785 () Bool)

(assert (=> b!664478 m!635785))

(declare-fun m!635787 () Bool)

(assert (=> b!664478 m!635787))

(declare-fun m!635789 () Bool)

(assert (=> b!664478 m!635789))

(assert (=> b!664478 m!635777))

(declare-fun m!635791 () Bool)

(assert (=> b!664478 m!635791))

(declare-fun m!635793 () Bool)

(assert (=> b!664478 m!635793))

(declare-fun m!635795 () Bool)

(assert (=> b!664478 m!635795))

(declare-fun m!635797 () Bool)

(assert (=> b!664496 m!635797))

(declare-fun m!635799 () Bool)

(assert (=> b!664491 m!635799))

(declare-fun m!635801 () Bool)

(assert (=> b!664493 m!635801))

(declare-fun m!635803 () Bool)

(assert (=> b!664498 m!635803))

(declare-fun m!635805 () Bool)

(assert (=> b!664480 m!635805))

(declare-fun m!635807 () Bool)

(assert (=> b!664500 m!635807))

(declare-fun m!635809 () Bool)

(assert (=> b!664492 m!635809))

(declare-fun m!635811 () Bool)

(assert (=> start!59944 m!635811))

(declare-fun m!635813 () Bool)

(assert (=> b!664482 m!635813))

(assert (=> b!664495 m!635813))

(assert (=> b!664488 m!635813))

(assert (=> b!664481 m!635775))

(assert (=> b!664481 m!635777))

(declare-fun m!635815 () Bool)

(assert (=> b!664481 m!635815))

(declare-fun m!635817 () Bool)

(assert (=> b!664481 m!635817))

(assert (=> b!664481 m!635777))

(assert (=> b!664481 m!635815))

(assert (=> b!664481 m!635785))

(assert (=> b!664481 m!635795))

(declare-fun m!635819 () Bool)

(assert (=> b!664501 m!635819))

(declare-fun m!635821 () Bool)

(assert (=> b!664484 m!635821))

(declare-fun m!635823 () Bool)

(assert (=> b!664502 m!635823))

(declare-fun m!635825 () Bool)

(assert (=> b!664489 m!635825))

(declare-fun m!635827 () Bool)

(assert (=> b!664485 m!635827))

(check-sat (not b!664482) (not b!664500) (not b!664478) (not b!664495) (not b!664491) (not b!664492) (not b!664501) (not b!664485) (not b!664496) (not b!664489) (not b!664498) (not b!664488) (not b!664480) (not b!664487) (not b!664481) (not b!664484) (not b!664502) (not b!664493) (not start!59944))
(check-sat)
