; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60918 () Bool)

(assert start!60918)

(declare-fun b!682631 () Bool)

(declare-datatypes ((Unit!23916 0))(
  ( (Unit!23917) )
))
(declare-fun e!388997 () Unit!23916)

(declare-fun Unit!23918 () Unit!23916)

(assert (=> b!682631 (= e!388997 Unit!23918)))

(declare-fun b!682632 () Bool)

(declare-fun res!448531 () Bool)

(declare-fun e!389001 () Bool)

(assert (=> b!682632 (=> (not res!448531) (not e!389001))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39540 0))(
  ( (array!39541 (arr!18949 (Array (_ BitVec 32) (_ BitVec 64))) (size!19313 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39540)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682632 (= res!448531 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19313 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682633 () Bool)

(declare-fun e!388998 () Bool)

(declare-datatypes ((List!12897 0))(
  ( (Nil!12894) (Cons!12893 (h!13941 (_ BitVec 64)) (t!19132 List!12897)) )
))
(declare-fun acc!681 () List!12897)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3549 (List!12897 (_ BitVec 64)) Bool)

(assert (=> b!682633 (= e!388998 (not (contains!3549 acc!681 k0!2843)))))

(declare-fun b!682634 () Bool)

(declare-fun res!448537 () Bool)

(assert (=> b!682634 (=> (not res!448537) (not e!389001))))

(declare-fun arrayNoDuplicates!0 (array!39540 (_ BitVec 32) List!12897) Bool)

(assert (=> b!682634 (= res!448537 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12894))))

(declare-fun b!682635 () Bool)

(declare-fun res!448533 () Bool)

(assert (=> b!682635 (=> (not res!448533) (not e!389001))))

(declare-fun noDuplicate!823 (List!12897) Bool)

(assert (=> b!682635 (= res!448533 (noDuplicate!823 acc!681))))

(declare-fun b!682636 () Bool)

(declare-fun res!448534 () Bool)

(assert (=> b!682636 (=> (not res!448534) (not e!389001))))

(assert (=> b!682636 (= res!448534 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19313 a!3626))))))

(declare-fun b!682637 () Bool)

(declare-fun e!389000 () Unit!23916)

(declare-fun Unit!23919 () Unit!23916)

(assert (=> b!682637 (= e!389000 Unit!23919)))

(declare-fun b!682639 () Bool)

(declare-fun e!388996 () Bool)

(assert (=> b!682639 (= e!388996 (contains!3549 acc!681 k0!2843))))

(declare-fun b!682640 () Bool)

(declare-fun res!448527 () Bool)

(assert (=> b!682640 (=> (not res!448527) (not e!389001))))

(assert (=> b!682640 (= res!448527 (not (contains!3549 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682641 () Bool)

(declare-fun res!448529 () Bool)

(assert (=> b!682641 (=> (not res!448529) (not e!389001))))

(declare-fun e!388999 () Bool)

(assert (=> b!682641 (= res!448529 e!388999)))

(declare-fun res!448532 () Bool)

(assert (=> b!682641 (=> res!448532 e!388999)))

(assert (=> b!682641 (= res!448532 e!388996)))

(declare-fun res!448526 () Bool)

(assert (=> b!682641 (=> (not res!448526) (not e!388996))))

(assert (=> b!682641 (= res!448526 (bvsgt from!3004 i!1382))))

(declare-fun b!682642 () Bool)

(declare-fun res!448525 () Bool)

(assert (=> b!682642 (=> (not res!448525) (not e!389001))))

(assert (=> b!682642 (= res!448525 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682643 () Bool)

(declare-fun Unit!23920 () Unit!23916)

(assert (=> b!682643 (= e!388997 Unit!23920)))

(declare-fun lt!313613 () Unit!23916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39540 (_ BitVec 64) (_ BitVec 32)) Unit!23916)

(assert (=> b!682643 (= lt!313613 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!682643 false))

(declare-fun b!682644 () Bool)

(declare-fun res!448536 () Bool)

(assert (=> b!682644 (=> (not res!448536) (not e!389001))))

(declare-fun arrayContainsKey!0 (array!39540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682644 (= res!448536 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682645 () Bool)

(assert (=> b!682645 (= e!389001 (not (not (contains!3549 acc!681 k0!2843))))))

(declare-fun subseq!158 (List!12897 List!12897) Bool)

(assert (=> b!682645 (subseq!158 acc!681 acc!681)))

(declare-fun lt!313610 () Unit!23916)

(declare-fun lemmaListSubSeqRefl!0 (List!12897) Unit!23916)

(assert (=> b!682645 (= lt!313610 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682645 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313614 () Unit!23916)

(assert (=> b!682645 (= lt!313614 e!389000)))

(declare-fun c!77422 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682645 (= c!77422 (validKeyInArray!0 (select (arr!18949 a!3626) from!3004)))))

(declare-fun lt!313611 () Unit!23916)

(assert (=> b!682645 (= lt!313611 e!388997)))

(declare-fun c!77423 () Bool)

(assert (=> b!682645 (= c!77423 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682645 (arrayContainsKey!0 (array!39541 (store (arr!18949 a!3626) i!1382 k0!2843) (size!19313 a!3626)) k0!2843 from!3004)))

(declare-fun b!682646 () Bool)

(declare-fun lt!313615 () Unit!23916)

(assert (=> b!682646 (= e!389000 lt!313615)))

(declare-fun lt!313612 () Unit!23916)

(assert (=> b!682646 (= lt!313612 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682646 (subseq!158 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39540 List!12897 List!12897 (_ BitVec 32)) Unit!23916)

(declare-fun $colon$colon!320 (List!12897 (_ BitVec 64)) List!12897)

(assert (=> b!682646 (= lt!313615 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!320 acc!681 (select (arr!18949 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682646 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682638 () Bool)

(assert (=> b!682638 (= e!388999 e!388998)))

(declare-fun res!448535 () Bool)

(assert (=> b!682638 (=> (not res!448535) (not e!388998))))

(assert (=> b!682638 (= res!448535 (bvsle from!3004 i!1382))))

(declare-fun res!448530 () Bool)

(assert (=> start!60918 (=> (not res!448530) (not e!389001))))

(assert (=> start!60918 (= res!448530 (and (bvslt (size!19313 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19313 a!3626))))))

(assert (=> start!60918 e!389001))

(assert (=> start!60918 true))

(declare-fun array_inv!14808 (array!39540) Bool)

(assert (=> start!60918 (array_inv!14808 a!3626)))

(declare-fun b!682647 () Bool)

(declare-fun res!448528 () Bool)

(assert (=> b!682647 (=> (not res!448528) (not e!389001))))

(assert (=> b!682647 (= res!448528 (not (contains!3549 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682648 () Bool)

(declare-fun res!448524 () Bool)

(assert (=> b!682648 (=> (not res!448524) (not e!389001))))

(assert (=> b!682648 (= res!448524 (validKeyInArray!0 k0!2843))))

(assert (= (and start!60918 res!448530) b!682635))

(assert (= (and b!682635 res!448533) b!682647))

(assert (= (and b!682647 res!448528) b!682640))

(assert (= (and b!682640 res!448527) b!682641))

(assert (= (and b!682641 res!448526) b!682639))

(assert (= (and b!682641 (not res!448532)) b!682638))

(assert (= (and b!682638 res!448535) b!682633))

(assert (= (and b!682641 res!448529) b!682634))

(assert (= (and b!682634 res!448537) b!682642))

(assert (= (and b!682642 res!448525) b!682636))

(assert (= (and b!682636 res!448534) b!682648))

(assert (= (and b!682648 res!448524) b!682644))

(assert (= (and b!682644 res!448536) b!682632))

(assert (= (and b!682632 res!448531) b!682645))

(assert (= (and b!682645 c!77423) b!682643))

(assert (= (and b!682645 (not c!77423)) b!682631))

(assert (= (and b!682645 c!77422) b!682646))

(assert (= (and b!682645 (not c!77422)) b!682637))

(declare-fun m!647815 () Bool)

(assert (=> b!682647 m!647815))

(declare-fun m!647817 () Bool)

(assert (=> b!682635 m!647817))

(declare-fun m!647819 () Bool)

(assert (=> b!682642 m!647819))

(declare-fun m!647821 () Bool)

(assert (=> b!682645 m!647821))

(declare-fun m!647823 () Bool)

(assert (=> b!682645 m!647823))

(declare-fun m!647825 () Bool)

(assert (=> b!682645 m!647825))

(declare-fun m!647827 () Bool)

(assert (=> b!682645 m!647827))

(declare-fun m!647829 () Bool)

(assert (=> b!682645 m!647829))

(declare-fun m!647831 () Bool)

(assert (=> b!682645 m!647831))

(assert (=> b!682645 m!647823))

(declare-fun m!647833 () Bool)

(assert (=> b!682645 m!647833))

(declare-fun m!647835 () Bool)

(assert (=> b!682645 m!647835))

(declare-fun m!647837 () Bool)

(assert (=> b!682645 m!647837))

(assert (=> b!682633 m!647825))

(declare-fun m!647839 () Bool)

(assert (=> b!682643 m!647839))

(declare-fun m!647841 () Bool)

(assert (=> b!682648 m!647841))

(assert (=> b!682639 m!647825))

(declare-fun m!647843 () Bool)

(assert (=> b!682640 m!647843))

(declare-fun m!647845 () Bool)

(assert (=> b!682644 m!647845))

(declare-fun m!647847 () Bool)

(assert (=> start!60918 m!647847))

(assert (=> b!682646 m!647821))

(assert (=> b!682646 m!647823))

(declare-fun m!647849 () Bool)

(assert (=> b!682646 m!647849))

(declare-fun m!647851 () Bool)

(assert (=> b!682646 m!647851))

(assert (=> b!682646 m!647823))

(assert (=> b!682646 m!647849))

(assert (=> b!682646 m!647829))

(assert (=> b!682646 m!647837))

(declare-fun m!647853 () Bool)

(assert (=> b!682634 m!647853))

(check-sat (not b!682633) (not b!682642) (not b!682634) (not b!682645) (not b!682640) (not b!682635) (not b!682639) (not start!60918) (not b!682643) (not b!682648) (not b!682647) (not b!682646) (not b!682644))
(check-sat)
