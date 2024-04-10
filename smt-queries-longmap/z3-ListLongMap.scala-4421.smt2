; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61174 () Bool)

(assert start!61174)

(declare-fun b!685540 () Bool)

(declare-fun res!450867 () Bool)

(declare-fun e!390435 () Bool)

(assert (=> b!685540 (=> res!450867 e!390435)))

(declare-fun lt!314696 () Bool)

(assert (=> b!685540 (= res!450867 lt!314696)))

(declare-fun b!685541 () Bool)

(declare-fun e!390437 () Bool)

(declare-datatypes ((List!13035 0))(
  ( (Nil!13032) (Cons!13031 (h!14076 (_ BitVec 64)) (t!19287 List!13035)) )
))
(declare-fun acc!681 () List!13035)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3612 (List!13035 (_ BitVec 64)) Bool)

(assert (=> b!685541 (= e!390437 (not (contains!3612 acc!681 k0!2843)))))

(declare-fun b!685542 () Bool)

(declare-datatypes ((Unit!24137 0))(
  ( (Unit!24138) )
))
(declare-fun e!390434 () Unit!24137)

(declare-fun Unit!24139 () Unit!24137)

(assert (=> b!685542 (= e!390434 Unit!24139)))

(declare-fun lt!314694 () Unit!24137)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39633 0))(
  ( (array!39634 (arr!18994 (Array (_ BitVec 32) (_ BitVec 64))) (size!19366 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39633)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39633 (_ BitVec 64) (_ BitVec 32)) Unit!24137)

(assert (=> b!685542 (= lt!314694 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!685542 false))

(declare-fun b!685543 () Bool)

(declare-fun e!390433 () Bool)

(assert (=> b!685543 (= e!390433 e!390437)))

(declare-fun res!450878 () Bool)

(assert (=> b!685543 (=> (not res!450878) (not e!390437))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685543 (= res!450878 (bvsle from!3004 i!1382))))

(declare-fun res!450874 () Bool)

(declare-fun e!390438 () Bool)

(assert (=> start!61174 (=> (not res!450874) (not e!390438))))

(assert (=> start!61174 (= res!450874 (and (bvslt (size!19366 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19366 a!3626))))))

(assert (=> start!61174 e!390438))

(assert (=> start!61174 true))

(declare-fun array_inv!14790 (array!39633) Bool)

(assert (=> start!61174 (array_inv!14790 a!3626)))

(declare-fun b!685544 () Bool)

(declare-fun res!450870 () Bool)

(assert (=> b!685544 (=> (not res!450870) (not e!390438))))

(assert (=> b!685544 (= res!450870 (not (contains!3612 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685545 () Bool)

(declare-fun Unit!24140 () Unit!24137)

(assert (=> b!685545 (= e!390434 Unit!24140)))

(declare-fun b!685546 () Bool)

(assert (=> b!685546 (= e!390438 (not e!390435))))

(declare-fun res!450881 () Bool)

(assert (=> b!685546 (=> res!450881 e!390435)))

(assert (=> b!685546 (= res!450881 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!314699 () List!13035)

(declare-fun -!163 (List!13035 (_ BitVec 64)) List!13035)

(assert (=> b!685546 (= (-!163 lt!314699 k0!2843) acc!681)))

(declare-fun $colon$colon!363 (List!13035 (_ BitVec 64)) List!13035)

(assert (=> b!685546 (= lt!314699 ($colon$colon!363 acc!681 k0!2843))))

(declare-fun lt!314695 () Unit!24137)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13035) Unit!24137)

(assert (=> b!685546 (= lt!314695 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!198 (List!13035 List!13035) Bool)

(assert (=> b!685546 (subseq!198 acc!681 acc!681)))

(declare-fun lt!314701 () Unit!24137)

(declare-fun lemmaListSubSeqRefl!0 (List!13035) Unit!24137)

(assert (=> b!685546 (= lt!314701 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!39633 (_ BitVec 32) List!13035) Bool)

(assert (=> b!685546 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314692 () Unit!24137)

(declare-fun e!390431 () Unit!24137)

(assert (=> b!685546 (= lt!314692 e!390431)))

(declare-fun c!77704 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685546 (= c!77704 (validKeyInArray!0 (select (arr!18994 a!3626) from!3004)))))

(declare-fun lt!314700 () Unit!24137)

(assert (=> b!685546 (= lt!314700 e!390434)))

(declare-fun c!77705 () Bool)

(assert (=> b!685546 (= c!77705 lt!314696)))

(declare-fun arrayContainsKey!0 (array!39633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685546 (= lt!314696 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685546 (arrayContainsKey!0 (array!39634 (store (arr!18994 a!3626) i!1382 k0!2843) (size!19366 a!3626)) k0!2843 from!3004)))

(declare-fun b!685547 () Bool)

(declare-fun res!450884 () Bool)

(assert (=> b!685547 (=> (not res!450884) (not e!390438))))

(assert (=> b!685547 (= res!450884 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19366 a!3626))))))

(declare-fun b!685548 () Bool)

(declare-fun res!450883 () Bool)

(assert (=> b!685548 (=> res!450883 e!390435)))

(declare-fun noDuplicate!859 (List!13035) Bool)

(assert (=> b!685548 (= res!450883 (not (noDuplicate!859 lt!314699)))))

(declare-fun b!685549 () Bool)

(declare-fun res!450880 () Bool)

(assert (=> b!685549 (=> (not res!450880) (not e!390438))))

(assert (=> b!685549 (= res!450880 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685550 () Bool)

(declare-fun lt!314693 () Unit!24137)

(assert (=> b!685550 (= e!390431 lt!314693)))

(declare-fun lt!314698 () Unit!24137)

(assert (=> b!685550 (= lt!314698 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685550 (subseq!198 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39633 List!13035 List!13035 (_ BitVec 32)) Unit!24137)

(assert (=> b!685550 (= lt!314693 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!363 acc!681 (select (arr!18994 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685550 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685551 () Bool)

(declare-fun res!450875 () Bool)

(assert (=> b!685551 (=> (not res!450875) (not e!390438))))

(assert (=> b!685551 (= res!450875 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13032))))

(declare-fun b!685552 () Bool)

(declare-fun Unit!24141 () Unit!24137)

(assert (=> b!685552 (= e!390431 Unit!24141)))

(declare-fun b!685553 () Bool)

(declare-fun res!450876 () Bool)

(assert (=> b!685553 (=> (not res!450876) (not e!390438))))

(assert (=> b!685553 (= res!450876 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19366 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685554 () Bool)

(declare-fun res!450866 () Bool)

(assert (=> b!685554 (=> res!450866 e!390435)))

(assert (=> b!685554 (= res!450866 (not (subseq!198 acc!681 lt!314699)))))

(declare-fun b!685555 () Bool)

(declare-fun res!450872 () Bool)

(assert (=> b!685555 (=> (not res!450872) (not e!390438))))

(assert (=> b!685555 (= res!450872 (not (contains!3612 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685556 () Bool)

(declare-fun res!450873 () Bool)

(assert (=> b!685556 (=> (not res!450873) (not e!390438))))

(assert (=> b!685556 (= res!450873 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685557 () Bool)

(declare-fun res!450879 () Bool)

(assert (=> b!685557 (=> (not res!450879) (not e!390438))))

(assert (=> b!685557 (= res!450879 (noDuplicate!859 acc!681))))

(declare-fun b!685558 () Bool)

(assert (=> b!685558 (= e!390435 true)))

(declare-fun lt!314697 () Bool)

(assert (=> b!685558 (= lt!314697 (contains!3612 lt!314699 k0!2843))))

(declare-fun b!685559 () Bool)

(declare-fun res!450882 () Bool)

(assert (=> b!685559 (=> (not res!450882) (not e!390438))))

(assert (=> b!685559 (= res!450882 e!390433)))

(declare-fun res!450877 () Bool)

(assert (=> b!685559 (=> res!450877 e!390433)))

(declare-fun e!390436 () Bool)

(assert (=> b!685559 (= res!450877 e!390436)))

(declare-fun res!450869 () Bool)

(assert (=> b!685559 (=> (not res!450869) (not e!390436))))

(assert (=> b!685559 (= res!450869 (bvsgt from!3004 i!1382))))

(declare-fun b!685560 () Bool)

(assert (=> b!685560 (= e!390436 (contains!3612 acc!681 k0!2843))))

(declare-fun b!685561 () Bool)

(declare-fun res!450871 () Bool)

(assert (=> b!685561 (=> res!450871 e!390435)))

(assert (=> b!685561 (= res!450871 (contains!3612 acc!681 k0!2843))))

(declare-fun b!685562 () Bool)

(declare-fun res!450868 () Bool)

(assert (=> b!685562 (=> (not res!450868) (not e!390438))))

(assert (=> b!685562 (= res!450868 (validKeyInArray!0 k0!2843))))

(assert (= (and start!61174 res!450874) b!685557))

(assert (= (and b!685557 res!450879) b!685555))

(assert (= (and b!685555 res!450872) b!685544))

(assert (= (and b!685544 res!450870) b!685559))

(assert (= (and b!685559 res!450869) b!685560))

(assert (= (and b!685559 (not res!450877)) b!685543))

(assert (= (and b!685543 res!450878) b!685541))

(assert (= (and b!685559 res!450882) b!685551))

(assert (= (and b!685551 res!450875) b!685549))

(assert (= (and b!685549 res!450880) b!685547))

(assert (= (and b!685547 res!450884) b!685562))

(assert (= (and b!685562 res!450868) b!685556))

(assert (= (and b!685556 res!450873) b!685553))

(assert (= (and b!685553 res!450876) b!685546))

(assert (= (and b!685546 c!77705) b!685542))

(assert (= (and b!685546 (not c!77705)) b!685545))

(assert (= (and b!685546 c!77704) b!685550))

(assert (= (and b!685546 (not c!77704)) b!685552))

(assert (= (and b!685546 (not res!450881)) b!685548))

(assert (= (and b!685548 (not res!450883)) b!685540))

(assert (= (and b!685540 (not res!450867)) b!685561))

(assert (= (and b!685561 (not res!450871)) b!685554))

(assert (= (and b!685554 (not res!450866)) b!685558))

(declare-fun m!649731 () Bool)

(assert (=> b!685555 m!649731))

(declare-fun m!649733 () Bool)

(assert (=> b!685544 m!649733))

(declare-fun m!649735 () Bool)

(assert (=> b!685558 m!649735))

(declare-fun m!649737 () Bool)

(assert (=> b!685556 m!649737))

(declare-fun m!649739 () Bool)

(assert (=> b!685554 m!649739))

(declare-fun m!649741 () Bool)

(assert (=> b!685542 m!649741))

(declare-fun m!649743 () Bool)

(assert (=> b!685551 m!649743))

(declare-fun m!649745 () Bool)

(assert (=> b!685546 m!649745))

(declare-fun m!649747 () Bool)

(assert (=> b!685546 m!649747))

(declare-fun m!649749 () Bool)

(assert (=> b!685546 m!649749))

(declare-fun m!649751 () Bool)

(assert (=> b!685546 m!649751))

(declare-fun m!649753 () Bool)

(assert (=> b!685546 m!649753))

(declare-fun m!649755 () Bool)

(assert (=> b!685546 m!649755))

(declare-fun m!649757 () Bool)

(assert (=> b!685546 m!649757))

(declare-fun m!649759 () Bool)

(assert (=> b!685546 m!649759))

(assert (=> b!685546 m!649747))

(declare-fun m!649761 () Bool)

(assert (=> b!685546 m!649761))

(declare-fun m!649763 () Bool)

(assert (=> b!685546 m!649763))

(declare-fun m!649765 () Bool)

(assert (=> b!685546 m!649765))

(declare-fun m!649767 () Bool)

(assert (=> b!685548 m!649767))

(assert (=> b!685550 m!649745))

(assert (=> b!685550 m!649747))

(declare-fun m!649769 () Bool)

(assert (=> b!685550 m!649769))

(declare-fun m!649771 () Bool)

(assert (=> b!685550 m!649771))

(assert (=> b!685550 m!649747))

(assert (=> b!685550 m!649769))

(assert (=> b!685550 m!649755))

(assert (=> b!685550 m!649765))

(declare-fun m!649773 () Bool)

(assert (=> b!685557 m!649773))

(declare-fun m!649775 () Bool)

(assert (=> b!685562 m!649775))

(declare-fun m!649777 () Bool)

(assert (=> b!685541 m!649777))

(assert (=> b!685561 m!649777))

(assert (=> b!685560 m!649777))

(declare-fun m!649779 () Bool)

(assert (=> b!685549 m!649779))

(declare-fun m!649781 () Bool)

(assert (=> start!61174 m!649781))

(check-sat (not b!685562) (not b!685549) (not b!685550) (not b!685554) (not b!685548) (not start!61174) (not b!685555) (not b!685560) (not b!685544) (not b!685551) (not b!685556) (not b!685541) (not b!685557) (not b!685561) (not b!685546) (not b!685542) (not b!685558))
(check-sat)
