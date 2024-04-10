; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63276 () Bool)

(assert start!63276)

(declare-fun b!712797 () Bool)

(declare-fun res!475979 () Bool)

(declare-fun e!400911 () Bool)

(assert (=> b!712797 (=> (not res!475979) (not e!400911))))

(declare-datatypes ((List!13401 0))(
  ( (Nil!13398) (Cons!13397 (h!14442 (_ BitVec 64)) (t!19713 List!13401)) )
))
(declare-fun newAcc!49 () List!13401)

(declare-fun contains!3978 (List!13401 (_ BitVec 64)) Bool)

(assert (=> b!712797 (= res!475979 (not (contains!3978 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712798 () Bool)

(declare-fun res!475975 () Bool)

(declare-fun e!400912 () Bool)

(assert (=> b!712798 (=> (not res!475975) (not e!400912))))

(declare-fun lt!318614 () List!13401)

(declare-fun noDuplicate!1225 (List!13401) Bool)

(assert (=> b!712798 (= res!475975 (noDuplicate!1225 lt!318614))))

(declare-fun b!712799 () Bool)

(declare-datatypes ((array!40437 0))(
  ( (array!40438 (arr!19360 (Array (_ BitVec 32) (_ BitVec 64))) (size!19768 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40437)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40437 (_ BitVec 32) List!13401) Bool)

(assert (=> b!712799 (= e!400912 (not (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49)))))

(declare-fun lt!318612 () List!13401)

(assert (=> b!712799 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318612)))

(declare-datatypes ((Unit!24632 0))(
  ( (Unit!24633) )
))
(declare-fun lt!318613 () Unit!24632)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40437 (_ BitVec 64) (_ BitVec 32) List!13401 List!13401) Unit!24632)

(assert (=> b!712799 (= lt!318613 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318614 lt!318612))))

(declare-fun b!712800 () Bool)

(declare-fun res!475984 () Bool)

(assert (=> b!712800 (=> (not res!475984) (not e!400911))))

(assert (=> b!712800 (= res!475984 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19768 a!3591)))))

(declare-fun b!712801 () Bool)

(declare-fun res!475983 () Bool)

(assert (=> b!712801 (=> (not res!475983) (not e!400911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!712801 (= res!475983 (validKeyInArray!0 k0!2824))))

(declare-fun b!712802 () Bool)

(declare-fun res!475993 () Bool)

(assert (=> b!712802 (=> (not res!475993) (not e!400912))))

(assert (=> b!712802 (= res!475993 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318614))))

(declare-fun b!712803 () Bool)

(declare-fun res!475985 () Bool)

(assert (=> b!712803 (=> (not res!475985) (not e!400912))))

(assert (=> b!712803 (= res!475985 (not (contains!3978 lt!318614 k0!2824)))))

(declare-fun b!712804 () Bool)

(declare-fun res!475974 () Bool)

(assert (=> b!712804 (=> (not res!475974) (not e!400911))))

(declare-fun acc!652 () List!13401)

(assert (=> b!712804 (= res!475974 (not (contains!3978 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712805 () Bool)

(declare-fun res!475968 () Bool)

(assert (=> b!712805 (=> (not res!475968) (not e!400912))))

(assert (=> b!712805 (= res!475968 (not (contains!3978 lt!318614 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712806 () Bool)

(declare-fun res!475967 () Bool)

(assert (=> b!712806 (=> (not res!475967) (not e!400912))))

(assert (=> b!712806 (= res!475967 (contains!3978 lt!318612 k0!2824))))

(declare-fun b!712807 () Bool)

(declare-fun res!475987 () Bool)

(assert (=> b!712807 (=> (not res!475987) (not e!400911))))

(declare-fun subseq!423 (List!13401 List!13401) Bool)

(assert (=> b!712807 (= res!475987 (subseq!423 acc!652 newAcc!49))))

(declare-fun b!712808 () Bool)

(declare-fun res!475986 () Bool)

(assert (=> b!712808 (=> (not res!475986) (not e!400911))))

(assert (=> b!712808 (= res!475986 (contains!3978 newAcc!49 k0!2824))))

(declare-fun b!712809 () Bool)

(declare-fun res!475973 () Bool)

(assert (=> b!712809 (=> (not res!475973) (not e!400912))))

(declare-fun arrayContainsKey!0 (array!40437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!712809 (= res!475973 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!712810 () Bool)

(declare-fun res!475988 () Bool)

(assert (=> b!712810 (=> (not res!475988) (not e!400911))))

(assert (=> b!712810 (= res!475988 (not (contains!3978 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712811 () Bool)

(declare-fun res!475990 () Bool)

(assert (=> b!712811 (=> (not res!475990) (not e!400912))))

(assert (=> b!712811 (= res!475990 (not (contains!3978 lt!318612 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712812 () Bool)

(declare-fun res!475965 () Bool)

(assert (=> b!712812 (=> (not res!475965) (not e!400911))))

(assert (=> b!712812 (= res!475965 (not (contains!3978 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712813 () Bool)

(declare-fun res!475972 () Bool)

(assert (=> b!712813 (=> (not res!475972) (not e!400912))))

(assert (=> b!712813 (= res!475972 (subseq!423 lt!318614 lt!318612))))

(declare-fun b!712814 () Bool)

(declare-fun res!475970 () Bool)

(assert (=> b!712814 (=> (not res!475970) (not e!400911))))

(assert (=> b!712814 (= res!475970 (not (contains!3978 acc!652 k0!2824)))))

(declare-fun b!712815 () Bool)

(declare-fun res!475971 () Bool)

(assert (=> b!712815 (=> (not res!475971) (not e!400912))))

(assert (=> b!712815 (= res!475971 (noDuplicate!1225 lt!318612))))

(declare-fun b!712816 () Bool)

(declare-fun res!475966 () Bool)

(assert (=> b!712816 (=> (not res!475966) (not e!400912))))

(declare-fun -!388 (List!13401 (_ BitVec 64)) List!13401)

(assert (=> b!712816 (= res!475966 (= (-!388 lt!318612 k0!2824) lt!318614))))

(declare-fun b!712817 () Bool)

(declare-fun res!475991 () Bool)

(assert (=> b!712817 (=> (not res!475991) (not e!400911))))

(assert (=> b!712817 (= res!475991 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!712818 () Bool)

(declare-fun res!475982 () Bool)

(assert (=> b!712818 (=> (not res!475982) (not e!400911))))

(assert (=> b!712818 (= res!475982 (validKeyInArray!0 (select (arr!19360 a!3591) from!2969)))))

(declare-fun res!475981 () Bool)

(assert (=> start!63276 (=> (not res!475981) (not e!400911))))

(assert (=> start!63276 (= res!475981 (and (bvslt (size!19768 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19768 a!3591))))))

(assert (=> start!63276 e!400911))

(assert (=> start!63276 true))

(declare-fun array_inv!15156 (array!40437) Bool)

(assert (=> start!63276 (array_inv!15156 a!3591)))

(declare-fun b!712819 () Bool)

(declare-fun res!475992 () Bool)

(assert (=> b!712819 (=> (not res!475992) (not e!400912))))

(assert (=> b!712819 (= res!475992 (not (contains!3978 lt!318612 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712820 () Bool)

(declare-fun res!475977 () Bool)

(assert (=> b!712820 (=> (not res!475977) (not e!400911))))

(assert (=> b!712820 (= res!475977 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!712821 () Bool)

(declare-fun res!475980 () Bool)

(assert (=> b!712821 (=> (not res!475980) (not e!400912))))

(assert (=> b!712821 (= res!475980 (not (contains!3978 lt!318614 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!712822 () Bool)

(declare-fun res!475989 () Bool)

(assert (=> b!712822 (=> (not res!475989) (not e!400911))))

(assert (=> b!712822 (= res!475989 (noDuplicate!1225 acc!652))))

(declare-fun b!712823 () Bool)

(declare-fun res!475978 () Bool)

(assert (=> b!712823 (=> (not res!475978) (not e!400911))))

(assert (=> b!712823 (= res!475978 (noDuplicate!1225 newAcc!49))))

(declare-fun b!712824 () Bool)

(declare-fun res!475969 () Bool)

(assert (=> b!712824 (=> (not res!475969) (not e!400911))))

(assert (=> b!712824 (= res!475969 (= (-!388 newAcc!49 k0!2824) acc!652))))

(declare-fun b!712825 () Bool)

(assert (=> b!712825 (= e!400911 e!400912)))

(declare-fun res!475976 () Bool)

(assert (=> b!712825 (=> (not res!475976) (not e!400912))))

(assert (=> b!712825 (= res!475976 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!534 (List!13401 (_ BitVec 64)) List!13401)

(assert (=> b!712825 (= lt!318612 ($colon$colon!534 newAcc!49 (select (arr!19360 a!3591) from!2969)))))

(assert (=> b!712825 (= lt!318614 ($colon$colon!534 acc!652 (select (arr!19360 a!3591) from!2969)))))

(assert (= (and start!63276 res!475981) b!712822))

(assert (= (and b!712822 res!475989) b!712823))

(assert (= (and b!712823 res!475978) b!712810))

(assert (= (and b!712810 res!475988) b!712804))

(assert (= (and b!712804 res!475974) b!712817))

(assert (= (and b!712817 res!475991) b!712814))

(assert (= (and b!712814 res!475970) b!712801))

(assert (= (and b!712801 res!475983) b!712820))

(assert (= (and b!712820 res!475977) b!712807))

(assert (= (and b!712807 res!475987) b!712808))

(assert (= (and b!712808 res!475986) b!712824))

(assert (= (and b!712824 res!475969) b!712797))

(assert (= (and b!712797 res!475979) b!712812))

(assert (= (and b!712812 res!475965) b!712800))

(assert (= (and b!712800 res!475984) b!712818))

(assert (= (and b!712818 res!475982) b!712825))

(assert (= (and b!712825 res!475976) b!712798))

(assert (= (and b!712798 res!475975) b!712815))

(assert (= (and b!712815 res!475971) b!712821))

(assert (= (and b!712821 res!475980) b!712805))

(assert (= (and b!712805 res!475968) b!712809))

(assert (= (and b!712809 res!475973) b!712803))

(assert (= (and b!712803 res!475985) b!712802))

(assert (= (and b!712802 res!475993) b!712813))

(assert (= (and b!712813 res!475972) b!712806))

(assert (= (and b!712806 res!475967) b!712816))

(assert (= (and b!712816 res!475966) b!712811))

(assert (= (and b!712811 res!475990) b!712819))

(assert (= (and b!712819 res!475992) b!712799))

(declare-fun m!669631 () Bool)

(assert (=> b!712804 m!669631))

(declare-fun m!669633 () Bool)

(assert (=> b!712817 m!669633))

(declare-fun m!669635 () Bool)

(assert (=> b!712809 m!669635))

(declare-fun m!669637 () Bool)

(assert (=> start!63276 m!669637))

(declare-fun m!669639 () Bool)

(assert (=> b!712803 m!669639))

(declare-fun m!669641 () Bool)

(assert (=> b!712807 m!669641))

(declare-fun m!669643 () Bool)

(assert (=> b!712812 m!669643))

(declare-fun m!669645 () Bool)

(assert (=> b!712822 m!669645))

(declare-fun m!669647 () Bool)

(assert (=> b!712814 m!669647))

(declare-fun m!669649 () Bool)

(assert (=> b!712810 m!669649))

(declare-fun m!669651 () Bool)

(assert (=> b!712801 m!669651))

(declare-fun m!669653 () Bool)

(assert (=> b!712816 m!669653))

(declare-fun m!669655 () Bool)

(assert (=> b!712806 m!669655))

(declare-fun m!669657 () Bool)

(assert (=> b!712825 m!669657))

(assert (=> b!712825 m!669657))

(declare-fun m!669659 () Bool)

(assert (=> b!712825 m!669659))

(assert (=> b!712825 m!669657))

(declare-fun m!669661 () Bool)

(assert (=> b!712825 m!669661))

(declare-fun m!669663 () Bool)

(assert (=> b!712802 m!669663))

(declare-fun m!669665 () Bool)

(assert (=> b!712821 m!669665))

(declare-fun m!669667 () Bool)

(assert (=> b!712824 m!669667))

(declare-fun m!669669 () Bool)

(assert (=> b!712805 m!669669))

(declare-fun m!669671 () Bool)

(assert (=> b!712819 m!669671))

(declare-fun m!669673 () Bool)

(assert (=> b!712808 m!669673))

(declare-fun m!669675 () Bool)

(assert (=> b!712813 m!669675))

(declare-fun m!669677 () Bool)

(assert (=> b!712797 m!669677))

(declare-fun m!669679 () Bool)

(assert (=> b!712820 m!669679))

(declare-fun m!669681 () Bool)

(assert (=> b!712815 m!669681))

(declare-fun m!669683 () Bool)

(assert (=> b!712798 m!669683))

(declare-fun m!669685 () Bool)

(assert (=> b!712799 m!669685))

(declare-fun m!669687 () Bool)

(assert (=> b!712799 m!669687))

(declare-fun m!669689 () Bool)

(assert (=> b!712799 m!669689))

(declare-fun m!669691 () Bool)

(assert (=> b!712811 m!669691))

(declare-fun m!669693 () Bool)

(assert (=> b!712823 m!669693))

(assert (=> b!712818 m!669657))

(assert (=> b!712818 m!669657))

(declare-fun m!669695 () Bool)

(assert (=> b!712818 m!669695))

(check-sat (not b!712821) (not b!712809) (not b!712797) (not b!712806) (not b!712822) (not b!712813) (not b!712823) (not b!712803) (not b!712802) (not b!712825) (not b!712798) (not b!712815) (not b!712805) (not b!712814) (not b!712807) (not b!712817) (not b!712824) (not b!712812) (not b!712818) (not b!712820) (not b!712804) (not b!712816) (not b!712811) (not b!712819) (not b!712801) (not b!712808) (not start!63276) (not b!712810) (not b!712799))
(check-sat)
(get-model)

(declare-fun b!712924 () Bool)

(declare-fun e!400932 () Bool)

(assert (=> b!712924 (= e!400932 (subseq!423 lt!318614 (t!19713 lt!318612)))))

(declare-fun d!98021 () Bool)

(declare-fun res!476091 () Bool)

(declare-fun e!400933 () Bool)

(assert (=> d!98021 (=> res!476091 e!400933)))

(get-info :version)

(assert (=> d!98021 (= res!476091 ((_ is Nil!13398) lt!318614))))

(assert (=> d!98021 (= (subseq!423 lt!318614 lt!318612) e!400933)))

(declare-fun b!712921 () Bool)

(declare-fun e!400934 () Bool)

(assert (=> b!712921 (= e!400933 e!400934)))

(declare-fun res!476090 () Bool)

(assert (=> b!712921 (=> (not res!476090) (not e!400934))))

(assert (=> b!712921 (= res!476090 ((_ is Cons!13397) lt!318612))))

(declare-fun b!712923 () Bool)

(declare-fun e!400931 () Bool)

(assert (=> b!712923 (= e!400931 (subseq!423 (t!19713 lt!318614) (t!19713 lt!318612)))))

(declare-fun b!712922 () Bool)

(assert (=> b!712922 (= e!400934 e!400932)))

(declare-fun res!476092 () Bool)

(assert (=> b!712922 (=> res!476092 e!400932)))

(assert (=> b!712922 (= res!476092 e!400931)))

(declare-fun res!476089 () Bool)

(assert (=> b!712922 (=> (not res!476089) (not e!400931))))

(assert (=> b!712922 (= res!476089 (= (h!14442 lt!318614) (h!14442 lt!318612)))))

(assert (= (and d!98021 (not res!476091)) b!712921))

(assert (= (and b!712921 res!476090) b!712922))

(assert (= (and b!712922 res!476089) b!712923))

(assert (= (and b!712922 (not res!476092)) b!712924))

(declare-fun m!669763 () Bool)

(assert (=> b!712924 m!669763))

(declare-fun m!669765 () Bool)

(assert (=> b!712923 m!669765))

(assert (=> b!712813 d!98021))

(declare-fun d!98023 () Bool)

(declare-fun lt!318626 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!361 (List!13401) (InoxSet (_ BitVec 64)))

(assert (=> d!98023 (= lt!318626 (select (content!361 acc!652) k0!2824))))

(declare-fun e!400939 () Bool)

(assert (=> d!98023 (= lt!318626 e!400939)))

(declare-fun res!476098 () Bool)

(assert (=> d!98023 (=> (not res!476098) (not e!400939))))

(assert (=> d!98023 (= res!476098 ((_ is Cons!13397) acc!652))))

(assert (=> d!98023 (= (contains!3978 acc!652 k0!2824) lt!318626)))

(declare-fun b!712929 () Bool)

(declare-fun e!400940 () Bool)

(assert (=> b!712929 (= e!400939 e!400940)))

(declare-fun res!476097 () Bool)

(assert (=> b!712929 (=> res!476097 e!400940)))

(assert (=> b!712929 (= res!476097 (= (h!14442 acc!652) k0!2824))))

(declare-fun b!712930 () Bool)

(assert (=> b!712930 (= e!400940 (contains!3978 (t!19713 acc!652) k0!2824))))

(assert (= (and d!98023 res!476098) b!712929))

(assert (= (and b!712929 (not res!476097)) b!712930))

(declare-fun m!669767 () Bool)

(assert (=> d!98023 m!669767))

(declare-fun m!669769 () Bool)

(assert (=> d!98023 m!669769))

(declare-fun m!669771 () Bool)

(assert (=> b!712930 m!669771))

(assert (=> b!712814 d!98023))

(declare-fun d!98025 () Bool)

(declare-fun res!476103 () Bool)

(declare-fun e!400945 () Bool)

(assert (=> d!98025 (=> res!476103 e!400945)))

(assert (=> d!98025 (= res!476103 ((_ is Nil!13398) lt!318612))))

(assert (=> d!98025 (= (noDuplicate!1225 lt!318612) e!400945)))

(declare-fun b!712935 () Bool)

(declare-fun e!400946 () Bool)

(assert (=> b!712935 (= e!400945 e!400946)))

(declare-fun res!476104 () Bool)

(assert (=> b!712935 (=> (not res!476104) (not e!400946))))

(assert (=> b!712935 (= res!476104 (not (contains!3978 (t!19713 lt!318612) (h!14442 lt!318612))))))

(declare-fun b!712936 () Bool)

(assert (=> b!712936 (= e!400946 (noDuplicate!1225 (t!19713 lt!318612)))))

(assert (= (and d!98025 (not res!476103)) b!712935))

(assert (= (and b!712935 res!476104) b!712936))

(declare-fun m!669773 () Bool)

(assert (=> b!712935 m!669773))

(declare-fun m!669775 () Bool)

(assert (=> b!712936 m!669775))

(assert (=> b!712815 d!98025))

(declare-fun d!98027 () Bool)

(declare-fun e!400968 () Bool)

(assert (=> d!98027 e!400968))

(declare-fun res!476115 () Bool)

(assert (=> d!98027 (=> (not res!476115) (not e!400968))))

(declare-fun lt!318634 () List!13401)

(declare-fun size!19770 (List!13401) Int)

(assert (=> d!98027 (= res!476115 (<= (size!19770 lt!318634) (size!19770 lt!318612)))))

(declare-fun e!400967 () List!13401)

(assert (=> d!98027 (= lt!318634 e!400967)))

(declare-fun c!78791 () Bool)

(assert (=> d!98027 (= c!78791 ((_ is Cons!13397) lt!318612))))

(assert (=> d!98027 (= (-!388 lt!318612 k0!2824) lt!318634)))

(declare-fun b!712963 () Bool)

(assert (=> b!712963 (= e!400968 (= (content!361 lt!318634) ((_ map and) (content!361 lt!318612) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!712964 () Bool)

(declare-fun e!400969 () List!13401)

(assert (=> b!712964 (= e!400967 e!400969)))

(declare-fun c!78792 () Bool)

(assert (=> b!712964 (= c!78792 (= k0!2824 (h!14442 lt!318612)))))

(declare-fun b!712965 () Bool)

(declare-fun call!34568 () List!13401)

(assert (=> b!712965 (= e!400969 (Cons!13397 (h!14442 lt!318612) call!34568))))

(declare-fun b!712966 () Bool)

(assert (=> b!712966 (= e!400967 Nil!13398)))

(declare-fun b!712967 () Bool)

(assert (=> b!712967 (= e!400969 call!34568)))

(declare-fun bm!34565 () Bool)

(assert (=> bm!34565 (= call!34568 (-!388 (t!19713 lt!318612) k0!2824))))

(assert (= (and d!98027 c!78791) b!712964))

(assert (= (and d!98027 (not c!78791)) b!712966))

(assert (= (and b!712964 c!78792) b!712967))

(assert (= (and b!712964 (not c!78792)) b!712965))

(assert (= (or b!712967 b!712965) bm!34565))

(assert (= (and d!98027 res!476115) b!712963))

(declare-fun m!669783 () Bool)

(assert (=> d!98027 m!669783))

(declare-fun m!669785 () Bool)

(assert (=> d!98027 m!669785))

(declare-fun m!669787 () Bool)

(assert (=> b!712963 m!669787))

(declare-fun m!669789 () Bool)

(assert (=> b!712963 m!669789))

(declare-fun m!669791 () Bool)

(assert (=> b!712963 m!669791))

(declare-fun m!669793 () Bool)

(assert (=> bm!34565 m!669793))

(assert (=> b!712816 d!98027))

(declare-fun d!98035 () Bool)

(declare-fun res!476121 () Bool)

(declare-fun e!400977 () Bool)

(assert (=> d!98035 (=> res!476121 e!400977)))

(assert (=> d!98035 (= res!476121 (= (select (arr!19360 a!3591) from!2969) k0!2824))))

(assert (=> d!98035 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!400977)))

(declare-fun b!712977 () Bool)

(declare-fun e!400978 () Bool)

(assert (=> b!712977 (= e!400977 e!400978)))

(declare-fun res!476122 () Bool)

(assert (=> b!712977 (=> (not res!476122) (not e!400978))))

(assert (=> b!712977 (= res!476122 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19768 a!3591)))))

(declare-fun b!712978 () Bool)

(assert (=> b!712978 (= e!400978 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98035 (not res!476121)) b!712977))

(assert (= (and b!712977 res!476122) b!712978))

(assert (=> d!98035 m!669657))

(declare-fun m!669807 () Bool)

(assert (=> b!712978 m!669807))

(assert (=> b!712817 d!98035))

(declare-fun d!98041 () Bool)

(declare-fun lt!318636 () Bool)

(assert (=> d!98041 (= lt!318636 (select (content!361 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400979 () Bool)

(assert (=> d!98041 (= lt!318636 e!400979)))

(declare-fun res!476124 () Bool)

(assert (=> d!98041 (=> (not res!476124) (not e!400979))))

(assert (=> d!98041 (= res!476124 ((_ is Cons!13397) newAcc!49))))

(assert (=> d!98041 (= (contains!3978 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318636)))

(declare-fun b!712979 () Bool)

(declare-fun e!400980 () Bool)

(assert (=> b!712979 (= e!400979 e!400980)))

(declare-fun res!476123 () Bool)

(assert (=> b!712979 (=> res!476123 e!400980)))

(assert (=> b!712979 (= res!476123 (= (h!14442 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712980 () Bool)

(assert (=> b!712980 (= e!400980 (contains!3978 (t!19713 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98041 res!476124) b!712979))

(assert (= (and b!712979 (not res!476123)) b!712980))

(declare-fun m!669809 () Bool)

(assert (=> d!98041 m!669809))

(declare-fun m!669811 () Bool)

(assert (=> d!98041 m!669811))

(declare-fun m!669813 () Bool)

(assert (=> b!712980 m!669813))

(assert (=> b!712797 d!98041))

(declare-fun d!98043 () Bool)

(assert (=> d!98043 (= (validKeyInArray!0 (select (arr!19360 a!3591) from!2969)) (and (not (= (select (arr!19360 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19360 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712818 d!98043))

(declare-fun d!98045 () Bool)

(declare-fun lt!318637 () Bool)

(assert (=> d!98045 (= lt!318637 (select (content!361 lt!318612) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!400993 () Bool)

(assert (=> d!98045 (= lt!318637 e!400993)))

(declare-fun res!476138 () Bool)

(assert (=> d!98045 (=> (not res!476138) (not e!400993))))

(assert (=> d!98045 (= res!476138 ((_ is Cons!13397) lt!318612))))

(assert (=> d!98045 (= (contains!3978 lt!318612 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318637)))

(declare-fun b!712993 () Bool)

(declare-fun e!400994 () Bool)

(assert (=> b!712993 (= e!400993 e!400994)))

(declare-fun res!476137 () Bool)

(assert (=> b!712993 (=> res!476137 e!400994)))

(assert (=> b!712993 (= res!476137 (= (h!14442 lt!318612) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!712994 () Bool)

(assert (=> b!712994 (= e!400994 (contains!3978 (t!19713 lt!318612) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98045 res!476138) b!712993))

(assert (= (and b!712993 (not res!476137)) b!712994))

(assert (=> d!98045 m!669789))

(declare-fun m!669815 () Bool)

(assert (=> d!98045 m!669815))

(declare-fun m!669817 () Bool)

(assert (=> b!712994 m!669817))

(assert (=> b!712819 d!98045))

(declare-fun d!98047 () Bool)

(declare-fun res!476139 () Bool)

(declare-fun e!400995 () Bool)

(assert (=> d!98047 (=> res!476139 e!400995)))

(assert (=> d!98047 (= res!476139 ((_ is Nil!13398) lt!318614))))

(assert (=> d!98047 (= (noDuplicate!1225 lt!318614) e!400995)))

(declare-fun b!712995 () Bool)

(declare-fun e!400996 () Bool)

(assert (=> b!712995 (= e!400995 e!400996)))

(declare-fun res!476140 () Bool)

(assert (=> b!712995 (=> (not res!476140) (not e!400996))))

(assert (=> b!712995 (= res!476140 (not (contains!3978 (t!19713 lt!318614) (h!14442 lt!318614))))))

(declare-fun b!712996 () Bool)

(assert (=> b!712996 (= e!400996 (noDuplicate!1225 (t!19713 lt!318614)))))

(assert (= (and d!98047 (not res!476139)) b!712995))

(assert (= (and b!712995 res!476140) b!712996))

(declare-fun m!669819 () Bool)

(assert (=> b!712995 m!669819))

(declare-fun m!669821 () Bool)

(assert (=> b!712996 m!669821))

(assert (=> b!712798 d!98047))

(declare-fun b!713044 () Bool)

(declare-fun e!401043 () Bool)

(assert (=> b!713044 (= e!401043 (contains!3978 newAcc!49 (select (arr!19360 a!3591) from!2969)))))

(declare-fun b!713045 () Bool)

(declare-fun e!401041 () Bool)

(declare-fun e!401040 () Bool)

(assert (=> b!713045 (= e!401041 e!401040)))

(declare-fun res!476182 () Bool)

(assert (=> b!713045 (=> (not res!476182) (not e!401040))))

(assert (=> b!713045 (= res!476182 (not e!401043))))

(declare-fun res!476181 () Bool)

(assert (=> b!713045 (=> (not res!476181) (not e!401043))))

(assert (=> b!713045 (= res!476181 (validKeyInArray!0 (select (arr!19360 a!3591) from!2969)))))

(declare-fun c!78799 () Bool)

(declare-fun call!34573 () Bool)

(declare-fun bm!34570 () Bool)

(assert (=> bm!34570 (= call!34573 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78799 (Cons!13397 (select (arr!19360 a!3591) from!2969) newAcc!49) newAcc!49)))))

(declare-fun b!713046 () Bool)

(declare-fun e!401042 () Bool)

(assert (=> b!713046 (= e!401040 e!401042)))

(assert (=> b!713046 (= c!78799 (validKeyInArray!0 (select (arr!19360 a!3591) from!2969)))))

(declare-fun d!98049 () Bool)

(declare-fun res!476180 () Bool)

(assert (=> d!98049 (=> res!476180 e!401041)))

(assert (=> d!98049 (= res!476180 (bvsge from!2969 (size!19768 a!3591)))))

(assert (=> d!98049 (= (arrayNoDuplicates!0 a!3591 from!2969 newAcc!49) e!401041)))

(declare-fun b!713047 () Bool)

(assert (=> b!713047 (= e!401042 call!34573)))

(declare-fun b!713048 () Bool)

(assert (=> b!713048 (= e!401042 call!34573)))

(assert (= (and d!98049 (not res!476180)) b!713045))

(assert (= (and b!713045 res!476181) b!713044))

(assert (= (and b!713045 res!476182) b!713046))

(assert (= (and b!713046 c!78799) b!713048))

(assert (= (and b!713046 (not c!78799)) b!713047))

(assert (= (or b!713048 b!713047) bm!34570))

(assert (=> b!713044 m!669657))

(assert (=> b!713044 m!669657))

(declare-fun m!669883 () Bool)

(assert (=> b!713044 m!669883))

(assert (=> b!713045 m!669657))

(assert (=> b!713045 m!669657))

(assert (=> b!713045 m!669695))

(assert (=> bm!34570 m!669657))

(declare-fun m!669885 () Bool)

(assert (=> bm!34570 m!669885))

(assert (=> b!713046 m!669657))

(assert (=> b!713046 m!669657))

(assert (=> b!713046 m!669695))

(assert (=> b!712799 d!98049))

(declare-fun e!401047 () Bool)

(declare-fun b!713049 () Bool)

(assert (=> b!713049 (= e!401047 (contains!3978 lt!318612 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713050 () Bool)

(declare-fun e!401045 () Bool)

(declare-fun e!401044 () Bool)

(assert (=> b!713050 (= e!401045 e!401044)))

(declare-fun res!476185 () Bool)

(assert (=> b!713050 (=> (not res!476185) (not e!401044))))

(assert (=> b!713050 (= res!476185 (not e!401047))))

(declare-fun res!476184 () Bool)

(assert (=> b!713050 (=> (not res!476184) (not e!401047))))

(assert (=> b!713050 (= res!476184 (validKeyInArray!0 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun call!34574 () Bool)

(declare-fun c!78800 () Bool)

(declare-fun bm!34571 () Bool)

(assert (=> bm!34571 (= call!34574 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78800 (Cons!13397 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318612) lt!318612)))))

(declare-fun b!713051 () Bool)

(declare-fun e!401046 () Bool)

(assert (=> b!713051 (= e!401044 e!401046)))

(assert (=> b!713051 (= c!78800 (validKeyInArray!0 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98079 () Bool)

(declare-fun res!476183 () Bool)

(assert (=> d!98079 (=> res!476183 e!401045)))

(assert (=> d!98079 (= res!476183 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19768 a!3591)))))

(assert (=> d!98079 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318612) e!401045)))

(declare-fun b!713052 () Bool)

(assert (=> b!713052 (= e!401046 call!34574)))

(declare-fun b!713053 () Bool)

(assert (=> b!713053 (= e!401046 call!34574)))

(assert (= (and d!98079 (not res!476183)) b!713050))

(assert (= (and b!713050 res!476184) b!713049))

(assert (= (and b!713050 res!476185) b!713051))

(assert (= (and b!713051 c!78800) b!713053))

(assert (= (and b!713051 (not c!78800)) b!713052))

(assert (= (or b!713053 b!713052) bm!34571))

(declare-fun m!669887 () Bool)

(assert (=> b!713049 m!669887))

(assert (=> b!713049 m!669887))

(declare-fun m!669889 () Bool)

(assert (=> b!713049 m!669889))

(assert (=> b!713050 m!669887))

(assert (=> b!713050 m!669887))

(declare-fun m!669891 () Bool)

(assert (=> b!713050 m!669891))

(assert (=> bm!34571 m!669887))

(declare-fun m!669893 () Bool)

(assert (=> bm!34571 m!669893))

(assert (=> b!713051 m!669887))

(assert (=> b!713051 m!669887))

(assert (=> b!713051 m!669891))

(assert (=> b!712799 d!98079))

(declare-fun d!98081 () Bool)

(assert (=> d!98081 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318612)))

(declare-fun lt!318651 () Unit!24632)

(declare-fun choose!66 (array!40437 (_ BitVec 64) (_ BitVec 32) List!13401 List!13401) Unit!24632)

(assert (=> d!98081 (= lt!318651 (choose!66 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318614 lt!318612))))

(assert (=> d!98081 (bvslt (size!19768 a!3591) #b01111111111111111111111111111111)))

(assert (=> d!98081 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!318614 lt!318612) lt!318651)))

(declare-fun bs!20557 () Bool)

(assert (= bs!20557 d!98081))

(assert (=> bs!20557 m!669687))

(declare-fun m!669895 () Bool)

(assert (=> bs!20557 m!669895))

(assert (=> b!712799 d!98081))

(declare-fun b!713079 () Bool)

(declare-fun e!401071 () Bool)

(assert (=> b!713079 (= e!401071 (contains!3978 acc!652 (select (arr!19360 a!3591) from!2969)))))

(declare-fun b!713080 () Bool)

(declare-fun e!401069 () Bool)

(declare-fun e!401068 () Bool)

(assert (=> b!713080 (= e!401069 e!401068)))

(declare-fun res!476203 () Bool)

(assert (=> b!713080 (=> (not res!476203) (not e!401068))))

(assert (=> b!713080 (= res!476203 (not e!401071))))

(declare-fun res!476202 () Bool)

(assert (=> b!713080 (=> (not res!476202) (not e!401071))))

(assert (=> b!713080 (= res!476202 (validKeyInArray!0 (select (arr!19360 a!3591) from!2969)))))

(declare-fun bm!34577 () Bool)

(declare-fun c!78806 () Bool)

(declare-fun call!34580 () Bool)

(assert (=> bm!34577 (= call!34580 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78806 (Cons!13397 (select (arr!19360 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!713081 () Bool)

(declare-fun e!401070 () Bool)

(assert (=> b!713081 (= e!401068 e!401070)))

(assert (=> b!713081 (= c!78806 (validKeyInArray!0 (select (arr!19360 a!3591) from!2969)))))

(declare-fun d!98083 () Bool)

(declare-fun res!476201 () Bool)

(assert (=> d!98083 (=> res!476201 e!401069)))

(assert (=> d!98083 (= res!476201 (bvsge from!2969 (size!19768 a!3591)))))

(assert (=> d!98083 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401069)))

(declare-fun b!713082 () Bool)

(assert (=> b!713082 (= e!401070 call!34580)))

(declare-fun b!713083 () Bool)

(assert (=> b!713083 (= e!401070 call!34580)))

(assert (= (and d!98083 (not res!476201)) b!713080))

(assert (= (and b!713080 res!476202) b!713079))

(assert (= (and b!713080 res!476203) b!713081))

(assert (= (and b!713081 c!78806) b!713083))

(assert (= (and b!713081 (not c!78806)) b!713082))

(assert (= (or b!713083 b!713082) bm!34577))

(assert (=> b!713079 m!669657))

(assert (=> b!713079 m!669657))

(declare-fun m!669899 () Bool)

(assert (=> b!713079 m!669899))

(assert (=> b!713080 m!669657))

(assert (=> b!713080 m!669657))

(assert (=> b!713080 m!669695))

(assert (=> bm!34577 m!669657))

(declare-fun m!669903 () Bool)

(assert (=> bm!34577 m!669903))

(assert (=> b!713081 m!669657))

(assert (=> b!713081 m!669657))

(assert (=> b!713081 m!669695))

(assert (=> b!712820 d!98083))

(declare-fun d!98087 () Bool)

(declare-fun lt!318652 () Bool)

(assert (=> d!98087 (= lt!318652 (select (content!361 lt!318614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401076 () Bool)

(assert (=> d!98087 (= lt!318652 e!401076)))

(declare-fun res!476208 () Bool)

(assert (=> d!98087 (=> (not res!476208) (not e!401076))))

(assert (=> d!98087 (= res!476208 ((_ is Cons!13397) lt!318614))))

(assert (=> d!98087 (= (contains!3978 lt!318614 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318652)))

(declare-fun b!713088 () Bool)

(declare-fun e!401077 () Bool)

(assert (=> b!713088 (= e!401076 e!401077)))

(declare-fun res!476207 () Bool)

(assert (=> b!713088 (=> res!476207 e!401077)))

(assert (=> b!713088 (= res!476207 (= (h!14442 lt!318614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713090 () Bool)

(assert (=> b!713090 (= e!401077 (contains!3978 (t!19713 lt!318614) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98087 res!476208) b!713088))

(assert (= (and b!713088 (not res!476207)) b!713090))

(declare-fun m!669905 () Bool)

(assert (=> d!98087 m!669905))

(declare-fun m!669907 () Bool)

(assert (=> d!98087 m!669907))

(declare-fun m!669909 () Bool)

(assert (=> b!713090 m!669909))

(assert (=> b!712821 d!98087))

(declare-fun d!98089 () Bool)

(assert (=> d!98089 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!712801 d!98089))

(declare-fun d!98091 () Bool)

(declare-fun res!476209 () Bool)

(declare-fun e!401078 () Bool)

(assert (=> d!98091 (=> res!476209 e!401078)))

(assert (=> d!98091 (= res!476209 ((_ is Nil!13398) acc!652))))

(assert (=> d!98091 (= (noDuplicate!1225 acc!652) e!401078)))

(declare-fun b!713091 () Bool)

(declare-fun e!401080 () Bool)

(assert (=> b!713091 (= e!401078 e!401080)))

(declare-fun res!476211 () Bool)

(assert (=> b!713091 (=> (not res!476211) (not e!401080))))

(assert (=> b!713091 (= res!476211 (not (contains!3978 (t!19713 acc!652) (h!14442 acc!652))))))

(declare-fun b!713092 () Bool)

(assert (=> b!713092 (= e!401080 (noDuplicate!1225 (t!19713 acc!652)))))

(assert (= (and d!98091 (not res!476209)) b!713091))

(assert (= (and b!713091 res!476211) b!713092))

(declare-fun m!669917 () Bool)

(assert (=> b!713091 m!669917))

(declare-fun m!669919 () Bool)

(assert (=> b!713092 m!669919))

(assert (=> b!712822 d!98091))

(declare-fun d!98093 () Bool)

(declare-fun res!476214 () Bool)

(declare-fun e!401084 () Bool)

(assert (=> d!98093 (=> res!476214 e!401084)))

(assert (=> d!98093 (= res!476214 ((_ is Nil!13398) newAcc!49))))

(assert (=> d!98093 (= (noDuplicate!1225 newAcc!49) e!401084)))

(declare-fun b!713098 () Bool)

(declare-fun e!401085 () Bool)

(assert (=> b!713098 (= e!401084 e!401085)))

(declare-fun res!476215 () Bool)

(assert (=> b!713098 (=> (not res!476215) (not e!401085))))

(assert (=> b!713098 (= res!476215 (not (contains!3978 (t!19713 newAcc!49) (h!14442 newAcc!49))))))

(declare-fun b!713099 () Bool)

(assert (=> b!713099 (= e!401085 (noDuplicate!1225 (t!19713 newAcc!49)))))

(assert (= (and d!98093 (not res!476214)) b!713098))

(assert (= (and b!713098 res!476215) b!713099))

(declare-fun m!669923 () Bool)

(assert (=> b!713098 m!669923))

(declare-fun m!669925 () Bool)

(assert (=> b!713099 m!669925))

(assert (=> b!712823 d!98093))

(declare-fun e!401089 () Bool)

(declare-fun b!713100 () Bool)

(assert (=> b!713100 (= e!401089 (contains!3978 lt!318614 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!713101 () Bool)

(declare-fun e!401087 () Bool)

(declare-fun e!401086 () Bool)

(assert (=> b!713101 (= e!401087 e!401086)))

(declare-fun res!476218 () Bool)

(assert (=> b!713101 (=> (not res!476218) (not e!401086))))

(assert (=> b!713101 (= res!476218 (not e!401089))))

(declare-fun res!476217 () Bool)

(assert (=> b!713101 (=> (not res!476217) (not e!401089))))

(assert (=> b!713101 (= res!476217 (validKeyInArray!0 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun c!78809 () Bool)

(declare-fun bm!34580 () Bool)

(declare-fun call!34583 () Bool)

(assert (=> bm!34580 (= call!34583 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78809 (Cons!13397 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) lt!318614) lt!318614)))))

(declare-fun b!713102 () Bool)

(declare-fun e!401088 () Bool)

(assert (=> b!713102 (= e!401086 e!401088)))

(assert (=> b!713102 (= c!78809 (validKeyInArray!0 (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98097 () Bool)

(declare-fun res!476216 () Bool)

(assert (=> d!98097 (=> res!476216 e!401087)))

(assert (=> d!98097 (= res!476216 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19768 a!3591)))))

(assert (=> d!98097 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318614) e!401087)))

(declare-fun b!713103 () Bool)

(assert (=> b!713103 (= e!401088 call!34583)))

(declare-fun b!713104 () Bool)

(assert (=> b!713104 (= e!401088 call!34583)))

(assert (= (and d!98097 (not res!476216)) b!713101))

(assert (= (and b!713101 res!476217) b!713100))

(assert (= (and b!713101 res!476218) b!713102))

(assert (= (and b!713102 c!78809) b!713104))

(assert (= (and b!713102 (not c!78809)) b!713103))

(assert (= (or b!713104 b!713103) bm!34580))

(assert (=> b!713100 m!669887))

(assert (=> b!713100 m!669887))

(declare-fun m!669931 () Bool)

(assert (=> b!713100 m!669931))

(assert (=> b!713101 m!669887))

(assert (=> b!713101 m!669887))

(assert (=> b!713101 m!669891))

(assert (=> bm!34580 m!669887))

(declare-fun m!669933 () Bool)

(assert (=> bm!34580 m!669933))

(assert (=> b!713102 m!669887))

(assert (=> b!713102 m!669887))

(assert (=> b!713102 m!669891))

(assert (=> b!712802 d!98097))

(declare-fun d!98101 () Bool)

(declare-fun lt!318653 () Bool)

(assert (=> d!98101 (= lt!318653 (select (content!361 lt!318614) k0!2824))))

(declare-fun e!401094 () Bool)

(assert (=> d!98101 (= lt!318653 e!401094)))

(declare-fun res!476223 () Bool)

(assert (=> d!98101 (=> (not res!476223) (not e!401094))))

(assert (=> d!98101 (= res!476223 ((_ is Cons!13397) lt!318614))))

(assert (=> d!98101 (= (contains!3978 lt!318614 k0!2824) lt!318653)))

(declare-fun b!713110 () Bool)

(declare-fun e!401095 () Bool)

(assert (=> b!713110 (= e!401094 e!401095)))

(declare-fun res!476222 () Bool)

(assert (=> b!713110 (=> res!476222 e!401095)))

(assert (=> b!713110 (= res!476222 (= (h!14442 lt!318614) k0!2824))))

(declare-fun b!713111 () Bool)

(assert (=> b!713111 (= e!401095 (contains!3978 (t!19713 lt!318614) k0!2824))))

(assert (= (and d!98101 res!476223) b!713110))

(assert (= (and b!713110 (not res!476222)) b!713111))

(assert (=> d!98101 m!669905))

(declare-fun m!669941 () Bool)

(assert (=> d!98101 m!669941))

(declare-fun m!669943 () Bool)

(assert (=> b!713111 m!669943))

(assert (=> b!712803 d!98101))

(declare-fun d!98105 () Bool)

(declare-fun e!401097 () Bool)

(assert (=> d!98105 e!401097))

(declare-fun res!476224 () Bool)

(assert (=> d!98105 (=> (not res!476224) (not e!401097))))

(declare-fun lt!318654 () List!13401)

(assert (=> d!98105 (= res!476224 (<= (size!19770 lt!318654) (size!19770 newAcc!49)))))

(declare-fun e!401096 () List!13401)

(assert (=> d!98105 (= lt!318654 e!401096)))

(declare-fun c!78811 () Bool)

(assert (=> d!98105 (= c!78811 ((_ is Cons!13397) newAcc!49))))

(assert (=> d!98105 (= (-!388 newAcc!49 k0!2824) lt!318654)))

(declare-fun b!713112 () Bool)

(assert (=> b!713112 (= e!401097 (= (content!361 lt!318654) ((_ map and) (content!361 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!713113 () Bool)

(declare-fun e!401098 () List!13401)

(assert (=> b!713113 (= e!401096 e!401098)))

(declare-fun c!78812 () Bool)

(assert (=> b!713113 (= c!78812 (= k0!2824 (h!14442 newAcc!49)))))

(declare-fun b!713114 () Bool)

(declare-fun call!34585 () List!13401)

(assert (=> b!713114 (= e!401098 (Cons!13397 (h!14442 newAcc!49) call!34585))))

(declare-fun b!713115 () Bool)

(assert (=> b!713115 (= e!401096 Nil!13398)))

(declare-fun b!713116 () Bool)

(assert (=> b!713116 (= e!401098 call!34585)))

(declare-fun bm!34582 () Bool)

(assert (=> bm!34582 (= call!34585 (-!388 (t!19713 newAcc!49) k0!2824))))

(assert (= (and d!98105 c!78811) b!713113))

(assert (= (and d!98105 (not c!78811)) b!713115))

(assert (= (and b!713113 c!78812) b!713116))

(assert (= (and b!713113 (not c!78812)) b!713114))

(assert (= (or b!713116 b!713114) bm!34582))

(assert (= (and d!98105 res!476224) b!713112))

(declare-fun m!669945 () Bool)

(assert (=> d!98105 m!669945))

(declare-fun m!669947 () Bool)

(assert (=> d!98105 m!669947))

(declare-fun m!669949 () Bool)

(assert (=> b!713112 m!669949))

(assert (=> b!713112 m!669809))

(assert (=> b!713112 m!669791))

(declare-fun m!669951 () Bool)

(assert (=> bm!34582 m!669951))

(assert (=> b!712824 d!98105))

(declare-fun d!98107 () Bool)

(assert (=> d!98107 (= ($colon$colon!534 newAcc!49 (select (arr!19360 a!3591) from!2969)) (Cons!13397 (select (arr!19360 a!3591) from!2969) newAcc!49))))

(assert (=> b!712825 d!98107))

(declare-fun d!98109 () Bool)

(assert (=> d!98109 (= ($colon$colon!534 acc!652 (select (arr!19360 a!3591) from!2969)) (Cons!13397 (select (arr!19360 a!3591) from!2969) acc!652))))

(assert (=> b!712825 d!98109))

(declare-fun d!98111 () Bool)

(assert (=> d!98111 (= (array_inv!15156 a!3591) (bvsge (size!19768 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63276 d!98111))

(declare-fun d!98117 () Bool)

(declare-fun lt!318659 () Bool)

(assert (=> d!98117 (= lt!318659 (select (content!361 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401109 () Bool)

(assert (=> d!98117 (= lt!318659 e!401109)))

(declare-fun res!476235 () Bool)

(assert (=> d!98117 (=> (not res!476235) (not e!401109))))

(assert (=> d!98117 (= res!476235 ((_ is Cons!13397) acc!652))))

(assert (=> d!98117 (= (contains!3978 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318659)))

(declare-fun b!713128 () Bool)

(declare-fun e!401110 () Bool)

(assert (=> b!713128 (= e!401109 e!401110)))

(declare-fun res!476234 () Bool)

(assert (=> b!713128 (=> res!476234 e!401110)))

(assert (=> b!713128 (= res!476234 (= (h!14442 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713129 () Bool)

(assert (=> b!713129 (= e!401110 (contains!3978 (t!19713 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98117 res!476235) b!713128))

(assert (= (and b!713128 (not res!476234)) b!713129))

(assert (=> d!98117 m!669767))

(declare-fun m!669961 () Bool)

(assert (=> d!98117 m!669961))

(declare-fun m!669963 () Bool)

(assert (=> b!713129 m!669963))

(assert (=> b!712804 d!98117))

(declare-fun d!98119 () Bool)

(declare-fun lt!318660 () Bool)

(assert (=> d!98119 (= lt!318660 (select (content!361 lt!318614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401113 () Bool)

(assert (=> d!98119 (= lt!318660 e!401113)))

(declare-fun res!476239 () Bool)

(assert (=> d!98119 (=> (not res!476239) (not e!401113))))

(assert (=> d!98119 (= res!476239 ((_ is Cons!13397) lt!318614))))

(assert (=> d!98119 (= (contains!3978 lt!318614 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318660)))

(declare-fun b!713132 () Bool)

(declare-fun e!401114 () Bool)

(assert (=> b!713132 (= e!401113 e!401114)))

(declare-fun res!476238 () Bool)

(assert (=> b!713132 (=> res!476238 e!401114)))

(assert (=> b!713132 (= res!476238 (= (h!14442 lt!318614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713133 () Bool)

(assert (=> b!713133 (= e!401114 (contains!3978 (t!19713 lt!318614) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98119 res!476239) b!713132))

(assert (= (and b!713132 (not res!476238)) b!713133))

(assert (=> d!98119 m!669905))

(declare-fun m!669973 () Bool)

(assert (=> d!98119 m!669973))

(declare-fun m!669975 () Bool)

(assert (=> b!713133 m!669975))

(assert (=> b!712805 d!98119))

(declare-fun d!98123 () Bool)

(declare-fun lt!318661 () Bool)

(assert (=> d!98123 (= lt!318661 (select (content!361 lt!318612) k0!2824))))

(declare-fun e!401117 () Bool)

(assert (=> d!98123 (= lt!318661 e!401117)))

(declare-fun res!476243 () Bool)

(assert (=> d!98123 (=> (not res!476243) (not e!401117))))

(assert (=> d!98123 (= res!476243 ((_ is Cons!13397) lt!318612))))

(assert (=> d!98123 (= (contains!3978 lt!318612 k0!2824) lt!318661)))

(declare-fun b!713136 () Bool)

(declare-fun e!401118 () Bool)

(assert (=> b!713136 (= e!401117 e!401118)))

(declare-fun res!476242 () Bool)

(assert (=> b!713136 (=> res!476242 e!401118)))

(assert (=> b!713136 (= res!476242 (= (h!14442 lt!318612) k0!2824))))

(declare-fun b!713137 () Bool)

(assert (=> b!713137 (= e!401118 (contains!3978 (t!19713 lt!318612) k0!2824))))

(assert (= (and d!98123 res!476243) b!713136))

(assert (= (and b!713136 (not res!476242)) b!713137))

(assert (=> d!98123 m!669789))

(declare-fun m!669981 () Bool)

(assert (=> d!98123 m!669981))

(declare-fun m!669983 () Bool)

(assert (=> b!713137 m!669983))

(assert (=> b!712806 d!98123))

(declare-fun b!713143 () Bool)

(declare-fun e!401122 () Bool)

(assert (=> b!713143 (= e!401122 (subseq!423 acc!652 (t!19713 newAcc!49)))))

(declare-fun d!98129 () Bool)

(declare-fun res!476248 () Bool)

(declare-fun e!401123 () Bool)

(assert (=> d!98129 (=> res!476248 e!401123)))

(assert (=> d!98129 (= res!476248 ((_ is Nil!13398) acc!652))))

(assert (=> d!98129 (= (subseq!423 acc!652 newAcc!49) e!401123)))

(declare-fun b!713140 () Bool)

(declare-fun e!401124 () Bool)

(assert (=> b!713140 (= e!401123 e!401124)))

(declare-fun res!476247 () Bool)

(assert (=> b!713140 (=> (not res!476247) (not e!401124))))

(assert (=> b!713140 (= res!476247 ((_ is Cons!13397) newAcc!49))))

(declare-fun b!713142 () Bool)

(declare-fun e!401121 () Bool)

(assert (=> b!713142 (= e!401121 (subseq!423 (t!19713 acc!652) (t!19713 newAcc!49)))))

(declare-fun b!713141 () Bool)

(assert (=> b!713141 (= e!401124 e!401122)))

(declare-fun res!476249 () Bool)

(assert (=> b!713141 (=> res!476249 e!401122)))

(assert (=> b!713141 (= res!476249 e!401121)))

(declare-fun res!476246 () Bool)

(assert (=> b!713141 (=> (not res!476246) (not e!401121))))

(assert (=> b!713141 (= res!476246 (= (h!14442 acc!652) (h!14442 newAcc!49)))))

(assert (= (and d!98129 (not res!476248)) b!713140))

(assert (= (and b!713140 res!476247) b!713141))

(assert (= (and b!713141 res!476246) b!713142))

(assert (= (and b!713141 (not res!476249)) b!713143))

(declare-fun m!669991 () Bool)

(assert (=> b!713143 m!669991))

(declare-fun m!669993 () Bool)

(assert (=> b!713142 m!669993))

(assert (=> b!712807 d!98129))

(declare-fun d!98133 () Bool)

(declare-fun lt!318663 () Bool)

(assert (=> d!98133 (= lt!318663 (select (content!361 newAcc!49) k0!2824))))

(declare-fun e!401127 () Bool)

(assert (=> d!98133 (= lt!318663 e!401127)))

(declare-fun res!476253 () Bool)

(assert (=> d!98133 (=> (not res!476253) (not e!401127))))

(assert (=> d!98133 (= res!476253 ((_ is Cons!13397) newAcc!49))))

(assert (=> d!98133 (= (contains!3978 newAcc!49 k0!2824) lt!318663)))

(declare-fun b!713146 () Bool)

(declare-fun e!401128 () Bool)

(assert (=> b!713146 (= e!401127 e!401128)))

(declare-fun res!476252 () Bool)

(assert (=> b!713146 (=> res!476252 e!401128)))

(assert (=> b!713146 (= res!476252 (= (h!14442 newAcc!49) k0!2824))))

(declare-fun b!713147 () Bool)

(assert (=> b!713147 (= e!401128 (contains!3978 (t!19713 newAcc!49) k0!2824))))

(assert (= (and d!98133 res!476253) b!713146))

(assert (= (and b!713146 (not res!476252)) b!713147))

(assert (=> d!98133 m!669809))

(declare-fun m!669999 () Bool)

(assert (=> d!98133 m!669999))

(declare-fun m!670001 () Bool)

(assert (=> b!713147 m!670001))

(assert (=> b!712808 d!98133))

(declare-fun d!98137 () Bool)

(declare-fun res!476254 () Bool)

(declare-fun e!401129 () Bool)

(assert (=> d!98137 (=> res!476254 e!401129)))

(assert (=> d!98137 (= res!476254 (= (select (arr!19360 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k0!2824))))

(assert (=> d!98137 (= (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401129)))

(declare-fun b!713148 () Bool)

(declare-fun e!401130 () Bool)

(assert (=> b!713148 (= e!401129 e!401130)))

(declare-fun res!476255 () Bool)

(assert (=> b!713148 (=> (not res!476255) (not e!401130))))

(assert (=> b!713148 (= res!476255 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19768 a!3591)))))

(declare-fun b!713149 () Bool)

(assert (=> b!713149 (= e!401130 (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98137 (not res!476254)) b!713148))

(assert (= (and b!713148 res!476255) b!713149))

(assert (=> d!98137 m!669887))

(declare-fun m!670003 () Bool)

(assert (=> b!713149 m!670003))

(assert (=> b!712809 d!98137))

(declare-fun d!98139 () Bool)

(declare-fun lt!318664 () Bool)

(assert (=> d!98139 (= lt!318664 (select (content!361 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401131 () Bool)

(assert (=> d!98139 (= lt!318664 e!401131)))

(declare-fun res!476257 () Bool)

(assert (=> d!98139 (=> (not res!476257) (not e!401131))))

(assert (=> d!98139 (= res!476257 ((_ is Cons!13397) acc!652))))

(assert (=> d!98139 (= (contains!3978 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318664)))

(declare-fun b!713150 () Bool)

(declare-fun e!401132 () Bool)

(assert (=> b!713150 (= e!401131 e!401132)))

(declare-fun res!476256 () Bool)

(assert (=> b!713150 (=> res!476256 e!401132)))

(assert (=> b!713150 (= res!476256 (= (h!14442 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713151 () Bool)

(assert (=> b!713151 (= e!401132 (contains!3978 (t!19713 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98139 res!476257) b!713150))

(assert (= (and b!713150 (not res!476256)) b!713151))

(assert (=> d!98139 m!669767))

(declare-fun m!670005 () Bool)

(assert (=> d!98139 m!670005))

(declare-fun m!670007 () Bool)

(assert (=> b!713151 m!670007))

(assert (=> b!712810 d!98139))

(declare-fun d!98141 () Bool)

(declare-fun lt!318665 () Bool)

(assert (=> d!98141 (= lt!318665 (select (content!361 lt!318612) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401133 () Bool)

(assert (=> d!98141 (= lt!318665 e!401133)))

(declare-fun res!476259 () Bool)

(assert (=> d!98141 (=> (not res!476259) (not e!401133))))

(assert (=> d!98141 (= res!476259 ((_ is Cons!13397) lt!318612))))

(assert (=> d!98141 (= (contains!3978 lt!318612 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318665)))

(declare-fun b!713152 () Bool)

(declare-fun e!401134 () Bool)

(assert (=> b!713152 (= e!401133 e!401134)))

(declare-fun res!476258 () Bool)

(assert (=> b!713152 (=> res!476258 e!401134)))

(assert (=> b!713152 (= res!476258 (= (h!14442 lt!318612) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713153 () Bool)

(assert (=> b!713153 (= e!401134 (contains!3978 (t!19713 lt!318612) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98141 res!476259) b!713152))

(assert (= (and b!713152 (not res!476258)) b!713153))

(assert (=> d!98141 m!669789))

(declare-fun m!670009 () Bool)

(assert (=> d!98141 m!670009))

(declare-fun m!670011 () Bool)

(assert (=> b!713153 m!670011))

(assert (=> b!712811 d!98141))

(declare-fun d!98143 () Bool)

(declare-fun lt!318666 () Bool)

(assert (=> d!98143 (= lt!318666 (select (content!361 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!401135 () Bool)

(assert (=> d!98143 (= lt!318666 e!401135)))

(declare-fun res!476261 () Bool)

(assert (=> d!98143 (=> (not res!476261) (not e!401135))))

(assert (=> d!98143 (= res!476261 ((_ is Cons!13397) newAcc!49))))

(assert (=> d!98143 (= (contains!3978 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318666)))

(declare-fun b!713154 () Bool)

(declare-fun e!401136 () Bool)

(assert (=> b!713154 (= e!401135 e!401136)))

(declare-fun res!476260 () Bool)

(assert (=> b!713154 (=> res!476260 e!401136)))

(assert (=> b!713154 (= res!476260 (= (h!14442 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713155 () Bool)

(assert (=> b!713155 (= e!401136 (contains!3978 (t!19713 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98143 res!476261) b!713154))

(assert (= (and b!713154 (not res!476260)) b!713155))

(assert (=> d!98143 m!669809))

(declare-fun m!670013 () Bool)

(assert (=> d!98143 m!670013))

(declare-fun m!670015 () Bool)

(assert (=> b!713155 m!670015))

(assert (=> b!712812 d!98143))

(check-sat (not b!713142) (not bm!34582) (not b!713045) (not d!98117) (not bm!34565) (not b!712994) (not b!712980) (not bm!34571) (not b!713081) (not d!98023) (not b!713091) (not d!98027) (not b!713147) (not b!713111) (not bm!34577) (not b!712924) (not d!98045) (not b!713051) (not d!98139) (not b!713044) (not b!712996) (not b!712978) (not d!98141) (not d!98041) (not b!713090) (not b!713151) (not b!713129) (not b!712936) (not b!713080) (not b!713079) (not b!713049) (not bm!34580) (not d!98143) (not d!98081) (not b!713153) (not b!712995) (not bm!34570) (not b!712935) (not b!712930) (not b!713101) (not b!713046) (not b!713133) (not d!98119) (not d!98101) (not b!712923) (not d!98087) (not b!713102) (not d!98123) (not b!713155) (not d!98105) (not b!713100) (not b!713099) (not b!713112) (not b!713050) (not b!713143) (not b!713137) (not b!713149) (not b!713098) (not d!98133) (not b!712963) (not b!713092))
(check-sat)
