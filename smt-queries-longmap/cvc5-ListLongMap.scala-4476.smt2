; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62282 () Bool)

(assert start!62282)

(declare-fun b!697864 () Bool)

(declare-fun res!461752 () Bool)

(declare-fun e!396711 () Bool)

(assert (=> b!697864 (=> (not res!461752) (not e!396711))))

(declare-datatypes ((array!40000 0))(
  ( (array!40001 (arr!19158 (Array (_ BitVec 32) (_ BitVec 64))) (size!19543 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!40000)

(declare-datatypes ((List!13199 0))(
  ( (Nil!13196) (Cons!13195 (h!14240 (_ BitVec 64)) (t!19481 List!13199)) )
))
(declare-fun arrayNoDuplicates!0 (array!40000 (_ BitVec 32) List!13199) Bool)

(assert (=> b!697864 (= res!461752 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13196))))

(declare-fun b!697865 () Bool)

(declare-fun res!461750 () Bool)

(assert (=> b!697865 (=> (not res!461750) (not e!396711))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!697865 (= res!461750 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19543 a!3626)))))

(declare-fun b!697866 () Bool)

(declare-fun res!461753 () Bool)

(assert (=> b!697866 (=> (not res!461753) (not e!396711))))

(declare-fun e!396713 () Bool)

(assert (=> b!697866 (= res!461753 e!396713)))

(declare-fun res!461745 () Bool)

(assert (=> b!697866 (=> res!461745 e!396713)))

(declare-fun e!396710 () Bool)

(assert (=> b!697866 (= res!461745 e!396710)))

(declare-fun res!461741 () Bool)

(assert (=> b!697866 (=> (not res!461741) (not e!396710))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!697866 (= res!461741 (bvsgt from!3004 i!1382))))

(declare-fun b!697868 () Bool)

(declare-fun res!461748 () Bool)

(assert (=> b!697868 (=> (not res!461748) (not e!396711))))

(declare-fun acc!681 () List!13199)

(assert (=> b!697868 (= res!461748 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!697869 () Bool)

(declare-fun res!461740 () Bool)

(assert (=> b!697869 (=> (not res!461740) (not e!396711))))

(declare-fun contains!3776 (List!13199 (_ BitVec 64)) Bool)

(assert (=> b!697869 (= res!461740 (not (contains!3776 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!697870 () Bool)

(declare-fun e!396712 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!697870 (= e!396712 (not (contains!3776 acc!681 k!2843)))))

(declare-fun b!697871 () Bool)

(declare-fun res!461742 () Bool)

(assert (=> b!697871 (=> (not res!461742) (not e!396711))))

(declare-fun noDuplicate!1023 (List!13199) Bool)

(assert (=> b!697871 (= res!461742 (noDuplicate!1023 acc!681))))

(declare-fun b!697872 () Bool)

(assert (=> b!697872 (= e!396711 (not (arrayNoDuplicates!0 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)) from!3004 acc!681)))))

(declare-fun b!697873 () Bool)

(declare-fun res!461743 () Bool)

(assert (=> b!697873 (=> (not res!461743) (not e!396711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!697873 (= res!461743 (validKeyInArray!0 k!2843))))

(declare-fun b!697874 () Bool)

(assert (=> b!697874 (= e!396710 (contains!3776 acc!681 k!2843))))

(declare-fun b!697875 () Bool)

(declare-fun res!461749 () Bool)

(assert (=> b!697875 (=> (not res!461749) (not e!396711))))

(assert (=> b!697875 (= res!461749 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19543 a!3626))))))

(declare-fun b!697876 () Bool)

(declare-fun res!461747 () Bool)

(assert (=> b!697876 (=> (not res!461747) (not e!396711))))

(declare-fun arrayContainsKey!0 (array!40000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!697876 (= res!461747 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!697877 () Bool)

(assert (=> b!697877 (= e!396713 e!396712)))

(declare-fun res!461746 () Bool)

(assert (=> b!697877 (=> (not res!461746) (not e!396712))))

(assert (=> b!697877 (= res!461746 (bvsle from!3004 i!1382))))

(declare-fun res!461744 () Bool)

(assert (=> start!62282 (=> (not res!461744) (not e!396711))))

(assert (=> start!62282 (= res!461744 (and (bvslt (size!19543 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19543 a!3626))))))

(assert (=> start!62282 e!396711))

(assert (=> start!62282 true))

(declare-fun array_inv!14954 (array!40000) Bool)

(assert (=> start!62282 (array_inv!14954 a!3626)))

(declare-fun b!697867 () Bool)

(declare-fun res!461751 () Bool)

(assert (=> b!697867 (=> (not res!461751) (not e!396711))))

(assert (=> b!697867 (= res!461751 (not (contains!3776 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62282 res!461744) b!697871))

(assert (= (and b!697871 res!461742) b!697869))

(assert (= (and b!697869 res!461740) b!697867))

(assert (= (and b!697867 res!461751) b!697866))

(assert (= (and b!697866 res!461741) b!697874))

(assert (= (and b!697866 (not res!461745)) b!697877))

(assert (= (and b!697877 res!461746) b!697870))

(assert (= (and b!697866 res!461753) b!697864))

(assert (= (and b!697864 res!461752) b!697868))

(assert (= (and b!697868 res!461748) b!697875))

(assert (= (and b!697875 res!461749) b!697873))

(assert (= (and b!697873 res!461743) b!697876))

(assert (= (and b!697876 res!461747) b!697865))

(assert (= (and b!697865 res!461750) b!697872))

(declare-fun m!658163 () Bool)

(assert (=> b!697868 m!658163))

(declare-fun m!658165 () Bool)

(assert (=> b!697873 m!658165))

(declare-fun m!658167 () Bool)

(assert (=> b!697871 m!658167))

(declare-fun m!658169 () Bool)

(assert (=> b!697870 m!658169))

(declare-fun m!658171 () Bool)

(assert (=> start!62282 m!658171))

(declare-fun m!658173 () Bool)

(assert (=> b!697864 m!658173))

(declare-fun m!658175 () Bool)

(assert (=> b!697872 m!658175))

(declare-fun m!658177 () Bool)

(assert (=> b!697872 m!658177))

(declare-fun m!658179 () Bool)

(assert (=> b!697867 m!658179))

(assert (=> b!697874 m!658169))

(declare-fun m!658181 () Bool)

(assert (=> b!697876 m!658181))

(declare-fun m!658183 () Bool)

(assert (=> b!697869 m!658183))

(push 1)

(assert (not b!697869))

(assert (not b!697872))

(assert (not b!697864))

(assert (not b!697874))

(assert (not b!697876))

(assert (not b!697871))

(assert (not b!697873))

(assert (not start!62282))

(assert (not b!697870))

(assert (not b!697867))

(assert (not b!697868))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96263 () Bool)

(declare-fun lt!317205 () Bool)

(declare-fun content!330 (List!13199) (Set (_ BitVec 64)))

(assert (=> d!96263 (= lt!317205 (set.member k!2843 (content!330 acc!681)))))

(declare-fun e!396799 () Bool)

(assert (=> d!96263 (= lt!317205 e!396799)))

(declare-fun res!461885 () Bool)

(assert (=> d!96263 (=> (not res!461885) (not e!396799))))

(assert (=> d!96263 (= res!461885 (is-Cons!13195 acc!681))))

(assert (=> d!96263 (= (contains!3776 acc!681 k!2843) lt!317205)))

(declare-fun b!698023 () Bool)

(declare-fun e!396800 () Bool)

(assert (=> b!698023 (= e!396799 e!396800)))

(declare-fun res!461886 () Bool)

(assert (=> b!698023 (=> res!461886 e!396800)))

(assert (=> b!698023 (= res!461886 (= (h!14240 acc!681) k!2843))))

(declare-fun b!698024 () Bool)

(assert (=> b!698024 (= e!396800 (contains!3776 (t!19481 acc!681) k!2843))))

(assert (= (and d!96263 res!461885) b!698023))

(assert (= (and b!698023 (not res!461886)) b!698024))

(declare-fun m!658273 () Bool)

(assert (=> d!96263 m!658273))

(declare-fun m!658275 () Bool)

(assert (=> d!96263 m!658275))

(declare-fun m!658277 () Bool)

(assert (=> b!698024 m!658277))

(assert (=> b!697874 d!96263))

(declare-fun d!96265 () Bool)

(assert (=> d!96265 (= (array_inv!14954 a!3626) (bvsge (size!19543 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62282 d!96265))

(declare-fun b!698044 () Bool)

(declare-fun e!396817 () Bool)

(declare-fun e!396820 () Bool)

(assert (=> b!698044 (= e!396817 e!396820)))

(declare-fun c!78439 () Bool)

(assert (=> b!698044 (= c!78439 (validKeyInArray!0 (select (arr!19158 a!3626) from!3004)))))

(declare-fun b!698045 () Bool)

(declare-fun call!34345 () Bool)

(assert (=> b!698045 (= e!396820 call!34345)))

(declare-fun b!698046 () Bool)

(declare-fun e!396818 () Bool)

(assert (=> b!698046 (= e!396818 e!396817)))

(declare-fun res!461902 () Bool)

(assert (=> b!698046 (=> (not res!461902) (not e!396817))))

(declare-fun e!396819 () Bool)

(assert (=> b!698046 (= res!461902 (not e!396819))))

(declare-fun res!461900 () Bool)

(assert (=> b!698046 (=> (not res!461900) (not e!396819))))

(assert (=> b!698046 (= res!461900 (validKeyInArray!0 (select (arr!19158 a!3626) from!3004)))))

(declare-fun d!96267 () Bool)

(declare-fun res!461901 () Bool)

(assert (=> d!96267 (=> res!461901 e!396818)))

(assert (=> d!96267 (= res!461901 (bvsge from!3004 (size!19543 a!3626)))))

(assert (=> d!96267 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!396818)))

(declare-fun b!698047 () Bool)

(assert (=> b!698047 (= e!396820 call!34345)))

(declare-fun b!698048 () Bool)

(assert (=> b!698048 (= e!396819 (contains!3776 acc!681 (select (arr!19158 a!3626) from!3004)))))

(declare-fun bm!34342 () Bool)

(assert (=> bm!34342 (= call!34345 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78439 (Cons!13195 (select (arr!19158 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!96267 (not res!461901)) b!698046))

(assert (= (and b!698046 res!461900) b!698048))

(assert (= (and b!698046 res!461902) b!698044))

(assert (= (and b!698044 c!78439) b!698045))

(assert (= (and b!698044 (not c!78439)) b!698047))

(assert (= (or b!698045 b!698047) bm!34342))

(declare-fun m!658287 () Bool)

(assert (=> b!698044 m!658287))

(assert (=> b!698044 m!658287))

(declare-fun m!658289 () Bool)

(assert (=> b!698044 m!658289))

(assert (=> b!698046 m!658287))

(assert (=> b!698046 m!658287))

(assert (=> b!698046 m!658289))

(assert (=> b!698048 m!658287))

(assert (=> b!698048 m!658287))

(declare-fun m!658291 () Bool)

(assert (=> b!698048 m!658291))

(assert (=> bm!34342 m!658287))

(declare-fun m!658293 () Bool)

(assert (=> bm!34342 m!658293))

(assert (=> b!697868 d!96267))

(declare-fun d!96271 () Bool)

(assert (=> d!96271 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!697873 d!96271))

(assert (=> b!697870 d!96263))

(declare-fun b!698051 () Bool)

(declare-fun e!396823 () Bool)

(declare-fun e!396826 () Bool)

(assert (=> b!698051 (= e!396823 e!396826)))

(declare-fun c!78440 () Bool)

(assert (=> b!698051 (= c!78440 (validKeyInArray!0 (select (arr!19158 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!698052 () Bool)

(declare-fun call!34346 () Bool)

(assert (=> b!698052 (= e!396826 call!34346)))

(declare-fun b!698053 () Bool)

(declare-fun e!396824 () Bool)

(assert (=> b!698053 (= e!396824 e!396823)))

(declare-fun res!461907 () Bool)

(assert (=> b!698053 (=> (not res!461907) (not e!396823))))

(declare-fun e!396825 () Bool)

(assert (=> b!698053 (= res!461907 (not e!396825))))

(declare-fun res!461905 () Bool)

(assert (=> b!698053 (=> (not res!461905) (not e!396825))))

(assert (=> b!698053 (= res!461905 (validKeyInArray!0 (select (arr!19158 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!96273 () Bool)

(declare-fun res!461906 () Bool)

(assert (=> d!96273 (=> res!461906 e!396824)))

(assert (=> d!96273 (= res!461906 (bvsge #b00000000000000000000000000000000 (size!19543 a!3626)))))

(assert (=> d!96273 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13196) e!396824)))

(declare-fun b!698054 () Bool)

(assert (=> b!698054 (= e!396826 call!34346)))

(declare-fun b!698055 () Bool)

(assert (=> b!698055 (= e!396825 (contains!3776 Nil!13196 (select (arr!19158 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34343 () Bool)

(assert (=> bm!34343 (= call!34346 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78440 (Cons!13195 (select (arr!19158 a!3626) #b00000000000000000000000000000000) Nil!13196) Nil!13196)))))

(assert (= (and d!96273 (not res!461906)) b!698053))

(assert (= (and b!698053 res!461905) b!698055))

(assert (= (and b!698053 res!461907) b!698051))

(assert (= (and b!698051 c!78440) b!698052))

(assert (= (and b!698051 (not c!78440)) b!698054))

(assert (= (or b!698052 b!698054) bm!34343))

(declare-fun m!658301 () Bool)

(assert (=> b!698051 m!658301))

(assert (=> b!698051 m!658301))

(declare-fun m!658303 () Bool)

(assert (=> b!698051 m!658303))

(assert (=> b!698053 m!658301))

(assert (=> b!698053 m!658301))

(assert (=> b!698053 m!658303))

(assert (=> b!698055 m!658301))

(assert (=> b!698055 m!658301))

(declare-fun m!658305 () Bool)

(assert (=> b!698055 m!658305))

(assert (=> bm!34343 m!658301))

(declare-fun m!658307 () Bool)

(assert (=> bm!34343 m!658307))

(assert (=> b!697864 d!96273))

(declare-fun d!96277 () Bool)

(declare-fun lt!317209 () Bool)

(assert (=> d!96277 (= lt!317209 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!330 acc!681)))))

(declare-fun e!396831 () Bool)

(assert (=> d!96277 (= lt!317209 e!396831)))

(declare-fun res!461911 () Bool)

(assert (=> d!96277 (=> (not res!461911) (not e!396831))))

(assert (=> d!96277 (= res!461911 (is-Cons!13195 acc!681))))

(assert (=> d!96277 (= (contains!3776 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!317209)))

(declare-fun b!698061 () Bool)

(declare-fun e!396832 () Bool)

(assert (=> b!698061 (= e!396831 e!396832)))

(declare-fun res!461912 () Bool)

(assert (=> b!698061 (=> res!461912 e!396832)))

(assert (=> b!698061 (= res!461912 (= (h!14240 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698062 () Bool)

(assert (=> b!698062 (= e!396832 (contains!3776 (t!19481 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96277 res!461911) b!698061))

(assert (= (and b!698061 (not res!461912)) b!698062))

(assert (=> d!96277 m!658273))

(declare-fun m!658309 () Bool)

(assert (=> d!96277 m!658309))

(declare-fun m!658311 () Bool)

(assert (=> b!698062 m!658311))

(assert (=> b!697869 d!96277))

(declare-fun d!96279 () Bool)

(declare-fun res!461917 () Bool)

(declare-fun e!396837 () Bool)

(assert (=> d!96279 (=> res!461917 e!396837)))

(assert (=> d!96279 (= res!461917 (is-Nil!13196 acc!681))))

(assert (=> d!96279 (= (noDuplicate!1023 acc!681) e!396837)))

(declare-fun b!698067 () Bool)

(declare-fun e!396838 () Bool)

(assert (=> b!698067 (= e!396837 e!396838)))

(declare-fun res!461918 () Bool)

(assert (=> b!698067 (=> (not res!461918) (not e!396838))))

(assert (=> b!698067 (= res!461918 (not (contains!3776 (t!19481 acc!681) (h!14240 acc!681))))))

(declare-fun b!698068 () Bool)

(assert (=> b!698068 (= e!396838 (noDuplicate!1023 (t!19481 acc!681)))))

(assert (= (and d!96279 (not res!461917)) b!698067))

(assert (= (and b!698067 res!461918) b!698068))

(declare-fun m!658321 () Bool)

(assert (=> b!698067 m!658321))

(declare-fun m!658323 () Bool)

(assert (=> b!698068 m!658323))

(assert (=> b!697871 d!96279))

(declare-fun d!96283 () Bool)

(declare-fun res!461929 () Bool)

(declare-fun e!396849 () Bool)

(assert (=> d!96283 (=> res!461929 e!396849)))

(assert (=> d!96283 (= res!461929 (= (select (arr!19158 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!96283 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!396849)))

(declare-fun b!698079 () Bool)

(declare-fun e!396850 () Bool)

(assert (=> b!698079 (= e!396849 e!396850)))

(declare-fun res!461930 () Bool)

(assert (=> b!698079 (=> (not res!461930) (not e!396850))))

(assert (=> b!698079 (= res!461930 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19543 a!3626)))))

(declare-fun b!698080 () Bool)

(assert (=> b!698080 (= e!396850 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96283 (not res!461929)) b!698079))

(assert (= (and b!698079 res!461930) b!698080))

(assert (=> d!96283 m!658301))

(declare-fun m!658329 () Bool)

(assert (=> b!698080 m!658329))

(assert (=> b!697876 d!96283))

(declare-fun d!96287 () Bool)

(declare-fun lt!317210 () Bool)

(assert (=> d!96287 (= lt!317210 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!330 acc!681)))))

(declare-fun e!396855 () Bool)

(assert (=> d!96287 (= lt!317210 e!396855)))

(declare-fun res!461934 () Bool)

(assert (=> d!96287 (=> (not res!461934) (not e!396855))))

(assert (=> d!96287 (= res!461934 (is-Cons!13195 acc!681))))

(assert (=> d!96287 (= (contains!3776 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317210)))

(declare-fun b!698086 () Bool)

(declare-fun e!396856 () Bool)

(assert (=> b!698086 (= e!396855 e!396856)))

(declare-fun res!461935 () Bool)

(assert (=> b!698086 (=> res!461935 e!396856)))

(assert (=> b!698086 (= res!461935 (= (h!14240 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698087 () Bool)

(assert (=> b!698087 (= e!396856 (contains!3776 (t!19481 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96287 res!461934) b!698086))

(assert (= (and b!698086 (not res!461935)) b!698087))

(assert (=> d!96287 m!658273))

(declare-fun m!658331 () Bool)

(assert (=> d!96287 m!658331))

(declare-fun m!658333 () Bool)

(assert (=> b!698087 m!658333))

(assert (=> b!697867 d!96287))

(declare-fun b!698088 () Bool)

(declare-fun e!396857 () Bool)

(declare-fun e!396860 () Bool)

(assert (=> b!698088 (= e!396857 e!396860)))

(declare-fun c!78443 () Bool)

(assert (=> b!698088 (= c!78443 (validKeyInArray!0 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)))))

(declare-fun b!698089 () Bool)

(declare-fun call!34349 () Bool)

(assert (=> b!698089 (= e!396860 call!34349)))

(declare-fun b!698090 () Bool)

(declare-fun e!396858 () Bool)

(assert (=> b!698090 (= e!396858 e!396857)))

(declare-fun res!461938 () Bool)

(assert (=> b!698090 (=> (not res!461938) (not e!396857))))

(declare-fun e!396859 () Bool)

(assert (=> b!698090 (= res!461938 (not e!396859))))

(declare-fun res!461936 () Bool)

(assert (=> b!698090 (=> (not res!461936) (not e!396859))))

(assert (=> b!698090 (= res!461936 (validKeyInArray!0 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)))))

(declare-fun d!96289 () Bool)

(declare-fun res!461937 () Bool)

(assert (=> d!96289 (=> res!461937 e!396858)))

(assert (=> d!96289 (= res!461937 (bvsge from!3004 (size!19543 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)))))))

(assert (=> d!96289 (= (arrayNoDuplicates!0 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)) from!3004 acc!681) e!396858)))

(declare-fun b!698091 () Bool)

(assert (=> b!698091 (= e!396860 call!34349)))

(declare-fun b!698092 () Bool)

(assert (=> b!698092 (= e!396859 (contains!3776 acc!681 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)))))

(declare-fun bm!34346 () Bool)

(assert (=> bm!34346 (= call!34349 (arrayNoDuplicates!0 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)) (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78443 (Cons!13195 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) acc!681) acc!681)))))

(assert (= (and d!96289 (not res!461937)) b!698090))

(assert (= (and b!698090 res!461936) b!698092))

(assert (= (and b!698090 res!461938) b!698088))

(assert (= (and b!698088 c!78443) b!698089))

(assert (= (and b!698088 (not c!78443)) b!698091))

(assert (= (or b!698089 b!698091) bm!34346))

(declare-fun m!658339 () Bool)

(assert (=> b!698088 m!658339))

(assert (=> b!698088 m!658339))

(declare-fun m!658341 () Bool)

(assert (=> b!698088 m!658341))

(assert (=> b!698090 m!658339))

(assert (=> b!698090 m!658339))

(assert (=> b!698090 m!658341))

(assert (=> b!698092 m!658339))

(assert (=> b!698092 m!658339))

(declare-fun m!658345 () Bool)

(assert (=> b!698092 m!658345))

(assert (=> bm!34346 m!658339))

(declare-fun m!658347 () Bool)

(assert (=> bm!34346 m!658347))

(assert (=> b!697872 d!96289))

(push 1)

(assert (not b!698087))

(assert (not b!698046))

(assert (not d!96263))

(assert (not d!96287))

(assert (not b!698090))

(assert (not b!698062))

(assert (not b!698080))

(assert (not b!698068))

(assert (not b!698053))

(assert (not d!96277))

(assert (not b!698044))

(assert (not b!698088))

(assert (not b!698055))

(assert (not b!698024))

(assert (not b!698092))

(assert (not bm!34346))

(assert (not bm!34343))

(assert (not b!698051))

(assert (not b!698067))

(assert (not b!698048))

(assert (not bm!34342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!698142 () Bool)

(declare-fun e!396904 () Bool)

(declare-fun e!396907 () Bool)

(assert (=> b!698142 (= e!396904 e!396907)))

(declare-fun c!78450 () Bool)

(assert (=> b!698142 (= c!78450 (validKeyInArray!0 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) (bvadd from!3004 #b00000000000000000000000000000001))))))

(declare-fun b!698143 () Bool)

(declare-fun call!34353 () Bool)

(assert (=> b!698143 (= e!396907 call!34353)))

(declare-fun b!698144 () Bool)

(declare-fun e!396905 () Bool)

(assert (=> b!698144 (= e!396905 e!396904)))

(declare-fun res!461978 () Bool)

(assert (=> b!698144 (=> (not res!461978) (not e!396904))))

(declare-fun e!396906 () Bool)

(assert (=> b!698144 (= res!461978 (not e!396906))))

(declare-fun res!461976 () Bool)

(assert (=> b!698144 (=> (not res!461976) (not e!396906))))

(assert (=> b!698144 (= res!461976 (validKeyInArray!0 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) (bvadd from!3004 #b00000000000000000000000000000001))))))

(declare-fun d!96333 () Bool)

(declare-fun res!461977 () Bool)

(assert (=> d!96333 (=> res!461977 e!396905)))

(assert (=> d!96333 (= res!461977 (bvsge (bvadd from!3004 #b00000000000000000000000000000001) (size!19543 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)))))))

(assert (=> d!96333 (= (arrayNoDuplicates!0 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)) (bvadd from!3004 #b00000000000000000000000000000001) (ite c!78443 (Cons!13195 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) acc!681) acc!681)) e!396905)))

(declare-fun b!698145 () Bool)

(assert (=> b!698145 (= e!396907 call!34353)))

(declare-fun b!698146 () Bool)

(assert (=> b!698146 (= e!396906 (contains!3776 (ite c!78443 (Cons!13195 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) acc!681) acc!681) (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) (bvadd from!3004 #b00000000000000000000000000000001))))))

(declare-fun bm!34350 () Bool)

(assert (=> bm!34350 (= call!34353 (arrayNoDuplicates!0 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626)) (bvadd from!3004 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!78450 (Cons!13195 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) (bvadd from!3004 #b00000000000000000000000000000001)) (ite c!78443 (Cons!13195 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) acc!681) acc!681)) (ite c!78443 (Cons!13195 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) acc!681) acc!681))))))

(assert (= (and d!96333 (not res!461977)) b!698144))

(assert (= (and b!698144 res!461976) b!698146))

(assert (= (and b!698144 res!461978) b!698142))

(assert (= (and b!698142 c!78450) b!698143))

(assert (= (and b!698142 (not c!78450)) b!698145))

(assert (= (or b!698143 b!698145) bm!34350))

(declare-fun m!658425 () Bool)

(assert (=> b!698142 m!658425))

(assert (=> b!698142 m!658425))

(declare-fun m!658427 () Bool)

(assert (=> b!698142 m!658427))

(assert (=> b!698144 m!658425))

(assert (=> b!698144 m!658425))

(assert (=> b!698144 m!658427))

(assert (=> b!698146 m!658425))

(assert (=> b!698146 m!658425))

(declare-fun m!658429 () Bool)

(assert (=> b!698146 m!658429))

(assert (=> bm!34350 m!658425))

(declare-fun m!658431 () Bool)

(assert (=> bm!34350 m!658431))

(assert (=> bm!34346 d!96333))

(declare-fun lt!317220 () Bool)

(declare-fun d!96335 () Bool)

(assert (=> d!96335 (= lt!317220 (set.member (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) (content!330 acc!681)))))

(declare-fun e!396908 () Bool)

(assert (=> d!96335 (= lt!317220 e!396908)))

(declare-fun res!461979 () Bool)

(assert (=> d!96335 (=> (not res!461979) (not e!396908))))

(assert (=> d!96335 (= res!461979 (is-Cons!13195 acc!681))))

(assert (=> d!96335 (= (contains!3776 acc!681 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)) lt!317220)))

(declare-fun b!698147 () Bool)

(declare-fun e!396909 () Bool)

(assert (=> b!698147 (= e!396908 e!396909)))

(declare-fun res!461980 () Bool)

(assert (=> b!698147 (=> res!461980 e!396909)))

(assert (=> b!698147 (= res!461980 (= (h!14240 acc!681) (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)))))

(declare-fun b!698148 () Bool)

(assert (=> b!698148 (= e!396909 (contains!3776 (t!19481 acc!681) (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)))))

(assert (= (and d!96335 res!461979) b!698147))

(assert (= (and b!698147 (not res!461980)) b!698148))

(assert (=> d!96335 m!658273))

(assert (=> d!96335 m!658339))

(declare-fun m!658433 () Bool)

(assert (=> d!96335 m!658433))

(assert (=> b!698148 m!658339))

(declare-fun m!658435 () Bool)

(assert (=> b!698148 m!658435))

(assert (=> b!698092 d!96335))

(declare-fun b!698149 () Bool)

(declare-fun e!396910 () Bool)

(declare-fun e!396913 () Bool)

(assert (=> b!698149 (= e!396910 e!396913)))

(declare-fun c!78451 () Bool)

(assert (=> b!698149 (= c!78451 (validKeyInArray!0 (select (arr!19158 a!3626) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!698150 () Bool)

(declare-fun call!34354 () Bool)

(assert (=> b!698150 (= e!396913 call!34354)))

(declare-fun b!698151 () Bool)

(declare-fun e!396911 () Bool)

(assert (=> b!698151 (= e!396911 e!396910)))

(declare-fun res!461983 () Bool)

(assert (=> b!698151 (=> (not res!461983) (not e!396910))))

(declare-fun e!396912 () Bool)

(assert (=> b!698151 (= res!461983 (not e!396912))))

(declare-fun res!461981 () Bool)

(assert (=> b!698151 (=> (not res!461981) (not e!396912))))

(assert (=> b!698151 (= res!461981 (validKeyInArray!0 (select (arr!19158 a!3626) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!96337 () Bool)

(declare-fun res!461982 () Bool)

(assert (=> d!96337 (=> res!461982 e!396911)))

(assert (=> d!96337 (= res!461982 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19543 a!3626)))))

(assert (=> d!96337 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78440 (Cons!13195 (select (arr!19158 a!3626) #b00000000000000000000000000000000) Nil!13196) Nil!13196)) e!396911)))

(declare-fun b!698152 () Bool)

(assert (=> b!698152 (= e!396913 call!34354)))

(declare-fun b!698153 () Bool)

(assert (=> b!698153 (= e!396912 (contains!3776 (ite c!78440 (Cons!13195 (select (arr!19158 a!3626) #b00000000000000000000000000000000) Nil!13196) Nil!13196) (select (arr!19158 a!3626) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!34351 () Bool)

(assert (=> bm!34351 (= call!34354 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!78451 (Cons!13195 (select (arr!19158 a!3626) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!78440 (Cons!13195 (select (arr!19158 a!3626) #b00000000000000000000000000000000) Nil!13196) Nil!13196)) (ite c!78440 (Cons!13195 (select (arr!19158 a!3626) #b00000000000000000000000000000000) Nil!13196) Nil!13196))))))

(assert (= (and d!96337 (not res!461982)) b!698151))

(assert (= (and b!698151 res!461981) b!698153))

(assert (= (and b!698151 res!461983) b!698149))

(assert (= (and b!698149 c!78451) b!698150))

(assert (= (and b!698149 (not c!78451)) b!698152))

(assert (= (or b!698150 b!698152) bm!34351))

(declare-fun m!658437 () Bool)

(assert (=> b!698149 m!658437))

(assert (=> b!698149 m!658437))

(declare-fun m!658439 () Bool)

(assert (=> b!698149 m!658439))

(assert (=> b!698151 m!658437))

(assert (=> b!698151 m!658437))

(assert (=> b!698151 m!658439))

(assert (=> b!698153 m!658437))

(assert (=> b!698153 m!658437))

(declare-fun m!658441 () Bool)

(assert (=> b!698153 m!658441))

(assert (=> bm!34351 m!658437))

(declare-fun m!658443 () Bool)

(assert (=> bm!34351 m!658443))

(assert (=> bm!34343 d!96337))

(declare-fun d!96339 () Bool)

(declare-fun lt!317221 () Bool)

(assert (=> d!96339 (= lt!317221 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!330 (t!19481 acc!681))))))

(declare-fun e!396914 () Bool)

(assert (=> d!96339 (= lt!317221 e!396914)))

(declare-fun res!461984 () Bool)

(assert (=> d!96339 (=> (not res!461984) (not e!396914))))

(assert (=> d!96339 (= res!461984 (is-Cons!13195 (t!19481 acc!681)))))

(assert (=> d!96339 (= (contains!3776 (t!19481 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000) lt!317221)))

(declare-fun b!698154 () Bool)

(declare-fun e!396915 () Bool)

(assert (=> b!698154 (= e!396914 e!396915)))

(declare-fun res!461985 () Bool)

(assert (=> b!698154 (=> res!461985 e!396915)))

(assert (=> b!698154 (= res!461985 (= (h!14240 (t!19481 acc!681)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!698155 () Bool)

(assert (=> b!698155 (= e!396915 (contains!3776 (t!19481 (t!19481 acc!681)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96339 res!461984) b!698154))

(assert (= (and b!698154 (not res!461985)) b!698155))

(declare-fun m!658445 () Bool)

(assert (=> d!96339 m!658445))

(declare-fun m!658447 () Bool)

(assert (=> d!96339 m!658447))

(declare-fun m!658449 () Bool)

(assert (=> b!698155 m!658449))

(assert (=> b!698087 d!96339))

(declare-fun d!96341 () Bool)

(declare-fun lt!317222 () Bool)

(assert (=> d!96341 (= lt!317222 (set.member (select (arr!19158 a!3626) #b00000000000000000000000000000000) (content!330 Nil!13196)))))

(declare-fun e!396916 () Bool)

(assert (=> d!96341 (= lt!317222 e!396916)))

(declare-fun res!461986 () Bool)

(assert (=> d!96341 (=> (not res!461986) (not e!396916))))

(assert (=> d!96341 (= res!461986 (is-Cons!13195 Nil!13196))))

(assert (=> d!96341 (= (contains!3776 Nil!13196 (select (arr!19158 a!3626) #b00000000000000000000000000000000)) lt!317222)))

(declare-fun b!698156 () Bool)

(declare-fun e!396917 () Bool)

(assert (=> b!698156 (= e!396916 e!396917)))

(declare-fun res!461987 () Bool)

(assert (=> b!698156 (=> res!461987 e!396917)))

(assert (=> b!698156 (= res!461987 (= (h!14240 Nil!13196) (select (arr!19158 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!698157 () Bool)

(assert (=> b!698157 (= e!396917 (contains!3776 (t!19481 Nil!13196) (select (arr!19158 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!96341 res!461986) b!698156))

(assert (= (and b!698156 (not res!461987)) b!698157))

(declare-fun m!658451 () Bool)

(assert (=> d!96341 m!658451))

(assert (=> d!96341 m!658301))

(declare-fun m!658453 () Bool)

(assert (=> d!96341 m!658453))

(assert (=> b!698157 m!658301))

(declare-fun m!658455 () Bool)

(assert (=> b!698157 m!658455))

(assert (=> b!698055 d!96341))

(declare-fun d!96343 () Bool)

(assert (=> d!96343 (= (validKeyInArray!0 (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004)) (and (not (= (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19158 (array!40001 (store (arr!19158 a!3626) i!1382 k!2843) (size!19543 a!3626))) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!698090 d!96343))

(declare-fun d!96345 () Bool)

(declare-fun c!78454 () Bool)

(assert (=> d!96345 (= c!78454 (is-Nil!13196 acc!681))))

(declare-fun e!396920 () (Set (_ BitVec 64)))

(assert (=> d!96345 (= (content!330 acc!681) e!396920)))

(declare-fun b!698162 () Bool)

(assert (=> b!698162 (= e!396920 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!698163 () Bool)

(assert (=> b!698163 (= e!396920 (set.union (set.insert (h!14240 acc!681) (as set.empty (Set (_ BitVec 64)))) (content!330 (t!19481 acc!681))))))

(assert (= (and d!96345 c!78454) b!698162))

(assert (= (and d!96345 (not c!78454)) b!698163))

(declare-fun m!658457 () Bool)

(assert (=> b!698163 m!658457))

(assert (=> b!698163 m!658445))

(assert (=> d!96263 d!96345))

(declare-fun d!96347 () Bool)

(assert (=> d!96347 (= (validKeyInArray!0 (select (arr!19158 a!3626) #b00000000000000000000000000000000)) (and (not (= (select (arr!19158 a!3626) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19158 a!3626) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!698051 d!96347))

(declare-fun b!698164 () Bool)

(declare-fun e!396921 () Bool)

(declare-fun e!396924 () Bool)

(assert (=> b!698164 (= e!396921 e!396924)))

(declare-fun c!78455 () Bool)

(assert (=> b!698164 (= c!78455 (validKeyInArray!0 (select (arr!19158 a!3626) (bvadd from!3004 #b00000000000000000000000000000001))))))

(declare-fun b!698165 () Bool)

(declare-fun call!34355 () Bool)

(assert (=> b!698165 (= e!396924 call!34355)))

(declare-fun b!698166 () Bool)

(declare-fun e!396922 () Bool)

(assert (=> b!698166 (= e!396922 e!396921)))

(declare-fun res!461990 () Bool)

(assert (=> b!698166 (=> (not res!461990) (not e!396921))))

(declare-fun e!396923 () Bool)

