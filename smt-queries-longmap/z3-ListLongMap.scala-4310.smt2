; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59876 () Bool)

(assert start!59876)

(declare-fun b!662472 () Bool)

(declare-fun res!430605 () Bool)

(declare-fun e!380237 () Bool)

(assert (=> b!662472 (=> (not res!430605) (not e!380237))))

(declare-datatypes ((array!38934 0))(
  ( (array!38935 (arr!18659 (Array (_ BitVec 32) (_ BitVec 64))) (size!19024 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38934)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12739 0))(
  ( (Nil!12736) (Cons!12735 (h!13780 (_ BitVec 64)) (t!18958 List!12739)) )
))
(declare-fun acc!681 () List!12739)

(declare-fun arrayNoDuplicates!0 (array!38934 (_ BitVec 32) List!12739) Bool)

(assert (=> b!662472 (= res!430605 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662473 () Bool)

(declare-fun e!380236 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3261 (List!12739 (_ BitVec 64)) Bool)

(assert (=> b!662473 (= e!380236 (contains!3261 acc!681 k0!2843))))

(declare-fun b!662474 () Bool)

(declare-fun res!430612 () Bool)

(assert (=> b!662474 (=> (not res!430612) (not e!380237))))

(declare-fun noDuplicate!530 (List!12739) Bool)

(assert (=> b!662474 (= res!430612 (noDuplicate!530 acc!681))))

(declare-fun b!662475 () Bool)

(declare-fun res!430619 () Bool)

(assert (=> b!662475 (=> (not res!430619) (not e!380237))))

(assert (=> b!662475 (= res!430619 (not (contains!3261 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662476 () Bool)

(declare-fun res!430621 () Bool)

(declare-fun e!380234 () Bool)

(assert (=> b!662476 (=> res!430621 e!380234)))

(declare-fun lt!308845 () List!12739)

(assert (=> b!662476 (= res!430621 (not (noDuplicate!530 lt!308845)))))

(declare-fun b!662477 () Bool)

(declare-fun res!430613 () Bool)

(assert (=> b!662477 (=> (not res!430613) (not e!380237))))

(declare-fun arrayContainsKey!0 (array!38934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662477 (= res!430613 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662478 () Bool)

(declare-fun e!380240 () Bool)

(assert (=> b!662478 (= e!380240 e!380234)))

(declare-fun res!430602 () Bool)

(assert (=> b!662478 (=> res!430602 e!380234)))

(assert (=> b!662478 (= res!430602 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!148 (List!12739 (_ BitVec 64)) List!12739)

(assert (=> b!662478 (= lt!308845 ($colon$colon!148 acc!681 (select (arr!18659 a!3626) from!3004)))))

(declare-fun subseq!17 (List!12739 List!12739) Bool)

(assert (=> b!662478 (subseq!17 acc!681 acc!681)))

(declare-datatypes ((Unit!23012 0))(
  ( (Unit!23013) )
))
(declare-fun lt!308849 () Unit!23012)

(declare-fun lemmaListSubSeqRefl!0 (List!12739) Unit!23012)

(assert (=> b!662478 (= lt!308849 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662479 () Bool)

(declare-fun res!430607 () Bool)

(assert (=> b!662479 (=> res!430607 e!380234)))

(assert (=> b!662479 (= res!430607 (contains!3261 lt!308845 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662480 () Bool)

(declare-fun e!380239 () Bool)

(declare-fun e!380235 () Bool)

(assert (=> b!662480 (= e!380239 e!380235)))

(declare-fun res!430617 () Bool)

(assert (=> b!662480 (=> (not res!430617) (not e!380235))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662480 (= res!430617 (bvsle from!3004 i!1382))))

(declare-fun b!662481 () Bool)

(declare-fun res!430606 () Bool)

(assert (=> b!662481 (=> res!430606 e!380234)))

(assert (=> b!662481 (= res!430606 (contains!3261 lt!308845 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662482 () Bool)

(declare-fun res!430616 () Bool)

(assert (=> b!662482 (=> (not res!430616) (not e!380237))))

(assert (=> b!662482 (= res!430616 e!380239)))

(declare-fun res!430620 () Bool)

(assert (=> b!662482 (=> res!430620 e!380239)))

(assert (=> b!662482 (= res!430620 e!380236)))

(declare-fun res!430608 () Bool)

(assert (=> b!662482 (=> (not res!430608) (not e!380236))))

(assert (=> b!662482 (= res!430608 (bvsgt from!3004 i!1382))))

(declare-fun b!662483 () Bool)

(declare-fun e!380233 () Unit!23012)

(declare-fun Unit!23014 () Unit!23012)

(assert (=> b!662483 (= e!380233 Unit!23014)))

(declare-fun b!662484 () Bool)

(assert (=> b!662484 (= e!380235 (not (contains!3261 acc!681 k0!2843)))))

(declare-fun res!430611 () Bool)

(assert (=> start!59876 (=> (not res!430611) (not e!380237))))

(assert (=> start!59876 (= res!430611 (and (bvslt (size!19024 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19024 a!3626))))))

(assert (=> start!59876 e!380237))

(assert (=> start!59876 true))

(declare-fun array_inv!14542 (array!38934) Bool)

(assert (=> start!59876 (array_inv!14542 a!3626)))

(declare-fun b!662485 () Bool)

(assert (=> b!662485 (= e!380234 true)))

(declare-fun lt!308848 () Bool)

(assert (=> b!662485 (= lt!308848 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308845))))

(declare-fun lt!308850 () Unit!23012)

(declare-fun noDuplicateSubseq!17 (List!12739 List!12739) Unit!23012)

(assert (=> b!662485 (= lt!308850 (noDuplicateSubseq!17 acc!681 lt!308845))))

(declare-fun b!662486 () Bool)

(declare-fun res!430609 () Bool)

(assert (=> b!662486 (=> (not res!430609) (not e!380237))))

(assert (=> b!662486 (= res!430609 (not (contains!3261 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662487 () Bool)

(declare-fun res!430604 () Bool)

(assert (=> b!662487 (=> (not res!430604) (not e!380237))))

(assert (=> b!662487 (= res!430604 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19024 a!3626))))))

(declare-fun b!662488 () Bool)

(assert (=> b!662488 (= e!380237 (not e!380240))))

(declare-fun res!430618 () Bool)

(assert (=> b!662488 (=> res!430618 e!380240)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662488 (= res!430618 (not (validKeyInArray!0 (select (arr!18659 a!3626) from!3004))))))

(declare-fun lt!308847 () Unit!23012)

(assert (=> b!662488 (= lt!308847 e!380233)))

(declare-fun c!76302 () Bool)

(assert (=> b!662488 (= c!76302 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662488 (arrayContainsKey!0 (array!38935 (store (arr!18659 a!3626) i!1382 k0!2843) (size!19024 a!3626)) k0!2843 from!3004)))

(declare-fun b!662489 () Bool)

(declare-fun res!430615 () Bool)

(assert (=> b!662489 (=> res!430615 e!380234)))

(assert (=> b!662489 (= res!430615 (not (subseq!17 acc!681 lt!308845)))))

(declare-fun b!662490 () Bool)

(declare-fun res!430603 () Bool)

(assert (=> b!662490 (=> (not res!430603) (not e!380237))))

(assert (=> b!662490 (= res!430603 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12736))))

(declare-fun b!662491 () Bool)

(declare-fun res!430610 () Bool)

(assert (=> b!662491 (=> (not res!430610) (not e!380237))))

(assert (=> b!662491 (= res!430610 (validKeyInArray!0 k0!2843))))

(declare-fun b!662492 () Bool)

(declare-fun res!430614 () Bool)

(assert (=> b!662492 (=> (not res!430614) (not e!380237))))

(assert (=> b!662492 (= res!430614 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19024 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662493 () Bool)

(declare-fun Unit!23015 () Unit!23012)

(assert (=> b!662493 (= e!380233 Unit!23015)))

(declare-fun lt!308846 () Unit!23012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38934 (_ BitVec 64) (_ BitVec 32)) Unit!23012)

(assert (=> b!662493 (= lt!308846 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662493 false))

(assert (= (and start!59876 res!430611) b!662474))

(assert (= (and b!662474 res!430612) b!662475))

(assert (= (and b!662475 res!430619) b!662486))

(assert (= (and b!662486 res!430609) b!662482))

(assert (= (and b!662482 res!430608) b!662473))

(assert (= (and b!662482 (not res!430620)) b!662480))

(assert (= (and b!662480 res!430617) b!662484))

(assert (= (and b!662482 res!430616) b!662490))

(assert (= (and b!662490 res!430603) b!662472))

(assert (= (and b!662472 res!430605) b!662487))

(assert (= (and b!662487 res!430604) b!662491))

(assert (= (and b!662491 res!430610) b!662477))

(assert (= (and b!662477 res!430613) b!662492))

(assert (= (and b!662492 res!430614) b!662488))

(assert (= (and b!662488 c!76302) b!662493))

(assert (= (and b!662488 (not c!76302)) b!662483))

(assert (= (and b!662488 (not res!430618)) b!662478))

(assert (= (and b!662478 (not res!430602)) b!662476))

(assert (= (and b!662476 (not res!430621)) b!662479))

(assert (= (and b!662479 (not res!430607)) b!662481))

(assert (= (and b!662481 (not res!430606)) b!662489))

(assert (= (and b!662489 (not res!430615)) b!662485))

(declare-fun m!633735 () Bool)

(assert (=> b!662485 m!633735))

(declare-fun m!633737 () Bool)

(assert (=> b!662485 m!633737))

(declare-fun m!633739 () Bool)

(assert (=> b!662478 m!633739))

(assert (=> b!662478 m!633739))

(declare-fun m!633741 () Bool)

(assert (=> b!662478 m!633741))

(declare-fun m!633743 () Bool)

(assert (=> b!662478 m!633743))

(declare-fun m!633745 () Bool)

(assert (=> b!662478 m!633745))

(declare-fun m!633747 () Bool)

(assert (=> b!662472 m!633747))

(assert (=> b!662488 m!633739))

(declare-fun m!633749 () Bool)

(assert (=> b!662488 m!633749))

(declare-fun m!633751 () Bool)

(assert (=> b!662488 m!633751))

(assert (=> b!662488 m!633739))

(declare-fun m!633753 () Bool)

(assert (=> b!662488 m!633753))

(declare-fun m!633755 () Bool)

(assert (=> b!662488 m!633755))

(declare-fun m!633757 () Bool)

(assert (=> b!662473 m!633757))

(declare-fun m!633759 () Bool)

(assert (=> b!662481 m!633759))

(declare-fun m!633761 () Bool)

(assert (=> b!662475 m!633761))

(declare-fun m!633763 () Bool)

(assert (=> b!662493 m!633763))

(declare-fun m!633765 () Bool)

(assert (=> b!662477 m!633765))

(declare-fun m!633767 () Bool)

(assert (=> b!662490 m!633767))

(declare-fun m!633769 () Bool)

(assert (=> b!662474 m!633769))

(declare-fun m!633771 () Bool)

(assert (=> b!662489 m!633771))

(declare-fun m!633773 () Bool)

(assert (=> b!662491 m!633773))

(declare-fun m!633775 () Bool)

(assert (=> b!662486 m!633775))

(declare-fun m!633777 () Bool)

(assert (=> b!662479 m!633777))

(declare-fun m!633779 () Bool)

(assert (=> b!662476 m!633779))

(assert (=> b!662484 m!633757))

(declare-fun m!633781 () Bool)

(assert (=> start!59876 m!633781))

(check-sat (not b!662489) (not b!662484) (not b!662472) (not b!662488) (not b!662473) (not b!662479) (not b!662490) (not b!662485) (not b!662474) (not b!662486) (not b!662491) (not start!59876) (not b!662477) (not b!662493) (not b!662476) (not b!662475) (not b!662481) (not b!662478))
(check-sat)
