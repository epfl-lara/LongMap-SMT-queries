; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63444 () Bool)

(assert start!63444)

(declare-fun b!714683 () Bool)

(declare-fun res!477730 () Bool)

(declare-fun e!401597 () Bool)

(assert (=> b!714683 (=> (not res!477730) (not e!401597))))

(declare-datatypes ((List!13431 0))(
  ( (Nil!13428) (Cons!13427 (h!14472 (_ BitVec 64)) (t!19746 List!13431)) )
))
(declare-fun acc!652 () List!13431)

(declare-fun contains!4008 (List!13431 (_ BitVec 64)) Bool)

(assert (=> b!714683 (= res!477730 (not (contains!4008 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714684 () Bool)

(declare-fun res!477725 () Bool)

(assert (=> b!714684 (=> (not res!477725) (not e!401597))))

(declare-fun newAcc!49 () List!13431)

(declare-fun noDuplicate!1255 (List!13431) Bool)

(assert (=> b!714684 (= res!477725 (noDuplicate!1255 newAcc!49))))

(declare-fun b!714685 () Bool)

(declare-fun res!477724 () Bool)

(assert (=> b!714685 (=> (not res!477724) (not e!401597))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!714685 (= res!477724 (not (contains!4008 acc!652 k0!2824)))))

(declare-fun b!714686 () Bool)

(declare-fun res!477723 () Bool)

(assert (=> b!714686 (=> (not res!477723) (not e!401597))))

(assert (=> b!714686 (= res!477723 (noDuplicate!1255 acc!652))))

(declare-fun b!714687 () Bool)

(declare-fun res!477720 () Bool)

(assert (=> b!714687 (=> (not res!477720) (not e!401597))))

(declare-datatypes ((array!40503 0))(
  ( (array!40504 (arr!19390 (Array (_ BitVec 32) (_ BitVec 64))) (size!19803 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40503)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714687 (= res!477720 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714688 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40503 (_ BitVec 32) List!13431) Bool)

(assert (=> b!714688 (= e!401597 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652)))))

(declare-fun b!714689 () Bool)

(declare-fun res!477728 () Bool)

(assert (=> b!714689 (=> (not res!477728) (not e!401597))))

(assert (=> b!714689 (= res!477728 (contains!4008 newAcc!49 k0!2824))))

(declare-fun b!714690 () Bool)

(declare-fun res!477717 () Bool)

(assert (=> b!714690 (=> (not res!477717) (not e!401597))))

(assert (=> b!714690 (= res!477717 (not (contains!4008 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714691 () Bool)

(declare-fun res!477729 () Bool)

(assert (=> b!714691 (=> (not res!477729) (not e!401597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714691 (= res!477729 (not (validKeyInArray!0 (select (arr!19390 a!3591) from!2969))))))

(declare-fun b!714692 () Bool)

(declare-fun res!477713 () Bool)

(assert (=> b!714692 (=> (not res!477713) (not e!401597))))

(assert (=> b!714692 (= res!477713 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19803 a!3591)))))

(declare-fun b!714693 () Bool)

(declare-fun res!477718 () Bool)

(assert (=> b!714693 (=> (not res!477718) (not e!401597))))

(assert (=> b!714693 (= res!477718 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714694 () Bool)

(declare-fun res!477719 () Bool)

(assert (=> b!714694 (=> (not res!477719) (not e!401597))))

(assert (=> b!714694 (= res!477719 (not (contains!4008 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714695 () Bool)

(declare-fun res!477721 () Bool)

(assert (=> b!714695 (=> (not res!477721) (not e!401597))))

(assert (=> b!714695 (= res!477721 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714696 () Bool)

(declare-fun res!477727 () Bool)

(assert (=> b!714696 (=> (not res!477727) (not e!401597))))

(assert (=> b!714696 (= res!477727 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714697 () Bool)

(declare-fun res!477722 () Bool)

(assert (=> b!714697 (=> (not res!477722) (not e!401597))))

(assert (=> b!714697 (= res!477722 (not (contains!4008 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714698 () Bool)

(declare-fun res!477716 () Bool)

(assert (=> b!714698 (=> (not res!477716) (not e!401597))))

(declare-fun -!418 (List!13431 (_ BitVec 64)) List!13431)

(assert (=> b!714698 (= res!477716 (= (-!418 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714699 () Bool)

(declare-fun res!477714 () Bool)

(assert (=> b!714699 (=> (not res!477714) (not e!401597))))

(declare-fun subseq!453 (List!13431 List!13431) Bool)

(assert (=> b!714699 (= res!477714 (subseq!453 acc!652 newAcc!49))))

(declare-fun res!477715 () Bool)

(assert (=> start!63444 (=> (not res!477715) (not e!401597))))

(assert (=> start!63444 (= res!477715 (and (bvslt (size!19803 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19803 a!3591))))))

(assert (=> start!63444 e!401597))

(assert (=> start!63444 true))

(declare-fun array_inv!15186 (array!40503) Bool)

(assert (=> start!63444 (array_inv!15186 a!3591)))

(declare-fun b!714700 () Bool)

(declare-fun res!477726 () Bool)

(assert (=> b!714700 (=> (not res!477726) (not e!401597))))

(assert (=> b!714700 (= res!477726 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63444 res!477715) b!714686))

(assert (= (and b!714686 res!477723) b!714684))

(assert (= (and b!714684 res!477725) b!714683))

(assert (= (and b!714683 res!477730) b!714697))

(assert (= (and b!714697 res!477722) b!714696))

(assert (= (and b!714696 res!477727) b!714685))

(assert (= (and b!714685 res!477724) b!714700))

(assert (= (and b!714700 res!477726) b!714695))

(assert (= (and b!714695 res!477721) b!714699))

(assert (= (and b!714699 res!477714) b!714689))

(assert (= (and b!714689 res!477728) b!714698))

(assert (= (and b!714698 res!477716) b!714690))

(assert (= (and b!714690 res!477717) b!714694))

(assert (= (and b!714694 res!477719) b!714692))

(assert (= (and b!714692 res!477713) b!714691))

(assert (= (and b!714691 res!477729) b!714693))

(assert (= (and b!714693 res!477718) b!714687))

(assert (= (and b!714687 res!477720) b!714688))

(declare-fun m!671137 () Bool)

(assert (=> b!714686 m!671137))

(declare-fun m!671139 () Bool)

(assert (=> b!714700 m!671139))

(declare-fun m!671141 () Bool)

(assert (=> b!714691 m!671141))

(assert (=> b!714691 m!671141))

(declare-fun m!671143 () Bool)

(assert (=> b!714691 m!671143))

(declare-fun m!671145 () Bool)

(assert (=> b!714696 m!671145))

(declare-fun m!671147 () Bool)

(assert (=> b!714684 m!671147))

(declare-fun m!671149 () Bool)

(assert (=> b!714687 m!671149))

(declare-fun m!671151 () Bool)

(assert (=> b!714688 m!671151))

(declare-fun m!671153 () Bool)

(assert (=> b!714683 m!671153))

(declare-fun m!671155 () Bool)

(assert (=> b!714694 m!671155))

(declare-fun m!671157 () Bool)

(assert (=> b!714689 m!671157))

(declare-fun m!671159 () Bool)

(assert (=> b!714698 m!671159))

(declare-fun m!671161 () Bool)

(assert (=> start!63444 m!671161))

(declare-fun m!671163 () Bool)

(assert (=> b!714699 m!671163))

(declare-fun m!671165 () Bool)

(assert (=> b!714690 m!671165))

(declare-fun m!671167 () Bool)

(assert (=> b!714695 m!671167))

(declare-fun m!671169 () Bool)

(assert (=> b!714685 m!671169))

(declare-fun m!671171 () Bool)

(assert (=> b!714697 m!671171))

(check-sat (not b!714698) (not b!714696) (not b!714697) (not b!714685) (not b!714686) (not b!714690) (not b!714694) (not b!714699) (not b!714689) (not b!714684) (not b!714695) (not b!714687) (not b!714683) (not b!714691) (not start!63444) (not b!714688) (not b!714700))
(check-sat)
(get-model)

(declare-fun d!98329 () Bool)

(declare-fun lt!318785 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!367 (List!13431) (InoxSet (_ BitVec 64)))

(assert (=> d!98329 (= lt!318785 (select (content!367 acc!652) k0!2824))))

(declare-fun e!401608 () Bool)

(assert (=> d!98329 (= lt!318785 e!401608)))

(declare-fun res!477790 () Bool)

(assert (=> d!98329 (=> (not res!477790) (not e!401608))))

(get-info :version)

(assert (=> d!98329 (= res!477790 ((_ is Cons!13427) acc!652))))

(assert (=> d!98329 (= (contains!4008 acc!652 k0!2824) lt!318785)))

(declare-fun b!714759 () Bool)

(declare-fun e!401609 () Bool)

(assert (=> b!714759 (= e!401608 e!401609)))

(declare-fun res!477789 () Bool)

(assert (=> b!714759 (=> res!477789 e!401609)))

(assert (=> b!714759 (= res!477789 (= (h!14472 acc!652) k0!2824))))

(declare-fun b!714760 () Bool)

(assert (=> b!714760 (= e!401609 (contains!4008 (t!19746 acc!652) k0!2824))))

(assert (= (and d!98329 res!477790) b!714759))

(assert (= (and b!714759 (not res!477789)) b!714760))

(declare-fun m!671209 () Bool)

(assert (=> d!98329 m!671209))

(declare-fun m!671211 () Bool)

(assert (=> d!98329 m!671211))

(declare-fun m!671213 () Bool)

(assert (=> b!714760 m!671213))

(assert (=> b!714685 d!98329))

(declare-fun d!98331 () Bool)

(declare-fun res!477795 () Bool)

(declare-fun e!401614 () Bool)

(assert (=> d!98331 (=> res!477795 e!401614)))

(assert (=> d!98331 (= res!477795 (= (select (arr!19390 a!3591) from!2969) k0!2824))))

(assert (=> d!98331 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!401614)))

(declare-fun b!714765 () Bool)

(declare-fun e!401615 () Bool)

(assert (=> b!714765 (= e!401614 e!401615)))

(declare-fun res!477796 () Bool)

(assert (=> b!714765 (=> (not res!477796) (not e!401615))))

(assert (=> b!714765 (= res!477796 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19803 a!3591)))))

(declare-fun b!714766 () Bool)

(assert (=> b!714766 (= e!401615 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98331 (not res!477795)) b!714765))

(assert (= (and b!714765 res!477796) b!714766))

(assert (=> d!98331 m!671141))

(declare-fun m!671215 () Bool)

(assert (=> b!714766 m!671215))

(assert (=> b!714696 d!98331))

(declare-fun d!98333 () Bool)

(declare-fun lt!318786 () Bool)

(assert (=> d!98333 (= lt!318786 (select (content!367 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401616 () Bool)

(assert (=> d!98333 (= lt!318786 e!401616)))

(declare-fun res!477798 () Bool)

(assert (=> d!98333 (=> (not res!477798) (not e!401616))))

(assert (=> d!98333 (= res!477798 ((_ is Cons!13427) acc!652))))

(assert (=> d!98333 (= (contains!4008 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318786)))

(declare-fun b!714767 () Bool)

(declare-fun e!401617 () Bool)

(assert (=> b!714767 (= e!401616 e!401617)))

(declare-fun res!477797 () Bool)

(assert (=> b!714767 (=> res!477797 e!401617)))

(assert (=> b!714767 (= res!477797 (= (h!14472 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714768 () Bool)

(assert (=> b!714768 (= e!401617 (contains!4008 (t!19746 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98333 res!477798) b!714767))

(assert (= (and b!714767 (not res!477797)) b!714768))

(assert (=> d!98333 m!671209))

(declare-fun m!671217 () Bool)

(assert (=> d!98333 m!671217))

(declare-fun m!671219 () Bool)

(assert (=> b!714768 m!671219))

(assert (=> b!714697 d!98333))

(declare-fun d!98335 () Bool)

(declare-fun res!477803 () Bool)

(declare-fun e!401622 () Bool)

(assert (=> d!98335 (=> res!477803 e!401622)))

(assert (=> d!98335 (= res!477803 ((_ is Nil!13428) acc!652))))

(assert (=> d!98335 (= (noDuplicate!1255 acc!652) e!401622)))

(declare-fun b!714773 () Bool)

(declare-fun e!401623 () Bool)

(assert (=> b!714773 (= e!401622 e!401623)))

(declare-fun res!477804 () Bool)

(assert (=> b!714773 (=> (not res!477804) (not e!401623))))

(assert (=> b!714773 (= res!477804 (not (contains!4008 (t!19746 acc!652) (h!14472 acc!652))))))

(declare-fun b!714774 () Bool)

(assert (=> b!714774 (= e!401623 (noDuplicate!1255 (t!19746 acc!652)))))

(assert (= (and d!98335 (not res!477803)) b!714773))

(assert (= (and b!714773 res!477804) b!714774))

(declare-fun m!671221 () Bool)

(assert (=> b!714773 m!671221))

(declare-fun m!671223 () Bool)

(assert (=> b!714774 m!671223))

(assert (=> b!714686 d!98335))

(declare-fun d!98339 () Bool)

(declare-fun res!477805 () Bool)

(declare-fun e!401624 () Bool)

(assert (=> d!98339 (=> res!477805 e!401624)))

(assert (=> d!98339 (= res!477805 (= (select (arr!19390 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98339 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401624)))

(declare-fun b!714775 () Bool)

(declare-fun e!401625 () Bool)

(assert (=> b!714775 (= e!401624 e!401625)))

(declare-fun res!477806 () Bool)

(assert (=> b!714775 (=> (not res!477806) (not e!401625))))

(assert (=> b!714775 (= res!477806 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19803 a!3591)))))

(declare-fun b!714776 () Bool)

(assert (=> b!714776 (= e!401625 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98339 (not res!477805)) b!714775))

(assert (= (and b!714775 res!477806) b!714776))

(declare-fun m!671225 () Bool)

(assert (=> d!98339 m!671225))

(declare-fun m!671227 () Bool)

(assert (=> b!714776 m!671227))

(assert (=> b!714687 d!98339))

(declare-fun d!98341 () Bool)

(assert (=> d!98341 (= (array_inv!15186 a!3591) (bvsge (size!19803 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63444 d!98341))

(declare-fun d!98345 () Bool)

(declare-fun lt!318787 () Bool)

(assert (=> d!98345 (= lt!318787 (select (content!367 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401626 () Bool)

(assert (=> d!98345 (= lt!318787 e!401626)))

(declare-fun res!477808 () Bool)

(assert (=> d!98345 (=> (not res!477808) (not e!401626))))

(assert (=> d!98345 (= res!477808 ((_ is Cons!13427) acc!652))))

(assert (=> d!98345 (= (contains!4008 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318787)))

(declare-fun b!714777 () Bool)

(declare-fun e!401627 () Bool)

(assert (=> b!714777 (= e!401626 e!401627)))

(declare-fun res!477807 () Bool)

(assert (=> b!714777 (=> res!477807 e!401627)))

(assert (=> b!714777 (= res!477807 (= (h!14472 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714778 () Bool)

(assert (=> b!714778 (= e!401627 (contains!4008 (t!19746 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98345 res!477808) b!714777))

(assert (= (and b!714777 (not res!477807)) b!714778))

(assert (=> d!98345 m!671209))

(declare-fun m!671229 () Bool)

(assert (=> d!98345 m!671229))

(declare-fun m!671231 () Bool)

(assert (=> b!714778 m!671231))

(assert (=> b!714683 d!98345))

(declare-fun d!98347 () Bool)

(declare-fun lt!318788 () Bool)

(assert (=> d!98347 (= lt!318788 (select (content!367 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401628 () Bool)

(assert (=> d!98347 (= lt!318788 e!401628)))

(declare-fun res!477810 () Bool)

(assert (=> d!98347 (=> (not res!477810) (not e!401628))))

(assert (=> d!98347 (= res!477810 ((_ is Cons!13427) newAcc!49))))

(assert (=> d!98347 (= (contains!4008 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318788)))

(declare-fun b!714779 () Bool)

(declare-fun e!401629 () Bool)

(assert (=> b!714779 (= e!401628 e!401629)))

(declare-fun res!477809 () Bool)

(assert (=> b!714779 (=> res!477809 e!401629)))

(assert (=> b!714779 (= res!477809 (= (h!14472 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714780 () Bool)

(assert (=> b!714780 (= e!401629 (contains!4008 (t!19746 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98347 res!477810) b!714779))

(assert (= (and b!714779 (not res!477809)) b!714780))

(declare-fun m!671233 () Bool)

(assert (=> d!98347 m!671233))

(declare-fun m!671235 () Bool)

(assert (=> d!98347 m!671235))

(declare-fun m!671237 () Bool)

(assert (=> b!714780 m!671237))

(assert (=> b!714694 d!98347))

(declare-fun b!714820 () Bool)

(declare-fun e!401662 () Bool)

(declare-fun e!401664 () Bool)

(assert (=> b!714820 (= e!401662 e!401664)))

(declare-fun res!477832 () Bool)

(assert (=> b!714820 (=> (not res!477832) (not e!401664))))

(declare-fun e!401663 () Bool)

(assert (=> b!714820 (= res!477832 (not e!401663))))

(declare-fun res!477834 () Bool)

(assert (=> b!714820 (=> (not res!477834) (not e!401663))))

(assert (=> b!714820 (= res!477834 (validKeyInArray!0 (select (arr!19390 a!3591) from!2969)))))

(declare-fun bm!34616 () Bool)

(declare-fun c!78861 () Bool)

(declare-fun call!34619 () Bool)

(assert (=> bm!34616 (= call!34619 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78861 (Cons!13427 (select (arr!19390 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!714821 () Bool)

(assert (=> b!714821 (= e!401663 (contains!4008 acc!652 (select (arr!19390 a!3591) from!2969)))))

(declare-fun b!714822 () Bool)

(declare-fun e!401661 () Bool)

(assert (=> b!714822 (= e!401661 call!34619)))

(declare-fun b!714823 () Bool)

(assert (=> b!714823 (= e!401664 e!401661)))

(assert (=> b!714823 (= c!78861 (validKeyInArray!0 (select (arr!19390 a!3591) from!2969)))))

(declare-fun d!98349 () Bool)

(declare-fun res!477833 () Bool)

(assert (=> d!98349 (=> res!477833 e!401662)))

(assert (=> d!98349 (= res!477833 (bvsge from!2969 (size!19803 a!3591)))))

(assert (=> d!98349 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401662)))

(declare-fun b!714824 () Bool)

(assert (=> b!714824 (= e!401661 call!34619)))

(assert (= (and d!98349 (not res!477833)) b!714820))

(assert (= (and b!714820 res!477834) b!714821))

(assert (= (and b!714820 res!477832) b!714823))

(assert (= (and b!714823 c!78861) b!714824))

(assert (= (and b!714823 (not c!78861)) b!714822))

(assert (= (or b!714824 b!714822) bm!34616))

(assert (=> b!714820 m!671141))

(assert (=> b!714820 m!671141))

(assert (=> b!714820 m!671143))

(assert (=> bm!34616 m!671141))

(declare-fun m!671253 () Bool)

(assert (=> bm!34616 m!671253))

(assert (=> b!714821 m!671141))

(assert (=> b!714821 m!671141))

(declare-fun m!671255 () Bool)

(assert (=> b!714821 m!671255))

(assert (=> b!714823 m!671141))

(assert (=> b!714823 m!671141))

(assert (=> b!714823 m!671143))

(assert (=> b!714695 d!98349))

(declare-fun d!98355 () Bool)

(declare-fun res!477837 () Bool)

(declare-fun e!401667 () Bool)

(assert (=> d!98355 (=> res!477837 e!401667)))

(assert (=> d!98355 (= res!477837 ((_ is Nil!13428) newAcc!49))))

(assert (=> d!98355 (= (noDuplicate!1255 newAcc!49) e!401667)))

(declare-fun b!714827 () Bool)

(declare-fun e!401668 () Bool)

(assert (=> b!714827 (= e!401667 e!401668)))

(declare-fun res!477838 () Bool)

(assert (=> b!714827 (=> (not res!477838) (not e!401668))))

(assert (=> b!714827 (= res!477838 (not (contains!4008 (t!19746 newAcc!49) (h!14472 newAcc!49))))))

(declare-fun b!714828 () Bool)

(assert (=> b!714828 (= e!401668 (noDuplicate!1255 (t!19746 newAcc!49)))))

(assert (= (and d!98355 (not res!477837)) b!714827))

(assert (= (and b!714827 res!477838) b!714828))

(declare-fun m!671257 () Bool)

(assert (=> b!714827 m!671257))

(declare-fun m!671259 () Bool)

(assert (=> b!714828 m!671259))

(assert (=> b!714684 d!98355))

(declare-fun d!98357 () Bool)

(declare-fun lt!318794 () Bool)

(assert (=> d!98357 (= lt!318794 (select (content!367 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401669 () Bool)

(assert (=> d!98357 (= lt!318794 e!401669)))

(declare-fun res!477840 () Bool)

(assert (=> d!98357 (=> (not res!477840) (not e!401669))))

(assert (=> d!98357 (= res!477840 ((_ is Cons!13427) newAcc!49))))

(assert (=> d!98357 (= (contains!4008 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318794)))

(declare-fun b!714829 () Bool)

(declare-fun e!401670 () Bool)

(assert (=> b!714829 (= e!401669 e!401670)))

(declare-fun res!477839 () Bool)

(assert (=> b!714829 (=> res!477839 e!401670)))

(assert (=> b!714829 (= res!477839 (= (h!14472 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714830 () Bool)

(assert (=> b!714830 (= e!401670 (contains!4008 (t!19746 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98357 res!477840) b!714829))

(assert (= (and b!714829 (not res!477839)) b!714830))

(assert (=> d!98357 m!671233))

(declare-fun m!671261 () Bool)

(assert (=> d!98357 m!671261))

(declare-fun m!671263 () Bool)

(assert (=> b!714830 m!671263))

(assert (=> b!714690 d!98357))

(declare-fun d!98359 () Bool)

(assert (=> d!98359 (= (validKeyInArray!0 (select (arr!19390 a!3591) from!2969)) (and (not (= (select (arr!19390 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19390 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714691 d!98359))

(declare-fun b!714868 () Bool)

(declare-fun e!401705 () List!13431)

(declare-fun e!401703 () List!13431)

(assert (=> b!714868 (= e!401705 e!401703)))

(declare-fun c!78868 () Bool)

(assert (=> b!714868 (= c!78868 (= k0!2824 (h!14472 newAcc!49)))))

(declare-fun bm!34620 () Bool)

(declare-fun call!34623 () List!13431)

(assert (=> bm!34620 (= call!34623 (-!418 (t!19746 newAcc!49) k0!2824))))

(declare-fun b!714869 () Bool)

(declare-fun e!401704 () Bool)

(declare-fun lt!318802 () List!13431)

(assert (=> b!714869 (= e!401704 (= (content!367 lt!318802) ((_ map and) (content!367 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!714870 () Bool)

(assert (=> b!714870 (= e!401703 (Cons!13427 (h!14472 newAcc!49) call!34623))))

(declare-fun b!714871 () Bool)

(assert (=> b!714871 (= e!401705 Nil!13428)))

(declare-fun b!714872 () Bool)

(assert (=> b!714872 (= e!401703 call!34623)))

(declare-fun d!98361 () Bool)

(assert (=> d!98361 e!401704))

(declare-fun res!477866 () Bool)

(assert (=> d!98361 (=> (not res!477866) (not e!401704))))

(declare-fun size!19806 (List!13431) Int)

(assert (=> d!98361 (= res!477866 (<= (size!19806 lt!318802) (size!19806 newAcc!49)))))

(assert (=> d!98361 (= lt!318802 e!401705)))

(declare-fun c!78869 () Bool)

(assert (=> d!98361 (= c!78869 ((_ is Cons!13427) newAcc!49))))

(assert (=> d!98361 (= (-!418 newAcc!49 k0!2824) lt!318802)))

(assert (= (and d!98361 c!78869) b!714868))

(assert (= (and d!98361 (not c!78869)) b!714871))

(assert (= (and b!714868 c!78868) b!714872))

(assert (= (and b!714868 (not c!78868)) b!714870))

(assert (= (or b!714872 b!714870) bm!34620))

(assert (= (and d!98361 res!477866) b!714869))

(declare-fun m!671293 () Bool)

(assert (=> bm!34620 m!671293))

(declare-fun m!671295 () Bool)

(assert (=> b!714869 m!671295))

(assert (=> b!714869 m!671233))

(declare-fun m!671297 () Bool)

(assert (=> b!714869 m!671297))

(declare-fun m!671299 () Bool)

(assert (=> d!98361 m!671299))

(declare-fun m!671301 () Bool)

(assert (=> d!98361 m!671301))

(assert (=> b!714698 d!98361))

(declare-fun b!714903 () Bool)

(declare-fun e!401738 () Bool)

(declare-fun e!401736 () Bool)

(assert (=> b!714903 (= e!401738 e!401736)))

(declare-fun res!477898 () Bool)

(assert (=> b!714903 (=> (not res!477898) (not e!401736))))

(assert (=> b!714903 (= res!477898 ((_ is Cons!13427) newAcc!49))))

(declare-fun b!714904 () Bool)

(declare-fun e!401737 () Bool)

(assert (=> b!714904 (= e!401736 e!401737)))

(declare-fun res!477900 () Bool)

(assert (=> b!714904 (=> res!477900 e!401737)))

(declare-fun e!401739 () Bool)

(assert (=> b!714904 (= res!477900 e!401739)))

(declare-fun res!477897 () Bool)

(assert (=> b!714904 (=> (not res!477897) (not e!401739))))

(assert (=> b!714904 (= res!477897 (= (h!14472 acc!652) (h!14472 newAcc!49)))))

(declare-fun b!714905 () Bool)

(assert (=> b!714905 (= e!401739 (subseq!453 (t!19746 acc!652) (t!19746 newAcc!49)))))

(declare-fun d!98381 () Bool)

(declare-fun res!477899 () Bool)

(assert (=> d!98381 (=> res!477899 e!401738)))

(assert (=> d!98381 (= res!477899 ((_ is Nil!13428) acc!652))))

(assert (=> d!98381 (= (subseq!453 acc!652 newAcc!49) e!401738)))

(declare-fun b!714906 () Bool)

(assert (=> b!714906 (= e!401737 (subseq!453 acc!652 (t!19746 newAcc!49)))))

(assert (= (and d!98381 (not res!477899)) b!714903))

(assert (= (and b!714903 res!477898) b!714904))

(assert (= (and b!714904 res!477897) b!714905))

(assert (= (and b!714904 (not res!477900)) b!714906))

(declare-fun m!671319 () Bool)

(assert (=> b!714905 m!671319))

(declare-fun m!671321 () Bool)

(assert (=> b!714906 m!671321))

(assert (=> b!714699 d!98381))

(declare-fun b!714915 () Bool)

(declare-fun e!401749 () Bool)

(declare-fun e!401751 () Bool)

(assert (=> b!714915 (= e!401749 e!401751)))

(declare-fun res!477909 () Bool)

(assert (=> b!714915 (=> (not res!477909) (not e!401751))))

(declare-fun e!401750 () Bool)

(assert (=> b!714915 (= res!477909 (not e!401750))))

(declare-fun res!477911 () Bool)

(assert (=> b!714915 (=> (not res!477911) (not e!401750))))

(assert (=> b!714915 (= res!477911 (validKeyInArray!0 (select (arr!19390 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun bm!34621 () Bool)

(declare-fun call!34624 () Bool)

(declare-fun c!78870 () Bool)

(assert (=> bm!34621 (= call!34624 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78870 (Cons!13427 (select (arr!19390 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun b!714916 () Bool)

(assert (=> b!714916 (= e!401750 (contains!4008 acc!652 (select (arr!19390 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714917 () Bool)

(declare-fun e!401748 () Bool)

(assert (=> b!714917 (= e!401748 call!34624)))

(declare-fun b!714918 () Bool)

(assert (=> b!714918 (= e!401751 e!401748)))

(assert (=> b!714918 (= c!78870 (validKeyInArray!0 (select (arr!19390 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98391 () Bool)

(declare-fun res!477910 () Bool)

(assert (=> d!98391 (=> res!477910 e!401749)))

(assert (=> d!98391 (= res!477910 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19803 a!3591)))))

(assert (=> d!98391 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!401749)))

(declare-fun b!714919 () Bool)

(assert (=> b!714919 (= e!401748 call!34624)))

(assert (= (and d!98391 (not res!477910)) b!714915))

(assert (= (and b!714915 res!477911) b!714916))

(assert (= (and b!714915 res!477909) b!714918))

(assert (= (and b!714918 c!78870) b!714919))

(assert (= (and b!714918 (not c!78870)) b!714917))

(assert (= (or b!714919 b!714917) bm!34621))

(assert (=> b!714915 m!671225))

(assert (=> b!714915 m!671225))

(declare-fun m!671323 () Bool)

(assert (=> b!714915 m!671323))

(assert (=> bm!34621 m!671225))

(declare-fun m!671325 () Bool)

(assert (=> bm!34621 m!671325))

(assert (=> b!714916 m!671225))

(assert (=> b!714916 m!671225))

(declare-fun m!671327 () Bool)

(assert (=> b!714916 m!671327))

(assert (=> b!714918 m!671225))

(assert (=> b!714918 m!671225))

(assert (=> b!714918 m!671323))

(assert (=> b!714688 d!98391))

(declare-fun d!98393 () Bool)

(declare-fun lt!318805 () Bool)

(assert (=> d!98393 (= lt!318805 (select (content!367 newAcc!49) k0!2824))))

(declare-fun e!401758 () Bool)

(assert (=> d!98393 (= lt!318805 e!401758)))

(declare-fun res!477919 () Bool)

(assert (=> d!98393 (=> (not res!477919) (not e!401758))))

(assert (=> d!98393 (= res!477919 ((_ is Cons!13427) newAcc!49))))

(assert (=> d!98393 (= (contains!4008 newAcc!49 k0!2824) lt!318805)))

(declare-fun b!714924 () Bool)

(declare-fun e!401759 () Bool)

(assert (=> b!714924 (= e!401758 e!401759)))

(declare-fun res!477918 () Bool)

(assert (=> b!714924 (=> res!477918 e!401759)))

(assert (=> b!714924 (= res!477918 (= (h!14472 newAcc!49) k0!2824))))

(declare-fun b!714925 () Bool)

(assert (=> b!714925 (= e!401759 (contains!4008 (t!19746 newAcc!49) k0!2824))))

(assert (= (and d!98393 res!477919) b!714924))

(assert (= (and b!714924 (not res!477918)) b!714925))

(assert (=> d!98393 m!671233))

(declare-fun m!671329 () Bool)

(assert (=> d!98393 m!671329))

(declare-fun m!671331 () Bool)

(assert (=> b!714925 m!671331))

(assert (=> b!714689 d!98393))

(declare-fun d!98395 () Bool)

(assert (=> d!98395 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714700 d!98395))

(check-sat (not b!714906) (not bm!34616) (not b!714905) (not d!98329) (not b!714778) (not b!714768) (not b!714766) (not b!714773) (not b!714916) (not b!714820) (not b!714925) (not b!714823) (not d!98333) (not d!98345) (not b!714827) (not d!98347) (not d!98393) (not b!714774) (not b!714821) (not b!714780) (not b!714828) (not b!714869) (not b!714830) (not b!714776) (not d!98357) (not d!98361) (not b!714760) (not b!714918) (not bm!34620) (not b!714915) (not bm!34621))
(check-sat)
