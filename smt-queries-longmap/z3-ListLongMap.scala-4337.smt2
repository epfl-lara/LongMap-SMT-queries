; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60052 () Bool)

(assert start!60052)

(declare-fun b!668528 () Bool)

(declare-fun res!435567 () Bool)

(declare-fun e!382497 () Bool)

(assert (=> b!668528 (=> (not res!435567) (not e!382497))))

(declare-datatypes ((List!12783 0))(
  ( (Nil!12780) (Cons!12779 (h!13824 (_ BitVec 64)) (t!19011 List!12783)) )
))
(declare-fun acc!681 () List!12783)

(declare-fun contains!3360 (List!12783 (_ BitVec 64)) Bool)

(assert (=> b!668528 (= res!435567 (not (contains!3360 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668529 () Bool)

(declare-fun res!435571 () Bool)

(assert (=> b!668529 (=> (not res!435571) (not e!382497))))

(declare-datatypes ((array!39099 0))(
  ( (array!39100 (arr!18742 (Array (_ BitVec 32) (_ BitVec 64))) (size!19106 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39099)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39099 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668529 (= res!435571 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668530 () Bool)

(declare-fun e!382499 () Bool)

(declare-fun e!382503 () Bool)

(assert (=> b!668530 (= e!382499 e!382503)))

(declare-fun res!435575 () Bool)

(assert (=> b!668530 (=> (not res!435575) (not e!382503))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668530 (= res!435575 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668531 () Bool)

(declare-fun res!435576 () Bool)

(assert (=> b!668531 (=> (not res!435576) (not e!382497))))

(declare-fun arrayNoDuplicates!0 (array!39099 (_ BitVec 32) List!12783) Bool)

(assert (=> b!668531 (= res!435576 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12780))))

(declare-fun b!668532 () Bool)

(declare-fun res!435569 () Bool)

(declare-fun e!382502 () Bool)

(assert (=> b!668532 (=> res!435569 e!382502)))

(declare-fun lt!311260 () List!12783)

(declare-fun noDuplicate!607 (List!12783) Bool)

(assert (=> b!668532 (= res!435569 (not (noDuplicate!607 lt!311260)))))

(declare-fun b!668533 () Bool)

(declare-fun res!435581 () Bool)

(assert (=> b!668533 (=> (not res!435581) (not e!382497))))

(assert (=> b!668533 (= res!435581 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19106 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668534 () Bool)

(declare-datatypes ((Unit!23435 0))(
  ( (Unit!23436) )
))
(declare-fun e!382504 () Unit!23435)

(declare-fun Unit!23437 () Unit!23435)

(assert (=> b!668534 (= e!382504 Unit!23437)))

(declare-fun b!668535 () Bool)

(assert (=> b!668535 (= e!382497 (not e!382502))))

(declare-fun res!435572 () Bool)

(assert (=> b!668535 (=> res!435572 e!382502)))

(assert (=> b!668535 (= res!435572 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668535 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311260)))

(declare-fun lt!311256 () Unit!23435)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39099 (_ BitVec 64) (_ BitVec 32) List!12783 List!12783) Unit!23435)

(assert (=> b!668535 (= lt!311256 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311260))))

(declare-fun -!97 (List!12783 (_ BitVec 64)) List!12783)

(assert (=> b!668535 (= (-!97 lt!311260 k0!2843) acc!681)))

(declare-fun $colon$colon!231 (List!12783 (_ BitVec 64)) List!12783)

(assert (=> b!668535 (= lt!311260 ($colon$colon!231 acc!681 k0!2843))))

(declare-fun lt!311257 () Unit!23435)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12783) Unit!23435)

(assert (=> b!668535 (= lt!311257 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!99 (List!12783 List!12783) Bool)

(assert (=> b!668535 (subseq!99 acc!681 acc!681)))

(declare-fun lt!311259 () Unit!23435)

(declare-fun lemmaListSubSeqRefl!0 (List!12783) Unit!23435)

(assert (=> b!668535 (= lt!311259 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668535 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311258 () Unit!23435)

(assert (=> b!668535 (= lt!311258 e!382504)))

(declare-fun c!76850 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668535 (= c!76850 (validKeyInArray!0 (select (arr!18742 a!3626) from!3004)))))

(declare-fun lt!311262 () Unit!23435)

(declare-fun e!382496 () Unit!23435)

(assert (=> b!668535 (= lt!311262 e!382496)))

(declare-fun c!76849 () Bool)

(assert (=> b!668535 (= c!76849 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668535 (arrayContainsKey!0 (array!39100 (store (arr!18742 a!3626) i!1382 k0!2843) (size!19106 a!3626)) k0!2843 from!3004)))

(declare-fun b!668536 () Bool)

(declare-fun Unit!23438 () Unit!23435)

(assert (=> b!668536 (= e!382496 Unit!23438)))

(declare-fun lt!311261 () Unit!23435)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39099 (_ BitVec 64) (_ BitVec 32)) Unit!23435)

(assert (=> b!668536 (= lt!311261 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!668536 false))

(declare-fun b!668538 () Bool)

(declare-fun res!435568 () Bool)

(assert (=> b!668538 (=> (not res!435568) (not e!382497))))

(assert (=> b!668538 (= res!435568 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668539 () Bool)

(declare-fun e!382505 () Bool)

(assert (=> b!668539 (= e!382505 (not (contains!3360 acc!681 k0!2843)))))

(declare-fun b!668540 () Bool)

(declare-fun res!435574 () Bool)

(assert (=> b!668540 (=> (not res!435574) (not e!382497))))

(assert (=> b!668540 (= res!435574 (not (contains!3360 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668541 () Bool)

(declare-fun res!435566 () Bool)

(assert (=> b!668541 (=> res!435566 e!382502)))

(assert (=> b!668541 (= res!435566 (contains!3360 lt!311260 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668542 () Bool)

(assert (=> b!668542 (= e!382502 true)))

(declare-fun lt!311255 () Bool)

(assert (=> b!668542 (= lt!311255 e!382499)))

(declare-fun res!435570 () Bool)

(assert (=> b!668542 (=> res!435570 e!382499)))

(declare-fun e!382506 () Bool)

(assert (=> b!668542 (= res!435570 e!382506)))

(declare-fun res!435582 () Bool)

(assert (=> b!668542 (=> (not res!435582) (not e!382506))))

(assert (=> b!668542 (= res!435582 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668543 () Bool)

(declare-fun lt!311263 () Unit!23435)

(assert (=> b!668543 (= e!382504 lt!311263)))

(declare-fun lt!311254 () Unit!23435)

(assert (=> b!668543 (= lt!311254 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668543 (subseq!99 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39099 List!12783 List!12783 (_ BitVec 32)) Unit!23435)

(assert (=> b!668543 (= lt!311263 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!231 acc!681 (select (arr!18742 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668543 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668544 () Bool)

(declare-fun res!435583 () Bool)

(assert (=> b!668544 (=> (not res!435583) (not e!382497))))

(declare-fun e!382498 () Bool)

(assert (=> b!668544 (= res!435583 e!382498)))

(declare-fun res!435565 () Bool)

(assert (=> b!668544 (=> res!435565 e!382498)))

(declare-fun e!382500 () Bool)

(assert (=> b!668544 (= res!435565 e!382500)))

(declare-fun res!435564 () Bool)

(assert (=> b!668544 (=> (not res!435564) (not e!382500))))

(assert (=> b!668544 (= res!435564 (bvsgt from!3004 i!1382))))

(declare-fun b!668545 () Bool)

(assert (=> b!668545 (= e!382506 (contains!3360 lt!311260 k0!2843))))

(declare-fun b!668546 () Bool)

(assert (=> b!668546 (= e!382498 e!382505)))

(declare-fun res!435578 () Bool)

(assert (=> b!668546 (=> (not res!435578) (not e!382505))))

(assert (=> b!668546 (= res!435578 (bvsle from!3004 i!1382))))

(declare-fun b!668547 () Bool)

(declare-fun res!435580 () Bool)

(assert (=> b!668547 (=> (not res!435580) (not e!382497))))

(assert (=> b!668547 (= res!435580 (noDuplicate!607 acc!681))))

(declare-fun b!668548 () Bool)

(declare-fun Unit!23439 () Unit!23435)

(assert (=> b!668548 (= e!382496 Unit!23439)))

(declare-fun b!668537 () Bool)

(declare-fun res!435577 () Bool)

(assert (=> b!668537 (=> (not res!435577) (not e!382497))))

(assert (=> b!668537 (= res!435577 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19106 a!3626))))))

(declare-fun res!435573 () Bool)

(assert (=> start!60052 (=> (not res!435573) (not e!382497))))

(assert (=> start!60052 (= res!435573 (and (bvslt (size!19106 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19106 a!3626))))))

(assert (=> start!60052 e!382497))

(assert (=> start!60052 true))

(declare-fun array_inv!14538 (array!39099) Bool)

(assert (=> start!60052 (array_inv!14538 a!3626)))

(declare-fun b!668549 () Bool)

(assert (=> b!668549 (= e!382503 (not (contains!3360 lt!311260 k0!2843)))))

(declare-fun b!668550 () Bool)

(declare-fun res!435579 () Bool)

(assert (=> b!668550 (=> res!435579 e!382502)))

(assert (=> b!668550 (= res!435579 (contains!3360 lt!311260 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668551 () Bool)

(assert (=> b!668551 (= e!382500 (contains!3360 acc!681 k0!2843))))

(declare-fun b!668552 () Bool)

(declare-fun res!435584 () Bool)

(assert (=> b!668552 (=> (not res!435584) (not e!382497))))

(assert (=> b!668552 (= res!435584 (validKeyInArray!0 k0!2843))))

(assert (= (and start!60052 res!435573) b!668547))

(assert (= (and b!668547 res!435580) b!668528))

(assert (= (and b!668528 res!435567) b!668540))

(assert (= (and b!668540 res!435574) b!668544))

(assert (= (and b!668544 res!435564) b!668551))

(assert (= (and b!668544 (not res!435565)) b!668546))

(assert (= (and b!668546 res!435578) b!668539))

(assert (= (and b!668544 res!435583) b!668531))

(assert (= (and b!668531 res!435576) b!668538))

(assert (= (and b!668538 res!435568) b!668537))

(assert (= (and b!668537 res!435577) b!668552))

(assert (= (and b!668552 res!435584) b!668529))

(assert (= (and b!668529 res!435571) b!668533))

(assert (= (and b!668533 res!435581) b!668535))

(assert (= (and b!668535 c!76849) b!668536))

(assert (= (and b!668535 (not c!76849)) b!668548))

(assert (= (and b!668535 c!76850) b!668543))

(assert (= (and b!668535 (not c!76850)) b!668534))

(assert (= (and b!668535 (not res!435572)) b!668532))

(assert (= (and b!668532 (not res!435569)) b!668541))

(assert (= (and b!668541 (not res!435566)) b!668550))

(assert (= (and b!668550 (not res!435579)) b!668542))

(assert (= (and b!668542 res!435582) b!668545))

(assert (= (and b!668542 (not res!435570)) b!668530))

(assert (= (and b!668530 res!435575) b!668549))

(declare-fun m!638829 () Bool)

(assert (=> b!668535 m!638829))

(declare-fun m!638831 () Bool)

(assert (=> b!668535 m!638831))

(declare-fun m!638833 () Bool)

(assert (=> b!668535 m!638833))

(declare-fun m!638835 () Bool)

(assert (=> b!668535 m!638835))

(declare-fun m!638837 () Bool)

(assert (=> b!668535 m!638837))

(declare-fun m!638839 () Bool)

(assert (=> b!668535 m!638839))

(declare-fun m!638841 () Bool)

(assert (=> b!668535 m!638841))

(declare-fun m!638843 () Bool)

(assert (=> b!668535 m!638843))

(declare-fun m!638845 () Bool)

(assert (=> b!668535 m!638845))

(assert (=> b!668535 m!638833))

(declare-fun m!638847 () Bool)

(assert (=> b!668535 m!638847))

(declare-fun m!638849 () Bool)

(assert (=> b!668535 m!638849))

(declare-fun m!638851 () Bool)

(assert (=> b!668535 m!638851))

(declare-fun m!638853 () Bool)

(assert (=> b!668535 m!638853))

(declare-fun m!638855 () Bool)

(assert (=> b!668538 m!638855))

(declare-fun m!638857 () Bool)

(assert (=> start!60052 m!638857))

(declare-fun m!638859 () Bool)

(assert (=> b!668550 m!638859))

(declare-fun m!638861 () Bool)

(assert (=> b!668551 m!638861))

(declare-fun m!638863 () Bool)

(assert (=> b!668528 m!638863))

(assert (=> b!668539 m!638861))

(declare-fun m!638865 () Bool)

(assert (=> b!668545 m!638865))

(assert (=> b!668543 m!638831))

(assert (=> b!668543 m!638833))

(declare-fun m!638867 () Bool)

(assert (=> b!668543 m!638867))

(declare-fun m!638869 () Bool)

(assert (=> b!668543 m!638869))

(assert (=> b!668543 m!638833))

(assert (=> b!668543 m!638867))

(assert (=> b!668543 m!638841))

(assert (=> b!668543 m!638853))

(declare-fun m!638871 () Bool)

(assert (=> b!668547 m!638871))

(declare-fun m!638873 () Bool)

(assert (=> b!668552 m!638873))

(declare-fun m!638875 () Bool)

(assert (=> b!668541 m!638875))

(declare-fun m!638877 () Bool)

(assert (=> b!668531 m!638877))

(declare-fun m!638879 () Bool)

(assert (=> b!668529 m!638879))

(declare-fun m!638881 () Bool)

(assert (=> b!668540 m!638881))

(declare-fun m!638883 () Bool)

(assert (=> b!668532 m!638883))

(assert (=> b!668549 m!638865))

(declare-fun m!638885 () Bool)

(assert (=> b!668536 m!638885))

(check-sat (not b!668551) (not b!668550) (not b!668541) (not b!668535) (not b!668528) (not b!668552) (not b!668539) (not b!668547) (not b!668538) (not b!668531) (not b!668536) (not b!668545) (not b!668549) (not b!668532) (not b!668529) (not b!668540) (not start!60052) (not b!668543))
(check-sat)
