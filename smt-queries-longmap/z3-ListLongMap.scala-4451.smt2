; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61914 () Bool)

(assert start!61914)

(declare-fun b!692621 () Bool)

(declare-fun e!394076 () Bool)

(declare-fun e!394081 () Bool)

(assert (=> b!692621 (= e!394076 e!394081)))

(declare-fun res!456769 () Bool)

(assert (=> b!692621 (=> (not res!456769) (not e!394081))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!39828 0))(
  ( (array!39829 (arr!19078 (Array (_ BitVec 32) (_ BitVec 64))) (size!19461 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39828)

(assert (=> b!692621 (= res!456769 (not (= (select (arr!19078 a!3626) from!3004) k0!2843)))))

(declare-datatypes ((Unit!24429 0))(
  ( (Unit!24430) )
))
(declare-fun lt!316688 () Unit!24429)

(declare-fun e!394078 () Unit!24429)

(assert (=> b!692621 (= lt!316688 e!394078)))

(declare-fun c!78302 () Bool)

(assert (=> b!692621 (= c!78302 (= (select (arr!19078 a!3626) from!3004) k0!2843))))

(declare-fun b!692622 () Bool)

(declare-fun res!456770 () Bool)

(assert (=> b!692622 (=> (not res!456770) (not e!394076))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!692622 (= res!456770 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19461 a!3626))))))

(declare-fun b!692623 () Bool)

(declare-fun res!456757 () Bool)

(declare-fun e!394082 () Bool)

(assert (=> b!692623 (=> (not res!456757) (not e!394082))))

(declare-datatypes ((List!13026 0))(
  ( (Nil!13023) (Cons!13022 (h!14070 (_ BitVec 64)) (t!19288 List!13026)) )
))
(declare-fun lt!316690 () List!13026)

(declare-fun noDuplicate!952 (List!13026) Bool)

(assert (=> b!692623 (= res!456757 (noDuplicate!952 lt!316690))))

(declare-fun b!692624 () Bool)

(declare-fun res!456760 () Bool)

(assert (=> b!692624 (=> (not res!456760) (not e!394076))))

(declare-fun acc!681 () List!13026)

(declare-fun contains!3678 (List!13026 (_ BitVec 64)) Bool)

(assert (=> b!692624 (= res!456760 (not (contains!3678 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692625 () Bool)

(declare-fun res!456763 () Bool)

(assert (=> b!692625 (=> (not res!456763) (not e!394076))))

(assert (=> b!692625 (= res!456763 (noDuplicate!952 acc!681))))

(declare-fun b!692626 () Bool)

(declare-fun res!456762 () Bool)

(assert (=> b!692626 (=> (not res!456762) (not e!394076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!692626 (= res!456762 (validKeyInArray!0 (select (arr!19078 a!3626) from!3004)))))

(declare-fun b!692627 () Bool)

(declare-fun res!456772 () Bool)

(assert (=> b!692627 (=> (not res!456772) (not e!394076))))

(declare-fun arrayContainsKey!0 (array!39828 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!692627 (= res!456772 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!456768 () Bool)

(assert (=> start!61914 (=> (not res!456768) (not e!394076))))

(assert (=> start!61914 (= res!456768 (and (bvslt (size!19461 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19461 a!3626))))))

(assert (=> start!61914 e!394076))

(assert (=> start!61914 true))

(declare-fun array_inv!14937 (array!39828) Bool)

(assert (=> start!61914 (array_inv!14937 a!3626)))

(declare-fun b!692628 () Bool)

(assert (=> b!692628 (= e!394081 e!394082)))

(declare-fun res!456771 () Bool)

(assert (=> b!692628 (=> (not res!456771) (not e!394082))))

(assert (=> b!692628 (= res!456771 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!410 (List!13026 (_ BitVec 64)) List!13026)

(assert (=> b!692628 (= lt!316690 ($colon$colon!410 acc!681 (select (arr!19078 a!3626) from!3004)))))

(declare-fun b!692629 () Bool)

(declare-fun Unit!24431 () Unit!24429)

(assert (=> b!692629 (= e!394078 Unit!24431)))

(assert (=> b!692629 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316689 () Unit!24429)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39828 (_ BitVec 64) (_ BitVec 32)) Unit!24429)

(assert (=> b!692629 (= lt!316689 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!692629 false))

(declare-fun b!692630 () Bool)

(declare-fun res!456761 () Bool)

(assert (=> b!692630 (=> (not res!456761) (not e!394076))))

(declare-fun arrayNoDuplicates!0 (array!39828 (_ BitVec 32) List!13026) Bool)

(assert (=> b!692630 (= res!456761 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13023))))

(declare-fun b!692631 () Bool)

(declare-fun res!456765 () Bool)

(assert (=> b!692631 (=> (not res!456765) (not e!394076))))

(assert (=> b!692631 (= res!456765 (validKeyInArray!0 k0!2843))))

(declare-fun b!692632 () Bool)

(declare-fun e!394083 () Bool)

(declare-fun e!394079 () Bool)

(assert (=> b!692632 (= e!394083 e!394079)))

(declare-fun res!456759 () Bool)

(assert (=> b!692632 (=> (not res!456759) (not e!394079))))

(assert (=> b!692632 (= res!456759 (bvsle from!3004 i!1382))))

(declare-fun b!692633 () Bool)

(declare-fun Unit!24432 () Unit!24429)

(assert (=> b!692633 (= e!394078 Unit!24432)))

(declare-fun b!692634 () Bool)

(assert (=> b!692634 (= e!394079 (not (contains!3678 acc!681 k0!2843)))))

(declare-fun b!692635 () Bool)

(declare-fun res!456756 () Bool)

(assert (=> b!692635 (=> (not res!456756) (not e!394076))))

(assert (=> b!692635 (= res!456756 e!394083)))

(declare-fun res!456754 () Bool)

(assert (=> b!692635 (=> res!456754 e!394083)))

(declare-fun e!394075 () Bool)

(assert (=> b!692635 (= res!456754 e!394075)))

(declare-fun res!456766 () Bool)

(assert (=> b!692635 (=> (not res!456766) (not e!394075))))

(assert (=> b!692635 (= res!456766 (bvsgt from!3004 i!1382))))

(declare-fun b!692636 () Bool)

(declare-fun e!394077 () Bool)

(assert (=> b!692636 (= e!394082 e!394077)))

(declare-fun res!456764 () Bool)

(assert (=> b!692636 (=> res!456764 e!394077)))

(assert (=> b!692636 (= res!456764 (contains!3678 lt!316690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692637 () Bool)

(assert (=> b!692637 (= e!394075 (contains!3678 acc!681 k0!2843))))

(declare-fun b!692638 () Bool)

(declare-fun res!456758 () Bool)

(assert (=> b!692638 (=> (not res!456758) (not e!394076))))

(assert (=> b!692638 (= res!456758 (not (contains!3678 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!692639 () Bool)

(declare-fun res!456755 () Bool)

(assert (=> b!692639 (=> (not res!456755) (not e!394076))))

(assert (=> b!692639 (= res!456755 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19461 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!692640 () Bool)

(assert (=> b!692640 (= e!394077 (contains!3678 lt!316690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692641 () Bool)

(declare-fun res!456767 () Bool)

(assert (=> b!692641 (=> (not res!456767) (not e!394076))))

(assert (=> b!692641 (= res!456767 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!61914 res!456768) b!692625))

(assert (= (and b!692625 res!456763) b!692624))

(assert (= (and b!692624 res!456760) b!692638))

(assert (= (and b!692638 res!456758) b!692635))

(assert (= (and b!692635 res!456766) b!692637))

(assert (= (and b!692635 (not res!456754)) b!692632))

(assert (= (and b!692632 res!456759) b!692634))

(assert (= (and b!692635 res!456756) b!692630))

(assert (= (and b!692630 res!456761) b!692641))

(assert (= (and b!692641 res!456767) b!692622))

(assert (= (and b!692622 res!456770) b!692631))

(assert (= (and b!692631 res!456765) b!692627))

(assert (= (and b!692627 res!456772) b!692639))

(assert (= (and b!692639 res!456755) b!692626))

(assert (= (and b!692626 res!456762) b!692621))

(assert (= (and b!692621 c!78302) b!692629))

(assert (= (and b!692621 (not c!78302)) b!692633))

(assert (= (and b!692621 res!456769) b!692628))

(assert (= (and b!692628 res!456771) b!692623))

(assert (= (and b!692623 res!456757) b!692636))

(assert (= (and b!692636 (not res!456764)) b!692640))

(declare-fun m!655705 () Bool)

(assert (=> b!692625 m!655705))

(declare-fun m!655707 () Bool)

(assert (=> b!692634 m!655707))

(declare-fun m!655709 () Bool)

(assert (=> b!692631 m!655709))

(declare-fun m!655711 () Bool)

(assert (=> b!692640 m!655711))

(declare-fun m!655713 () Bool)

(assert (=> b!692630 m!655713))

(declare-fun m!655715 () Bool)

(assert (=> b!692621 m!655715))

(assert (=> b!692637 m!655707))

(declare-fun m!655717 () Bool)

(assert (=> b!692638 m!655717))

(declare-fun m!655719 () Bool)

(assert (=> b!692624 m!655719))

(declare-fun m!655721 () Bool)

(assert (=> b!692636 m!655721))

(declare-fun m!655723 () Bool)

(assert (=> b!692629 m!655723))

(declare-fun m!655725 () Bool)

(assert (=> b!692629 m!655725))

(declare-fun m!655727 () Bool)

(assert (=> b!692627 m!655727))

(assert (=> b!692628 m!655715))

(assert (=> b!692628 m!655715))

(declare-fun m!655729 () Bool)

(assert (=> b!692628 m!655729))

(declare-fun m!655731 () Bool)

(assert (=> start!61914 m!655731))

(declare-fun m!655733 () Bool)

(assert (=> b!692623 m!655733))

(assert (=> b!692626 m!655715))

(assert (=> b!692626 m!655715))

(declare-fun m!655735 () Bool)

(assert (=> b!692626 m!655735))

(declare-fun m!655737 () Bool)

(assert (=> b!692641 m!655737))

(check-sat (not b!692641) (not b!692628) (not b!692636) (not b!692625) (not b!692627) (not b!692629) (not b!692626) (not b!692638) (not start!61914) (not b!692634) (not b!692631) (not b!692630) (not b!692623) (not b!692637) (not b!692640) (not b!692624))
(check-sat)
(get-model)

(declare-fun d!95731 () Bool)

(assert (=> d!95731 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692631 d!95731))

(declare-fun d!95733 () Bool)

(assert (=> d!95733 (= (array_inv!14937 a!3626) (bvsge (size!19461 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61914 d!95733))

(declare-fun d!95735 () Bool)

(declare-fun res!456891 () Bool)

(declare-fun e!394142 () Bool)

(assert (=> d!95735 (=> res!456891 e!394142)))

(get-info :version)

(assert (=> d!95735 (= res!456891 ((_ is Nil!13023) lt!316690))))

(assert (=> d!95735 (= (noDuplicate!952 lt!316690) e!394142)))

(declare-fun b!692772 () Bool)

(declare-fun e!394143 () Bool)

(assert (=> b!692772 (= e!394142 e!394143)))

(declare-fun res!456892 () Bool)

(assert (=> b!692772 (=> (not res!456892) (not e!394143))))

(assert (=> b!692772 (= res!456892 (not (contains!3678 (t!19288 lt!316690) (h!14070 lt!316690))))))

(declare-fun b!692773 () Bool)

(assert (=> b!692773 (= e!394143 (noDuplicate!952 (t!19288 lt!316690)))))

(assert (= (and d!95735 (not res!456891)) b!692772))

(assert (= (and b!692772 res!456892) b!692773))

(declare-fun m!655807 () Bool)

(assert (=> b!692772 m!655807))

(declare-fun m!655809 () Bool)

(assert (=> b!692773 m!655809))

(assert (=> b!692623 d!95735))

(declare-fun d!95737 () Bool)

(declare-fun lt!316711 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!312 (List!13026) (InoxSet (_ BitVec 64)))

(assert (=> d!95737 (= lt!316711 (select (content!312 acc!681) k0!2843))))

(declare-fun e!394148 () Bool)

(assert (=> d!95737 (= lt!316711 e!394148)))

(declare-fun res!456897 () Bool)

(assert (=> d!95737 (=> (not res!456897) (not e!394148))))

(assert (=> d!95737 (= res!456897 ((_ is Cons!13022) acc!681))))

(assert (=> d!95737 (= (contains!3678 acc!681 k0!2843) lt!316711)))

(declare-fun b!692778 () Bool)

(declare-fun e!394149 () Bool)

(assert (=> b!692778 (= e!394148 e!394149)))

(declare-fun res!456898 () Bool)

(assert (=> b!692778 (=> res!456898 e!394149)))

(assert (=> b!692778 (= res!456898 (= (h!14070 acc!681) k0!2843))))

(declare-fun b!692779 () Bool)

(assert (=> b!692779 (= e!394149 (contains!3678 (t!19288 acc!681) k0!2843))))

(assert (= (and d!95737 res!456897) b!692778))

(assert (= (and b!692778 (not res!456898)) b!692779))

(declare-fun m!655811 () Bool)

(assert (=> d!95737 m!655811))

(declare-fun m!655813 () Bool)

(assert (=> d!95737 m!655813))

(declare-fun m!655815 () Bool)

(assert (=> b!692779 m!655815))

(assert (=> b!692634 d!95737))

(declare-fun d!95739 () Bool)

(declare-fun lt!316712 () Bool)

(assert (=> d!95739 (= lt!316712 (select (content!312 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394150 () Bool)

(assert (=> d!95739 (= lt!316712 e!394150)))

(declare-fun res!456899 () Bool)

(assert (=> d!95739 (=> (not res!456899) (not e!394150))))

(assert (=> d!95739 (= res!456899 ((_ is Cons!13022) acc!681))))

(assert (=> d!95739 (= (contains!3678 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316712)))

(declare-fun b!692780 () Bool)

(declare-fun e!394151 () Bool)

(assert (=> b!692780 (= e!394150 e!394151)))

(declare-fun res!456900 () Bool)

(assert (=> b!692780 (=> res!456900 e!394151)))

(assert (=> b!692780 (= res!456900 (= (h!14070 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692781 () Bool)

(assert (=> b!692781 (= e!394151 (contains!3678 (t!19288 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95739 res!456899) b!692780))

(assert (= (and b!692780 (not res!456900)) b!692781))

(assert (=> d!95739 m!655811))

(declare-fun m!655817 () Bool)

(assert (=> d!95739 m!655817))

(declare-fun m!655819 () Bool)

(assert (=> b!692781 m!655819))

(assert (=> b!692624 d!95739))

(declare-fun d!95741 () Bool)

(declare-fun res!456901 () Bool)

(declare-fun e!394152 () Bool)

(assert (=> d!95741 (=> res!456901 e!394152)))

(assert (=> d!95741 (= res!456901 ((_ is Nil!13023) acc!681))))

(assert (=> d!95741 (= (noDuplicate!952 acc!681) e!394152)))

(declare-fun b!692782 () Bool)

(declare-fun e!394153 () Bool)

(assert (=> b!692782 (= e!394152 e!394153)))

(declare-fun res!456902 () Bool)

(assert (=> b!692782 (=> (not res!456902) (not e!394153))))

(assert (=> b!692782 (= res!456902 (not (contains!3678 (t!19288 acc!681) (h!14070 acc!681))))))

(declare-fun b!692783 () Bool)

(assert (=> b!692783 (= e!394153 (noDuplicate!952 (t!19288 acc!681)))))

(assert (= (and d!95741 (not res!456901)) b!692782))

(assert (= (and b!692782 res!456902) b!692783))

(declare-fun m!655821 () Bool)

(assert (=> b!692782 m!655821))

(declare-fun m!655823 () Bool)

(assert (=> b!692783 m!655823))

(assert (=> b!692625 d!95741))

(declare-fun d!95743 () Bool)

(declare-fun lt!316713 () Bool)

(assert (=> d!95743 (= lt!316713 (select (content!312 lt!316690) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394154 () Bool)

(assert (=> d!95743 (= lt!316713 e!394154)))

(declare-fun res!456903 () Bool)

(assert (=> d!95743 (=> (not res!456903) (not e!394154))))

(assert (=> d!95743 (= res!456903 ((_ is Cons!13022) lt!316690))))

(assert (=> d!95743 (= (contains!3678 lt!316690 #b0000000000000000000000000000000000000000000000000000000000000000) lt!316713)))

(declare-fun b!692784 () Bool)

(declare-fun e!394155 () Bool)

(assert (=> b!692784 (= e!394154 e!394155)))

(declare-fun res!456904 () Bool)

(assert (=> b!692784 (=> res!456904 e!394155)))

(assert (=> b!692784 (= res!456904 (= (h!14070 lt!316690) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692785 () Bool)

(assert (=> b!692785 (= e!394155 (contains!3678 (t!19288 lt!316690) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95743 res!456903) b!692784))

(assert (= (and b!692784 (not res!456904)) b!692785))

(declare-fun m!655825 () Bool)

(assert (=> d!95743 m!655825))

(declare-fun m!655827 () Bool)

(assert (=> d!95743 m!655827))

(declare-fun m!655829 () Bool)

(assert (=> b!692785 m!655829))

(assert (=> b!692636 d!95743))

(declare-fun d!95745 () Bool)

(assert (=> d!95745 (= (validKeyInArray!0 (select (arr!19078 a!3626) from!3004)) (and (not (= (select (arr!19078 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19078 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!692626 d!95745))

(assert (=> b!692637 d!95737))

(declare-fun d!95747 () Bool)

(declare-fun res!456909 () Bool)

(declare-fun e!394160 () Bool)

(assert (=> d!95747 (=> res!456909 e!394160)))

(assert (=> d!95747 (= res!456909 (= (select (arr!19078 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!95747 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!394160)))

(declare-fun b!692790 () Bool)

(declare-fun e!394161 () Bool)

(assert (=> b!692790 (= e!394160 e!394161)))

(declare-fun res!456910 () Bool)

(assert (=> b!692790 (=> (not res!456910) (not e!394161))))

(assert (=> b!692790 (= res!456910 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19461 a!3626)))))

(declare-fun b!692791 () Bool)

(assert (=> b!692791 (= e!394161 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95747 (not res!456909)) b!692790))

(assert (= (and b!692790 res!456910) b!692791))

(declare-fun m!655831 () Bool)

(assert (=> d!95747 m!655831))

(declare-fun m!655833 () Bool)

(assert (=> b!692791 m!655833))

(assert (=> b!692627 d!95747))

(declare-fun d!95749 () Bool)

(declare-fun lt!316714 () Bool)

(assert (=> d!95749 (= lt!316714 (select (content!312 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394162 () Bool)

(assert (=> d!95749 (= lt!316714 e!394162)))

(declare-fun res!456911 () Bool)

(assert (=> d!95749 (=> (not res!456911) (not e!394162))))

(assert (=> d!95749 (= res!456911 ((_ is Cons!13022) acc!681))))

(assert (=> d!95749 (= (contains!3678 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316714)))

(declare-fun b!692792 () Bool)

(declare-fun e!394163 () Bool)

(assert (=> b!692792 (= e!394162 e!394163)))

(declare-fun res!456912 () Bool)

(assert (=> b!692792 (=> res!456912 e!394163)))

(assert (=> b!692792 (= res!456912 (= (h!14070 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692793 () Bool)

(assert (=> b!692793 (= e!394163 (contains!3678 (t!19288 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95749 res!456911) b!692792))

(assert (= (and b!692792 (not res!456912)) b!692793))

(assert (=> d!95749 m!655811))

(declare-fun m!655835 () Bool)

(assert (=> d!95749 m!655835))

(declare-fun m!655837 () Bool)

(assert (=> b!692793 m!655837))

(assert (=> b!692638 d!95749))

(declare-fun d!95751 () Bool)

(assert (=> d!95751 (= ($colon$colon!410 acc!681 (select (arr!19078 a!3626) from!3004)) (Cons!13022 (select (arr!19078 a!3626) from!3004) acc!681))))

(assert (=> b!692628 d!95751))

(declare-fun d!95753 () Bool)

(declare-fun res!456913 () Bool)

(declare-fun e!394164 () Bool)

(assert (=> d!95753 (=> res!456913 e!394164)))

(assert (=> d!95753 (= res!456913 (= (select (arr!19078 a!3626) from!3004) k0!2843))))

(assert (=> d!95753 (= (arrayContainsKey!0 a!3626 k0!2843 from!3004) e!394164)))

(declare-fun b!692794 () Bool)

(declare-fun e!394165 () Bool)

(assert (=> b!692794 (= e!394164 e!394165)))

(declare-fun res!456914 () Bool)

(assert (=> b!692794 (=> (not res!456914) (not e!394165))))

(assert (=> b!692794 (= res!456914 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19461 a!3626)))))

(declare-fun b!692795 () Bool)

(assert (=> b!692795 (= e!394165 (arrayContainsKey!0 a!3626 k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95753 (not res!456913)) b!692794))

(assert (= (and b!692794 res!456914) b!692795))

(assert (=> d!95753 m!655715))

(declare-fun m!655839 () Bool)

(assert (=> b!692795 m!655839))

(assert (=> b!692629 d!95753))

(declare-fun d!95755 () Bool)

(assert (=> d!95755 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!316717 () Unit!24429)

(declare-fun choose!13 (array!39828 (_ BitVec 64) (_ BitVec 32)) Unit!24429)

(assert (=> d!95755 (= lt!316717 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!95755 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95755 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!316717)))

(declare-fun bs!20288 () Bool)

(assert (= bs!20288 d!95755))

(assert (=> bs!20288 m!655727))

(declare-fun m!655841 () Bool)

(assert (=> bs!20288 m!655841))

(assert (=> b!692629 d!95755))

(declare-fun d!95757 () Bool)

(declare-fun lt!316718 () Bool)

(assert (=> d!95757 (= lt!316718 (select (content!312 lt!316690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!394166 () Bool)

(assert (=> d!95757 (= lt!316718 e!394166)))

(declare-fun res!456915 () Bool)

(assert (=> d!95757 (=> (not res!456915) (not e!394166))))

(assert (=> d!95757 (= res!456915 ((_ is Cons!13022) lt!316690))))

(assert (=> d!95757 (= (contains!3678 lt!316690 #b1000000000000000000000000000000000000000000000000000000000000000) lt!316718)))

(declare-fun b!692796 () Bool)

(declare-fun e!394167 () Bool)

(assert (=> b!692796 (= e!394166 e!394167)))

(declare-fun res!456916 () Bool)

(assert (=> b!692796 (=> res!456916 e!394167)))

(assert (=> b!692796 (= res!456916 (= (h!14070 lt!316690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!692797 () Bool)

(assert (=> b!692797 (= e!394167 (contains!3678 (t!19288 lt!316690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95757 res!456915) b!692796))

(assert (= (and b!692796 (not res!456916)) b!692797))

(assert (=> d!95757 m!655825))

(declare-fun m!655843 () Bool)

(assert (=> d!95757 m!655843))

(declare-fun m!655845 () Bool)

(assert (=> b!692797 m!655845))

(assert (=> b!692640 d!95757))

(declare-fun bm!34245 () Bool)

(declare-fun call!34248 () Bool)

(declare-fun c!78311 () Bool)

(assert (=> bm!34245 (= call!34248 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78311 (Cons!13022 (select (arr!19078 a!3626) #b00000000000000000000000000000000) Nil!13023) Nil!13023)))))

(declare-fun b!692808 () Bool)

(declare-fun e!394176 () Bool)

(declare-fun e!394177 () Bool)

(assert (=> b!692808 (= e!394176 e!394177)))

(declare-fun res!456923 () Bool)

(assert (=> b!692808 (=> (not res!456923) (not e!394177))))

(declare-fun e!394179 () Bool)

(assert (=> b!692808 (= res!456923 (not e!394179))))

(declare-fun res!456924 () Bool)

(assert (=> b!692808 (=> (not res!456924) (not e!394179))))

(assert (=> b!692808 (= res!456924 (validKeyInArray!0 (select (arr!19078 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95759 () Bool)

(declare-fun res!456925 () Bool)

(assert (=> d!95759 (=> res!456925 e!394176)))

(assert (=> d!95759 (= res!456925 (bvsge #b00000000000000000000000000000000 (size!19461 a!3626)))))

(assert (=> d!95759 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13023) e!394176)))

(declare-fun b!692809 () Bool)

(assert (=> b!692809 (= e!394179 (contains!3678 Nil!13023 (select (arr!19078 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692810 () Bool)

(declare-fun e!394178 () Bool)

(assert (=> b!692810 (= e!394177 e!394178)))

(assert (=> b!692810 (= c!78311 (validKeyInArray!0 (select (arr!19078 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!692811 () Bool)

(assert (=> b!692811 (= e!394178 call!34248)))

(declare-fun b!692812 () Bool)

(assert (=> b!692812 (= e!394178 call!34248)))

(assert (= (and d!95759 (not res!456925)) b!692808))

(assert (= (and b!692808 res!456924) b!692809))

(assert (= (and b!692808 res!456923) b!692810))

(assert (= (and b!692810 c!78311) b!692811))

(assert (= (and b!692810 (not c!78311)) b!692812))

(assert (= (or b!692811 b!692812) bm!34245))

(assert (=> bm!34245 m!655831))

(declare-fun m!655847 () Bool)

(assert (=> bm!34245 m!655847))

(assert (=> b!692808 m!655831))

(assert (=> b!692808 m!655831))

(declare-fun m!655849 () Bool)

(assert (=> b!692808 m!655849))

(assert (=> b!692809 m!655831))

(assert (=> b!692809 m!655831))

(declare-fun m!655851 () Bool)

(assert (=> b!692809 m!655851))

(assert (=> b!692810 m!655831))

(assert (=> b!692810 m!655831))

(assert (=> b!692810 m!655849))

(assert (=> b!692630 d!95759))

(declare-fun call!34249 () Bool)

(declare-fun bm!34246 () Bool)

(declare-fun c!78312 () Bool)

(assert (=> bm!34246 (= call!34249 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78312 (Cons!13022 (select (arr!19078 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!692813 () Bool)

(declare-fun e!394180 () Bool)

(declare-fun e!394181 () Bool)

(assert (=> b!692813 (= e!394180 e!394181)))

(declare-fun res!456926 () Bool)

(assert (=> b!692813 (=> (not res!456926) (not e!394181))))

(declare-fun e!394183 () Bool)

(assert (=> b!692813 (= res!456926 (not e!394183))))

(declare-fun res!456927 () Bool)

(assert (=> b!692813 (=> (not res!456927) (not e!394183))))

(assert (=> b!692813 (= res!456927 (validKeyInArray!0 (select (arr!19078 a!3626) from!3004)))))

(declare-fun d!95761 () Bool)

(declare-fun res!456928 () Bool)

(assert (=> d!95761 (=> res!456928 e!394180)))

(assert (=> d!95761 (= res!456928 (bvsge from!3004 (size!19461 a!3626)))))

(assert (=> d!95761 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!394180)))

(declare-fun b!692814 () Bool)

(assert (=> b!692814 (= e!394183 (contains!3678 acc!681 (select (arr!19078 a!3626) from!3004)))))

(declare-fun b!692815 () Bool)

(declare-fun e!394182 () Bool)

(assert (=> b!692815 (= e!394181 e!394182)))

(assert (=> b!692815 (= c!78312 (validKeyInArray!0 (select (arr!19078 a!3626) from!3004)))))

(declare-fun b!692816 () Bool)

(assert (=> b!692816 (= e!394182 call!34249)))

(declare-fun b!692817 () Bool)

(assert (=> b!692817 (= e!394182 call!34249)))

(assert (= (and d!95761 (not res!456928)) b!692813))

(assert (= (and b!692813 res!456927) b!692814))

(assert (= (and b!692813 res!456926) b!692815))

(assert (= (and b!692815 c!78312) b!692816))

(assert (= (and b!692815 (not c!78312)) b!692817))

(assert (= (or b!692816 b!692817) bm!34246))

(assert (=> bm!34246 m!655715))

(declare-fun m!655853 () Bool)

(assert (=> bm!34246 m!655853))

(assert (=> b!692813 m!655715))

(assert (=> b!692813 m!655715))

(assert (=> b!692813 m!655735))

(assert (=> b!692814 m!655715))

(assert (=> b!692814 m!655715))

(declare-fun m!655855 () Bool)

(assert (=> b!692814 m!655855))

(assert (=> b!692815 m!655715))

(assert (=> b!692815 m!655715))

(assert (=> b!692815 m!655735))

(assert (=> b!692641 d!95761))

(check-sat (not b!692783) (not b!692773) (not b!692814) (not b!692813) (not b!692795) (not d!95757) (not bm!34246) (not b!692781) (not b!692772) (not b!692791) (not d!95743) (not b!692810) (not d!95755) (not b!692785) (not b!692793) (not d!95749) (not b!692815) (not b!692782) (not b!692809) (not b!692797) (not b!692779) (not d!95737) (not bm!34245) (not b!692808) (not d!95739))
(check-sat)
