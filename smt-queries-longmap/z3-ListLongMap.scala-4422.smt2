; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61180 () Bool)

(assert start!61180)

(declare-fun b!685757 () Bool)

(declare-fun res!451058 () Bool)

(declare-fun e!390508 () Bool)

(assert (=> b!685757 (=> (not res!451058) (not e!390508))))

(declare-datatypes ((array!39639 0))(
  ( (array!39640 (arr!18997 (Array (_ BitVec 32) (_ BitVec 64))) (size!19369 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39639)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685757 (= res!451058 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685758 () Bool)

(declare-fun res!451053 () Bool)

(assert (=> b!685758 (=> (not res!451053) (not e!390508))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13038 0))(
  ( (Nil!13035) (Cons!13034 (h!14079 (_ BitVec 64)) (t!19290 List!13038)) )
))
(declare-fun acc!681 () List!13038)

(declare-fun arrayNoDuplicates!0 (array!39639 (_ BitVec 32) List!13038) Bool)

(assert (=> b!685758 (= res!451053 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685759 () Bool)

(declare-datatypes ((Unit!24152 0))(
  ( (Unit!24153) )
))
(declare-fun e!390511 () Unit!24152)

(declare-fun Unit!24154 () Unit!24152)

(assert (=> b!685759 (= e!390511 Unit!24154)))

(declare-fun lt!314781 () Unit!24152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39639 (_ BitVec 64) (_ BitVec 32)) Unit!24152)

(assert (=> b!685759 (= lt!314781 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!685759 false))

(declare-fun b!685760 () Bool)

(declare-fun res!451052 () Bool)

(declare-fun e!390512 () Bool)

(assert (=> b!685760 (=> res!451052 e!390512)))

(declare-fun lt!314777 () Bool)

(assert (=> b!685760 (= res!451052 lt!314777)))

(declare-fun b!685761 () Bool)

(declare-fun e!390516 () Bool)

(declare-fun contains!3615 (List!13038 (_ BitVec 64)) Bool)

(assert (=> b!685761 (= e!390516 (contains!3615 acc!681 k0!2843))))

(declare-fun b!685762 () Bool)

(declare-fun res!451050 () Bool)

(assert (=> b!685762 (=> (not res!451050) (not e!390508))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685762 (= res!451050 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19369 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!451057 () Bool)

(assert (=> start!61180 (=> (not res!451057) (not e!390508))))

(assert (=> start!61180 (= res!451057 (and (bvslt (size!19369 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19369 a!3626))))))

(assert (=> start!61180 e!390508))

(assert (=> start!61180 true))

(declare-fun array_inv!14793 (array!39639) Bool)

(assert (=> start!61180 (array_inv!14793 a!3626)))

(declare-fun b!685763 () Bool)

(declare-fun res!451064 () Bool)

(assert (=> b!685763 (=> res!451064 e!390512)))

(declare-fun lt!314779 () List!13038)

(assert (=> b!685763 (= res!451064 (not (contains!3615 lt!314779 k0!2843)))))

(declare-fun b!685764 () Bool)

(declare-fun Unit!24155 () Unit!24152)

(assert (=> b!685764 (= e!390511 Unit!24155)))

(declare-fun b!685765 () Bool)

(declare-fun e!390509 () Unit!24152)

(declare-fun lt!314783 () Unit!24152)

(assert (=> b!685765 (= e!390509 lt!314783)))

(declare-fun lt!314784 () Unit!24152)

(declare-fun lemmaListSubSeqRefl!0 (List!13038) Unit!24152)

(assert (=> b!685765 (= lt!314784 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!201 (List!13038 List!13038) Bool)

(assert (=> b!685765 (subseq!201 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39639 List!13038 List!13038 (_ BitVec 32)) Unit!24152)

(declare-fun $colon$colon!366 (List!13038 (_ BitVec 64)) List!13038)

(assert (=> b!685765 (= lt!314783 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!366 acc!681 (select (arr!18997 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685765 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685766 () Bool)

(declare-fun res!451067 () Bool)

(assert (=> b!685766 (=> (not res!451067) (not e!390508))))

(declare-fun noDuplicate!862 (List!13038) Bool)

(assert (=> b!685766 (= res!451067 (noDuplicate!862 acc!681))))

(declare-fun b!685767 () Bool)

(declare-fun res!451065 () Bool)

(assert (=> b!685767 (=> (not res!451065) (not e!390508))))

(assert (=> b!685767 (= res!451065 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13035))))

(declare-fun b!685768 () Bool)

(declare-fun res!451047 () Bool)

(assert (=> b!685768 (=> (not res!451047) (not e!390508))))

(assert (=> b!685768 (= res!451047 (not (contains!3615 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685769 () Bool)

(assert (=> b!685769 (= e!390508 (not e!390512))))

(declare-fun res!451048 () Bool)

(assert (=> b!685769 (=> res!451048 e!390512)))

(assert (=> b!685769 (= res!451048 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!166 (List!13038 (_ BitVec 64)) List!13038)

(assert (=> b!685769 (= (-!166 lt!314779 k0!2843) acc!681)))

(assert (=> b!685769 (= lt!314779 ($colon$colon!366 acc!681 k0!2843))))

(declare-fun lt!314780 () Unit!24152)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13038) Unit!24152)

(assert (=> b!685769 (= lt!314780 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!685769 (subseq!201 acc!681 acc!681)))

(declare-fun lt!314785 () Unit!24152)

(assert (=> b!685769 (= lt!314785 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685769 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314778 () Unit!24152)

(assert (=> b!685769 (= lt!314778 e!390509)))

(declare-fun c!77722 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685769 (= c!77722 (validKeyInArray!0 (select (arr!18997 a!3626) from!3004)))))

(declare-fun lt!314782 () Unit!24152)

(assert (=> b!685769 (= lt!314782 e!390511)))

(declare-fun c!77723 () Bool)

(assert (=> b!685769 (= c!77723 lt!314777)))

(assert (=> b!685769 (= lt!314777 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685769 (arrayContainsKey!0 (array!39640 (store (arr!18997 a!3626) i!1382 k0!2843) (size!19369 a!3626)) k0!2843 from!3004)))

(declare-fun b!685770 () Bool)

(declare-fun e!390510 () Bool)

(assert (=> b!685770 (= e!390512 e!390510)))

(declare-fun res!451054 () Bool)

(assert (=> b!685770 (=> (not res!451054) (not e!390510))))

(assert (=> b!685770 (= res!451054 (not (contains!3615 lt!314779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685771 () Bool)

(declare-fun res!451062 () Bool)

(assert (=> b!685771 (=> res!451062 e!390512)))

(assert (=> b!685771 (= res!451062 (contains!3615 acc!681 k0!2843))))

(declare-fun b!685772 () Bool)

(declare-fun res!451049 () Bool)

(assert (=> b!685772 (=> (not res!451049) (not e!390508))))

(assert (=> b!685772 (= res!451049 (not (contains!3615 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685773 () Bool)

(declare-fun Unit!24156 () Unit!24152)

(assert (=> b!685773 (= e!390509 Unit!24156)))

(declare-fun b!685774 () Bool)

(declare-fun e!390515 () Bool)

(declare-fun e!390513 () Bool)

(assert (=> b!685774 (= e!390515 e!390513)))

(declare-fun res!451061 () Bool)

(assert (=> b!685774 (=> (not res!451061) (not e!390513))))

(assert (=> b!685774 (= res!451061 (bvsle from!3004 i!1382))))

(declare-fun b!685775 () Bool)

(declare-fun res!451066 () Bool)

(assert (=> b!685775 (=> (not res!451066) (not e!390508))))

(assert (=> b!685775 (= res!451066 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19369 a!3626))))))

(declare-fun b!685776 () Bool)

(declare-fun res!451059 () Bool)

(assert (=> b!685776 (=> res!451059 e!390512)))

(assert (=> b!685776 (= res!451059 (not (subseq!201 acc!681 lt!314779)))))

(declare-fun b!685777 () Bool)

(declare-fun res!451055 () Bool)

(assert (=> b!685777 (=> res!451055 e!390512)))

(assert (=> b!685777 (= res!451055 (not (noDuplicate!862 lt!314779)))))

(declare-fun b!685778 () Bool)

(declare-fun res!451056 () Bool)

(assert (=> b!685778 (=> (not res!451056) (not e!390508))))

(assert (=> b!685778 (= res!451056 e!390515)))

(declare-fun res!451063 () Bool)

(assert (=> b!685778 (=> res!451063 e!390515)))

(assert (=> b!685778 (= res!451063 e!390516)))

(declare-fun res!451060 () Bool)

(assert (=> b!685778 (=> (not res!451060) (not e!390516))))

(assert (=> b!685778 (= res!451060 (bvsgt from!3004 i!1382))))

(declare-fun b!685779 () Bool)

(declare-fun res!451051 () Bool)

(assert (=> b!685779 (=> (not res!451051) (not e!390508))))

(assert (=> b!685779 (= res!451051 (validKeyInArray!0 k0!2843))))

(declare-fun b!685780 () Bool)

(assert (=> b!685780 (= e!390513 (not (contains!3615 acc!681 k0!2843)))))

(declare-fun b!685781 () Bool)

(assert (=> b!685781 (= e!390510 (not (contains!3615 lt!314779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61180 res!451057) b!685766))

(assert (= (and b!685766 res!451067) b!685768))

(assert (= (and b!685768 res!451047) b!685772))

(assert (= (and b!685772 res!451049) b!685778))

(assert (= (and b!685778 res!451060) b!685761))

(assert (= (and b!685778 (not res!451063)) b!685774))

(assert (= (and b!685774 res!451061) b!685780))

(assert (= (and b!685778 res!451056) b!685767))

(assert (= (and b!685767 res!451065) b!685758))

(assert (= (and b!685758 res!451053) b!685775))

(assert (= (and b!685775 res!451066) b!685779))

(assert (= (and b!685779 res!451051) b!685757))

(assert (= (and b!685757 res!451058) b!685762))

(assert (= (and b!685762 res!451050) b!685769))

(assert (= (and b!685769 c!77723) b!685759))

(assert (= (and b!685769 (not c!77723)) b!685764))

(assert (= (and b!685769 c!77722) b!685765))

(assert (= (and b!685769 (not c!77722)) b!685773))

(assert (= (and b!685769 (not res!451048)) b!685777))

(assert (= (and b!685777 (not res!451055)) b!685760))

(assert (= (and b!685760 (not res!451052)) b!685771))

(assert (= (and b!685771 (not res!451062)) b!685776))

(assert (= (and b!685776 (not res!451059)) b!685763))

(assert (= (and b!685763 (not res!451064)) b!685770))

(assert (= (and b!685770 res!451054) b!685781))

(declare-fun m!649891 () Bool)

(assert (=> b!685780 m!649891))

(declare-fun m!649893 () Bool)

(assert (=> b!685759 m!649893))

(declare-fun m!649895 () Bool)

(assert (=> start!61180 m!649895))

(declare-fun m!649897 () Bool)

(assert (=> b!685776 m!649897))

(declare-fun m!649899 () Bool)

(assert (=> b!685781 m!649899))

(declare-fun m!649901 () Bool)

(assert (=> b!685758 m!649901))

(declare-fun m!649903 () Bool)

(assert (=> b!685765 m!649903))

(declare-fun m!649905 () Bool)

(assert (=> b!685765 m!649905))

(declare-fun m!649907 () Bool)

(assert (=> b!685765 m!649907))

(declare-fun m!649909 () Bool)

(assert (=> b!685765 m!649909))

(assert (=> b!685765 m!649905))

(assert (=> b!685765 m!649907))

(declare-fun m!649911 () Bool)

(assert (=> b!685765 m!649911))

(declare-fun m!649913 () Bool)

(assert (=> b!685765 m!649913))

(declare-fun m!649915 () Bool)

(assert (=> b!685779 m!649915))

(declare-fun m!649917 () Bool)

(assert (=> b!685763 m!649917))

(assert (=> b!685771 m!649891))

(declare-fun m!649919 () Bool)

(assert (=> b!685772 m!649919))

(declare-fun m!649921 () Bool)

(assert (=> b!685770 m!649921))

(assert (=> b!685761 m!649891))

(assert (=> b!685769 m!649903))

(assert (=> b!685769 m!649905))

(declare-fun m!649923 () Bool)

(assert (=> b!685769 m!649923))

(declare-fun m!649925 () Bool)

(assert (=> b!685769 m!649925))

(declare-fun m!649927 () Bool)

(assert (=> b!685769 m!649927))

(assert (=> b!685769 m!649911))

(declare-fun m!649929 () Bool)

(assert (=> b!685769 m!649929))

(declare-fun m!649931 () Bool)

(assert (=> b!685769 m!649931))

(assert (=> b!685769 m!649905))

(declare-fun m!649933 () Bool)

(assert (=> b!685769 m!649933))

(declare-fun m!649935 () Bool)

(assert (=> b!685769 m!649935))

(assert (=> b!685769 m!649913))

(declare-fun m!649937 () Bool)

(assert (=> b!685777 m!649937))

(declare-fun m!649939 () Bool)

(assert (=> b!685767 m!649939))

(declare-fun m!649941 () Bool)

(assert (=> b!685768 m!649941))

(declare-fun m!649943 () Bool)

(assert (=> b!685757 m!649943))

(declare-fun m!649945 () Bool)

(assert (=> b!685766 m!649945))

(check-sat (not b!685759) (not b!685780) (not b!685772) (not b!685777) (not b!685761) (not b!685781) (not b!685770) (not b!685766) (not b!685758) (not b!685767) (not b!685757) (not b!685779) (not b!685763) (not b!685771) (not start!61180) (not b!685769) (not b!685776) (not b!685765) (not b!685768))
(check-sat)
(get-model)

(declare-fun d!94603 () Bool)

(declare-fun lt!314815 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!291 (List!13038) (InoxSet (_ BitVec 64)))

(assert (=> d!94603 (= lt!314815 (select (content!291 lt!314779) k0!2843))))

(declare-fun e!390549 () Bool)

(assert (=> d!94603 (= lt!314815 e!390549)))

(declare-fun res!451135 () Bool)

(assert (=> d!94603 (=> (not res!451135) (not e!390549))))

(get-info :version)

(assert (=> d!94603 (= res!451135 ((_ is Cons!13034) lt!314779))))

(assert (=> d!94603 (= (contains!3615 lt!314779 k0!2843) lt!314815)))

(declare-fun b!685861 () Bool)

(declare-fun e!390548 () Bool)

(assert (=> b!685861 (= e!390549 e!390548)))

(declare-fun res!451136 () Bool)

(assert (=> b!685861 (=> res!451136 e!390548)))

(assert (=> b!685861 (= res!451136 (= (h!14079 lt!314779) k0!2843))))

(declare-fun b!685862 () Bool)

(assert (=> b!685862 (= e!390548 (contains!3615 (t!19290 lt!314779) k0!2843))))

(assert (= (and d!94603 res!451135) b!685861))

(assert (= (and b!685861 (not res!451136)) b!685862))

(declare-fun m!650003 () Bool)

(assert (=> d!94603 m!650003))

(declare-fun m!650005 () Bool)

(assert (=> d!94603 m!650005))

(declare-fun m!650007 () Bool)

(assert (=> b!685862 m!650007))

(assert (=> b!685763 d!94603))

(declare-fun d!94605 () Bool)

(declare-fun lt!314816 () Bool)

(assert (=> d!94605 (= lt!314816 (select (content!291 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390551 () Bool)

(assert (=> d!94605 (= lt!314816 e!390551)))

(declare-fun res!451137 () Bool)

(assert (=> d!94605 (=> (not res!451137) (not e!390551))))

(assert (=> d!94605 (= res!451137 ((_ is Cons!13034) acc!681))))

(assert (=> d!94605 (= (contains!3615 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314816)))

(declare-fun b!685863 () Bool)

(declare-fun e!390550 () Bool)

(assert (=> b!685863 (= e!390551 e!390550)))

(declare-fun res!451138 () Bool)

(assert (=> b!685863 (=> res!451138 e!390550)))

(assert (=> b!685863 (= res!451138 (= (h!14079 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685864 () Bool)

(assert (=> b!685864 (= e!390550 (contains!3615 (t!19290 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94605 res!451137) b!685863))

(assert (= (and b!685863 (not res!451138)) b!685864))

(declare-fun m!650009 () Bool)

(assert (=> d!94605 m!650009))

(declare-fun m!650011 () Bool)

(assert (=> d!94605 m!650011))

(declare-fun m!650013 () Bool)

(assert (=> b!685864 m!650013))

(assert (=> b!685772 d!94605))

(declare-fun d!94607 () Bool)

(declare-fun lt!314817 () Bool)

(assert (=> d!94607 (= lt!314817 (select (content!291 acc!681) k0!2843))))

(declare-fun e!390553 () Bool)

(assert (=> d!94607 (= lt!314817 e!390553)))

(declare-fun res!451139 () Bool)

(assert (=> d!94607 (=> (not res!451139) (not e!390553))))

(assert (=> d!94607 (= res!451139 ((_ is Cons!13034) acc!681))))

(assert (=> d!94607 (= (contains!3615 acc!681 k0!2843) lt!314817)))

(declare-fun b!685865 () Bool)

(declare-fun e!390552 () Bool)

(assert (=> b!685865 (= e!390553 e!390552)))

(declare-fun res!451140 () Bool)

(assert (=> b!685865 (=> res!451140 e!390552)))

(assert (=> b!685865 (= res!451140 (= (h!14079 acc!681) k0!2843))))

(declare-fun b!685866 () Bool)

(assert (=> b!685866 (= e!390552 (contains!3615 (t!19290 acc!681) k0!2843))))

(assert (= (and d!94607 res!451139) b!685865))

(assert (= (and b!685865 (not res!451140)) b!685866))

(assert (=> d!94607 m!650009))

(declare-fun m!650015 () Bool)

(assert (=> d!94607 m!650015))

(declare-fun m!650017 () Bool)

(assert (=> b!685866 m!650017))

(assert (=> b!685761 d!94607))

(assert (=> b!685771 d!94607))

(declare-fun d!94609 () Bool)

(declare-fun lt!314818 () Bool)

(assert (=> d!94609 (= lt!314818 (select (content!291 lt!314779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390555 () Bool)

(assert (=> d!94609 (= lt!314818 e!390555)))

(declare-fun res!451141 () Bool)

(assert (=> d!94609 (=> (not res!451141) (not e!390555))))

(assert (=> d!94609 (= res!451141 ((_ is Cons!13034) lt!314779))))

(assert (=> d!94609 (= (contains!3615 lt!314779 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314818)))

(declare-fun b!685867 () Bool)

(declare-fun e!390554 () Bool)

(assert (=> b!685867 (= e!390555 e!390554)))

(declare-fun res!451142 () Bool)

(assert (=> b!685867 (=> res!451142 e!390554)))

(assert (=> b!685867 (= res!451142 (= (h!14079 lt!314779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685868 () Bool)

(assert (=> b!685868 (= e!390554 (contains!3615 (t!19290 lt!314779) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94609 res!451141) b!685867))

(assert (= (and b!685867 (not res!451142)) b!685868))

(assert (=> d!94609 m!650003))

(declare-fun m!650019 () Bool)

(assert (=> d!94609 m!650019))

(declare-fun m!650021 () Bool)

(assert (=> b!685868 m!650021))

(assert (=> b!685770 d!94609))

(declare-fun d!94613 () Bool)

(declare-fun lt!314819 () Bool)

(assert (=> d!94613 (= lt!314819 (select (content!291 lt!314779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390557 () Bool)

(assert (=> d!94613 (= lt!314819 e!390557)))

(declare-fun res!451143 () Bool)

(assert (=> d!94613 (=> (not res!451143) (not e!390557))))

(assert (=> d!94613 (= res!451143 ((_ is Cons!13034) lt!314779))))

(assert (=> d!94613 (= (contains!3615 lt!314779 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314819)))

(declare-fun b!685869 () Bool)

(declare-fun e!390556 () Bool)

(assert (=> b!685869 (= e!390557 e!390556)))

(declare-fun res!451144 () Bool)

(assert (=> b!685869 (=> res!451144 e!390556)))

(assert (=> b!685869 (= res!451144 (= (h!14079 lt!314779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685870 () Bool)

(assert (=> b!685870 (= e!390556 (contains!3615 (t!19290 lt!314779) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94613 res!451143) b!685869))

(assert (= (and b!685869 (not res!451144)) b!685870))

(assert (=> d!94613 m!650003))

(declare-fun m!650023 () Bool)

(assert (=> d!94613 m!650023))

(declare-fun m!650025 () Bool)

(assert (=> b!685870 m!650025))

(assert (=> b!685781 d!94613))

(assert (=> b!685780 d!94607))

(declare-fun d!94615 () Bool)

(assert (=> d!94615 (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314824 () Unit!24152)

(declare-fun choose!13 (array!39639 (_ BitVec 64) (_ BitVec 32)) Unit!24152)

(assert (=> d!94615 (= lt!314824 (choose!13 a!3626 k0!2843 from!3004))))

(assert (=> d!94615 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94615 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004) lt!314824)))

(declare-fun bs!20107 () Bool)

(assert (= bs!20107 d!94615))

(assert (=> bs!20107 m!649943))

(declare-fun m!650027 () Bool)

(assert (=> bs!20107 m!650027))

(assert (=> b!685759 d!94615))

(declare-fun e!390589 () Bool)

(declare-fun b!685903 () Bool)

(assert (=> b!685903 (= e!390589 (contains!3615 acc!681 (select (arr!18997 a!3626) from!3004)))))

(declare-fun b!685904 () Bool)

(declare-fun e!390590 () Bool)

(declare-fun call!34079 () Bool)

(assert (=> b!685904 (= e!390590 call!34079)))

(declare-fun d!94617 () Bool)

(declare-fun res!451175 () Bool)

(declare-fun e!390591 () Bool)

(assert (=> d!94617 (=> res!451175 e!390591)))

(assert (=> d!94617 (= res!451175 (bvsge from!3004 (size!19369 a!3626)))))

(assert (=> d!94617 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390591)))

(declare-fun b!685905 () Bool)

(declare-fun e!390588 () Bool)

(assert (=> b!685905 (= e!390591 e!390588)))

(declare-fun res!451174 () Bool)

(assert (=> b!685905 (=> (not res!451174) (not e!390588))))

(assert (=> b!685905 (= res!451174 (not e!390589))))

(declare-fun res!451173 () Bool)

(assert (=> b!685905 (=> (not res!451173) (not e!390589))))

(assert (=> b!685905 (= res!451173 (validKeyInArray!0 (select (arr!18997 a!3626) from!3004)))))

(declare-fun b!685906 () Bool)

(assert (=> b!685906 (= e!390588 e!390590)))

(declare-fun c!77732 () Bool)

(assert (=> b!685906 (= c!77732 (validKeyInArray!0 (select (arr!18997 a!3626) from!3004)))))

(declare-fun bm!34076 () Bool)

(assert (=> bm!34076 (= call!34079 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77732 (Cons!13034 (select (arr!18997 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!685907 () Bool)

(assert (=> b!685907 (= e!390590 call!34079)))

(assert (= (and d!94617 (not res!451175)) b!685905))

(assert (= (and b!685905 res!451173) b!685903))

(assert (= (and b!685905 res!451174) b!685906))

(assert (= (and b!685906 c!77732) b!685904))

(assert (= (and b!685906 (not c!77732)) b!685907))

(assert (= (or b!685904 b!685907) bm!34076))

(assert (=> b!685903 m!649905))

(assert (=> b!685903 m!649905))

(declare-fun m!650045 () Bool)

(assert (=> b!685903 m!650045))

(assert (=> b!685905 m!649905))

(assert (=> b!685905 m!649905))

(assert (=> b!685905 m!649933))

(assert (=> b!685906 m!649905))

(assert (=> b!685906 m!649905))

(assert (=> b!685906 m!649933))

(assert (=> bm!34076 m!649905))

(declare-fun m!650047 () Bool)

(assert (=> bm!34076 m!650047))

(assert (=> b!685758 d!94617))

(declare-fun b!685955 () Bool)

(declare-fun e!390634 () List!13038)

(declare-fun call!34085 () List!13038)

(assert (=> b!685955 (= e!390634 call!34085)))

(declare-fun b!685956 () Bool)

(declare-fun e!390635 () List!13038)

(assert (=> b!685956 (= e!390635 e!390634)))

(declare-fun c!77740 () Bool)

(assert (=> b!685956 (= c!77740 (= k0!2843 (h!14079 lt!314779)))))

(declare-fun bm!34082 () Bool)

(assert (=> bm!34082 (= call!34085 (-!166 (t!19290 lt!314779) k0!2843))))

(declare-fun d!94629 () Bool)

(declare-fun e!390632 () Bool)

(assert (=> d!94629 e!390632))

(declare-fun res!451209 () Bool)

(assert (=> d!94629 (=> (not res!451209) (not e!390632))))

(declare-fun lt!314833 () List!13038)

(declare-fun size!19371 (List!13038) Int)

(assert (=> d!94629 (= res!451209 (<= (size!19371 lt!314833) (size!19371 lt!314779)))))

(assert (=> d!94629 (= lt!314833 e!390635)))

(declare-fun c!77741 () Bool)

(assert (=> d!94629 (= c!77741 ((_ is Cons!13034) lt!314779))))

(assert (=> d!94629 (= (-!166 lt!314779 k0!2843) lt!314833)))

(declare-fun b!685957 () Bool)

(assert (=> b!685957 (= e!390632 (= (content!291 lt!314833) ((_ map and) (content!291 lt!314779) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2843 true)))))))

(declare-fun b!685958 () Bool)

(assert (=> b!685958 (= e!390634 (Cons!13034 (h!14079 lt!314779) call!34085))))

(declare-fun b!685959 () Bool)

(assert (=> b!685959 (= e!390635 Nil!13035)))

(assert (= (and d!94629 c!77741) b!685956))

(assert (= (and d!94629 (not c!77741)) b!685959))

(assert (= (and b!685956 c!77740) b!685955))

(assert (= (and b!685956 (not c!77740)) b!685958))

(assert (= (or b!685955 b!685958) bm!34082))

(assert (= (and d!94629 res!451209) b!685957))

(declare-fun m!650067 () Bool)

(assert (=> bm!34082 m!650067))

(declare-fun m!650069 () Bool)

(assert (=> d!94629 m!650069))

(declare-fun m!650071 () Bool)

(assert (=> d!94629 m!650071))

(declare-fun m!650073 () Bool)

(assert (=> b!685957 m!650073))

(assert (=> b!685957 m!650003))

(declare-fun m!650077 () Bool)

(assert (=> b!685957 m!650077))

(assert (=> b!685769 d!94629))

(declare-fun b!685984 () Bool)

(declare-fun e!390661 () Bool)

(assert (=> b!685984 (= e!390661 (subseq!201 (t!19290 acc!681) (t!19290 acc!681)))))

(declare-fun b!685982 () Bool)

(declare-fun e!390659 () Bool)

(declare-fun e!390660 () Bool)

(assert (=> b!685982 (= e!390659 e!390660)))

(declare-fun res!451235 () Bool)

(assert (=> b!685982 (=> (not res!451235) (not e!390660))))

(assert (=> b!685982 (= res!451235 ((_ is Cons!13034) acc!681))))

(declare-fun d!94641 () Bool)

(declare-fun res!451233 () Bool)

(assert (=> d!94641 (=> res!451233 e!390659)))

(assert (=> d!94641 (= res!451233 ((_ is Nil!13035) acc!681))))

(assert (=> d!94641 (= (subseq!201 acc!681 acc!681) e!390659)))

(declare-fun b!685985 () Bool)

(declare-fun e!390658 () Bool)

(assert (=> b!685985 (= e!390658 (subseq!201 acc!681 (t!19290 acc!681)))))

(declare-fun b!685983 () Bool)

(assert (=> b!685983 (= e!390660 e!390658)))

(declare-fun res!451234 () Bool)

(assert (=> b!685983 (=> res!451234 e!390658)))

(assert (=> b!685983 (= res!451234 e!390661)))

(declare-fun res!451232 () Bool)

(assert (=> b!685983 (=> (not res!451232) (not e!390661))))

(assert (=> b!685983 (= res!451232 (= (h!14079 acc!681) (h!14079 acc!681)))))

(assert (= (and d!94641 (not res!451233)) b!685982))

(assert (= (and b!685982 res!451235) b!685983))

(assert (= (and b!685983 res!451232) b!685984))

(assert (= (and b!685983 (not res!451234)) b!685985))

(declare-fun m!650101 () Bool)

(assert (=> b!685984 m!650101))

(declare-fun m!650105 () Bool)

(assert (=> b!685985 m!650105))

(assert (=> b!685769 d!94641))

(declare-fun d!94655 () Bool)

(declare-fun res!451244 () Bool)

(declare-fun e!390676 () Bool)

(assert (=> d!94655 (=> res!451244 e!390676)))

(assert (=> d!94655 (= res!451244 (= (select (arr!18997 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k0!2843))))

(assert (=> d!94655 (= (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390676)))

(declare-fun b!686002 () Bool)

(declare-fun e!390678 () Bool)

(assert (=> b!686002 (= e!390676 e!390678)))

(declare-fun res!451246 () Bool)

(assert (=> b!686002 (=> (not res!451246) (not e!390678))))

(assert (=> b!686002 (= res!451246 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19369 a!3626)))))

(declare-fun b!686003 () Bool)

(assert (=> b!686003 (= e!390678 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94655 (not res!451244)) b!686002))

(assert (= (and b!686002 res!451246) b!686003))

(declare-fun m!650111 () Bool)

(assert (=> d!94655 m!650111))

(declare-fun m!650113 () Bool)

(assert (=> b!686003 m!650113))

(assert (=> b!685769 d!94655))

(declare-fun d!94661 () Bool)

(assert (=> d!94661 (= (-!166 ($colon$colon!366 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!314850 () Unit!24152)

(declare-fun choose!16 ((_ BitVec 64) List!13038) Unit!24152)

(assert (=> d!94661 (= lt!314850 (choose!16 k0!2843 acc!681))))

(assert (=> d!94661 (not (contains!3615 acc!681 k0!2843))))

(assert (=> d!94661 (= (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681) lt!314850)))

(declare-fun bs!20111 () Bool)

(assert (= bs!20111 d!94661))

(assert (=> bs!20111 m!649931))

(assert (=> bs!20111 m!649931))

(declare-fun m!650137 () Bool)

(assert (=> bs!20111 m!650137))

(declare-fun m!650139 () Bool)

(assert (=> bs!20111 m!650139))

(assert (=> bs!20111 m!649891))

(assert (=> b!685769 d!94661))

(declare-fun d!94669 () Bool)

(declare-fun res!451257 () Bool)

(declare-fun e!390692 () Bool)

(assert (=> d!94669 (=> res!451257 e!390692)))

(assert (=> d!94669 (= res!451257 (= (select (arr!18997 (array!39640 (store (arr!18997 a!3626) i!1382 k0!2843) (size!19369 a!3626))) from!3004) k0!2843))))

(assert (=> d!94669 (= (arrayContainsKey!0 (array!39640 (store (arr!18997 a!3626) i!1382 k0!2843) (size!19369 a!3626)) k0!2843 from!3004) e!390692)))

(declare-fun b!686023 () Bool)

(declare-fun e!390693 () Bool)

(assert (=> b!686023 (= e!390692 e!390693)))

(declare-fun res!451258 () Bool)

(assert (=> b!686023 (=> (not res!451258) (not e!390693))))

(assert (=> b!686023 (= res!451258 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19369 (array!39640 (store (arr!18997 a!3626) i!1382 k0!2843) (size!19369 a!3626)))))))

(declare-fun b!686024 () Bool)

(assert (=> b!686024 (= e!390693 (arrayContainsKey!0 (array!39640 (store (arr!18997 a!3626) i!1382 k0!2843) (size!19369 a!3626)) k0!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94669 (not res!451257)) b!686023))

(assert (= (and b!686023 res!451258) b!686024))

(declare-fun m!650151 () Bool)

(assert (=> d!94669 m!650151))

(declare-fun m!650155 () Bool)

(assert (=> b!686024 m!650155))

(assert (=> b!685769 d!94669))

(declare-fun d!94673 () Bool)

(assert (=> d!94673 (subseq!201 acc!681 acc!681)))

(declare-fun lt!314856 () Unit!24152)

(declare-fun choose!36 (List!13038) Unit!24152)

(assert (=> d!94673 (= lt!314856 (choose!36 acc!681))))

(assert (=> d!94673 (= (lemmaListSubSeqRefl!0 acc!681) lt!314856)))

(declare-fun bs!20113 () Bool)

(assert (= bs!20113 d!94673))

(assert (=> bs!20113 m!649913))

(declare-fun m!650159 () Bool)

(assert (=> bs!20113 m!650159))

(assert (=> b!685769 d!94673))

(declare-fun d!94679 () Bool)

(assert (=> d!94679 (= (validKeyInArray!0 (select (arr!18997 a!3626) from!3004)) (and (not (= (select (arr!18997 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18997 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685769 d!94679))

(declare-fun d!94683 () Bool)

(assert (=> d!94683 (= ($colon$colon!366 acc!681 k0!2843) (Cons!13034 k0!2843 acc!681))))

(assert (=> b!685769 d!94683))

(declare-fun b!686031 () Bool)

(declare-fun e!390701 () Bool)

(assert (=> b!686031 (= e!390701 (contains!3615 acc!681 (select (arr!18997 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686032 () Bool)

(declare-fun e!390702 () Bool)

(declare-fun call!34091 () Bool)

(assert (=> b!686032 (= e!390702 call!34091)))

(declare-fun d!94687 () Bool)

(declare-fun res!451267 () Bool)

(declare-fun e!390703 () Bool)

(assert (=> d!94687 (=> res!451267 e!390703)))

(assert (=> d!94687 (= res!451267 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19369 a!3626)))))

(assert (=> d!94687 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390703)))

(declare-fun b!686033 () Bool)

(declare-fun e!390700 () Bool)

(assert (=> b!686033 (= e!390703 e!390700)))

(declare-fun res!451266 () Bool)

(assert (=> b!686033 (=> (not res!451266) (not e!390700))))

(assert (=> b!686033 (= res!451266 (not e!390701))))

(declare-fun res!451265 () Bool)

(assert (=> b!686033 (=> (not res!451265) (not e!390701))))

(assert (=> b!686033 (= res!451265 (validKeyInArray!0 (select (arr!18997 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686034 () Bool)

(assert (=> b!686034 (= e!390700 e!390702)))

(declare-fun c!77750 () Bool)

(assert (=> b!686034 (= c!77750 (validKeyInArray!0 (select (arr!18997 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34088 () Bool)

(assert (=> bm!34088 (= call!34091 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77750 (Cons!13034 (select (arr!18997 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!686035 () Bool)

(assert (=> b!686035 (= e!390702 call!34091)))

(assert (= (and d!94687 (not res!451267)) b!686033))

(assert (= (and b!686033 res!451265) b!686031))

(assert (= (and b!686033 res!451266) b!686034))

(assert (= (and b!686034 c!77750) b!686032))

(assert (= (and b!686034 (not c!77750)) b!686035))

(assert (= (or b!686032 b!686035) bm!34088))

(assert (=> b!686031 m!650111))

(assert (=> b!686031 m!650111))

(declare-fun m!650163 () Bool)

(assert (=> b!686031 m!650163))

(assert (=> b!686033 m!650111))

(assert (=> b!686033 m!650111))

(declare-fun m!650165 () Bool)

(assert (=> b!686033 m!650165))

(assert (=> b!686034 m!650111))

(assert (=> b!686034 m!650111))

(assert (=> b!686034 m!650165))

(assert (=> bm!34088 m!650111))

(declare-fun m!650167 () Bool)

(assert (=> bm!34088 m!650167))

(assert (=> b!685769 d!94687))

(declare-fun d!94691 () Bool)

(declare-fun lt!314857 () Bool)

(assert (=> d!94691 (= lt!314857 (select (content!291 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!390705 () Bool)

(assert (=> d!94691 (= lt!314857 e!390705)))

(declare-fun res!451268 () Bool)

(assert (=> d!94691 (=> (not res!451268) (not e!390705))))

(assert (=> d!94691 (= res!451268 ((_ is Cons!13034) acc!681))))

(assert (=> d!94691 (= (contains!3615 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314857)))

(declare-fun b!686036 () Bool)

(declare-fun e!390704 () Bool)

(assert (=> b!686036 (= e!390705 e!390704)))

(declare-fun res!451269 () Bool)

(assert (=> b!686036 (=> res!451269 e!390704)))

(assert (=> b!686036 (= res!451269 (= (h!14079 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!686037 () Bool)

(assert (=> b!686037 (= e!390704 (contains!3615 (t!19290 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94691 res!451268) b!686036))

(assert (= (and b!686036 (not res!451269)) b!686037))

(assert (=> d!94691 m!650009))

(declare-fun m!650169 () Bool)

(assert (=> d!94691 m!650169))

(declare-fun m!650171 () Bool)

(assert (=> b!686037 m!650171))

(assert (=> b!685768 d!94691))

(declare-fun d!94693 () Bool)

(assert (=> d!94693 (= (validKeyInArray!0 k0!2843) (and (not (= k0!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685779 d!94693))

(declare-fun d!94695 () Bool)

(declare-fun res!451270 () Bool)

(declare-fun e!390706 () Bool)

(assert (=> d!94695 (=> res!451270 e!390706)))

(assert (=> d!94695 (= res!451270 (= (select (arr!18997 a!3626) #b00000000000000000000000000000000) k0!2843))))

(assert (=> d!94695 (= (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000) e!390706)))

(declare-fun b!686038 () Bool)

(declare-fun e!390707 () Bool)

(assert (=> b!686038 (= e!390706 e!390707)))

(declare-fun res!451271 () Bool)

(assert (=> b!686038 (=> (not res!451271) (not e!390707))))

(assert (=> b!686038 (= res!451271 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19369 a!3626)))))

(declare-fun b!686039 () Bool)

(assert (=> b!686039 (= e!390707 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94695 (not res!451270)) b!686038))

(assert (= (and b!686038 res!451271) b!686039))

(declare-fun m!650173 () Bool)

(assert (=> d!94695 m!650173))

(declare-fun m!650175 () Bool)

(assert (=> b!686039 m!650175))

(assert (=> b!685757 d!94695))

(declare-fun b!686040 () Bool)

(declare-fun e!390709 () Bool)

(assert (=> b!686040 (= e!390709 (contains!3615 Nil!13035 (select (arr!18997 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686041 () Bool)

(declare-fun e!390710 () Bool)

(declare-fun call!34092 () Bool)

(assert (=> b!686041 (= e!390710 call!34092)))

(declare-fun d!94697 () Bool)

(declare-fun res!451274 () Bool)

(declare-fun e!390711 () Bool)

(assert (=> d!94697 (=> res!451274 e!390711)))

(assert (=> d!94697 (= res!451274 (bvsge #b00000000000000000000000000000000 (size!19369 a!3626)))))

(assert (=> d!94697 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13035) e!390711)))

(declare-fun b!686042 () Bool)

(declare-fun e!390708 () Bool)

(assert (=> b!686042 (= e!390711 e!390708)))

(declare-fun res!451273 () Bool)

(assert (=> b!686042 (=> (not res!451273) (not e!390708))))

(assert (=> b!686042 (= res!451273 (not e!390709))))

(declare-fun res!451272 () Bool)

(assert (=> b!686042 (=> (not res!451272) (not e!390709))))

(assert (=> b!686042 (= res!451272 (validKeyInArray!0 (select (arr!18997 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!686043 () Bool)

(assert (=> b!686043 (= e!390708 e!390710)))

(declare-fun c!77751 () Bool)

(assert (=> b!686043 (= c!77751 (validKeyInArray!0 (select (arr!18997 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34089 () Bool)

(assert (=> bm!34089 (= call!34092 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77751 (Cons!13034 (select (arr!18997 a!3626) #b00000000000000000000000000000000) Nil!13035) Nil!13035)))))

(declare-fun b!686044 () Bool)

(assert (=> b!686044 (= e!390710 call!34092)))

(assert (= (and d!94697 (not res!451274)) b!686042))

(assert (= (and b!686042 res!451272) b!686040))

(assert (= (and b!686042 res!451273) b!686043))

(assert (= (and b!686043 c!77751) b!686041))

(assert (= (and b!686043 (not c!77751)) b!686044))

(assert (= (or b!686041 b!686044) bm!34089))

(assert (=> b!686040 m!650173))

(assert (=> b!686040 m!650173))

(declare-fun m!650179 () Bool)

(assert (=> b!686040 m!650179))

(assert (=> b!686042 m!650173))

(assert (=> b!686042 m!650173))

(declare-fun m!650181 () Bool)

(assert (=> b!686042 m!650181))

(assert (=> b!686043 m!650173))

(assert (=> b!686043 m!650173))

(assert (=> b!686043 m!650181))

(assert (=> bm!34089 m!650173))

(declare-fun m!650183 () Bool)

(assert (=> bm!34089 m!650183))

(assert (=> b!685767 d!94697))

(declare-fun d!94701 () Bool)

(declare-fun res!451287 () Bool)

(declare-fun e!390726 () Bool)

(assert (=> d!94701 (=> res!451287 e!390726)))

(assert (=> d!94701 (= res!451287 ((_ is Nil!13035) acc!681))))

(assert (=> d!94701 (= (noDuplicate!862 acc!681) e!390726)))

(declare-fun b!686061 () Bool)

(declare-fun e!390727 () Bool)

(assert (=> b!686061 (= e!390726 e!390727)))

(declare-fun res!451288 () Bool)

(assert (=> b!686061 (=> (not res!451288) (not e!390727))))

(assert (=> b!686061 (= res!451288 (not (contains!3615 (t!19290 acc!681) (h!14079 acc!681))))))

(declare-fun b!686062 () Bool)

(assert (=> b!686062 (= e!390727 (noDuplicate!862 (t!19290 acc!681)))))

(assert (= (and d!94701 (not res!451287)) b!686061))

(assert (= (and b!686061 res!451288) b!686062))

(declare-fun m!650187 () Bool)

(assert (=> b!686061 m!650187))

(declare-fun m!650189 () Bool)

(assert (=> b!686062 m!650189))

(assert (=> b!685766 d!94701))

(declare-fun d!94707 () Bool)

(declare-fun res!451289 () Bool)

(declare-fun e!390728 () Bool)

(assert (=> d!94707 (=> res!451289 e!390728)))

(assert (=> d!94707 (= res!451289 ((_ is Nil!13035) lt!314779))))

(assert (=> d!94707 (= (noDuplicate!862 lt!314779) e!390728)))

(declare-fun b!686063 () Bool)

(declare-fun e!390729 () Bool)

(assert (=> b!686063 (= e!390728 e!390729)))

(declare-fun res!451290 () Bool)

(assert (=> b!686063 (=> (not res!451290) (not e!390729))))

(assert (=> b!686063 (= res!451290 (not (contains!3615 (t!19290 lt!314779) (h!14079 lt!314779))))))

(declare-fun b!686064 () Bool)

(assert (=> b!686064 (= e!390729 (noDuplicate!862 (t!19290 lt!314779)))))

(assert (= (and d!94707 (not res!451289)) b!686063))

(assert (= (and b!686063 res!451290) b!686064))

(declare-fun m!650191 () Bool)

(assert (=> b!686063 m!650191))

(declare-fun m!650193 () Bool)

(assert (=> b!686064 m!650193))

(assert (=> b!685777 d!94707))

(declare-fun b!686072 () Bool)

(declare-fun e!390737 () Bool)

(assert (=> b!686072 (= e!390737 (subseq!201 (t!19290 acc!681) (t!19290 lt!314779)))))

(declare-fun b!686070 () Bool)

(declare-fun e!390735 () Bool)

(declare-fun e!390736 () Bool)

(assert (=> b!686070 (= e!390735 e!390736)))

(declare-fun res!451297 () Bool)

(assert (=> b!686070 (=> (not res!451297) (not e!390736))))

(assert (=> b!686070 (= res!451297 ((_ is Cons!13034) lt!314779))))

(declare-fun d!94709 () Bool)

(declare-fun res!451295 () Bool)

(assert (=> d!94709 (=> res!451295 e!390735)))

(assert (=> d!94709 (= res!451295 ((_ is Nil!13035) acc!681))))

(assert (=> d!94709 (= (subseq!201 acc!681 lt!314779) e!390735)))

(declare-fun b!686073 () Bool)

(declare-fun e!390734 () Bool)

(assert (=> b!686073 (= e!390734 (subseq!201 acc!681 (t!19290 lt!314779)))))

(declare-fun b!686071 () Bool)

(assert (=> b!686071 (= e!390736 e!390734)))

(declare-fun res!451296 () Bool)

(assert (=> b!686071 (=> res!451296 e!390734)))

(assert (=> b!686071 (= res!451296 e!390737)))

(declare-fun res!451294 () Bool)

(assert (=> b!686071 (=> (not res!451294) (not e!390737))))

(assert (=> b!686071 (= res!451294 (= (h!14079 acc!681) (h!14079 lt!314779)))))

(assert (= (and d!94709 (not res!451295)) b!686070))

(assert (= (and b!686070 res!451297) b!686071))

(assert (= (and b!686071 res!451294) b!686072))

(assert (= (and b!686071 (not res!451296)) b!686073))

(declare-fun m!650199 () Bool)

(assert (=> b!686072 m!650199))

(declare-fun m!650201 () Bool)

(assert (=> b!686073 m!650201))

(assert (=> b!685776 d!94709))

(declare-fun d!94713 () Bool)

(assert (=> d!94713 (= ($colon$colon!366 acc!681 (select (arr!18997 a!3626) from!3004)) (Cons!13034 (select (arr!18997 a!3626) from!3004) acc!681))))

(assert (=> b!685765 d!94713))

(assert (=> b!685765 d!94641))

(declare-fun d!94715 () Bool)

(assert (=> d!94715 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314867 () Unit!24152)

(declare-fun choose!80 (array!39639 List!13038 List!13038 (_ BitVec 32)) Unit!24152)

(assert (=> d!94715 (= lt!314867 (choose!80 a!3626 ($colon$colon!366 acc!681 (select (arr!18997 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94715 (bvslt (size!19369 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94715 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!366 acc!681 (select (arr!18997 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314867)))

(declare-fun bs!20116 () Bool)

(assert (= bs!20116 d!94715))

(assert (=> bs!20116 m!649903))

(assert (=> bs!20116 m!649907))

(declare-fun m!650217 () Bool)

(assert (=> bs!20116 m!650217))

(assert (=> b!685765 d!94715))

(assert (=> b!685765 d!94673))

(assert (=> b!685765 d!94687))

(declare-fun d!94725 () Bool)

(assert (=> d!94725 (= (array_inv!14793 a!3626) (bvsge (size!19369 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61180 d!94725))

(check-sat (not bm!34089) (not b!686064) (not d!94615) (not d!94661) (not b!686031) (not b!686003) (not b!685903) (not d!94607) (not d!94609) (not d!94715) (not b!685985) (not b!686040) (not b!686033) (not bm!34082) (not b!685957) (not b!685906) (not b!686063) (not b!686039) (not b!686037) (not b!686073) (not b!686062) (not d!94605) (not b!686043) (not b!686061) (not d!94691) (not d!94629) (not b!686072) (not b!685984) (not d!94603) (not b!685864) (not b!685870) (not bm!34076) (not d!94673) (not b!686042) (not b!685862) (not b!686024) (not bm!34088) (not b!685866) (not b!685868) (not b!685905) (not b!686034) (not d!94613))
(check-sat)
