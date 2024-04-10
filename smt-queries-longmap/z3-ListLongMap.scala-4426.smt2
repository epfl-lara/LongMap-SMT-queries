; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61282 () Bool)

(assert start!61282)

(declare-fun b!686708 () Bool)

(declare-fun e!391013 () Bool)

(declare-datatypes ((List!13050 0))(
  ( (Nil!13047) (Cons!13046 (h!14091 (_ BitVec 64)) (t!19305 List!13050)) )
))
(declare-fun acc!681 () List!13050)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3627 (List!13050 (_ BitVec 64)) Bool)

(assert (=> b!686708 (= e!391013 (not (contains!3627 acc!681 k0!2843)))))

(declare-fun b!686710 () Bool)

(declare-fun res!451802 () Bool)

(declare-fun e!391020 () Bool)

(assert (=> b!686710 (=> (not res!451802) (not e!391020))))

(declare-fun noDuplicate!874 (List!13050) Bool)

(assert (=> b!686710 (= res!451802 (noDuplicate!874 acc!681))))

(declare-fun b!686711 () Bool)

(declare-fun e!391014 () Bool)

(assert (=> b!686711 (= e!391014 (contains!3627 acc!681 k0!2843))))

(declare-fun b!686712 () Bool)

(declare-datatypes ((Unit!24212 0))(
  ( (Unit!24213) )
))
(declare-fun e!391017 () Unit!24212)

(declare-fun Unit!24214 () Unit!24212)

(assert (=> b!686712 (= e!391017 Unit!24214)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!315175 () Unit!24212)

(declare-datatypes ((array!39666 0))(
  ( (array!39667 (arr!19009 (Array (_ BitVec 32) (_ BitVec 64))) (size!19383 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39666)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39666 (_ BitVec 64) (_ BitVec 32)) Unit!24212)

(assert (=> b!686712 (= lt!315175 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686712 false))

(declare-fun b!686713 () Bool)

(declare-fun res!451797 () Bool)

(assert (=> b!686713 (=> (not res!451797) (not e!391020))))

(assert (=> b!686713 (= res!451797 (not (contains!3627 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686714 () Bool)

(declare-fun e!391018 () Bool)

(assert (=> b!686714 (= e!391020 (not e!391018))))

(declare-fun res!451789 () Bool)

(assert (=> b!686714 (=> res!451789 e!391018)))

(assert (=> b!686714 (= res!451789 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!315170 () List!13050)

(declare-fun arrayNoDuplicates!0 (array!39666 (_ BitVec 32) List!13050) Bool)

(assert (=> b!686714 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315170)))

(declare-fun lt!315178 () Unit!24212)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39666 (_ BitVec 64) (_ BitVec 32) List!13050 List!13050) Unit!24212)

(assert (=> b!686714 (= lt!315178 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315170))))

(declare-fun -!178 (List!13050 (_ BitVec 64)) List!13050)

(assert (=> b!686714 (= (-!178 lt!315170 k0!2843) acc!681)))

(declare-fun $colon$colon!378 (List!13050 (_ BitVec 64)) List!13050)

(assert (=> b!686714 (= lt!315170 ($colon$colon!378 acc!681 k0!2843))))

(declare-fun lt!315177 () Unit!24212)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13050) Unit!24212)

(assert (=> b!686714 (= lt!315177 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!213 (List!13050 List!13050) Bool)

(assert (=> b!686714 (subseq!213 acc!681 acc!681)))

(declare-fun lt!315173 () Unit!24212)

(declare-fun lemmaListSubSeqRefl!0 (List!13050) Unit!24212)

(assert (=> b!686714 (= lt!315173 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686714 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315171 () Unit!24212)

(declare-fun e!391015 () Unit!24212)

(assert (=> b!686714 (= lt!315171 e!391015)))

(declare-fun c!77828 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686714 (= c!77828 (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)))))

(declare-fun lt!315172 () Unit!24212)

(assert (=> b!686714 (= lt!315172 e!391017)))

(declare-fun c!77827 () Bool)

(declare-fun arrayContainsKey!0 (array!39666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686714 (= c!77827 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686714 (arrayContainsKey!0 (array!39667 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19383 a!3626)) k0!2843 from!3004)))

(declare-fun b!686715 () Bool)

(declare-fun e!391016 () Bool)

(assert (=> b!686715 (= e!391016 e!391013)))

(declare-fun res!451801 () Bool)

(assert (=> b!686715 (=> (not res!451801) (not e!391013))))

(assert (=> b!686715 (= res!451801 (bvsle from!3004 i!1382))))

(declare-fun b!686716 () Bool)

(declare-fun res!451794 () Bool)

(assert (=> b!686716 (=> (not res!451794) (not e!391020))))

(assert (=> b!686716 (= res!451794 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13047))))

(declare-fun b!686717 () Bool)

(declare-fun res!451790 () Bool)

(assert (=> b!686717 (=> (not res!451790) (not e!391020))))

(assert (=> b!686717 (= res!451790 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19383 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686718 () Bool)

(declare-fun res!451792 () Bool)

(assert (=> b!686718 (=> (not res!451792) (not e!391020))))

(assert (=> b!686718 (= res!451792 (validKeyInArray!0 k0!2843))))

(declare-fun res!451800 () Bool)

(assert (=> start!61282 (=> (not res!451800) (not e!391020))))

(assert (=> start!61282 (= res!451800 (and (bvslt (size!19383 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19383 a!3626))))))

(assert (=> start!61282 e!391020))

(assert (=> start!61282 true))

(declare-fun array_inv!14805 (array!39666) Bool)

(assert (=> start!61282 (array_inv!14805 a!3626)))

(declare-fun b!686709 () Bool)

(declare-fun res!451799 () Bool)

(assert (=> b!686709 (=> (not res!451799) (not e!391020))))

(assert (=> b!686709 (= res!451799 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19383 a!3626))))))

(declare-fun b!686719 () Bool)

(declare-fun lt!315174 () Unit!24212)

(assert (=> b!686719 (= e!391015 lt!315174)))

(declare-fun lt!315176 () Unit!24212)

(assert (=> b!686719 (= lt!315176 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686719 (subseq!213 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39666 List!13050 List!13050 (_ BitVec 32)) Unit!24212)

(assert (=> b!686719 (= lt!315174 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!378 acc!681 (select (arr!19009 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686719 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686720 () Bool)

(assert (=> b!686720 (= e!391018 (noDuplicate!874 lt!315170))))

(declare-fun b!686721 () Bool)

(declare-fun res!451798 () Bool)

(assert (=> b!686721 (=> (not res!451798) (not e!391020))))

(assert (=> b!686721 (= res!451798 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686722 () Bool)

(declare-fun Unit!24215 () Unit!24212)

(assert (=> b!686722 (= e!391015 Unit!24215)))

(declare-fun b!686723 () Bool)

(declare-fun res!451788 () Bool)

(assert (=> b!686723 (=> (not res!451788) (not e!391020))))

(assert (=> b!686723 (= res!451788 e!391016)))

(declare-fun res!451795 () Bool)

(assert (=> b!686723 (=> res!451795 e!391016)))

(assert (=> b!686723 (= res!451795 e!391014)))

(declare-fun res!451791 () Bool)

(assert (=> b!686723 (=> (not res!451791) (not e!391014))))

(assert (=> b!686723 (= res!451791 (bvsgt from!3004 i!1382))))

(declare-fun b!686724 () Bool)

(declare-fun res!451796 () Bool)

(assert (=> b!686724 (=> (not res!451796) (not e!391020))))

(assert (=> b!686724 (= res!451796 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686725 () Bool)

(declare-fun res!451793 () Bool)

(assert (=> b!686725 (=> (not res!451793) (not e!391020))))

(assert (=> b!686725 (= res!451793 (not (contains!3627 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686726 () Bool)

(declare-fun Unit!24216 () Unit!24212)

(assert (=> b!686726 (= e!391017 Unit!24216)))

(assert (= (and start!61282 res!451800) b!686710))

(assert (= (and b!686710 res!451802) b!686713))

(assert (= (and b!686713 res!451797) b!686725))

(assert (= (and b!686725 res!451793) b!686723))

(assert (= (and b!686723 res!451791) b!686711))

(assert (= (and b!686723 (not res!451795)) b!686715))

(assert (= (and b!686715 res!451801) b!686708))

(assert (= (and b!686723 res!451788) b!686716))

(assert (= (and b!686716 res!451794) b!686724))

(assert (= (and b!686724 res!451796) b!686709))

(assert (= (and b!686709 res!451799) b!686718))

(assert (= (and b!686718 res!451792) b!686721))

(assert (= (and b!686721 res!451798) b!686717))

(assert (= (and b!686717 res!451790) b!686714))

(assert (= (and b!686714 c!77827) b!686712))

(assert (= (and b!686714 (not c!77827)) b!686726))

(assert (= (and b!686714 c!77828) b!686719))

(assert (= (and b!686714 (not c!77828)) b!686722))

(assert (= (and b!686714 (not res!451789)) b!686720))

(declare-fun m!650781 () Bool)

(assert (=> b!686712 m!650781))

(declare-fun m!650783 () Bool)

(assert (=> b!686711 m!650783))

(declare-fun m!650785 () Bool)

(assert (=> b!686725 m!650785))

(declare-fun m!650787 () Bool)

(assert (=> b!686710 m!650787))

(declare-fun m!650789 () Bool)

(assert (=> b!686720 m!650789))

(declare-fun m!650791 () Bool)

(assert (=> b!686721 m!650791))

(declare-fun m!650793 () Bool)

(assert (=> b!686713 m!650793))

(declare-fun m!650795 () Bool)

(assert (=> start!61282 m!650795))

(declare-fun m!650797 () Bool)

(assert (=> b!686714 m!650797))

(declare-fun m!650799 () Bool)

(assert (=> b!686714 m!650799))

(declare-fun m!650801 () Bool)

(assert (=> b!686714 m!650801))

(declare-fun m!650803 () Bool)

(assert (=> b!686714 m!650803))

(declare-fun m!650805 () Bool)

(assert (=> b!686714 m!650805))

(declare-fun m!650807 () Bool)

(assert (=> b!686714 m!650807))

(declare-fun m!650809 () Bool)

(assert (=> b!686714 m!650809))

(declare-fun m!650811 () Bool)

(assert (=> b!686714 m!650811))

(assert (=> b!686714 m!650799))

(declare-fun m!650813 () Bool)

(assert (=> b!686714 m!650813))

(declare-fun m!650815 () Bool)

(assert (=> b!686714 m!650815))

(declare-fun m!650817 () Bool)

(assert (=> b!686714 m!650817))

(declare-fun m!650819 () Bool)

(assert (=> b!686714 m!650819))

(declare-fun m!650821 () Bool)

(assert (=> b!686714 m!650821))

(declare-fun m!650823 () Bool)

(assert (=> b!686724 m!650823))

(assert (=> b!686708 m!650783))

(declare-fun m!650825 () Bool)

(assert (=> b!686718 m!650825))

(declare-fun m!650827 () Bool)

(assert (=> b!686716 m!650827))

(assert (=> b!686719 m!650797))

(assert (=> b!686719 m!650799))

(declare-fun m!650829 () Bool)

(assert (=> b!686719 m!650829))

(declare-fun m!650831 () Bool)

(assert (=> b!686719 m!650831))

(assert (=> b!686719 m!650799))

(assert (=> b!686719 m!650829))

(assert (=> b!686719 m!650809))

(assert (=> b!686719 m!650821))

(check-sat (not b!686711) (not b!686708) (not b!686725) (not b!686724) (not b!686720) (not b!686710) (not b!686713) (not start!61282) (not b!686714) (not b!686719) (not b!686721) (not b!686718) (not b!686716) (not b!686712))
(check-sat)
(get-model)

(declare-fun d!94767 () Bool)

(assert (=> d!94767 (= (array_inv!14805 a!3626) (bvsge (size!19383 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61282 d!94767))

(declare-fun b!686794 () Bool)

(declare-fun e!391053 () Bool)

(declare-fun e!391056 () Bool)

(assert (=> b!686794 (= e!391053 e!391056)))

(declare-fun c!77837 () Bool)

(assert (=> b!686794 (= c!77837 (validKeyInArray!0 (select (arr!19009 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34100 () Bool)

(declare-fun call!34103 () Bool)

(assert (=> bm!34100 (= call!34103 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77837 (Cons!13046 (select (arr!19009 a!3626) #b00000000000000000000000000000000) Nil!13047) Nil!13047)))))

(declare-fun b!686795 () Bool)

(declare-fun e!391054 () Bool)

(assert (=> b!686795 (= e!391054 e!391053)))

(declare-fun res!451856 () Bool)

(assert (=> b!686795 (=> (not res!451856) (not e!391053))))

(declare-fun e!391055 () Bool)

(assert (=> b!686795 (= res!451856 (not e!391055))))

(declare-fun res!451854 () Bool)

(assert (=> b!686795 (=> (not res!451854) (not e!391055))))

(assert (=> b!686795 (= res!451854 (validKeyInArray!0 (select (arr!19009 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686796 () Bool)

(assert (=> b!686796 (= e!391056 call!34103)))

(declare-fun d!94769 () Bool)

(declare-fun res!451855 () Bool)

(assert (=> d!94769 (=> res!451855 e!391054)))

(assert (=> d!94769 (= res!451855 (bvsge #b00000000000000000000000000000000 (size!19383 a!3626)))))

(assert (=> d!94769 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13047) e!391054)))

(declare-fun b!686797 () Bool)

(assert (=> b!686797 (= e!391055 (contains!3627 Nil!13047 (select (arr!19009 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686798 () Bool)

(assert (=> b!686798 (= e!391056 call!34103)))

(assert (= (and d!94769 (not res!451855)) b!686795))

(assert (= (and b!686795 res!451854) b!686797))

(assert (= (and b!686795 res!451856) b!686794))

(assert (= (and b!686794 c!77837) b!686798))

(assert (= (and b!686794 (not c!77837)) b!686796))

(assert (= (or b!686798 b!686796) bm!34100))

(declare-fun m!650885 () Bool)

(assert (=> b!686794 m!650885))

(assert (=> b!686794 m!650885))

(declare-fun m!650887 () Bool)

(assert (=> b!686794 m!650887))

(assert (=> bm!34100 m!650885))

(declare-fun m!650889 () Bool)

(assert (=> bm!34100 m!650889))

(assert (=> b!686795 m!650885))

(assert (=> b!686795 m!650885))

(assert (=> b!686795 m!650887))

(assert (=> b!686797 m!650885))

(assert (=> b!686797 m!650885))

(declare-fun m!650891 () Bool)

(assert (=> b!686797 m!650891))

(assert (=> b!686716 d!94769))

(declare-fun d!94775 () Bool)

(assert (=> d!94775 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686718 d!94775))

(declare-fun b!686809 () Bool)

(declare-fun e!391065 () Bool)

(declare-fun e!391068 () Bool)

(assert (=> b!686809 (= e!391065 e!391068)))

(declare-fun c!77840 () Bool)

(assert (=> b!686809 (= c!77840 (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)))))

(declare-fun call!34106 () Bool)

(declare-fun bm!34103 () Bool)

(assert (=> bm!34103 (= call!34106 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77840 (Cons!13046 (select (arr!19009 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!686810 () Bool)

(declare-fun e!391066 () Bool)

(assert (=> b!686810 (= e!391066 e!391065)))

(declare-fun res!451865 () Bool)

(assert (=> b!686810 (=> (not res!451865) (not e!391065))))

(declare-fun e!391067 () Bool)

(assert (=> b!686810 (= res!451865 (not e!391067))))

(declare-fun res!451863 () Bool)

(assert (=> b!686810 (=> (not res!451863) (not e!391067))))

(assert (=> b!686810 (= res!451863 (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)))))

(declare-fun b!686811 () Bool)

(assert (=> b!686811 (= e!391068 call!34106)))

(declare-fun d!94779 () Bool)

(declare-fun res!451864 () Bool)

(assert (=> d!94779 (=> res!451864 e!391066)))

(assert (=> d!94779 (= res!451864 (bvsge from!3004 (size!19383 a!3626)))))

(assert (=> d!94779 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391066)))

(declare-fun b!686812 () Bool)

(assert (=> b!686812 (= e!391067 (contains!3627 acc!681 (select (arr!19009 a!3626) from!3004)))))

(declare-fun b!686813 () Bool)

(assert (=> b!686813 (= e!391068 call!34106)))

(assert (= (and d!94779 (not res!451864)) b!686810))

(assert (= (and b!686810 res!451863) b!686812))

(assert (= (and b!686810 res!451865) b!686809))

(assert (= (and b!686809 c!77840) b!686813))

(assert (= (and b!686809 (not c!77840)) b!686811))

(assert (= (or b!686813 b!686811) bm!34103))

(assert (=> b!686809 m!650799))

(assert (=> b!686809 m!650799))

(assert (=> b!686809 m!650813))

(assert (=> bm!34103 m!650799))

(declare-fun m!650893 () Bool)

(assert (=> bm!34103 m!650893))

(assert (=> b!686810 m!650799))

(assert (=> b!686810 m!650799))

(assert (=> b!686810 m!650813))

(assert (=> b!686812 m!650799))

(assert (=> b!686812 m!650799))

(declare-fun m!650895 () Bool)

(assert (=> b!686812 m!650895))

(assert (=> b!686724 d!94779))

(declare-fun d!94781 () Bool)

(declare-fun lt!315208 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!294 (List!13050) (InoxSet (_ BitVec 64)))

(assert (=> d!94781 (= lt!315208 (select (content!294 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391084 () Bool)

(assert (=> d!94781 (= lt!315208 e!391084)))

(declare-fun res!451879 () Bool)

(assert (=> d!94781 (=> (not res!451879) (not e!391084))))

(get-info :version)

(assert (=> d!94781 (= res!451879 ((_ is Cons!13046) acc!681))))

(assert (=> d!94781 (= (contains!3627 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315208)))

(declare-fun b!686829 () Bool)

(declare-fun e!391083 () Bool)

(assert (=> b!686829 (= e!391084 e!391083)))

(declare-fun res!451880 () Bool)

(assert (=> b!686829 (=> res!451880 e!391083)))

(assert (=> b!686829 (= res!451880 (= (h!14091 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686830 () Bool)

(assert (=> b!686830 (= e!391083 (contains!3627 (t!19305 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94781 res!451879) b!686829))

(assert (= (and b!686829 (not res!451880)) b!686830))

(declare-fun m!650909 () Bool)

(assert (=> d!94781 m!650909))

(declare-fun m!650911 () Bool)

(assert (=> d!94781 m!650911))

(declare-fun m!650913 () Bool)

(assert (=> b!686830 m!650913))

(assert (=> b!686725 d!94781))

(declare-fun b!686831 () Bool)

(declare-fun e!391085 () Bool)

(declare-fun e!391088 () Bool)

(assert (=> b!686831 (= e!391085 e!391088)))

(declare-fun c!77842 () Bool)

(assert (=> b!686831 (= c!77842 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34108 () Bool)

(declare-fun bm!34105 () Bool)

(assert (=> bm!34105 (= call!34108 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77842 (Cons!13046 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315170) lt!315170)))))

(declare-fun b!686832 () Bool)

(declare-fun e!391086 () Bool)

(assert (=> b!686832 (= e!391086 e!391085)))

(declare-fun res!451883 () Bool)

(assert (=> b!686832 (=> (not res!451883) (not e!391085))))

(declare-fun e!391087 () Bool)

(assert (=> b!686832 (= res!451883 (not e!391087))))

(declare-fun res!451881 () Bool)

(assert (=> b!686832 (=> (not res!451881) (not e!391087))))

(assert (=> b!686832 (= res!451881 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686833 () Bool)

(assert (=> b!686833 (= e!391088 call!34108)))

(declare-fun d!94791 () Bool)

(declare-fun res!451882 () Bool)

(assert (=> d!94791 (=> res!451882 e!391086)))

(assert (=> d!94791 (= res!451882 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19383 a!3626)))))

(assert (=> d!94791 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315170) e!391086)))

(declare-fun b!686834 () Bool)

(assert (=> b!686834 (= e!391087 (contains!3627 lt!315170 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686835 () Bool)

(assert (=> b!686835 (= e!391088 call!34108)))

(assert (= (and d!94791 (not res!451882)) b!686832))

(assert (= (and b!686832 res!451881) b!686834))

(assert (= (and b!686832 res!451883) b!686831))

(assert (= (and b!686831 c!77842) b!686835))

(assert (= (and b!686831 (not c!77842)) b!686833))

(assert (= (or b!686835 b!686833) bm!34105))

(declare-fun m!650915 () Bool)

(assert (=> b!686831 m!650915))

(assert (=> b!686831 m!650915))

(declare-fun m!650917 () Bool)

(assert (=> b!686831 m!650917))

(assert (=> bm!34105 m!650915))

(declare-fun m!650919 () Bool)

(assert (=> bm!34105 m!650919))

(assert (=> b!686832 m!650915))

(assert (=> b!686832 m!650915))

(assert (=> b!686832 m!650917))

(assert (=> b!686834 m!650915))

(assert (=> b!686834 m!650915))

(declare-fun m!650921 () Bool)

(assert (=> b!686834 m!650921))

(assert (=> b!686714 d!94791))

(declare-fun b!686872 () Bool)

(declare-fun e!391126 () List!13050)

(declare-fun e!391124 () List!13050)

(assert (=> b!686872 (= e!391126 e!391124)))

(declare-fun c!77848 () Bool)

(assert (=> b!686872 (= c!77848 (= k0!2843 (h!14091 lt!315170)))))

(declare-fun b!686873 () Bool)

(declare-fun call!34111 () List!13050)

(assert (=> b!686873 (= e!391124 (Cons!13046 (h!14091 lt!315170) call!34111))))

(declare-fun bm!34108 () Bool)

(assert (=> bm!34108 (= call!34111 (-!178 (t!19305 lt!315170) k0!2843))))

(declare-fun d!94793 () Bool)

(declare-fun e!391125 () Bool)

(assert (=> d!94793 e!391125))

(declare-fun res!451914 () Bool)

(assert (=> d!94793 (=> (not res!451914) (not e!391125))))

(declare-fun lt!315217 () List!13050)

(declare-fun size!19385 (List!13050) Int)

(assert (=> d!94793 (= res!451914 (<= (size!19385 lt!315217) (size!19385 lt!315170)))))

(assert (=> d!94793 (= lt!315217 e!391126)))

(declare-fun c!77847 () Bool)

(assert (=> d!94793 (= c!77847 ((_ is Cons!13046) lt!315170))))

(assert (=> d!94793 (= (-!178 lt!315170 k0!2843) lt!315217)))

(declare-fun b!686874 () Bool)

(assert (=> b!686874 (= e!391126 Nil!13047)))

(declare-fun b!686875 () Bool)

(assert (=> b!686875 (= e!391124 call!34111)))

(declare-fun b!686876 () Bool)

(assert (=> b!686876 (= e!391125 (= (content!294 lt!315217) ((_ map and) (content!294 lt!315170) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(assert (= (and d!94793 c!77847) b!686872))

(assert (= (and d!94793 (not c!77847)) b!686874))

(assert (= (and b!686872 c!77848) b!686875))

(assert (= (and b!686872 (not c!77848)) b!686873))

(assert (= (or b!686875 b!686873) bm!34108))

(assert (= (and d!94793 res!451914) b!686876))

(declare-fun m!650941 () Bool)

(assert (=> bm!34108 m!650941))

(declare-fun m!650943 () Bool)

(assert (=> d!94793 m!650943))

(declare-fun m!650945 () Bool)

(assert (=> d!94793 m!650945))

(declare-fun m!650947 () Bool)

(assert (=> b!686876 m!650947))

(declare-fun m!650949 () Bool)

(assert (=> b!686876 m!650949))

(declare-fun m!650951 () Bool)

(assert (=> b!686876 m!650951))

(assert (=> b!686714 d!94793))

(declare-fun b!686893 () Bool)

(declare-fun e!391139 () Bool)

(assert (=> b!686893 (= e!391139 (subseq!213 (t!19305 acc!681) (t!19305 acc!681)))))

(declare-fun b!686891 () Bool)

(declare-fun e!391142 () Bool)

(declare-fun e!391140 () Bool)

(assert (=> b!686891 (= e!391142 e!391140)))

(declare-fun res!451927 () Bool)

(assert (=> b!686891 (=> (not res!451927) (not e!391140))))

(assert (=> b!686891 (= res!451927 ((_ is Cons!13046) acc!681))))

(declare-fun d!94805 () Bool)

(declare-fun res!451928 () Bool)

(assert (=> d!94805 (=> res!451928 e!391142)))

(assert (=> d!94805 (= res!451928 ((_ is Nil!13047) acc!681))))

(assert (=> d!94805 (= (subseq!213 acc!681 acc!681) e!391142)))

(declare-fun b!686894 () Bool)

(declare-fun e!391141 () Bool)

(assert (=> b!686894 (= e!391141 (subseq!213 acc!681 (t!19305 acc!681)))))

(declare-fun b!686892 () Bool)

(assert (=> b!686892 (= e!391140 e!391141)))

(declare-fun res!451929 () Bool)

(assert (=> b!686892 (=> res!451929 e!391141)))

(assert (=> b!686892 (= res!451929 e!391139)))

(declare-fun res!451930 () Bool)

(assert (=> b!686892 (=> (not res!451930) (not e!391139))))

(assert (=> b!686892 (= res!451930 (= (h!14091 acc!681) (h!14091 acc!681)))))

(assert (= (and d!94805 (not res!451928)) b!686891))

(assert (= (and b!686891 res!451927) b!686892))

(assert (= (and b!686892 res!451930) b!686893))

(assert (= (and b!686892 (not res!451929)) b!686894))

(declare-fun m!650961 () Bool)

(assert (=> b!686893 m!650961))

(declare-fun m!650963 () Bool)

(assert (=> b!686894 m!650963))

(assert (=> b!686714 d!94805))

(declare-fun d!94811 () Bool)

(declare-fun res!451939 () Bool)

(declare-fun e!391161 () Bool)

(assert (=> d!94811 (=> res!451939 e!391161)))

(assert (=> d!94811 (= res!451939 (= (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94811 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391161)))

(declare-fun b!686917 () Bool)

(declare-fun e!391162 () Bool)

(assert (=> b!686917 (= e!391161 e!391162)))

(declare-fun res!451940 () Bool)

(assert (=> b!686917 (=> (not res!451940) (not e!391162))))

(assert (=> b!686917 (= res!451940 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19383 a!3626)))))

(declare-fun b!686918 () Bool)

(assert (=> b!686918 (= e!391162 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94811 (not res!451939)) b!686917))

(assert (= (and b!686917 res!451940) b!686918))

(assert (=> d!94811 m!650915))

(declare-fun m!650965 () Bool)

(assert (=> b!686918 m!650965))

(assert (=> b!686714 d!94811))

(declare-fun d!94813 () Bool)

(assert (=> d!94813 (= (-!178 ($colon$colon!378 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!315229 () Unit!24212)

(declare-fun choose!16 ((_ BitVec 64) List!13050) Unit!24212)

(assert (=> d!94813 (= lt!315229 (choose!16 k0!2843 acc!681))))

(assert (=> d!94813 (not (contains!3627 acc!681 k0!2843))))

(assert (=> d!94813 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!315229)))

(declare-fun bs!20133 () Bool)

(assert (= bs!20133 d!94813))

(assert (=> bs!20133 m!650811))

(assert (=> bs!20133 m!650811))

(declare-fun m!650983 () Bool)

(assert (=> bs!20133 m!650983))

(declare-fun m!650985 () Bool)

(assert (=> bs!20133 m!650985))

(assert (=> bs!20133 m!650783))

(assert (=> b!686714 d!94813))

(declare-fun d!94819 () Bool)

(declare-fun res!451945 () Bool)

(declare-fun e!391171 () Bool)

(assert (=> d!94819 (=> res!451945 e!391171)))

(assert (=> d!94819 (= res!451945 (= (select (arr!19009 (array!39667 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19383 a!3626))) from!3004) k0!2843))))

(assert (=> d!94819 (= (arrayContainsKey!0 (array!39667 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19383 a!3626)) k0!2843 from!3004) e!391171)))

(declare-fun b!686933 () Bool)

(declare-fun e!391172 () Bool)

(assert (=> b!686933 (= e!391171 e!391172)))

(declare-fun res!451946 () Bool)

(assert (=> b!686933 (=> (not res!451946) (not e!391172))))

(assert (=> b!686933 (= res!451946 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19383 (array!39667 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19383 a!3626)))))))

(declare-fun b!686934 () Bool)

(assert (=> b!686934 (= e!391172 (arrayContainsKey!0 (array!39667 (store (arr!19009 a!3626) i!1382 k0!2843) (size!19383 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94819 (not res!451945)) b!686933))

(assert (= (and b!686933 res!451946) b!686934))

(declare-fun m!650999 () Bool)

(assert (=> d!94819 m!650999))

(declare-fun m!651001 () Bool)

(assert (=> b!686934 m!651001))

(assert (=> b!686714 d!94819))

(declare-fun d!94823 () Bool)

(assert (=> d!94823 (subseq!213 acc!681 acc!681)))

(declare-fun lt!315235 () Unit!24212)

(declare-fun choose!36 (List!13050) Unit!24212)

(assert (=> d!94823 (= lt!315235 (choose!36 acc!681))))

(assert (=> d!94823 (= (lemmaListSubSeqRefl!0 acc!681) lt!315235)))

(declare-fun bs!20135 () Bool)

(assert (= bs!20135 d!94823))

(assert (=> bs!20135 m!650821))

(declare-fun m!651015 () Bool)

(assert (=> bs!20135 m!651015))

(assert (=> b!686714 d!94823))

(declare-fun d!94829 () Bool)

(assert (=> d!94829 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315170)))

(declare-fun lt!315238 () Unit!24212)

(declare-fun choose!66 (array!39666 (_ BitVec 64) (_ BitVec 32) List!13050 List!13050) Unit!24212)

(assert (=> d!94829 (= lt!315238 (choose!66 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315170))))

(assert (=> d!94829 (bvslt (size!19383 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94829 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315170) lt!315238)))

(declare-fun bs!20136 () Bool)

(assert (= bs!20136 d!94829))

(assert (=> bs!20136 m!650815))

(declare-fun m!651019 () Bool)

(assert (=> bs!20136 m!651019))

(assert (=> b!686714 d!94829))

(declare-fun d!94833 () Bool)

(assert (=> d!94833 (= (validKeyInArray!0 (select (arr!19009 a!3626) from!3004)) (and (not (= (select (arr!19009 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19009 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686714 d!94833))

(declare-fun d!94835 () Bool)

(assert (=> d!94835 (= ($colon$colon!378 acc!681 k0!2843) (Cons!13046 k0!2843 acc!681))))

(assert (=> b!686714 d!94835))

(declare-fun b!686960 () Bool)

(declare-fun e!391195 () Bool)

(declare-fun e!391198 () Bool)

(assert (=> b!686960 (= e!391195 e!391198)))

(declare-fun c!77864 () Bool)

(assert (=> b!686960 (= c!77864 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun call!34121 () Bool)

(declare-fun bm!34118 () Bool)

(assert (=> bm!34118 (= call!34121 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77864 (Cons!13046 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!686961 () Bool)

(declare-fun e!391196 () Bool)

(assert (=> b!686961 (= e!391196 e!391195)))

(declare-fun res!451968 () Bool)

(assert (=> b!686961 (=> (not res!451968) (not e!391195))))

(declare-fun e!391197 () Bool)

(assert (=> b!686961 (= res!451968 (not e!391197))))

(declare-fun res!451966 () Bool)

(assert (=> b!686961 (=> (not res!451966) (not e!391197))))

(assert (=> b!686961 (= res!451966 (validKeyInArray!0 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686962 () Bool)

(assert (=> b!686962 (= e!391198 call!34121)))

(declare-fun d!94837 () Bool)

(declare-fun res!451967 () Bool)

(assert (=> d!94837 (=> res!451967 e!391196)))

(assert (=> d!94837 (= res!451967 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19383 a!3626)))))

(assert (=> d!94837 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391196)))

(declare-fun b!686963 () Bool)

(assert (=> b!686963 (= e!391197 (contains!3627 acc!681 (select (arr!19009 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686964 () Bool)

(assert (=> b!686964 (= e!391198 call!34121)))

(assert (= (and d!94837 (not res!451967)) b!686961))

(assert (= (and b!686961 res!451966) b!686963))

(assert (= (and b!686961 res!451968) b!686960))

(assert (= (and b!686960 c!77864) b!686964))

(assert (= (and b!686960 (not c!77864)) b!686962))

(assert (= (or b!686964 b!686962) bm!34118))

(assert (=> b!686960 m!650915))

(assert (=> b!686960 m!650915))

(assert (=> b!686960 m!650917))

(assert (=> bm!34118 m!650915))

(declare-fun m!651021 () Bool)

(assert (=> bm!34118 m!651021))

(assert (=> b!686961 m!650915))

(assert (=> b!686961 m!650915))

(assert (=> b!686961 m!650917))

(assert (=> b!686963 m!650915))

(assert (=> b!686963 m!650915))

(declare-fun m!651023 () Bool)

(assert (=> b!686963 m!651023))

(assert (=> b!686714 d!94837))

(declare-fun d!94839 () Bool)

(declare-fun lt!315239 () Bool)

(assert (=> d!94839 (= lt!315239 (select (content!294 acc!681) k0!2843))))

(declare-fun e!391200 () Bool)

(assert (=> d!94839 (= lt!315239 e!391200)))

(declare-fun res!451969 () Bool)

(assert (=> d!94839 (=> (not res!451969) (not e!391200))))

(assert (=> d!94839 (= res!451969 ((_ is Cons!13046) acc!681))))

(assert (=> d!94839 (= (contains!3627 acc!681 k0!2843) lt!315239)))

(declare-fun b!686965 () Bool)

(declare-fun e!391199 () Bool)

(assert (=> b!686965 (= e!391200 e!391199)))

(declare-fun res!451970 () Bool)

(assert (=> b!686965 (=> res!451970 e!391199)))

(assert (=> b!686965 (= res!451970 (= (h!14091 acc!681) k0!2843))))

(declare-fun b!686966 () Bool)

(assert (=> b!686966 (= e!391199 (contains!3627 (t!19305 acc!681) k0!2843))))

(assert (= (and d!94839 res!451969) b!686965))

(assert (= (and b!686965 (not res!451970)) b!686966))

(assert (=> d!94839 m!650909))

(declare-fun m!651025 () Bool)

(assert (=> d!94839 m!651025))

(declare-fun m!651027 () Bool)

(assert (=> b!686966 m!651027))

(assert (=> b!686711 d!94839))

(declare-fun d!94841 () Bool)

(assert (=> d!94841 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315244 () Unit!24212)

(declare-fun choose!13 (array!39666 (_ BitVec 64) (_ BitVec 32)) Unit!24212)

(assert (=> d!94841 (= lt!315244 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94841 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94841 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!315244)))

(declare-fun bs!20137 () Bool)

(assert (= bs!20137 d!94841))

(assert (=> bs!20137 m!650791))

(declare-fun m!651039 () Bool)

(assert (=> bs!20137 m!651039))

(assert (=> b!686712 d!94841))

(declare-fun d!94847 () Bool)

(declare-fun lt!315245 () Bool)

(assert (=> d!94847 (= lt!315245 (select (content!294 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!391212 () Bool)

(assert (=> d!94847 (= lt!315245 e!391212)))

(declare-fun res!451980 () Bool)

(assert (=> d!94847 (=> (not res!451980) (not e!391212))))

(assert (=> d!94847 (= res!451980 ((_ is Cons!13046) acc!681))))

(assert (=> d!94847 (= (contains!3627 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315245)))

(declare-fun b!686978 () Bool)

(declare-fun e!391211 () Bool)

(assert (=> b!686978 (= e!391212 e!391211)))

(declare-fun res!451981 () Bool)

(assert (=> b!686978 (=> res!451981 e!391211)))

(assert (=> b!686978 (= res!451981 (= (h!14091 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686979 () Bool)

(assert (=> b!686979 (= e!391211 (contains!3627 (t!19305 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94847 res!451980) b!686978))

(assert (= (and b!686978 (not res!451981)) b!686979))

(assert (=> d!94847 m!650909))

(declare-fun m!651047 () Bool)

(assert (=> d!94847 m!651047))

(declare-fun m!651049 () Bool)

(assert (=> b!686979 m!651049))

(assert (=> b!686713 d!94847))

(declare-fun d!94853 () Bool)

(assert (=> d!94853 (= ($colon$colon!378 acc!681 (select (arr!19009 a!3626) from!3004)) (Cons!13046 (select (arr!19009 a!3626) from!3004) acc!681))))

(assert (=> b!686719 d!94853))

(assert (=> b!686719 d!94805))

(declare-fun d!94857 () Bool)

(assert (=> d!94857 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315252 () Unit!24212)

(declare-fun choose!80 (array!39666 List!13050 List!13050 (_ BitVec 32)) Unit!24212)

(assert (=> d!94857 (= lt!315252 (choose!80 a!3626 ($colon$colon!378 acc!681 (select (arr!19009 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94857 (bvslt (size!19383 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94857 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!378 acc!681 (select (arr!19009 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315252)))

(declare-fun bs!20140 () Bool)

(assert (= bs!20140 d!94857))

(assert (=> bs!20140 m!650797))

(assert (=> bs!20140 m!650829))

(declare-fun m!651057 () Bool)

(assert (=> bs!20140 m!651057))

(assert (=> b!686719 d!94857))

(assert (=> b!686719 d!94823))

(assert (=> b!686719 d!94837))

(assert (=> b!686708 d!94839))

(declare-fun d!94867 () Bool)

(declare-fun res!451992 () Bool)

(declare-fun e!391225 () Bool)

(assert (=> d!94867 (=> res!451992 e!391225)))

(assert (=> d!94867 (= res!451992 ((_ is Nil!13047) lt!315170))))

(assert (=> d!94867 (= (noDuplicate!874 lt!315170) e!391225)))

(declare-fun b!686994 () Bool)

(declare-fun e!391226 () Bool)

(assert (=> b!686994 (= e!391225 e!391226)))

(declare-fun res!451993 () Bool)

(assert (=> b!686994 (=> (not res!451993) (not e!391226))))

(assert (=> b!686994 (= res!451993 (not (contains!3627 (t!19305 lt!315170) (h!14091 lt!315170))))))

(declare-fun b!686995 () Bool)

(assert (=> b!686995 (= e!391226 (noDuplicate!874 (t!19305 lt!315170)))))

(assert (= (and d!94867 (not res!451992)) b!686994))

(assert (= (and b!686994 res!451993) b!686995))

(declare-fun m!651063 () Bool)

(assert (=> b!686994 m!651063))

(declare-fun m!651065 () Bool)

(assert (=> b!686995 m!651065))

(assert (=> b!686720 d!94867))

(declare-fun d!94875 () Bool)

(declare-fun res!451997 () Bool)

(declare-fun e!391231 () Bool)

(assert (=> d!94875 (=> res!451997 e!391231)))

(assert (=> d!94875 (= res!451997 (= (select (arr!19009 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94875 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!391231)))

(declare-fun b!687001 () Bool)

(declare-fun e!391232 () Bool)

(assert (=> b!687001 (= e!391231 e!391232)))

(declare-fun res!451998 () Bool)

(assert (=> b!687001 (=> (not res!451998) (not e!391232))))

(assert (=> b!687001 (= res!451998 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19383 a!3626)))))

(declare-fun b!687002 () Bool)

(assert (=> b!687002 (= e!391232 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94875 (not res!451997)) b!687001))

(assert (= (and b!687001 res!451998) b!687002))

(assert (=> d!94875 m!650885))

(declare-fun m!651071 () Bool)

(assert (=> b!687002 m!651071))

(assert (=> b!686721 d!94875))

(declare-fun d!94879 () Bool)

(declare-fun res!451999 () Bool)

(declare-fun e!391233 () Bool)

(assert (=> d!94879 (=> res!451999 e!391233)))

(assert (=> d!94879 (= res!451999 ((_ is Nil!13047) acc!681))))

(assert (=> d!94879 (= (noDuplicate!874 acc!681) e!391233)))

(declare-fun b!687003 () Bool)

(declare-fun e!391234 () Bool)

(assert (=> b!687003 (= e!391233 e!391234)))

(declare-fun res!452000 () Bool)

(assert (=> b!687003 (=> (not res!452000) (not e!391234))))

(assert (=> b!687003 (= res!452000 (not (contains!3627 (t!19305 acc!681) (h!14091 acc!681))))))

(declare-fun b!687004 () Bool)

(assert (=> b!687004 (= e!391234 (noDuplicate!874 (t!19305 acc!681)))))

(assert (= (and d!94879 (not res!451999)) b!687003))

(assert (= (and b!687003 res!452000) b!687004))

(declare-fun m!651073 () Bool)

(assert (=> b!687003 m!651073))

(declare-fun m!651075 () Bool)

(assert (=> b!687004 m!651075))

(assert (=> b!686710 d!94879))

(check-sat (not bm!34105) (not b!686979) (not b!686893) (not b!686794) (not b!686963) (not b!686934) (not b!686795) (not bm!34118) (not b!687002) (not b!686834) (not b!686797) (not b!686960) (not b!686961) (not b!686918) (not b!686966) (not d!94857) (not d!94847) (not d!94823) (not b!687004) (not b!686831) (not d!94781) (not b!686876) (not d!94793) (not b!686809) (not bm!34108) (not b!686832) (not bm!34100) (not d!94839) (not d!94813) (not b!687003) (not b!686812) (not b!686994) (not b!686894) (not d!94829) (not bm!34103) (not b!686995) (not b!686810) (not d!94841) (not b!686830))
(check-sat)
