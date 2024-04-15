; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60632 () Bool)

(assert start!60632)

(declare-fun b!680765 () Bool)

(declare-fun res!447107 () Bool)

(declare-fun e!387815 () Bool)

(assert (=> b!680765 (=> (not res!447107) (not e!387815))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39510 0))(
  ( (array!39511 (arr!18941 (Array (_ BitVec 32) (_ BitVec 64))) (size!19306 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39510)

(assert (=> b!680765 (= res!447107 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19306 a!3626))))))

(declare-fun b!680766 () Bool)

(declare-fun res!447122 () Bool)

(assert (=> b!680766 (=> (not res!447122) (not e!387815))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680766 (= res!447122 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680767 () Bool)

(declare-fun res!447111 () Bool)

(assert (=> b!680767 (=> (not res!447111) (not e!387815))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!680767 (= res!447111 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19306 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680768 () Bool)

(declare-fun e!387809 () Bool)

(assert (=> b!680768 (= e!387815 (not e!387809))))

(declare-fun res!447118 () Bool)

(assert (=> b!680768 (=> res!447118 e!387809)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680768 (= res!447118 (not (validKeyInArray!0 (select (arr!18941 a!3626) from!3004))))))

(declare-datatypes ((Unit!23864 0))(
  ( (Unit!23865) )
))
(declare-fun lt!312953 () Unit!23864)

(declare-fun e!387812 () Unit!23864)

(assert (=> b!680768 (= lt!312953 e!387812)))

(declare-fun c!77196 () Bool)

(assert (=> b!680768 (= c!77196 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680768 (arrayContainsKey!0 (array!39511 (store (arr!18941 a!3626) i!1382 k0!2843) (size!19306 a!3626)) k0!2843 from!3004)))

(declare-fun b!680769 () Bool)

(declare-fun res!447113 () Bool)

(assert (=> b!680769 (=> (not res!447113) (not e!387815))))

(assert (=> b!680769 (= res!447113 (validKeyInArray!0 k0!2843))))

(declare-fun b!680770 () Bool)

(declare-fun e!387810 () Bool)

(declare-datatypes ((List!13021 0))(
  ( (Nil!13018) (Cons!13017 (h!14062 (_ BitVec 64)) (t!19246 List!13021)) )
))
(declare-fun acc!681 () List!13021)

(declare-fun contains!3543 (List!13021 (_ BitVec 64)) Bool)

(assert (=> b!680770 (= e!387810 (not (contains!3543 acc!681 k0!2843)))))

(declare-fun b!680771 () Bool)

(declare-fun res!447110 () Bool)

(declare-fun e!387808 () Bool)

(assert (=> b!680771 (=> res!447110 e!387808)))

(declare-fun lt!312954 () List!13021)

(assert (=> b!680771 (= res!447110 (contains!3543 lt!312954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680772 () Bool)

(declare-fun res!447120 () Bool)

(assert (=> b!680772 (=> (not res!447120) (not e!387815))))

(declare-fun e!387813 () Bool)

(assert (=> b!680772 (= res!447120 e!387813)))

(declare-fun res!447117 () Bool)

(assert (=> b!680772 (=> res!447117 e!387813)))

(declare-fun e!387811 () Bool)

(assert (=> b!680772 (= res!447117 e!387811)))

(declare-fun res!447115 () Bool)

(assert (=> b!680772 (=> (not res!447115) (not e!387811))))

(assert (=> b!680772 (= res!447115 (bvsgt from!3004 i!1382))))

(declare-fun b!680773 () Bool)

(declare-fun res!447124 () Bool)

(assert (=> b!680773 (=> (not res!447124) (not e!387815))))

(declare-fun arrayNoDuplicates!0 (array!39510 (_ BitVec 32) List!13021) Bool)

(assert (=> b!680773 (= res!447124 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680774 () Bool)

(assert (=> b!680774 (= e!387811 (contains!3543 acc!681 k0!2843))))

(declare-fun res!447121 () Bool)

(assert (=> start!60632 (=> (not res!447121) (not e!387815))))

(assert (=> start!60632 (= res!447121 (and (bvslt (size!19306 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19306 a!3626))))))

(assert (=> start!60632 e!387815))

(assert (=> start!60632 true))

(declare-fun array_inv!14824 (array!39510) Bool)

(assert (=> start!60632 (array_inv!14824 a!3626)))

(declare-fun b!680775 () Bool)

(declare-fun Unit!23866 () Unit!23864)

(assert (=> b!680775 (= e!387812 Unit!23866)))

(declare-fun b!680776 () Bool)

(declare-fun res!447116 () Bool)

(assert (=> b!680776 (=> (not res!447116) (not e!387815))))

(assert (=> b!680776 (= res!447116 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13018))))

(declare-fun b!680777 () Bool)

(declare-fun res!447114 () Bool)

(assert (=> b!680777 (=> (not res!447114) (not e!387815))))

(declare-fun noDuplicate!812 (List!13021) Bool)

(assert (=> b!680777 (= res!447114 (noDuplicate!812 acc!681))))

(declare-fun b!680778 () Bool)

(assert (=> b!680778 (= e!387813 e!387810)))

(declare-fun res!447123 () Bool)

(assert (=> b!680778 (=> (not res!447123) (not e!387810))))

(assert (=> b!680778 (= res!447123 (bvsle from!3004 i!1382))))

(declare-fun b!680779 () Bool)

(declare-fun res!447108 () Bool)

(assert (=> b!680779 (=> (not res!447108) (not e!387815))))

(assert (=> b!680779 (= res!447108 (not (contains!3543 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680780 () Bool)

(assert (=> b!680780 (= e!387809 e!387808)))

(declare-fun res!447109 () Bool)

(assert (=> b!680780 (=> res!447109 e!387808)))

(assert (=> b!680780 (= res!447109 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!310 (List!13021 (_ BitVec 64)) List!13021)

(assert (=> b!680780 (= lt!312954 ($colon$colon!310 acc!681 (select (arr!18941 a!3626) from!3004)))))

(declare-fun subseq!146 (List!13021 List!13021) Bool)

(assert (=> b!680780 (subseq!146 acc!681 acc!681)))

(declare-fun lt!312952 () Unit!23864)

(declare-fun lemmaListSubSeqRefl!0 (List!13021) Unit!23864)

(assert (=> b!680780 (= lt!312952 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680781 () Bool)

(declare-fun Unit!23867 () Unit!23864)

(assert (=> b!680781 (= e!387812 Unit!23867)))

(declare-fun lt!312951 () Unit!23864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39510 (_ BitVec 64) (_ BitVec 32)) Unit!23864)

(assert (=> b!680781 (= lt!312951 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!680781 false))

(declare-fun b!680782 () Bool)

(assert (=> b!680782 (= e!387808 true)))

(declare-fun lt!312950 () Bool)

(assert (=> b!680782 (= lt!312950 (contains!3543 lt!312954 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680783 () Bool)

(declare-fun res!447112 () Bool)

(assert (=> b!680783 (=> (not res!447112) (not e!387815))))

(assert (=> b!680783 (= res!447112 (not (contains!3543 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680784 () Bool)

(declare-fun res!447119 () Bool)

(assert (=> b!680784 (=> res!447119 e!387808)))

(assert (=> b!680784 (= res!447119 (not (noDuplicate!812 lt!312954)))))

(assert (= (and start!60632 res!447121) b!680777))

(assert (= (and b!680777 res!447114) b!680779))

(assert (= (and b!680779 res!447108) b!680783))

(assert (= (and b!680783 res!447112) b!680772))

(assert (= (and b!680772 res!447115) b!680774))

(assert (= (and b!680772 (not res!447117)) b!680778))

(assert (= (and b!680778 res!447123) b!680770))

(assert (= (and b!680772 res!447120) b!680776))

(assert (= (and b!680776 res!447116) b!680773))

(assert (= (and b!680773 res!447124) b!680765))

(assert (= (and b!680765 res!447107) b!680769))

(assert (= (and b!680769 res!447113) b!680766))

(assert (= (and b!680766 res!447122) b!680767))

(assert (= (and b!680767 res!447111) b!680768))

(assert (= (and b!680768 c!77196) b!680781))

(assert (= (and b!680768 (not c!77196)) b!680775))

(assert (= (and b!680768 (not res!447118)) b!680780))

(assert (= (and b!680780 (not res!447109)) b!680784))

(assert (= (and b!680784 (not res!447119)) b!680771))

(assert (= (and b!680771 (not res!447110)) b!680782))

(declare-fun m!645225 () Bool)

(assert (=> b!680781 m!645225))

(declare-fun m!645227 () Bool)

(assert (=> b!680776 m!645227))

(declare-fun m!645229 () Bool)

(assert (=> b!680770 m!645229))

(declare-fun m!645231 () Bool)

(assert (=> b!680779 m!645231))

(declare-fun m!645233 () Bool)

(assert (=> b!680784 m!645233))

(declare-fun m!645235 () Bool)

(assert (=> start!60632 m!645235))

(declare-fun m!645237 () Bool)

(assert (=> b!680768 m!645237))

(declare-fun m!645239 () Bool)

(assert (=> b!680768 m!645239))

(declare-fun m!645241 () Bool)

(assert (=> b!680768 m!645241))

(assert (=> b!680768 m!645237))

(declare-fun m!645243 () Bool)

(assert (=> b!680768 m!645243))

(declare-fun m!645245 () Bool)

(assert (=> b!680768 m!645245))

(declare-fun m!645247 () Bool)

(assert (=> b!680782 m!645247))

(declare-fun m!645249 () Bool)

(assert (=> b!680777 m!645249))

(assert (=> b!680780 m!645237))

(assert (=> b!680780 m!645237))

(declare-fun m!645251 () Bool)

(assert (=> b!680780 m!645251))

(declare-fun m!645253 () Bool)

(assert (=> b!680780 m!645253))

(declare-fun m!645255 () Bool)

(assert (=> b!680780 m!645255))

(declare-fun m!645257 () Bool)

(assert (=> b!680783 m!645257))

(declare-fun m!645259 () Bool)

(assert (=> b!680769 m!645259))

(declare-fun m!645261 () Bool)

(assert (=> b!680771 m!645261))

(declare-fun m!645263 () Bool)

(assert (=> b!680773 m!645263))

(declare-fun m!645265 () Bool)

(assert (=> b!680766 m!645265))

(assert (=> b!680774 m!645229))

(check-sat (not b!680770) (not b!680784) (not b!680779) (not b!680777) (not b!680773) (not b!680782) (not b!680766) (not b!680780) (not b!680781) (not b!680771) (not b!680768) (not b!680774) (not start!60632) (not b!680769) (not b!680776) (not b!680783))
(check-sat)
