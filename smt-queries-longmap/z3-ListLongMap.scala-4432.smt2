; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61570 () Bool)

(assert start!61570)

(declare-fun b!688793 () Bool)

(declare-fun e!392274 () Bool)

(declare-datatypes ((List!13068 0))(
  ( (Nil!13065) (Cons!13064 (h!14109 (_ BitVec 64)) (t!19332 List!13068)) )
))
(declare-fun acc!681 () List!13068)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3645 (List!13068 (_ BitVec 64)) Bool)

(assert (=> b!688793 (= e!392274 (not (contains!3645 acc!681 k0!2843)))))

(declare-fun b!688794 () Bool)

(declare-fun res!453460 () Bool)

(declare-fun e!392272 () Bool)

(assert (=> b!688794 (=> (not res!453460) (not e!392272))))

(declare-datatypes ((array!39711 0))(
  ( (array!39712 (arr!19027 (Array (_ BitVec 32) (_ BitVec 64))) (size!19409 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39711)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!39711 (_ BitVec 32) List!13068) Bool)

(assert (=> b!688794 (= res!453460 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688795 () Bool)

(declare-fun e!392265 () Bool)

(declare-fun lt!315911 () List!13068)

(assert (=> b!688795 (= e!392265 (contains!3645 lt!315911 k0!2843))))

(declare-fun b!688796 () Bool)

(declare-fun res!453442 () Bool)

(assert (=> b!688796 (=> (not res!453442) (not e!392272))))

(assert (=> b!688796 (= res!453442 (not (contains!3645 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688797 () Bool)

(declare-fun res!453454 () Bool)

(assert (=> b!688797 (=> (not res!453454) (not e!392272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688797 (= res!453454 (validKeyInArray!0 k0!2843))))

(declare-fun b!688798 () Bool)

(declare-fun e!392268 () Bool)

(assert (=> b!688798 (= e!392268 (contains!3645 acc!681 k0!2843))))

(declare-fun res!453448 () Bool)

(assert (=> start!61570 (=> (not res!453448) (not e!392272))))

(assert (=> start!61570 (= res!453448 (and (bvslt (size!19409 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19409 a!3626))))))

(assert (=> start!61570 e!392272))

(assert (=> start!61570 true))

(declare-fun array_inv!14823 (array!39711) Bool)

(assert (=> start!61570 (array_inv!14823 a!3626)))

(declare-fun b!688799 () Bool)

(declare-datatypes ((Unit!24302 0))(
  ( (Unit!24303) )
))
(declare-fun e!392267 () Unit!24302)

(declare-fun Unit!24304 () Unit!24302)

(assert (=> b!688799 (= e!392267 Unit!24304)))

(declare-fun lt!315912 () Unit!24302)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39711 (_ BitVec 64) (_ BitVec 32)) Unit!24302)

(assert (=> b!688799 (= lt!315912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688799 false))

(declare-fun b!688800 () Bool)

(declare-fun res!453441 () Bool)

(assert (=> b!688800 (=> (not res!453441) (not e!392272))))

(assert (=> b!688800 (= res!453441 (not (contains!3645 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688801 () Bool)

(declare-fun e!392271 () Bool)

(assert (=> b!688801 (= e!392271 (not (contains!3645 lt!315911 k0!2843)))))

(declare-fun b!688802 () Bool)

(declare-fun e!392264 () Bool)

(assert (=> b!688802 (= e!392264 e!392274)))

(declare-fun res!453458 () Bool)

(assert (=> b!688802 (=> (not res!453458) (not e!392274))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688802 (= res!453458 (bvsle from!3004 i!1382))))

(declare-fun b!688803 () Bool)

(declare-fun e!392269 () Bool)

(assert (=> b!688803 (= e!392269 e!392271)))

(declare-fun res!453452 () Bool)

(assert (=> b!688803 (=> (not res!453452) (not e!392271))))

(assert (=> b!688803 (= res!453452 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688804 () Bool)

(declare-fun res!453459 () Bool)

(assert (=> b!688804 (=> (not res!453459) (not e!392272))))

(assert (=> b!688804 (= res!453459 e!392264)))

(declare-fun res!453461 () Bool)

(assert (=> b!688804 (=> res!453461 e!392264)))

(assert (=> b!688804 (= res!453461 e!392268)))

(declare-fun res!453446 () Bool)

(assert (=> b!688804 (=> (not res!453446) (not e!392268))))

(assert (=> b!688804 (= res!453446 (bvsgt from!3004 i!1382))))

(declare-fun b!688805 () Bool)

(declare-fun res!453450 () Bool)

(declare-fun e!392273 () Bool)

(assert (=> b!688805 (=> res!453450 e!392273)))

(assert (=> b!688805 (= res!453450 (contains!3645 lt!315911 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688806 () Bool)

(declare-fun res!453456 () Bool)

(assert (=> b!688806 (=> (not res!453456) (not e!392272))))

(assert (=> b!688806 (= res!453456 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13065))))

(declare-fun b!688807 () Bool)

(declare-fun res!453445 () Bool)

(assert (=> b!688807 (=> res!453445 e!392273)))

(declare-fun noDuplicate!892 (List!13068) Bool)

(assert (=> b!688807 (= res!453445 (not (noDuplicate!892 lt!315911)))))

(declare-fun b!688808 () Bool)

(declare-fun res!453455 () Bool)

(assert (=> b!688808 (=> (not res!453455) (not e!392272))))

(assert (=> b!688808 (= res!453455 (noDuplicate!892 acc!681))))

(declare-fun b!688809 () Bool)

(assert (=> b!688809 (= e!392273 true)))

(declare-fun lt!315917 () Bool)

(assert (=> b!688809 (= lt!315917 e!392269)))

(declare-fun res!453453 () Bool)

(assert (=> b!688809 (=> res!453453 e!392269)))

(assert (=> b!688809 (= res!453453 e!392265)))

(declare-fun res!453444 () Bool)

(assert (=> b!688809 (=> (not res!453444) (not e!392265))))

(assert (=> b!688809 (= res!453444 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688810 () Bool)

(declare-fun Unit!24305 () Unit!24302)

(assert (=> b!688810 (= e!392267 Unit!24305)))

(declare-fun b!688811 () Bool)

(declare-fun res!453451 () Bool)

(assert (=> b!688811 (=> (not res!453451) (not e!392272))))

(declare-fun arrayContainsKey!0 (array!39711 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688811 (= res!453451 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!688812 () Bool)

(declare-fun res!453443 () Bool)

(assert (=> b!688812 (=> (not res!453443) (not e!392272))))

(assert (=> b!688812 (= res!453443 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19409 a!3626))))))

(declare-fun b!688813 () Bool)

(assert (=> b!688813 (= e!392272 (not e!392273))))

(declare-fun res!453449 () Bool)

(assert (=> b!688813 (=> res!453449 e!392273)))

(assert (=> b!688813 (= res!453449 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688813 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315911)))

(declare-fun lt!315913 () Unit!24302)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39711 (_ BitVec 64) (_ BitVec 32) List!13068 List!13068) Unit!24302)

(assert (=> b!688813 (= lt!315913 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315911))))

(declare-fun -!196 (List!13068 (_ BitVec 64)) List!13068)

(assert (=> b!688813 (= (-!196 lt!315911 k0!2843) acc!681)))

(declare-fun $colon$colon!396 (List!13068 (_ BitVec 64)) List!13068)

(assert (=> b!688813 (= lt!315911 ($colon$colon!396 acc!681 k0!2843))))

(declare-fun lt!315914 () Unit!24302)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13068) Unit!24302)

(assert (=> b!688813 (= lt!315914 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!231 (List!13068 List!13068) Bool)

(assert (=> b!688813 (subseq!231 acc!681 acc!681)))

(declare-fun lt!315910 () Unit!24302)

(declare-fun lemmaListSubSeqRefl!0 (List!13068) Unit!24302)

(assert (=> b!688813 (= lt!315910 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688813 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315915 () Unit!24302)

(declare-fun e!392270 () Unit!24302)

(assert (=> b!688813 (= lt!315915 e!392270)))

(declare-fun c!78044 () Bool)

(assert (=> b!688813 (= c!78044 (validKeyInArray!0 (select (arr!19027 a!3626) from!3004)))))

(declare-fun lt!315916 () Unit!24302)

(assert (=> b!688813 (= lt!315916 e!392267)))

(declare-fun c!78043 () Bool)

(assert (=> b!688813 (= c!78043 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688813 (arrayContainsKey!0 (array!39712 (store (arr!19027 a!3626) i!1382 k0!2843) (size!19409 a!3626)) k0!2843 from!3004)))

(declare-fun b!688814 () Bool)

(declare-fun res!453447 () Bool)

(assert (=> b!688814 (=> (not res!453447) (not e!392272))))

(assert (=> b!688814 (= res!453447 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19409 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688815 () Bool)

(declare-fun lt!315918 () Unit!24302)

(assert (=> b!688815 (= e!392270 lt!315918)))

(declare-fun lt!315919 () Unit!24302)

(assert (=> b!688815 (= lt!315919 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688815 (subseq!231 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39711 List!13068 List!13068 (_ BitVec 32)) Unit!24302)

(assert (=> b!688815 (= lt!315918 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!396 acc!681 (select (arr!19027 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688815 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688816 () Bool)

(declare-fun Unit!24306 () Unit!24302)

(assert (=> b!688816 (= e!392270 Unit!24306)))

(declare-fun b!688817 () Bool)

(declare-fun res!453457 () Bool)

(assert (=> b!688817 (=> res!453457 e!392273)))

(assert (=> b!688817 (= res!453457 (contains!3645 lt!315911 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!61570 res!453448) b!688808))

(assert (= (and b!688808 res!453455) b!688800))

(assert (= (and b!688800 res!453441) b!688796))

(assert (= (and b!688796 res!453442) b!688804))

(assert (= (and b!688804 res!453446) b!688798))

(assert (= (and b!688804 (not res!453461)) b!688802))

(assert (= (and b!688802 res!453458) b!688793))

(assert (= (and b!688804 res!453459) b!688806))

(assert (= (and b!688806 res!453456) b!688794))

(assert (= (and b!688794 res!453460) b!688812))

(assert (= (and b!688812 res!453443) b!688797))

(assert (= (and b!688797 res!453454) b!688811))

(assert (= (and b!688811 res!453451) b!688814))

(assert (= (and b!688814 res!453447) b!688813))

(assert (= (and b!688813 c!78043) b!688799))

(assert (= (and b!688813 (not c!78043)) b!688810))

(assert (= (and b!688813 c!78044) b!688815))

(assert (= (and b!688813 (not c!78044)) b!688816))

(assert (= (and b!688813 (not res!453449)) b!688807))

(assert (= (and b!688807 (not res!453445)) b!688805))

(assert (= (and b!688805 (not res!453450)) b!688817))

(assert (= (and b!688817 (not res!453457)) b!688809))

(assert (= (and b!688809 res!453444) b!688795))

(assert (= (and b!688809 (not res!453453)) b!688803))

(assert (= (and b!688803 res!453452) b!688801))

(declare-fun m!652605 () Bool)

(assert (=> b!688811 m!652605))

(declare-fun m!652607 () Bool)

(assert (=> b!688813 m!652607))

(declare-fun m!652609 () Bool)

(assert (=> b!688813 m!652609))

(declare-fun m!652611 () Bool)

(assert (=> b!688813 m!652611))

(declare-fun m!652613 () Bool)

(assert (=> b!688813 m!652613))

(declare-fun m!652615 () Bool)

(assert (=> b!688813 m!652615))

(declare-fun m!652617 () Bool)

(assert (=> b!688813 m!652617))

(declare-fun m!652619 () Bool)

(assert (=> b!688813 m!652619))

(declare-fun m!652621 () Bool)

(assert (=> b!688813 m!652621))

(assert (=> b!688813 m!652609))

(declare-fun m!652623 () Bool)

(assert (=> b!688813 m!652623))

(declare-fun m!652625 () Bool)

(assert (=> b!688813 m!652625))

(declare-fun m!652627 () Bool)

(assert (=> b!688813 m!652627))

(declare-fun m!652629 () Bool)

(assert (=> b!688813 m!652629))

(declare-fun m!652631 () Bool)

(assert (=> b!688813 m!652631))

(declare-fun m!652633 () Bool)

(assert (=> start!61570 m!652633))

(declare-fun m!652635 () Bool)

(assert (=> b!688817 m!652635))

(assert (=> b!688815 m!652607))

(assert (=> b!688815 m!652609))

(declare-fun m!652637 () Bool)

(assert (=> b!688815 m!652637))

(declare-fun m!652639 () Bool)

(assert (=> b!688815 m!652639))

(assert (=> b!688815 m!652609))

(assert (=> b!688815 m!652637))

(assert (=> b!688815 m!652619))

(assert (=> b!688815 m!652631))

(declare-fun m!652641 () Bool)

(assert (=> b!688796 m!652641))

(declare-fun m!652643 () Bool)

(assert (=> b!688797 m!652643))

(declare-fun m!652645 () Bool)

(assert (=> b!688807 m!652645))

(declare-fun m!652647 () Bool)

(assert (=> b!688808 m!652647))

(declare-fun m!652649 () Bool)

(assert (=> b!688798 m!652649))

(declare-fun m!652651 () Bool)

(assert (=> b!688805 m!652651))

(declare-fun m!652653 () Bool)

(assert (=> b!688800 m!652653))

(declare-fun m!652655 () Bool)

(assert (=> b!688806 m!652655))

(declare-fun m!652657 () Bool)

(assert (=> b!688795 m!652657))

(declare-fun m!652659 () Bool)

(assert (=> b!688799 m!652659))

(assert (=> b!688793 m!652649))

(declare-fun m!652661 () Bool)

(assert (=> b!688794 m!652661))

(assert (=> b!688801 m!652657))

(check-sat (not b!688797) (not b!688794) (not b!688793) (not b!688811) (not b!688798) (not b!688799) (not b!688805) (not start!61570) (not b!688815) (not b!688800) (not b!688807) (not b!688817) (not b!688808) (not b!688795) (not b!688813) (not b!688796) (not b!688801) (not b!688806))
(check-sat)
