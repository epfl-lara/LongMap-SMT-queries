; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60582 () Bool)

(assert start!60582)

(declare-fun b!680809 () Bool)

(declare-fun e!387801 () Bool)

(declare-fun e!387800 () Bool)

(assert (=> b!680809 (= e!387801 e!387800)))

(declare-fun res!447030 () Bool)

(assert (=> b!680809 (=> res!447030 e!387800)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!680809 (= res!447030 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39506 0))(
  ( (array!39507 (arr!18941 (Array (_ BitVec 32) (_ BitVec 64))) (size!19305 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39506)

(declare-datatypes ((List!12982 0))(
  ( (Nil!12979) (Cons!12978 (h!14023 (_ BitVec 64)) (t!19213 List!12982)) )
))
(declare-fun lt!313155 () List!12982)

(declare-fun acc!681 () List!12982)

(declare-fun $colon$colon!310 (List!12982 (_ BitVec 64)) List!12982)

(assert (=> b!680809 (= lt!313155 ($colon$colon!310 acc!681 (select (arr!18941 a!3626) from!3004)))))

(declare-fun subseq!145 (List!12982 List!12982) Bool)

(assert (=> b!680809 (subseq!145 acc!681 acc!681)))

(declare-datatypes ((Unit!23882 0))(
  ( (Unit!23883) )
))
(declare-fun lt!313154 () Unit!23882)

(declare-fun lemmaListSubSeqRefl!0 (List!12982) Unit!23882)

(assert (=> b!680809 (= lt!313154 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!680810 () Bool)

(declare-fun res!447038 () Bool)

(declare-fun e!387794 () Bool)

(assert (=> b!680810 (=> (not res!447038) (not e!387794))))

(declare-fun arrayNoDuplicates!0 (array!39506 (_ BitVec 32) List!12982) Bool)

(assert (=> b!680810 (= res!447038 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!680811 () Bool)

(declare-fun res!447035 () Bool)

(assert (=> b!680811 (=> (not res!447035) (not e!387794))))

(declare-fun contains!3559 (List!12982 (_ BitVec 64)) Bool)

(assert (=> b!680811 (= res!447035 (not (contains!3559 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!447032 () Bool)

(assert (=> start!60582 (=> (not res!447032) (not e!387794))))

(assert (=> start!60582 (= res!447032 (and (bvslt (size!19305 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19305 a!3626))))))

(assert (=> start!60582 e!387794))

(assert (=> start!60582 true))

(declare-fun array_inv!14737 (array!39506) Bool)

(assert (=> start!60582 (array_inv!14737 a!3626)))

(declare-fun b!680812 () Bool)

(declare-fun e!387793 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!680812 (= e!387793 (contains!3559 acc!681 k!2843))))

(declare-fun b!680813 () Bool)

(declare-fun res!447036 () Bool)

(assert (=> b!680813 (=> (not res!447036) (not e!387794))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!680813 (= res!447036 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19305 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!680814 () Bool)

(declare-fun res!447028 () Bool)

(assert (=> b!680814 (=> (not res!447028) (not e!387794))))

(assert (=> b!680814 (= res!447028 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19305 a!3626))))))

(declare-fun b!680815 () Bool)

(declare-fun res!447031 () Bool)

(assert (=> b!680815 (=> res!447031 e!387800)))

(declare-fun noDuplicate!806 (List!12982) Bool)

(assert (=> b!680815 (= res!447031 (not (noDuplicate!806 lt!313155)))))

(declare-fun b!680816 () Bool)

(declare-fun res!447034 () Bool)

(assert (=> b!680816 (=> (not res!447034) (not e!387794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!680816 (= res!447034 (validKeyInArray!0 k!2843))))

(declare-fun b!680817 () Bool)

(declare-fun res!447024 () Bool)

(assert (=> b!680817 (=> (not res!447024) (not e!387794))))

(assert (=> b!680817 (= res!447024 (not (contains!3559 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680818 () Bool)

(declare-fun res!447023 () Bool)

(assert (=> b!680818 (=> (not res!447023) (not e!387794))))

(assert (=> b!680818 (= res!447023 (noDuplicate!806 acc!681))))

(declare-fun b!680819 () Bool)

(declare-fun e!387797 () Bool)

(assert (=> b!680819 (= e!387797 (not (contains!3559 acc!681 k!2843)))))

(declare-fun b!680820 () Bool)

(declare-fun e!387796 () Bool)

(assert (=> b!680820 (= e!387800 e!387796)))

(declare-fun res!447021 () Bool)

(assert (=> b!680820 (=> (not res!447021) (not e!387796))))

(assert (=> b!680820 (= res!447021 (not (contains!3559 lt!313155 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680821 () Bool)

(declare-fun e!387799 () Unit!23882)

(declare-fun Unit!23884 () Unit!23882)

(assert (=> b!680821 (= e!387799 Unit!23884)))

(declare-fun lt!313153 () Unit!23882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39506 (_ BitVec 64) (_ BitVec 32)) Unit!23882)

(assert (=> b!680821 (= lt!313153 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!680821 false))

(declare-fun b!680822 () Bool)

(assert (=> b!680822 (= e!387794 (not e!387801))))

(declare-fun res!447022 () Bool)

(assert (=> b!680822 (=> res!447022 e!387801)))

(assert (=> b!680822 (= res!447022 (not (validKeyInArray!0 (select (arr!18941 a!3626) from!3004))))))

(declare-fun lt!313156 () Unit!23882)

(assert (=> b!680822 (= lt!313156 e!387799)))

(declare-fun c!77261 () Bool)

(declare-fun arrayContainsKey!0 (array!39506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!680822 (= c!77261 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!680822 (arrayContainsKey!0 (array!39507 (store (arr!18941 a!3626) i!1382 k!2843) (size!19305 a!3626)) k!2843 from!3004)))

(declare-fun b!680823 () Bool)

(declare-fun res!447037 () Bool)

(assert (=> b!680823 (=> (not res!447037) (not e!387794))))

(declare-fun e!387798 () Bool)

(assert (=> b!680823 (= res!447037 e!387798)))

(declare-fun res!447033 () Bool)

(assert (=> b!680823 (=> res!447033 e!387798)))

(assert (=> b!680823 (= res!447033 e!387793)))

(declare-fun res!447025 () Bool)

(assert (=> b!680823 (=> (not res!447025) (not e!387793))))

(assert (=> b!680823 (= res!447025 (bvsgt from!3004 i!1382))))

(declare-fun b!680824 () Bool)

(declare-fun res!447026 () Bool)

(assert (=> b!680824 (=> (not res!447026) (not e!387794))))

(assert (=> b!680824 (= res!447026 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!680825 () Bool)

(declare-fun res!447029 () Bool)

(assert (=> b!680825 (=> (not res!447029) (not e!387794))))

(assert (=> b!680825 (= res!447029 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12979))))

(declare-fun b!680826 () Bool)

(declare-fun Unit!23885 () Unit!23882)

(assert (=> b!680826 (= e!387799 Unit!23885)))

(declare-fun b!680827 () Bool)

(assert (=> b!680827 (= e!387796 (not (contains!3559 lt!313155 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!680828 () Bool)

(assert (=> b!680828 (= e!387798 e!387797)))

(declare-fun res!447027 () Bool)

(assert (=> b!680828 (=> (not res!447027) (not e!387797))))

(assert (=> b!680828 (= res!447027 (bvsle from!3004 i!1382))))

(assert (= (and start!60582 res!447032) b!680818))

(assert (= (and b!680818 res!447023) b!680811))

(assert (= (and b!680811 res!447035) b!680817))

(assert (= (and b!680817 res!447024) b!680823))

(assert (= (and b!680823 res!447025) b!680812))

(assert (= (and b!680823 (not res!447033)) b!680828))

(assert (= (and b!680828 res!447027) b!680819))

(assert (= (and b!680823 res!447037) b!680825))

(assert (= (and b!680825 res!447029) b!680810))

(assert (= (and b!680810 res!447038) b!680814))

(assert (= (and b!680814 res!447028) b!680816))

(assert (= (and b!680816 res!447034) b!680824))

(assert (= (and b!680824 res!447026) b!680813))

(assert (= (and b!680813 res!447036) b!680822))

(assert (= (and b!680822 c!77261) b!680821))

(assert (= (and b!680822 (not c!77261)) b!680826))

(assert (= (and b!680822 (not res!447022)) b!680809))

(assert (= (and b!680809 (not res!447030)) b!680815))

(assert (= (and b!680815 (not res!447031)) b!680820))

(assert (= (and b!680820 res!447021) b!680827))

(declare-fun m!645779 () Bool)

(assert (=> start!60582 m!645779))

(declare-fun m!645781 () Bool)

(assert (=> b!680821 m!645781))

(declare-fun m!645783 () Bool)

(assert (=> b!680811 m!645783))

(declare-fun m!645785 () Bool)

(assert (=> b!680809 m!645785))

(assert (=> b!680809 m!645785))

(declare-fun m!645787 () Bool)

(assert (=> b!680809 m!645787))

(declare-fun m!645789 () Bool)

(assert (=> b!680809 m!645789))

(declare-fun m!645791 () Bool)

(assert (=> b!680809 m!645791))

(declare-fun m!645793 () Bool)

(assert (=> b!680825 m!645793))

(declare-fun m!645795 () Bool)

(assert (=> b!680827 m!645795))

(declare-fun m!645797 () Bool)

(assert (=> b!680817 m!645797))

(assert (=> b!680822 m!645785))

(declare-fun m!645799 () Bool)

(assert (=> b!680822 m!645799))

(declare-fun m!645801 () Bool)

(assert (=> b!680822 m!645801))

(assert (=> b!680822 m!645785))

(declare-fun m!645803 () Bool)

(assert (=> b!680822 m!645803))

(declare-fun m!645805 () Bool)

(assert (=> b!680822 m!645805))

(declare-fun m!645807 () Bool)

(assert (=> b!680816 m!645807))

(declare-fun m!645809 () Bool)

(assert (=> b!680820 m!645809))

(declare-fun m!645811 () Bool)

(assert (=> b!680824 m!645811))

(declare-fun m!645813 () Bool)

(assert (=> b!680818 m!645813))

(declare-fun m!645815 () Bool)

(assert (=> b!680812 m!645815))

(declare-fun m!645817 () Bool)

(assert (=> b!680815 m!645817))

(declare-fun m!645819 () Bool)

(assert (=> b!680810 m!645819))

(assert (=> b!680819 m!645815))

(push 1)

(assert (not b!680811))

(assert (not b!680809))

(assert (not b!680818))

(assert (not b!680810))

(assert (not b!680822))

(assert (not b!680812))

(assert (not b!680816))

(assert (not b!680820))

(assert (not start!60582))

(assert (not b!680819))

(assert (not b!680815))

(assert (not b!680821))

(assert (not b!680824))

(assert (not b!680827))

(assert (not b!680825))

(assert (not b!680817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93677 () Bool)

(declare-fun lt!313159 () Bool)

(declare-fun content!270 (List!12982) (Set (_ BitVec 64)))

(assert (=> d!93677 (= lt!313159 (member k!2843 (content!270 acc!681)))))

(declare-fun e!387806 () Bool)

(assert (=> d!93677 (= lt!313159 e!387806)))

(declare-fun res!447044 () Bool)

(assert (=> d!93677 (=> (not res!447044) (not e!387806))))

(assert (=> d!93677 (= res!447044 (is-Cons!12978 acc!681))))

(assert (=> d!93677 (= (contains!3559 acc!681 k!2843) lt!313159)))

(declare-fun b!680833 () Bool)

(declare-fun e!387807 () Bool)

(assert (=> b!680833 (= e!387806 e!387807)))

(declare-fun res!447043 () Bool)

(assert (=> b!680833 (=> res!447043 e!387807)))

(assert (=> b!680833 (= res!447043 (= (h!14023 acc!681) k!2843))))

(declare-fun b!680834 () Bool)

(assert (=> b!680834 (= e!387807 (contains!3559 (t!19213 acc!681) k!2843))))

(assert (= (and d!93677 res!447044) b!680833))

(assert (= (and b!680833 (not res!447043)) b!680834))

(declare-fun m!645821 () Bool)

(assert (=> d!93677 m!645821))

(declare-fun m!645823 () Bool)

(assert (=> d!93677 m!645823))

(declare-fun m!645825 () Bool)

(assert (=> b!680834 m!645825))

(assert (=> b!680819 d!93677))

(declare-fun d!93679 () Bool)

(assert (=> d!93679 (= ($colon$colon!310 acc!681 (select (arr!18941 a!3626) from!3004)) (Cons!12978 (select (arr!18941 a!3626) from!3004) acc!681))))

(assert (=> b!680809 d!93679))

(declare-fun b!680843 () Bool)

(declare-fun e!387819 () Bool)

(declare-fun e!387817 () Bool)

(assert (=> b!680843 (= e!387819 e!387817)))

(declare-fun res!447054 () Bool)

(assert (=> b!680843 (=> (not res!447054) (not e!387817))))

(assert (=> b!680843 (= res!447054 (is-Cons!12978 acc!681))))

(declare-fun b!680845 () Bool)

(declare-fun e!387818 () Bool)

(assert (=> b!680845 (= e!387818 (subseq!145 (t!19213 acc!681) (t!19213 acc!681)))))

(declare-fun b!680846 () Bool)

(declare-fun e!387816 () Bool)

(assert (=> b!680846 (= e!387816 (subseq!145 acc!681 (t!19213 acc!681)))))

(declare-fun b!680844 () Bool)

(assert (=> b!680844 (= e!387817 e!387816)))

(declare-fun res!447055 () Bool)

(assert (=> b!680844 (=> res!447055 e!387816)))

(assert (=> b!680844 (= res!447055 e!387818)))

(declare-fun res!447056 () Bool)

(assert (=> b!680844 (=> (not res!447056) (not e!387818))))

(assert (=> b!680844 (= res!447056 (= (h!14023 acc!681) (h!14023 acc!681)))))

(declare-fun d!93681 () Bool)

(declare-fun res!447053 () Bool)

(assert (=> d!93681 (=> res!447053 e!387819)))

(assert (=> d!93681 (= res!447053 (is-Nil!12979 acc!681))))

(assert (=> d!93681 (= (subseq!145 acc!681 acc!681) e!387819)))

(assert (= (and d!93681 (not res!447053)) b!680843))

(assert (= (and b!680843 res!447054) b!680844))

(assert (= (and b!680844 res!447056) b!680845))

(assert (= (and b!680844 (not res!447055)) b!680846))

(declare-fun m!645827 () Bool)

(assert (=> b!680845 m!645827))

(declare-fun m!645829 () Bool)

(assert (=> b!680846 m!645829))

(assert (=> b!680809 d!93681))

(declare-fun d!93685 () Bool)

(assert (=> d!93685 (subseq!145 acc!681 acc!681)))

(declare-fun lt!313162 () Unit!23882)

(declare-fun choose!36 (List!12982) Unit!23882)

(assert (=> d!93685 (= lt!313162 (choose!36 acc!681))))

(assert (=> d!93685 (= (lemmaListSubSeqRefl!0 acc!681) lt!313162)))

(declare-fun bs!19987 () Bool)

(assert (= bs!19987 d!93685))

(assert (=> bs!19987 m!645789))

(declare-fun m!645831 () Bool)

(assert (=> bs!19987 m!645831))

(assert (=> b!680809 d!93685))

(declare-fun d!93687 () Bool)

(declare-fun lt!313163 () Bool)

(assert (=> d!93687 (= lt!313163 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!270 lt!313155)))))

(declare-fun e!387820 () Bool)

(assert (=> d!93687 (= lt!313163 e!387820)))

(declare-fun res!447058 () Bool)

(assert (=> d!93687 (=> (not res!447058) (not e!387820))))

(assert (=> d!93687 (= res!447058 (is-Cons!12978 lt!313155))))

(assert (=> d!93687 (= (contains!3559 lt!313155 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313163)))

(declare-fun b!680847 () Bool)

(declare-fun e!387821 () Bool)

(assert (=> b!680847 (= e!387820 e!387821)))

(declare-fun res!447057 () Bool)

(assert (=> b!680847 (=> res!447057 e!387821)))

(assert (=> b!680847 (= res!447057 (= (h!14023 lt!313155) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680848 () Bool)

(assert (=> b!680848 (= e!387821 (contains!3559 (t!19213 lt!313155) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93687 res!447058) b!680847))

(assert (= (and b!680847 (not res!447057)) b!680848))

(declare-fun m!645833 () Bool)

(assert (=> d!93687 m!645833))

(declare-fun m!645835 () Bool)

(assert (=> d!93687 m!645835))

(declare-fun m!645837 () Bool)

(assert (=> b!680848 m!645837))

(assert (=> b!680820 d!93687))

(declare-fun d!93689 () Bool)

(declare-fun res!447069 () Bool)

(declare-fun e!387832 () Bool)

(assert (=> d!93689 (=> res!447069 e!387832)))

(assert (=> d!93689 (= res!447069 (is-Nil!12979 acc!681))))

(assert (=> d!93689 (= (noDuplicate!806 acc!681) e!387832)))

(declare-fun b!680859 () Bool)

(declare-fun e!387833 () Bool)

(assert (=> b!680859 (= e!387832 e!387833)))

(declare-fun res!447070 () Bool)

(assert (=> b!680859 (=> (not res!447070) (not e!387833))))

(assert (=> b!680859 (= res!447070 (not (contains!3559 (t!19213 acc!681) (h!14023 acc!681))))))

(declare-fun b!680860 () Bool)

(assert (=> b!680860 (= e!387833 (noDuplicate!806 (t!19213 acc!681)))))

(assert (= (and d!93689 (not res!447069)) b!680859))

(assert (= (and b!680859 res!447070) b!680860))

(declare-fun m!645845 () Bool)

(assert (=> b!680859 m!645845))

(declare-fun m!645847 () Bool)

(assert (=> b!680860 m!645847))

(assert (=> b!680818 d!93689))

(declare-fun d!93693 () Bool)

(declare-fun lt!313167 () Bool)

(assert (=> d!93693 (= lt!313167 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!270 acc!681)))))

(declare-fun e!387838 () Bool)

(assert (=> d!93693 (= lt!313167 e!387838)))

(declare-fun res!447076 () Bool)

(assert (=> d!93693 (=> (not res!447076) (not e!387838))))

(assert (=> d!93693 (= res!447076 (is-Cons!12978 acc!681))))

(assert (=> d!93693 (= (contains!3559 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313167)))

(declare-fun b!680863 () Bool)

(declare-fun e!387839 () Bool)

(assert (=> b!680863 (= e!387838 e!387839)))

(declare-fun res!447075 () Bool)

(assert (=> b!680863 (=> res!447075 e!387839)))

(assert (=> b!680863 (= res!447075 (= (h!14023 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680864 () Bool)

(assert (=> b!680864 (= e!387839 (contains!3559 (t!19213 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93693 res!447076) b!680863))

(assert (= (and b!680863 (not res!447075)) b!680864))

(assert (=> d!93693 m!645821))

(declare-fun m!645849 () Bool)

(assert (=> d!93693 m!645849))

(declare-fun m!645851 () Bool)

(assert (=> b!680864 m!645851))

(assert (=> b!680811 d!93693))

(declare-fun d!93695 () Bool)

(assert (=> d!93695 (= (validKeyInArray!0 (select (arr!18941 a!3626) from!3004)) (and (not (= (select (arr!18941 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18941 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!680822 d!93695))

(declare-fun d!93699 () Bool)

(declare-fun res!447091 () Bool)

(declare-fun e!387854 () Bool)

(assert (=> d!93699 (=> res!447091 e!387854)))

(assert (=> d!93699 (= res!447091 (= (select (arr!18941 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!93699 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!387854)))

(declare-fun b!680881 () Bool)

(declare-fun e!387855 () Bool)

(assert (=> b!680881 (= e!387854 e!387855)))

(declare-fun res!447092 () Bool)

(assert (=> b!680881 (=> (not res!447092) (not e!387855))))

(assert (=> b!680881 (= res!447092 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19305 a!3626)))))

(declare-fun b!680882 () Bool)

(assert (=> b!680882 (= e!387855 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93699 (not res!447091)) b!680881))

(assert (= (and b!680881 res!447092) b!680882))

(declare-fun m!645865 () Bool)

(assert (=> d!93699 m!645865))

(declare-fun m!645867 () Bool)

(assert (=> b!680882 m!645867))

(assert (=> b!680822 d!93699))

(declare-fun d!93709 () Bool)

(declare-fun res!447097 () Bool)

(declare-fun e!387860 () Bool)

(assert (=> d!93709 (=> res!447097 e!387860)))

(assert (=> d!93709 (= res!447097 (= (select (arr!18941 (array!39507 (store (arr!18941 a!3626) i!1382 k!2843) (size!19305 a!3626))) from!3004) k!2843))))

(assert (=> d!93709 (= (arrayContainsKey!0 (array!39507 (store (arr!18941 a!3626) i!1382 k!2843) (size!19305 a!3626)) k!2843 from!3004) e!387860)))

(declare-fun b!680887 () Bool)

(declare-fun e!387861 () Bool)

(assert (=> b!680887 (= e!387860 e!387861)))

(declare-fun res!447098 () Bool)

(assert (=> b!680887 (=> (not res!447098) (not e!387861))))

(assert (=> b!680887 (= res!447098 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19305 (array!39507 (store (arr!18941 a!3626) i!1382 k!2843) (size!19305 a!3626)))))))

(declare-fun b!680888 () Bool)

(assert (=> b!680888 (= e!387861 (arrayContainsKey!0 (array!39507 (store (arr!18941 a!3626) i!1382 k!2843) (size!19305 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!93709 (not res!447097)) b!680887))

(assert (= (and b!680887 res!447098) b!680888))

(declare-fun m!645869 () Bool)

(assert (=> d!93709 m!645869))

(declare-fun m!645871 () Bool)

(assert (=> b!680888 m!645871))

(assert (=> b!680822 d!93709))

(assert (=> b!680812 d!93677))

(declare-fun b!680927 () Bool)

(declare-fun e!387898 () Bool)

(assert (=> b!680927 (= e!387898 (contains!3559 acc!681 (select (arr!18941 a!3626) from!3004)))))

(declare-fun call!33955 () Bool)

(declare-fun bm!33952 () Bool)

(declare-fun c!77266 () Bool)

(assert (=> bm!33952 (= call!33955 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77266 (Cons!12978 (select (arr!18941 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun d!93711 () Bool)

(declare-fun res!447130 () Bool)

(declare-fun e!387899 () Bool)

(assert (=> d!93711 (=> res!447130 e!387899)))

(assert (=> d!93711 (= res!447130 (bvsge from!3004 (size!19305 a!3626)))))

(assert (=> d!93711 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!387899)))

(declare-fun b!680928 () Bool)

(declare-fun e!387896 () Bool)

(assert (=> b!680928 (= e!387899 e!387896)))

(declare-fun res!447129 () Bool)

(assert (=> b!680928 (=> (not res!447129) (not e!387896))))

(assert (=> b!680928 (= res!447129 (not e!387898))))

(declare-fun res!447131 () Bool)

(assert (=> b!680928 (=> (not res!447131) (not e!387898))))

(assert (=> b!680928 (= res!447131 (validKeyInArray!0 (select (arr!18941 a!3626) from!3004)))))

(declare-fun b!680929 () Bool)

(declare-fun e!387897 () Bool)

(assert (=> b!680929 (= e!387897 call!33955)))

(declare-fun b!680930 () Bool)

(assert (=> b!680930 (= e!387897 call!33955)))

(declare-fun b!680931 () Bool)

(assert (=> b!680931 (= e!387896 e!387897)))

(assert (=> b!680931 (= c!77266 (validKeyInArray!0 (select (arr!18941 a!3626) from!3004)))))

(assert (= (and d!93711 (not res!447130)) b!680928))

(assert (= (and b!680928 res!447131) b!680927))

(assert (= (and b!680928 res!447129) b!680931))

(assert (= (and b!680931 c!77266) b!680929))

(assert (= (and b!680931 (not c!77266)) b!680930))

(assert (= (or b!680929 b!680930) bm!33952))

(assert (=> b!680927 m!645785))

(assert (=> b!680927 m!645785))

(declare-fun m!645897 () Bool)

(assert (=> b!680927 m!645897))

(assert (=> bm!33952 m!645785))

(declare-fun m!645901 () Bool)

(assert (=> bm!33952 m!645901))

(assert (=> b!680928 m!645785))

(assert (=> b!680928 m!645785))

(assert (=> b!680928 m!645803))

(assert (=> b!680931 m!645785))

(assert (=> b!680931 m!645785))

(assert (=> b!680931 m!645803))

(assert (=> b!680810 d!93711))

(declare-fun d!93727 () Bool)

(assert (=> d!93727 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313177 () Unit!23882)

(declare-fun choose!13 (array!39506 (_ BitVec 64) (_ BitVec 32)) Unit!23882)

(assert (=> d!93727 (= lt!313177 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!93727 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!93727 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313177)))

(declare-fun bs!19988 () Bool)

(assert (= bs!19988 d!93727))

(assert (=> bs!19988 m!645811))

(declare-fun m!645929 () Bool)

(assert (=> bs!19988 m!645929))

(assert (=> b!680821 d!93727))

(declare-fun d!93743 () Bool)

(assert (=> d!93743 (= (array_inv!14737 a!3626) (bvsge (size!19305 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60582 d!93743))

(declare-fun b!680953 () Bool)

(declare-fun e!387922 () Bool)

(assert (=> b!680953 (= e!387922 (contains!3559 Nil!12979 (select (arr!18941 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33954 () Bool)

(declare-fun call!33957 () Bool)

(declare-fun c!77268 () Bool)

(assert (=> bm!33954 (= call!33957 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77268 (Cons!12978 (select (arr!18941 a!3626) #b00000000000000000000000000000000) Nil!12979) Nil!12979)))))

(declare-fun d!93747 () Bool)

(declare-fun res!447152 () Bool)

(declare-fun e!387923 () Bool)

(assert (=> d!93747 (=> res!447152 e!387923)))

(assert (=> d!93747 (= res!447152 (bvsge #b00000000000000000000000000000000 (size!19305 a!3626)))))

(assert (=> d!93747 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12979) e!387923)))

(declare-fun b!680954 () Bool)

(declare-fun e!387920 () Bool)

(assert (=> b!680954 (= e!387923 e!387920)))

(declare-fun res!447151 () Bool)

(assert (=> b!680954 (=> (not res!447151) (not e!387920))))

(assert (=> b!680954 (= res!447151 (not e!387922))))

(declare-fun res!447153 () Bool)

(assert (=> b!680954 (=> (not res!447153) (not e!387922))))

(assert (=> b!680954 (= res!447153 (validKeyInArray!0 (select (arr!18941 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!680955 () Bool)

(declare-fun e!387921 () Bool)

(assert (=> b!680955 (= e!387921 call!33957)))

(declare-fun b!680956 () Bool)

(assert (=> b!680956 (= e!387921 call!33957)))

(declare-fun b!680957 () Bool)

(assert (=> b!680957 (= e!387920 e!387921)))

(assert (=> b!680957 (= c!77268 (validKeyInArray!0 (select (arr!18941 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!93747 (not res!447152)) b!680954))

(assert (= (and b!680954 res!447153) b!680953))

(assert (= (and b!680954 res!447151) b!680957))

(assert (= (and b!680957 c!77268) b!680955))

(assert (= (and b!680957 (not c!77268)) b!680956))

(assert (= (or b!680955 b!680956) bm!33954))

(declare-fun m!645939 () Bool)

(assert (=> b!680953 m!645939))

(assert (=> b!680953 m!645939))

(declare-fun m!645941 () Bool)

(assert (=> b!680953 m!645941))

(assert (=> bm!33954 m!645939))

(declare-fun m!645943 () Bool)

(assert (=> bm!33954 m!645943))

(assert (=> b!680954 m!645939))

(assert (=> b!680954 m!645939))

(declare-fun m!645945 () Bool)

(assert (=> b!680954 m!645945))

(assert (=> b!680957 m!645939))

(assert (=> b!680957 m!645939))

(assert (=> b!680957 m!645945))

(assert (=> b!680825 d!93747))

(declare-fun d!93753 () Bool)

(declare-fun res!447154 () Bool)

(declare-fun e!387924 () Bool)

(assert (=> d!93753 (=> res!447154 e!387924)))

(assert (=> d!93753 (= res!447154 (= (select (arr!18941 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93753 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!387924)))

(declare-fun b!680958 () Bool)

(declare-fun e!387925 () Bool)

(assert (=> b!680958 (= e!387924 e!387925)))

(declare-fun res!447155 () Bool)

(assert (=> b!680958 (=> (not res!447155) (not e!387925))))

(assert (=> b!680958 (= res!447155 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19305 a!3626)))))

(declare-fun b!680959 () Bool)

(assert (=> b!680959 (= e!387925 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93753 (not res!447154)) b!680958))

(assert (= (and b!680958 res!447155) b!680959))

(assert (=> d!93753 m!645939))

(declare-fun m!645949 () Bool)

(assert (=> b!680959 m!645949))

(assert (=> b!680824 d!93753))

(declare-fun d!93757 () Bool)

(declare-fun lt!313182 () Bool)

(assert (=> d!93757 (= lt!313182 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!270 lt!313155)))))

(declare-fun e!387926 () Bool)

(assert (=> d!93757 (= lt!313182 e!387926)))

(declare-fun res!447157 () Bool)

(assert (=> d!93757 (=> (not res!447157) (not e!387926))))

(assert (=> d!93757 (= res!447157 (is-Cons!12978 lt!313155))))

(assert (=> d!93757 (= (contains!3559 lt!313155 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313182)))

(declare-fun b!680960 () Bool)

(declare-fun e!387927 () Bool)

(assert (=> b!680960 (= e!387926 e!387927)))

(declare-fun res!447156 () Bool)

(assert (=> b!680960 (=> res!447156 e!387927)))

(assert (=> b!680960 (= res!447156 (= (h!14023 lt!313155) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680961 () Bool)

(assert (=> b!680961 (= e!387927 (contains!3559 (t!19213 lt!313155) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93757 res!447157) b!680960))

(assert (= (and b!680960 (not res!447156)) b!680961))

(assert (=> d!93757 m!645833))

(declare-fun m!645951 () Bool)

(assert (=> d!93757 m!645951))

(declare-fun m!645953 () Bool)

(assert (=> b!680961 m!645953))

(assert (=> b!680827 d!93757))

(declare-fun d!93759 () Bool)

(declare-fun lt!313183 () Bool)

(assert (=> d!93759 (= lt!313183 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!270 acc!681)))))

(declare-fun e!387928 () Bool)

(assert (=> d!93759 (= lt!313183 e!387928)))

(declare-fun res!447159 () Bool)

(assert (=> d!93759 (=> (not res!447159) (not e!387928))))

(assert (=> d!93759 (= res!447159 (is-Cons!12978 acc!681))))

(assert (=> d!93759 (= (contains!3559 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313183)))

(declare-fun b!680962 () Bool)

(declare-fun e!387929 () Bool)

(assert (=> b!680962 (= e!387928 e!387929)))

(declare-fun res!447158 () Bool)

(assert (=> b!680962 (=> res!447158 e!387929)))

(assert (=> b!680962 (= res!447158 (= (h!14023 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!680963 () Bool)

(assert (=> b!680963 (= e!387929 (contains!3559 (t!19213 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93759 res!447159) b!680962))

(assert (= (and b!680962 (not res!447158)) b!680963))

(assert (=> d!93759 m!645821))

(declare-fun m!645955 () Bool)

(assert (=> d!93759 m!645955))

(declare-fun m!645957 () Bool)

(assert (=> b!680963 m!645957))

(assert (=> b!680817 d!93759))

(declare-fun d!93763 () Bool)

(declare-fun res!447160 () Bool)

(declare-fun e!387930 () Bool)

(assert (=> d!93763 (=> res!447160 e!387930)))

(assert (=> d!93763 (= res!447160 (is-Nil!12979 lt!313155))))

(assert (=> d!93763 (= (noDuplicate!806 lt!313155) e!387930)))

(declare-fun b!680964 () Bool)

(declare-fun e!387931 () Bool)

(assert (=> b!680964 (= e!387930 e!387931)))

(declare-fun res!447161 () Bool)

(assert (=> b!680964 (=> (not res!447161) (not e!387931))))

