; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63514 () Bool)

(assert start!63514)

(declare-datatypes ((List!13486 0))(
  ( (Nil!13483) (Cons!13482 (h!14527 (_ BitVec 64)) (t!19792 List!13486)) )
))
(declare-fun newAcc!49 () List!13486)

(declare-fun b!715544 () Bool)

(declare-datatypes ((array!40539 0))(
  ( (array!40540 (arr!19406 (Array (_ BitVec 32) (_ BitVec 64))) (size!19821 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40539)

(declare-fun e!401712 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40539 (_ BitVec 32) List!13486) Bool)

(assert (=> b!715544 (= e!401712 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(assert (=> b!715544 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24614 0))(
  ( (Unit!24615) )
))
(declare-fun lt!318599 () Unit!24614)

(declare-fun acc!652 () List!13486)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40539 (_ BitVec 64) (_ BitVec 32) List!13486 List!13486) Unit!24614)

(assert (=> b!715544 (= lt!318599 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!715545 () Bool)

(declare-fun res!478689 () Bool)

(assert (=> b!715545 (=> (not res!478689) (not e!401712))))

(assert (=> b!715545 (= res!478689 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19821 a!3591)))))

(declare-fun b!715546 () Bool)

(declare-fun res!478688 () Bool)

(assert (=> b!715546 (=> (not res!478688) (not e!401712))))

(declare-fun contains!4008 (List!13486 (_ BitVec 64)) Bool)

(assert (=> b!715546 (= res!478688 (not (contains!4008 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715547 () Bool)

(declare-fun res!478691 () Bool)

(assert (=> b!715547 (=> (not res!478691) (not e!401712))))

(assert (=> b!715547 (= res!478691 (not (contains!4008 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!478687 () Bool)

(assert (=> start!63514 (=> (not res!478687) (not e!401712))))

(assert (=> start!63514 (= res!478687 (and (bvslt (size!19821 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19821 a!3591))))))

(assert (=> start!63514 e!401712))

(assert (=> start!63514 true))

(declare-fun array_inv!15289 (array!40539) Bool)

(assert (=> start!63514 (array_inv!15289 a!3591)))

(declare-fun b!715548 () Bool)

(declare-fun res!478696 () Bool)

(assert (=> b!715548 (=> (not res!478696) (not e!401712))))

(assert (=> b!715548 (= res!478696 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715549 () Bool)

(declare-fun res!478697 () Bool)

(assert (=> b!715549 (=> (not res!478697) (not e!401712))))

(declare-fun arrayContainsKey!0 (array!40539 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715549 (= res!478697 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715550 () Bool)

(declare-fun res!478686 () Bool)

(assert (=> b!715550 (=> (not res!478686) (not e!401712))))

(assert (=> b!715550 (= res!478686 (not (contains!4008 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715551 () Bool)

(declare-fun res!478693 () Bool)

(assert (=> b!715551 (=> (not res!478693) (not e!401712))))

(assert (=> b!715551 (= res!478693 (contains!4008 newAcc!49 k0!2824))))

(declare-fun b!715552 () Bool)

(declare-fun res!478682 () Bool)

(assert (=> b!715552 (=> (not res!478682) (not e!401712))))

(assert (=> b!715552 (= res!478682 (not (contains!4008 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715553 () Bool)

(declare-fun res!478698 () Bool)

(assert (=> b!715553 (=> (not res!478698) (not e!401712))))

(declare-fun noDuplicate!1277 (List!13486) Bool)

(assert (=> b!715553 (= res!478698 (noDuplicate!1277 newAcc!49))))

(declare-fun b!715554 () Bool)

(declare-fun res!478695 () Bool)

(assert (=> b!715554 (=> (not res!478695) (not e!401712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715554 (= res!478695 (validKeyInArray!0 k0!2824))))

(declare-fun b!715555 () Bool)

(declare-fun res!478694 () Bool)

(assert (=> b!715555 (=> (not res!478694) (not e!401712))))

(declare-fun -!435 (List!13486 (_ BitVec 64)) List!13486)

(assert (=> b!715555 (= res!478694 (= (-!435 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715556 () Bool)

(declare-fun res!478683 () Bool)

(assert (=> b!715556 (=> (not res!478683) (not e!401712))))

(assert (=> b!715556 (= res!478683 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715557 () Bool)

(declare-fun res!478692 () Bool)

(assert (=> b!715557 (=> (not res!478692) (not e!401712))))

(assert (=> b!715557 (= res!478692 (not (contains!4008 acc!652 k0!2824)))))

(declare-fun b!715558 () Bool)

(declare-fun res!478680 () Bool)

(assert (=> b!715558 (=> (not res!478680) (not e!401712))))

(assert (=> b!715558 (= res!478680 (not (validKeyInArray!0 (select (arr!19406 a!3591) from!2969))))))

(declare-fun b!715559 () Bool)

(declare-fun res!478685 () Bool)

(assert (=> b!715559 (=> (not res!478685) (not e!401712))))

(assert (=> b!715559 (= res!478685 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715560 () Bool)

(declare-fun res!478684 () Bool)

(assert (=> b!715560 (=> (not res!478684) (not e!401712))))

(assert (=> b!715560 (= res!478684 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715561 () Bool)

(declare-fun res!478690 () Bool)

(assert (=> b!715561 (=> (not res!478690) (not e!401712))))

(assert (=> b!715561 (= res!478690 (noDuplicate!1277 acc!652))))

(declare-fun b!715562 () Bool)

(declare-fun res!478681 () Bool)

(assert (=> b!715562 (=> (not res!478681) (not e!401712))))

(declare-fun subseq!470 (List!13486 List!13486) Bool)

(assert (=> b!715562 (= res!478681 (subseq!470 acc!652 newAcc!49))))

(assert (= (and start!63514 res!478687) b!715561))

(assert (= (and b!715561 res!478690) b!715553))

(assert (= (and b!715553 res!478698) b!715552))

(assert (= (and b!715552 res!478682) b!715547))

(assert (= (and b!715547 res!478691) b!715549))

(assert (= (and b!715549 res!478697) b!715557))

(assert (= (and b!715557 res!478692) b!715554))

(assert (= (and b!715554 res!478695) b!715559))

(assert (= (and b!715559 res!478685) b!715562))

(assert (= (and b!715562 res!478681) b!715551))

(assert (= (and b!715551 res!478693) b!715555))

(assert (= (and b!715555 res!478694) b!715550))

(assert (= (and b!715550 res!478686) b!715546))

(assert (= (and b!715546 res!478688) b!715545))

(assert (= (and b!715545 res!478689) b!715558))

(assert (= (and b!715558 res!478680) b!715560))

(assert (= (and b!715560 res!478684) b!715556))

(assert (= (and b!715556 res!478683) b!715548))

(assert (= (and b!715548 res!478696) b!715544))

(declare-fun m!671157 () Bool)

(assert (=> b!715558 m!671157))

(assert (=> b!715558 m!671157))

(declare-fun m!671159 () Bool)

(assert (=> b!715558 m!671159))

(declare-fun m!671161 () Bool)

(assert (=> b!715548 m!671161))

(declare-fun m!671163 () Bool)

(assert (=> b!715562 m!671163))

(declare-fun m!671165 () Bool)

(assert (=> b!715561 m!671165))

(declare-fun m!671167 () Bool)

(assert (=> b!715557 m!671167))

(declare-fun m!671169 () Bool)

(assert (=> b!715551 m!671169))

(declare-fun m!671171 () Bool)

(assert (=> b!715547 m!671171))

(declare-fun m!671173 () Bool)

(assert (=> start!63514 m!671173))

(declare-fun m!671175 () Bool)

(assert (=> b!715546 m!671175))

(declare-fun m!671177 () Bool)

(assert (=> b!715550 m!671177))

(declare-fun m!671179 () Bool)

(assert (=> b!715553 m!671179))

(declare-fun m!671181 () Bool)

(assert (=> b!715556 m!671181))

(declare-fun m!671183 () Bool)

(assert (=> b!715555 m!671183))

(declare-fun m!671185 () Bool)

(assert (=> b!715544 m!671185))

(declare-fun m!671187 () Bool)

(assert (=> b!715544 m!671187))

(declare-fun m!671189 () Bool)

(assert (=> b!715544 m!671189))

(declare-fun m!671191 () Bool)

(assert (=> b!715554 m!671191))

(declare-fun m!671193 () Bool)

(assert (=> b!715559 m!671193))

(declare-fun m!671195 () Bool)

(assert (=> b!715552 m!671195))

(declare-fun m!671197 () Bool)

(assert (=> b!715549 m!671197))

(check-sat (not b!715550) (not b!715551) (not b!715556) (not b!715546) (not b!715559) (not b!715555) (not b!715548) (not start!63514) (not b!715547) (not b!715553) (not b!715558) (not b!715562) (not b!715544) (not b!715552) (not b!715549) (not b!715554) (not b!715557) (not b!715561))
(check-sat)
(get-model)

(declare-fun d!98221 () Bool)

(declare-fun res!478817 () Bool)

(declare-fun e!401730 () Bool)

(assert (=> d!98221 (=> res!478817 e!401730)))

(get-info :version)

(assert (=> d!98221 (= res!478817 ((_ is Nil!13483) newAcc!49))))

(assert (=> d!98221 (= (noDuplicate!1277 newAcc!49) e!401730)))

(declare-fun b!715681 () Bool)

(declare-fun e!401731 () Bool)

(assert (=> b!715681 (= e!401730 e!401731)))

(declare-fun res!478818 () Bool)

(assert (=> b!715681 (=> (not res!478818) (not e!401731))))

(assert (=> b!715681 (= res!478818 (not (contains!4008 (t!19792 newAcc!49) (h!14527 newAcc!49))))))

(declare-fun b!715682 () Bool)

(assert (=> b!715682 (= e!401731 (noDuplicate!1277 (t!19792 newAcc!49)))))

(assert (= (and d!98221 (not res!478817)) b!715681))

(assert (= (and b!715681 res!478818) b!715682))

(declare-fun m!671283 () Bool)

(assert (=> b!715681 m!671283))

(declare-fun m!671285 () Bool)

(assert (=> b!715682 m!671285))

(assert (=> b!715553 d!98221))

(declare-fun d!98223 () Bool)

(declare-fun lt!318608 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!370 (List!13486) (InoxSet (_ BitVec 64)))

(assert (=> d!98223 (= lt!318608 (select (content!370 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401737 () Bool)

(assert (=> d!98223 (= lt!318608 e!401737)))

(declare-fun res!478824 () Bool)

(assert (=> d!98223 (=> (not res!478824) (not e!401737))))

(assert (=> d!98223 (= res!478824 ((_ is Cons!13482) acc!652))))

(assert (=> d!98223 (= (contains!4008 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318608)))

(declare-fun b!715687 () Bool)

(declare-fun e!401736 () Bool)

(assert (=> b!715687 (= e!401737 e!401736)))

(declare-fun res!478823 () Bool)

(assert (=> b!715687 (=> res!478823 e!401736)))

(assert (=> b!715687 (= res!478823 (= (h!14527 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715688 () Bool)

(assert (=> b!715688 (= e!401736 (contains!4008 (t!19792 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98223 res!478824) b!715687))

(assert (= (and b!715687 (not res!478823)) b!715688))

(declare-fun m!671287 () Bool)

(assert (=> d!98223 m!671287))

(declare-fun m!671289 () Bool)

(assert (=> d!98223 m!671289))

(declare-fun m!671291 () Bool)

(assert (=> b!715688 m!671291))

(assert (=> b!715552 d!98223))

(declare-fun b!715697 () Bool)

(declare-fun e!401748 () Bool)

(declare-fun e!401749 () Bool)

(assert (=> b!715697 (= e!401748 e!401749)))

(declare-fun res!478836 () Bool)

(assert (=> b!715697 (=> (not res!478836) (not e!401749))))

(assert (=> b!715697 (= res!478836 ((_ is Cons!13482) newAcc!49))))

(declare-fun b!715698 () Bool)

(declare-fun e!401746 () Bool)

(assert (=> b!715698 (= e!401749 e!401746)))

(declare-fun res!478833 () Bool)

(assert (=> b!715698 (=> res!478833 e!401746)))

(declare-fun e!401747 () Bool)

(assert (=> b!715698 (= res!478833 e!401747)))

(declare-fun res!478834 () Bool)

(assert (=> b!715698 (=> (not res!478834) (not e!401747))))

(assert (=> b!715698 (= res!478834 (= (h!14527 acc!652) (h!14527 newAcc!49)))))

(declare-fun b!715700 () Bool)

(assert (=> b!715700 (= e!401746 (subseq!470 acc!652 (t!19792 newAcc!49)))))

(declare-fun b!715699 () Bool)

(assert (=> b!715699 (= e!401747 (subseq!470 (t!19792 acc!652) (t!19792 newAcc!49)))))

(declare-fun d!98225 () Bool)

(declare-fun res!478835 () Bool)

(assert (=> d!98225 (=> res!478835 e!401748)))

(assert (=> d!98225 (= res!478835 ((_ is Nil!13483) acc!652))))

(assert (=> d!98225 (= (subseq!470 acc!652 newAcc!49) e!401748)))

(assert (= (and d!98225 (not res!478835)) b!715697))

(assert (= (and b!715697 res!478836) b!715698))

(assert (= (and b!715698 res!478834) b!715699))

(assert (= (and b!715698 (not res!478833)) b!715700))

(declare-fun m!671293 () Bool)

(assert (=> b!715700 m!671293))

(declare-fun m!671295 () Bool)

(assert (=> b!715699 m!671295))

(assert (=> b!715562 d!98225))

(declare-fun d!98227 () Bool)

(declare-fun res!478841 () Bool)

(declare-fun e!401754 () Bool)

(assert (=> d!98227 (=> res!478841 e!401754)))

(assert (=> d!98227 (= res!478841 (= (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98227 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401754)))

(declare-fun b!715705 () Bool)

(declare-fun e!401755 () Bool)

(assert (=> b!715705 (= e!401754 e!401755)))

(declare-fun res!478842 () Bool)

(assert (=> b!715705 (=> (not res!478842) (not e!401755))))

(assert (=> b!715705 (= res!478842 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19821 a!3591)))))

(declare-fun b!715706 () Bool)

(assert (=> b!715706 (= e!401755 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98227 (not res!478841)) b!715705))

(assert (= (and b!715705 res!478842) b!715706))

(declare-fun m!671297 () Bool)

(assert (=> d!98227 m!671297))

(declare-fun m!671299 () Bool)

(assert (=> b!715706 m!671299))

(assert (=> b!715556 d!98227))

(declare-fun d!98233 () Bool)

(assert (=> d!98233 (= (array_inv!15289 a!3591) (bvsge (size!19821 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63514 d!98233))

(declare-fun b!715750 () Bool)

(declare-fun e!401794 () Bool)

(declare-fun call!34609 () Bool)

(assert (=> b!715750 (= e!401794 call!34609)))

(declare-fun b!715751 () Bool)

(declare-fun e!401796 () Bool)

(assert (=> b!715751 (= e!401796 e!401794)))

(declare-fun c!78804 () Bool)

(assert (=> b!715751 (= c!78804 (validKeyInArray!0 (select (arr!19406 a!3591) from!2969)))))

(declare-fun d!98235 () Bool)

(declare-fun res!478877 () Bool)

(declare-fun e!401795 () Bool)

(assert (=> d!98235 (=> res!478877 e!401795)))

(assert (=> d!98235 (= res!478877 (bvsge from!2969 (size!19821 a!3591)))))

(assert (=> d!98235 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401795)))

(declare-fun e!401797 () Bool)

(declare-fun b!715752 () Bool)

(assert (=> b!715752 (= e!401797 (contains!4008 newAcc!49 (select (arr!19406 a!3591) from!2969)))))

(declare-fun b!715753 () Bool)

(assert (=> b!715753 (= e!401794 call!34609)))

(declare-fun bm!34606 () Bool)

(assert (=> bm!34606 (= call!34609 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78804 (Cons!13482 (select (arr!19406 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!715754 () Bool)

(assert (=> b!715754 (= e!401795 e!401796)))

(declare-fun res!478876 () Bool)

(assert (=> b!715754 (=> (not res!478876) (not e!401796))))

(assert (=> b!715754 (= res!478876 (not e!401797))))

(declare-fun res!478878 () Bool)

(assert (=> b!715754 (=> (not res!478878) (not e!401797))))

(assert (=> b!715754 (= res!478878 (validKeyInArray!0 (select (arr!19406 a!3591) from!2969)))))

(assert (= (and d!98235 (not res!478877)) b!715754))

(assert (= (and b!715754 res!478878) b!715752))

(assert (= (and b!715754 res!478876) b!715751))

(assert (= (and b!715751 c!78804) b!715750))

(assert (= (and b!715751 (not c!78804)) b!715753))

(assert (= (or b!715750 b!715753) bm!34606))

(assert (=> b!715751 m!671157))

(assert (=> b!715751 m!671157))

(assert (=> b!715751 m!671159))

(assert (=> b!715752 m!671157))

(assert (=> b!715752 m!671157))

(declare-fun m!671321 () Bool)

(assert (=> b!715752 m!671321))

(assert (=> bm!34606 m!671157))

(declare-fun m!671323 () Bool)

(assert (=> bm!34606 m!671323))

(assert (=> b!715754 m!671157))

(assert (=> b!715754 m!671157))

(assert (=> b!715754 m!671159))

(assert (=> b!715544 d!98235))

(declare-fun b!715759 () Bool)

(declare-fun e!401802 () Bool)

(declare-fun call!34610 () Bool)

(assert (=> b!715759 (= e!401802 call!34610)))

(declare-fun b!715760 () Bool)

(declare-fun e!401804 () Bool)

(assert (=> b!715760 (= e!401804 e!401802)))

(declare-fun c!78805 () Bool)

(assert (=> b!715760 (= c!78805 (validKeyInArray!0 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98245 () Bool)

(declare-fun res!478884 () Bool)

(declare-fun e!401803 () Bool)

(assert (=> d!98245 (=> res!478884 e!401803)))

(assert (=> d!98245 (= res!478884 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19821 a!3591)))))

(assert (=> d!98245 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49) e!401803)))

(declare-fun e!401805 () Bool)

(declare-fun b!715761 () Bool)

(assert (=> b!715761 (= e!401805 (contains!4008 newAcc!49 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715762 () Bool)

(assert (=> b!715762 (= e!401802 call!34610)))

(declare-fun bm!34607 () Bool)

(assert (=> bm!34607 (= call!34610 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78805 (Cons!13482 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) newAcc!49) newAcc!49)))))

(declare-fun b!715763 () Bool)

(assert (=> b!715763 (= e!401803 e!401804)))

(declare-fun res!478883 () Bool)

(assert (=> b!715763 (=> (not res!478883) (not e!401804))))

(assert (=> b!715763 (= res!478883 (not e!401805))))

(declare-fun res!478885 () Bool)

(assert (=> b!715763 (=> (not res!478885) (not e!401805))))

(assert (=> b!715763 (= res!478885 (validKeyInArray!0 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!98245 (not res!478884)) b!715763))

(assert (= (and b!715763 res!478885) b!715761))

(assert (= (and b!715763 res!478883) b!715760))

(assert (= (and b!715760 c!78805) b!715759))

(assert (= (and b!715760 (not c!78805)) b!715762))

(assert (= (or b!715759 b!715762) bm!34607))

(assert (=> b!715760 m!671297))

(assert (=> b!715760 m!671297))

(declare-fun m!671325 () Bool)

(assert (=> b!715760 m!671325))

(assert (=> b!715761 m!671297))

(assert (=> b!715761 m!671297))

(declare-fun m!671327 () Bool)

(assert (=> b!715761 m!671327))

(assert (=> bm!34607 m!671297))

(declare-fun m!671329 () Bool)

(assert (=> bm!34607 m!671329))

(assert (=> b!715763 m!671297))

(assert (=> b!715763 m!671297))

(assert (=> b!715763 m!671325))

(assert (=> b!715544 d!98245))

(declare-fun d!98247 () Bool)

(assert (=> d!98247 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun lt!318620 () Unit!24614)

(declare-fun choose!66 (array!40539 (_ BitVec 64) (_ BitVec 32) List!13486 List!13486) Unit!24614)

(assert (=> d!98247 (= lt!318620 (choose!66 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(assert (=> d!98247 (bvslt (size!19821 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98247 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49) lt!318620)))

(declare-fun bs!20577 () Bool)

(assert (= bs!20577 d!98247))

(assert (=> bs!20577 m!671187))

(declare-fun m!671351 () Bool)

(assert (=> bs!20577 m!671351))

(assert (=> b!715544 d!98247))

(declare-fun d!98257 () Bool)

(declare-fun e!401855 () Bool)

(assert (=> d!98257 e!401855))

(declare-fun res!478928 () Bool)

(assert (=> d!98257 (=> (not res!478928) (not e!401855))))

(declare-fun lt!318623 () List!13486)

(declare-fun size!19824 (List!13486) Int)

(assert (=> d!98257 (= res!478928 (<= (size!19824 lt!318623) (size!19824 newAcc!49)))))

(declare-fun e!401857 () List!13486)

(assert (=> d!98257 (= lt!318623 e!401857)))

(declare-fun c!78812 () Bool)

(assert (=> d!98257 (= c!78812 ((_ is Cons!13482) newAcc!49))))

(assert (=> d!98257 (= (-!435 newAcc!49 k0!2824) lt!318623)))

(declare-fun b!715818 () Bool)

(declare-fun e!401856 () List!13486)

(declare-fun call!34615 () List!13486)

(assert (=> b!715818 (= e!401856 (Cons!13482 (h!14527 newAcc!49) call!34615))))

(declare-fun bm!34612 () Bool)

(assert (=> bm!34612 (= call!34615 (-!435 (t!19792 newAcc!49) k0!2824))))

(declare-fun b!715819 () Bool)

(assert (=> b!715819 (= e!401855 (= (content!370 lt!318623) ((_ map and) (content!370 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!715820 () Bool)

(assert (=> b!715820 (= e!401857 e!401856)))

(declare-fun c!78813 () Bool)

(assert (=> b!715820 (= c!78813 (= k0!2824 (h!14527 newAcc!49)))))

(declare-fun b!715821 () Bool)

(assert (=> b!715821 (= e!401857 Nil!13483)))

(declare-fun b!715822 () Bool)

(assert (=> b!715822 (= e!401856 call!34615)))

(assert (= (and d!98257 c!78812) b!715820))

(assert (= (and d!98257 (not c!78812)) b!715821))

(assert (= (and b!715820 c!78813) b!715822))

(assert (= (and b!715820 (not c!78813)) b!715818))

(assert (= (or b!715822 b!715818) bm!34612))

(assert (= (and d!98257 res!478928) b!715819))

(declare-fun m!671367 () Bool)

(assert (=> d!98257 m!671367))

(declare-fun m!671369 () Bool)

(assert (=> d!98257 m!671369))

(declare-fun m!671371 () Bool)

(assert (=> bm!34612 m!671371))

(declare-fun m!671373 () Bool)

(assert (=> b!715819 m!671373))

(declare-fun m!671375 () Bool)

(assert (=> b!715819 m!671375))

(declare-fun m!671377 () Bool)

(assert (=> b!715819 m!671377))

(assert (=> b!715555 d!98257))

(declare-fun d!98269 () Bool)

(assert (=> d!98269 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715554 d!98269))

(declare-fun b!715831 () Bool)

(declare-fun e!401863 () Bool)

(declare-fun call!34618 () Bool)

(assert (=> b!715831 (= e!401863 call!34618)))

(declare-fun b!715832 () Bool)

(declare-fun e!401865 () Bool)

(assert (=> b!715832 (= e!401865 e!401863)))

(declare-fun c!78818 () Bool)

(assert (=> b!715832 (= c!78818 (validKeyInArray!0 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98271 () Bool)

(declare-fun res!478930 () Bool)

(declare-fun e!401864 () Bool)

(assert (=> d!98271 (=> res!478930 e!401864)))

(assert (=> d!98271 (= res!478930 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19821 a!3591)))))

(assert (=> d!98271 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!401864)))

(declare-fun e!401866 () Bool)

(declare-fun b!715833 () Bool)

(assert (=> b!715833 (= e!401866 (contains!4008 acc!652 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715834 () Bool)

(assert (=> b!715834 (= e!401863 call!34618)))

(declare-fun bm!34615 () Bool)

(assert (=> bm!34615 (= call!34618 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78818 (Cons!13482 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun b!715835 () Bool)

(assert (=> b!715835 (= e!401864 e!401865)))

(declare-fun res!478929 () Bool)

(assert (=> b!715835 (=> (not res!478929) (not e!401865))))

(assert (=> b!715835 (= res!478929 (not e!401866))))

(declare-fun res!478931 () Bool)

(assert (=> b!715835 (=> (not res!478931) (not e!401866))))

(assert (=> b!715835 (= res!478931 (validKeyInArray!0 (select (arr!19406 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and d!98271 (not res!478930)) b!715835))

(assert (= (and b!715835 res!478931) b!715833))

(assert (= (and b!715835 res!478929) b!715832))

(assert (= (and b!715832 c!78818) b!715831))

(assert (= (and b!715832 (not c!78818)) b!715834))

(assert (= (or b!715831 b!715834) bm!34615))

(assert (=> b!715832 m!671297))

(assert (=> b!715832 m!671297))

(assert (=> b!715832 m!671325))

(assert (=> b!715833 m!671297))

(assert (=> b!715833 m!671297))

(declare-fun m!671379 () Bool)

(assert (=> b!715833 m!671379))

(assert (=> bm!34615 m!671297))

(declare-fun m!671381 () Bool)

(assert (=> bm!34615 m!671381))

(assert (=> b!715835 m!671297))

(assert (=> b!715835 m!671297))

(assert (=> b!715835 m!671325))

(assert (=> b!715548 d!98271))

(declare-fun b!715843 () Bool)

(declare-fun e!401873 () Bool)

(declare-fun call!34620 () Bool)

(assert (=> b!715843 (= e!401873 call!34620)))

(declare-fun b!715844 () Bool)

(declare-fun e!401875 () Bool)

(assert (=> b!715844 (= e!401875 e!401873)))

(declare-fun c!78820 () Bool)

(assert (=> b!715844 (= c!78820 (validKeyInArray!0 (select (arr!19406 a!3591) from!2969)))))

(declare-fun d!98273 () Bool)

(declare-fun res!478938 () Bool)

(declare-fun e!401874 () Bool)

(assert (=> d!98273 (=> res!478938 e!401874)))

(assert (=> d!98273 (= res!478938 (bvsge from!2969 (size!19821 a!3591)))))

(assert (=> d!98273 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401874)))

(declare-fun b!715845 () Bool)

(declare-fun e!401876 () Bool)

(assert (=> b!715845 (= e!401876 (contains!4008 acc!652 (select (arr!19406 a!3591) from!2969)))))

(declare-fun b!715846 () Bool)

(assert (=> b!715846 (= e!401873 call!34620)))

(declare-fun bm!34617 () Bool)

(assert (=> bm!34617 (= call!34620 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78820 (Cons!13482 (select (arr!19406 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!715847 () Bool)

(assert (=> b!715847 (= e!401874 e!401875)))

(declare-fun res!478937 () Bool)

(assert (=> b!715847 (=> (not res!478937) (not e!401875))))

(assert (=> b!715847 (= res!478937 (not e!401876))))

(declare-fun res!478939 () Bool)

(assert (=> b!715847 (=> (not res!478939) (not e!401876))))

(assert (=> b!715847 (= res!478939 (validKeyInArray!0 (select (arr!19406 a!3591) from!2969)))))

(assert (= (and d!98273 (not res!478938)) b!715847))

(assert (= (and b!715847 res!478939) b!715845))

(assert (= (and b!715847 res!478937) b!715844))

(assert (= (and b!715844 c!78820) b!715843))

(assert (= (and b!715844 (not c!78820)) b!715846))

(assert (= (or b!715843 b!715846) bm!34617))

(assert (=> b!715844 m!671157))

(assert (=> b!715844 m!671157))

(assert (=> b!715844 m!671159))

(assert (=> b!715845 m!671157))

(assert (=> b!715845 m!671157))

(declare-fun m!671389 () Bool)

(assert (=> b!715845 m!671389))

(assert (=> bm!34617 m!671157))

(declare-fun m!671391 () Bool)

(assert (=> bm!34617 m!671391))

(assert (=> b!715847 m!671157))

(assert (=> b!715847 m!671157))

(assert (=> b!715847 m!671159))

(assert (=> b!715559 d!98273))

(declare-fun d!98277 () Bool)

(assert (=> d!98277 (= (validKeyInArray!0 (select (arr!19406 a!3591) from!2969)) (and (not (= (select (arr!19406 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19406 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!715558 d!98277))

(declare-fun d!98279 () Bool)

(declare-fun lt!318626 () Bool)

(assert (=> d!98279 (= lt!318626 (select (content!370 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401878 () Bool)

(assert (=> d!98279 (= lt!318626 e!401878)))

(declare-fun res!478941 () Bool)

(assert (=> d!98279 (=> (not res!478941) (not e!401878))))

(assert (=> d!98279 (= res!478941 ((_ is Cons!13482) acc!652))))

(assert (=> d!98279 (= (contains!4008 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318626)))

(declare-fun b!715848 () Bool)

(declare-fun e!401877 () Bool)

(assert (=> b!715848 (= e!401878 e!401877)))

(declare-fun res!478940 () Bool)

(assert (=> b!715848 (=> res!478940 e!401877)))

(assert (=> b!715848 (= res!478940 (= (h!14527 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715849 () Bool)

(assert (=> b!715849 (= e!401877 (contains!4008 (t!19792 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98279 res!478941) b!715848))

(assert (= (and b!715848 (not res!478940)) b!715849))

(assert (=> d!98279 m!671287))

(declare-fun m!671393 () Bool)

(assert (=> d!98279 m!671393))

(declare-fun m!671395 () Bool)

(assert (=> b!715849 m!671395))

(assert (=> b!715547 d!98279))

(declare-fun d!98283 () Bool)

(declare-fun lt!318628 () Bool)

(assert (=> d!98283 (= lt!318628 (select (content!370 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401882 () Bool)

(assert (=> d!98283 (= lt!318628 e!401882)))

(declare-fun res!478945 () Bool)

(assert (=> d!98283 (=> (not res!478945) (not e!401882))))

(assert (=> d!98283 (= res!478945 ((_ is Cons!13482) newAcc!49))))

(assert (=> d!98283 (= (contains!4008 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318628)))

(declare-fun b!715852 () Bool)

(declare-fun e!401881 () Bool)

(assert (=> b!715852 (= e!401882 e!401881)))

(declare-fun res!478944 () Bool)

(assert (=> b!715852 (=> res!478944 e!401881)))

(assert (=> b!715852 (= res!478944 (= (h!14527 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715853 () Bool)

(assert (=> b!715853 (= e!401881 (contains!4008 (t!19792 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98283 res!478945) b!715852))

(assert (= (and b!715852 (not res!478944)) b!715853))

(assert (=> d!98283 m!671375))

(declare-fun m!671401 () Bool)

(assert (=> d!98283 m!671401))

(declare-fun m!671403 () Bool)

(assert (=> b!715853 m!671403))

(assert (=> b!715546 d!98283))

(declare-fun d!98287 () Bool)

(declare-fun lt!318630 () Bool)

(assert (=> d!98287 (= lt!318630 (select (content!370 acc!652) k0!2824))))

(declare-fun e!401891 () Bool)

(assert (=> d!98287 (= lt!318630 e!401891)))

(declare-fun res!478951 () Bool)

(assert (=> d!98287 (=> (not res!478951) (not e!401891))))

(assert (=> d!98287 (= res!478951 ((_ is Cons!13482) acc!652))))

(assert (=> d!98287 (= (contains!4008 acc!652 k0!2824) lt!318630)))

(declare-fun b!715864 () Bool)

(declare-fun e!401890 () Bool)

(assert (=> b!715864 (= e!401891 e!401890)))

(declare-fun res!478950 () Bool)

(assert (=> b!715864 (=> res!478950 e!401890)))

(assert (=> b!715864 (= res!478950 (= (h!14527 acc!652) k0!2824))))

(declare-fun b!715865 () Bool)

(assert (=> b!715865 (= e!401890 (contains!4008 (t!19792 acc!652) k0!2824))))

(assert (= (and d!98287 res!478951) b!715864))

(assert (= (and b!715864 (not res!478950)) b!715865))

(assert (=> d!98287 m!671287))

(declare-fun m!671405 () Bool)

(assert (=> d!98287 m!671405))

(declare-fun m!671407 () Bool)

(assert (=> b!715865 m!671407))

(assert (=> b!715557 d!98287))

(declare-fun d!98289 () Bool)

(declare-fun lt!318631 () Bool)

(assert (=> d!98289 (= lt!318631 (select (content!370 newAcc!49) k0!2824))))

(declare-fun e!401893 () Bool)

(assert (=> d!98289 (= lt!318631 e!401893)))

(declare-fun res!478953 () Bool)

(assert (=> d!98289 (=> (not res!478953) (not e!401893))))

(assert (=> d!98289 (= res!478953 ((_ is Cons!13482) newAcc!49))))

(assert (=> d!98289 (= (contains!4008 newAcc!49 k0!2824) lt!318631)))

(declare-fun b!715866 () Bool)

(declare-fun e!401892 () Bool)

(assert (=> b!715866 (= e!401893 e!401892)))

(declare-fun res!478952 () Bool)

(assert (=> b!715866 (=> res!478952 e!401892)))

(assert (=> b!715866 (= res!478952 (= (h!14527 newAcc!49) k0!2824))))

(declare-fun b!715867 () Bool)

(assert (=> b!715867 (= e!401892 (contains!4008 (t!19792 newAcc!49) k0!2824))))

(assert (= (and d!98289 res!478953) b!715866))

(assert (= (and b!715866 (not res!478952)) b!715867))

(assert (=> d!98289 m!671375))

(declare-fun m!671421 () Bool)

(assert (=> d!98289 m!671421))

(declare-fun m!671423 () Bool)

(assert (=> b!715867 m!671423))

(assert (=> b!715551 d!98289))

(declare-fun d!98293 () Bool)

(declare-fun lt!318632 () Bool)

(assert (=> d!98293 (= lt!318632 (select (content!370 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401897 () Bool)

(assert (=> d!98293 (= lt!318632 e!401897)))

(declare-fun res!478957 () Bool)

(assert (=> d!98293 (=> (not res!478957) (not e!401897))))

(assert (=> d!98293 (= res!478957 ((_ is Cons!13482) newAcc!49))))

(assert (=> d!98293 (= (contains!4008 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318632)))

(declare-fun b!715870 () Bool)

(declare-fun e!401896 () Bool)

(assert (=> b!715870 (= e!401897 e!401896)))

(declare-fun res!478956 () Bool)

(assert (=> b!715870 (=> res!478956 e!401896)))

(assert (=> b!715870 (= res!478956 (= (h!14527 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!715871 () Bool)

(assert (=> b!715871 (= e!401896 (contains!4008 (t!19792 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98293 res!478957) b!715870))

(assert (= (and b!715870 (not res!478956)) b!715871))

(assert (=> d!98293 m!671375))

(declare-fun m!671431 () Bool)

(assert (=> d!98293 m!671431))

(declare-fun m!671433 () Bool)

(assert (=> b!715871 m!671433))

(assert (=> b!715550 d!98293))

(declare-fun d!98299 () Bool)

(declare-fun res!478961 () Bool)

(declare-fun e!401902 () Bool)

(assert (=> d!98299 (=> res!478961 e!401902)))

(assert (=> d!98299 (= res!478961 ((_ is Nil!13483) acc!652))))

(assert (=> d!98299 (= (noDuplicate!1277 acc!652) e!401902)))

(declare-fun b!715877 () Bool)

(declare-fun e!401903 () Bool)

(assert (=> b!715877 (= e!401902 e!401903)))

(declare-fun res!478962 () Bool)

(assert (=> b!715877 (=> (not res!478962) (not e!401903))))

(assert (=> b!715877 (= res!478962 (not (contains!4008 (t!19792 acc!652) (h!14527 acc!652))))))

(declare-fun b!715878 () Bool)

(assert (=> b!715878 (= e!401903 (noDuplicate!1277 (t!19792 acc!652)))))

(assert (= (and d!98299 (not res!478961)) b!715877))

(assert (= (and b!715877 res!478962) b!715878))

(declare-fun m!671435 () Bool)

(assert (=> b!715877 m!671435))

(declare-fun m!671437 () Bool)

(assert (=> b!715878 m!671437))

(assert (=> b!715561 d!98299))

(declare-fun d!98301 () Bool)

(declare-fun res!478963 () Bool)

(declare-fun e!401904 () Bool)

(assert (=> d!98301 (=> res!478963 e!401904)))

(assert (=> d!98301 (= res!478963 (= (select (arr!19406 a!3591) from!2969) k0!2824))))

(assert (=> d!98301 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401904)))

(declare-fun b!715879 () Bool)

(declare-fun e!401905 () Bool)

(assert (=> b!715879 (= e!401904 e!401905)))

(declare-fun res!478964 () Bool)

(assert (=> b!715879 (=> (not res!478964) (not e!401905))))

(assert (=> b!715879 (= res!478964 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19821 a!3591)))))

(declare-fun b!715880 () Bool)

(assert (=> b!715880 (= e!401905 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98301 (not res!478963)) b!715879))

(assert (= (and b!715879 res!478964) b!715880))

(assert (=> d!98301 m!671157))

(declare-fun m!671443 () Bool)

(assert (=> b!715880 m!671443))

(assert (=> b!715549 d!98301))

(check-sat (not b!715752) (not b!715751) (not b!715835) (not b!715847) (not d!98287) (not bm!34615) (not b!715877) (not bm!34606) (not b!715700) (not b!715832) (not b!715706) (not b!715754) (not b!715819) (not d!98279) (not b!715699) (not d!98293) (not b!715865) (not d!98289) (not b!715844) (not b!715878) (not b!715760) (not b!715763) (not b!715871) (not b!715849) (not b!715853) (not b!715682) (not b!715761) (not bm!34617) (not bm!34612) (not b!715833) (not b!715867) (not d!98257) (not b!715880) (not d!98283) (not bm!34607) (not b!715688) (not b!715845) (not b!715681) (not d!98247) (not d!98223))
(check-sat)
