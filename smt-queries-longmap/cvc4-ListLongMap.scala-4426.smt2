; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61284 () Bool)

(assert start!61284)

(declare-fun b!686765 () Bool)

(declare-fun res!451834 () Bool)

(declare-fun e!391041 () Bool)

(assert (=> b!686765 (=> (not res!451834) (not e!391041))))

(declare-datatypes ((array!39668 0))(
  ( (array!39669 (arr!19010 (Array (_ BitVec 32) (_ BitVec 64))) (size!19384 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39668)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686765 (= res!451834 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!686766 () Bool)

(declare-fun e!391044 () Bool)

(declare-datatypes ((List!13051 0))(
  ( (Nil!13048) (Cons!13047 (h!14092 (_ BitVec 64)) (t!19306 List!13051)) )
))
(declare-fun acc!681 () List!13051)

(declare-fun contains!3628 (List!13051 (_ BitVec 64)) Bool)

(assert (=> b!686766 (= e!391044 (not (contains!3628 acc!681 k!2843)))))

(declare-fun b!686767 () Bool)

(declare-fun res!451835 () Bool)

(assert (=> b!686767 (=> (not res!451835) (not e!391041))))

(declare-fun arrayNoDuplicates!0 (array!39668 (_ BitVec 32) List!13051) Bool)

(assert (=> b!686767 (= res!451835 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13048))))

(declare-fun b!686768 () Bool)

(declare-fun res!451845 () Bool)

(assert (=> b!686768 (=> (not res!451845) (not e!391041))))

(assert (=> b!686768 (= res!451845 (not (contains!3628 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686769 () Bool)

(declare-fun res!451833 () Bool)

(assert (=> b!686769 (=> (not res!451833) (not e!391041))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!686769 (= res!451833 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686770 () Bool)

(declare-datatypes ((Unit!24217 0))(
  ( (Unit!24218) )
))
(declare-fun e!391039 () Unit!24217)

(declare-fun lt!315202 () Unit!24217)

(assert (=> b!686770 (= e!391039 lt!315202)))

(declare-fun lt!315205 () Unit!24217)

(declare-fun lemmaListSubSeqRefl!0 (List!13051) Unit!24217)

(assert (=> b!686770 (= lt!315205 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!214 (List!13051 List!13051) Bool)

(assert (=> b!686770 (subseq!214 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39668 List!13051 List!13051 (_ BitVec 32)) Unit!24217)

(declare-fun $colon$colon!379 (List!13051 (_ BitVec 64)) List!13051)

(assert (=> b!686770 (= lt!315202 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!379 acc!681 (select (arr!19010 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686770 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686771 () Bool)

(declare-fun res!451847 () Bool)

(assert (=> b!686771 (=> (not res!451847) (not e!391041))))

(declare-fun e!391043 () Bool)

(assert (=> b!686771 (= res!451847 e!391043)))

(declare-fun res!451838 () Bool)

(assert (=> b!686771 (=> res!451838 e!391043)))

(declare-fun e!391038 () Bool)

(assert (=> b!686771 (= res!451838 e!391038)))

(declare-fun res!451836 () Bool)

(assert (=> b!686771 (=> (not res!451836) (not e!391038))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686771 (= res!451836 (bvsgt from!3004 i!1382))))

(declare-fun b!686772 () Bool)

(declare-fun res!451843 () Bool)

(assert (=> b!686772 (=> (not res!451843) (not e!391041))))

(declare-fun noDuplicate!875 (List!13051) Bool)

(assert (=> b!686772 (= res!451843 (noDuplicate!875 acc!681))))

(declare-fun b!686773 () Bool)

(assert (=> b!686773 (= e!391043 e!391044)))

(declare-fun res!451846 () Bool)

(assert (=> b!686773 (=> (not res!451846) (not e!391044))))

(assert (=> b!686773 (= res!451846 (bvsle from!3004 i!1382))))

(declare-fun b!686774 () Bool)

(declare-fun e!391042 () Unit!24217)

(declare-fun Unit!24219 () Unit!24217)

(assert (=> b!686774 (= e!391042 Unit!24219)))

(declare-fun b!686775 () Bool)

(declare-fun res!451841 () Bool)

(assert (=> b!686775 (=> (not res!451841) (not e!391041))))

(assert (=> b!686775 (= res!451841 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19384 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686776 () Bool)

(declare-fun res!451837 () Bool)

(assert (=> b!686776 (=> (not res!451837) (not e!391041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686776 (= res!451837 (validKeyInArray!0 k!2843))))

(declare-fun b!686777 () Bool)

(declare-fun Unit!24220 () Unit!24217)

(assert (=> b!686777 (= e!391042 Unit!24220)))

(declare-fun lt!315198 () Unit!24217)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39668 (_ BitVec 64) (_ BitVec 32)) Unit!24217)

(assert (=> b!686777 (= lt!315198 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!686777 false))

(declare-fun res!451842 () Bool)

(assert (=> start!61284 (=> (not res!451842) (not e!391041))))

(assert (=> start!61284 (= res!451842 (and (bvslt (size!19384 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19384 a!3626))))))

(assert (=> start!61284 e!391041))

(assert (=> start!61284 true))

(declare-fun array_inv!14806 (array!39668) Bool)

(assert (=> start!61284 (array_inv!14806 a!3626)))

(declare-fun b!686778 () Bool)

(declare-fun res!451844 () Bool)

(assert (=> b!686778 (=> (not res!451844) (not e!391041))))

(assert (=> b!686778 (= res!451844 (not (contains!3628 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686779 () Bool)

(declare-fun Unit!24221 () Unit!24217)

(assert (=> b!686779 (= e!391039 Unit!24221)))

(declare-fun b!686780 () Bool)

(assert (=> b!686780 (= e!391038 (contains!3628 acc!681 k!2843))))

(declare-fun b!686781 () Bool)

(declare-fun res!451840 () Bool)

(assert (=> b!686781 (=> (not res!451840) (not e!391041))))

(assert (=> b!686781 (= res!451840 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19384 a!3626))))))

(declare-fun b!686782 () Bool)

(declare-fun e!391037 () Bool)

(declare-fun lt!315203 () List!13051)

(assert (=> b!686782 (= e!391037 (noDuplicate!875 lt!315203))))

(declare-fun b!686783 () Bool)

(assert (=> b!686783 (= e!391041 (not e!391037))))

(declare-fun res!451839 () Bool)

(assert (=> b!686783 (=> res!451839 e!391037)))

(assert (=> b!686783 (= res!451839 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!686783 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315203)))

(declare-fun lt!315204 () Unit!24217)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39668 (_ BitVec 64) (_ BitVec 32) List!13051 List!13051) Unit!24217)

(assert (=> b!686783 (= lt!315204 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315203))))

(declare-fun -!179 (List!13051 (_ BitVec 64)) List!13051)

(assert (=> b!686783 (= (-!179 lt!315203 k!2843) acc!681)))

(assert (=> b!686783 (= lt!315203 ($colon$colon!379 acc!681 k!2843))))

(declare-fun lt!315201 () Unit!24217)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13051) Unit!24217)

(assert (=> b!686783 (= lt!315201 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!686783 (subseq!214 acc!681 acc!681)))

(declare-fun lt!315197 () Unit!24217)

(assert (=> b!686783 (= lt!315197 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686783 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315199 () Unit!24217)

(assert (=> b!686783 (= lt!315199 e!391039)))

(declare-fun c!77833 () Bool)

(assert (=> b!686783 (= c!77833 (validKeyInArray!0 (select (arr!19010 a!3626) from!3004)))))

(declare-fun lt!315200 () Unit!24217)

(assert (=> b!686783 (= lt!315200 e!391042)))

(declare-fun c!77834 () Bool)

(assert (=> b!686783 (= c!77834 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686783 (arrayContainsKey!0 (array!39669 (store (arr!19010 a!3626) i!1382 k!2843) (size!19384 a!3626)) k!2843 from!3004)))

(assert (= (and start!61284 res!451842) b!686772))

(assert (= (and b!686772 res!451843) b!686778))

(assert (= (and b!686778 res!451844) b!686768))

(assert (= (and b!686768 res!451845) b!686771))

(assert (= (and b!686771 res!451836) b!686780))

(assert (= (and b!686771 (not res!451838)) b!686773))

(assert (= (and b!686773 res!451846) b!686766))

(assert (= (and b!686771 res!451847) b!686767))

(assert (= (and b!686767 res!451835) b!686769))

(assert (= (and b!686769 res!451833) b!686781))

(assert (= (and b!686781 res!451840) b!686776))

(assert (= (and b!686776 res!451837) b!686765))

(assert (= (and b!686765 res!451834) b!686775))

(assert (= (and b!686775 res!451841) b!686783))

(assert (= (and b!686783 c!77834) b!686777))

(assert (= (and b!686783 (not c!77834)) b!686774))

(assert (= (and b!686783 c!77833) b!686770))

(assert (= (and b!686783 (not c!77833)) b!686779))

(assert (= (and b!686783 (not res!451839)) b!686782))

(declare-fun m!650833 () Bool)

(assert (=> b!686768 m!650833))

(declare-fun m!650835 () Bool)

(assert (=> b!686780 m!650835))

(declare-fun m!650837 () Bool)

(assert (=> b!686778 m!650837))

(declare-fun m!650839 () Bool)

(assert (=> b!686770 m!650839))

(declare-fun m!650841 () Bool)

(assert (=> b!686770 m!650841))

(declare-fun m!650843 () Bool)

(assert (=> b!686770 m!650843))

(declare-fun m!650845 () Bool)

(assert (=> b!686770 m!650845))

(assert (=> b!686770 m!650841))

(assert (=> b!686770 m!650843))

(declare-fun m!650847 () Bool)

(assert (=> b!686770 m!650847))

(declare-fun m!650849 () Bool)

(assert (=> b!686770 m!650849))

(declare-fun m!650851 () Bool)

(assert (=> b!686767 m!650851))

(declare-fun m!650853 () Bool)

(assert (=> b!686783 m!650853))

(assert (=> b!686783 m!650839))

(assert (=> b!686783 m!650841))

(declare-fun m!650855 () Bool)

(assert (=> b!686783 m!650855))

(declare-fun m!650857 () Bool)

(assert (=> b!686783 m!650857))

(declare-fun m!650859 () Bool)

(assert (=> b!686783 m!650859))

(assert (=> b!686783 m!650847))

(declare-fun m!650861 () Bool)

(assert (=> b!686783 m!650861))

(declare-fun m!650863 () Bool)

(assert (=> b!686783 m!650863))

(declare-fun m!650865 () Bool)

(assert (=> b!686783 m!650865))

(assert (=> b!686783 m!650841))

(declare-fun m!650867 () Bool)

(assert (=> b!686783 m!650867))

(declare-fun m!650869 () Bool)

(assert (=> b!686783 m!650869))

(assert (=> b!686783 m!650849))

(declare-fun m!650871 () Bool)

(assert (=> b!686769 m!650871))

(declare-fun m!650873 () Bool)

(assert (=> b!686782 m!650873))

(declare-fun m!650875 () Bool)

(assert (=> b!686777 m!650875))

(declare-fun m!650877 () Bool)

(assert (=> b!686776 m!650877))

(declare-fun m!650879 () Bool)

(assert (=> start!61284 m!650879))

(declare-fun m!650881 () Bool)

(assert (=> b!686772 m!650881))

(declare-fun m!650883 () Bool)

(assert (=> b!686765 m!650883))

(assert (=> b!686766 m!650835))

(push 1)

(assert (not b!686766))

(assert (not b!686783))

(assert (not b!686778))

(assert (not b!686770))

(assert (not b!686780))

(assert (not b!686769))

(assert (not b!686777))

(assert (not b!686765))

(assert (not start!61284))

(assert (not b!686768))

(assert (not b!686782))

(assert (not b!686767))

(assert (not b!686776))

(assert (not b!686772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94777 () Bool)

(declare-fun res!451873 () Bool)

(declare-fun e!391077 () Bool)

(assert (=> d!94777 (=> res!451873 e!391077)))

(assert (=> d!94777 (= res!451873 (= (select (arr!19010 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94777 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!391077)))

(declare-fun b!686823 () Bool)

(declare-fun e!391078 () Bool)

(assert (=> b!686823 (= e!391077 e!391078)))

(declare-fun res!451874 () Bool)

(assert (=> b!686823 (=> (not res!451874) (not e!391078))))

(assert (=> b!686823 (= res!451874 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19384 a!3626)))))

(declare-fun b!686824 () Bool)

(assert (=> b!686824 (= e!391078 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94777 (not res!451873)) b!686823))

(assert (= (and b!686823 res!451874) b!686824))

(declare-fun m!650905 () Bool)

(assert (=> d!94777 m!650905))

(declare-fun m!650907 () Bool)

(assert (=> b!686824 m!650907))

(assert (=> b!686765 d!94777))

(declare-fun d!94785 () Bool)

(assert (=> d!94785 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686776 d!94785))

(declare-fun d!94789 () Bool)

(assert (=> d!94789 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315211 () Unit!24217)

(declare-fun choose!13 (array!39668 (_ BitVec 64) (_ BitVec 32)) Unit!24217)

(assert (=> d!94789 (= lt!315211 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94789 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94789 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!315211)))

(declare-fun bs!20131 () Bool)

(assert (= bs!20131 d!94789))

(assert (=> bs!20131 m!650883))

(declare-fun m!650923 () Bool)

(assert (=> bs!20131 m!650923))

(assert (=> b!686777 d!94789))

(declare-fun d!94795 () Bool)

(declare-fun lt!315216 () Bool)

(declare-fun content!295 (List!13051) (Set (_ BitVec 64)))

(assert (=> d!94795 (= lt!315216 (member k!2843 (content!295 acc!681)))))

(declare-fun e!391109 () Bool)

(assert (=> d!94795 (= lt!315216 e!391109)))

(declare-fun res!451898 () Bool)

(assert (=> d!94795 (=> (not res!451898) (not e!391109))))

(assert (=> d!94795 (= res!451898 (is-Cons!13047 acc!681))))

(assert (=> d!94795 (= (contains!3628 acc!681 k!2843) lt!315216)))

(declare-fun b!686858 () Bool)

(declare-fun e!391108 () Bool)

(assert (=> b!686858 (= e!391109 e!391108)))

(declare-fun res!451899 () Bool)

(assert (=> b!686858 (=> res!451899 e!391108)))

(assert (=> b!686858 (= res!451899 (= (h!14092 acc!681) k!2843))))

(declare-fun b!686859 () Bool)

(assert (=> b!686859 (= e!391108 (contains!3628 (t!19306 acc!681) k!2843))))

(assert (= (and d!94795 res!451898) b!686858))

(assert (= (and b!686858 (not res!451899)) b!686859))

(declare-fun m!650929 () Bool)

(assert (=> d!94795 m!650929))

(declare-fun m!650931 () Bool)

(assert (=> d!94795 m!650931))

(declare-fun m!650933 () Bool)

(assert (=> b!686859 m!650933))

(assert (=> b!686766 d!94795))

(declare-fun b!686879 () Bool)

(declare-fun e!391129 () Bool)

(declare-fun e!391127 () Bool)

(assert (=> b!686879 (= e!391129 e!391127)))

(declare-fun res!451917 () Bool)

(assert (=> b!686879 (=> (not res!451917) (not e!391127))))

(assert (=> b!686879 (= res!451917 (is-Cons!13047 acc!681))))

(declare-fun b!686880 () Bool)

(declare-fun e!391128 () Bool)

(assert (=> b!686880 (= e!391127 e!391128)))

(declare-fun res!451918 () Bool)

(assert (=> b!686880 (=> res!451918 e!391128)))

(declare-fun e!391130 () Bool)

(assert (=> b!686880 (= res!451918 e!391130)))

(declare-fun res!451916 () Bool)

(assert (=> b!686880 (=> (not res!451916) (not e!391130))))

(assert (=> b!686880 (= res!451916 (= (h!14092 acc!681) (h!14092 acc!681)))))

(declare-fun d!94799 () Bool)

(declare-fun res!451915 () Bool)

(assert (=> d!94799 (=> res!451915 e!391129)))

(assert (=> d!94799 (= res!451915 (is-Nil!13048 acc!681))))

(assert (=> d!94799 (= (subseq!214 acc!681 acc!681) e!391129)))

(declare-fun b!686882 () Bool)

(assert (=> b!686882 (= e!391128 (subseq!214 acc!681 (t!19306 acc!681)))))

(declare-fun b!686881 () Bool)

(assert (=> b!686881 (= e!391130 (subseq!214 (t!19306 acc!681) (t!19306 acc!681)))))

(assert (= (and d!94799 (not res!451915)) b!686879))

(assert (= (and b!686879 res!451917) b!686880))

(assert (= (and b!686880 res!451916) b!686881))

(assert (= (and b!686880 (not res!451918)) b!686882))

(declare-fun m!650957 () Bool)

(assert (=> b!686882 m!650957))

(declare-fun m!650959 () Bool)

(assert (=> b!686881 m!650959))

(assert (=> b!686783 d!94799))

(declare-fun b!686921 () Bool)

(declare-fun e!391165 () List!13051)

(declare-fun call!34116 () List!13051)

(assert (=> b!686921 (= e!391165 (Cons!13047 (h!14092 lt!315203) call!34116))))

(declare-fun b!686922 () Bool)

(declare-fun e!391164 () List!13051)

(assert (=> b!686922 (= e!391164 Nil!13048)))

(declare-fun b!686923 () Bool)

(declare-fun e!391163 () Bool)

(declare-fun lt!315225 () List!13051)

(assert (=> b!686923 (= e!391163 (= (content!295 lt!315225) (setminus (content!295 lt!315203) (insert k!2843 (as emptyset (Set (_ BitVec 64)))))))))

(declare-fun b!686924 () Bool)

(assert (=> b!686924 (= e!391164 e!391165)))

(declare-fun c!77857 () Bool)

(assert (=> b!686924 (= c!77857 (= k!2843 (h!14092 lt!315203)))))

(declare-fun b!686925 () Bool)

(assert (=> b!686925 (= e!391165 call!34116)))

(declare-fun bm!34113 () Bool)

(assert (=> bm!34113 (= call!34116 (-!179 (t!19306 lt!315203) k!2843))))

(declare-fun d!94809 () Bool)

(assert (=> d!94809 e!391163))

(declare-fun res!451941 () Bool)

(assert (=> d!94809 (=> (not res!451941) (not e!391163))))

(declare-fun size!19386 (List!13051) Int)

(assert (=> d!94809 (= res!451941 (<= (size!19386 lt!315225) (size!19386 lt!315203)))))

(assert (=> d!94809 (= lt!315225 e!391164)))

(declare-fun c!77858 () Bool)

(assert (=> d!94809 (= c!77858 (is-Cons!13047 lt!315203))))

(assert (=> d!94809 (= (-!179 lt!315203 k!2843) lt!315225)))

(assert (= (and d!94809 c!77858) b!686924))

(assert (= (and d!94809 (not c!77858)) b!686922))

(assert (= (and b!686924 c!77857) b!686925))

(assert (= (and b!686924 (not c!77857)) b!686921))

(assert (= (or b!686925 b!686921) bm!34113))

(assert (= (and d!94809 res!451941) b!686923))

(declare-fun m!650967 () Bool)

(assert (=> b!686923 m!650967))

(declare-fun m!650969 () Bool)

(assert (=> b!686923 m!650969))

(declare-fun m!650971 () Bool)

(assert (=> b!686923 m!650971))

(declare-fun m!650973 () Bool)

(assert (=> bm!34113 m!650973))

(declare-fun m!650975 () Bool)

(assert (=> d!94809 m!650975))

(declare-fun m!650977 () Bool)

(assert (=> d!94809 m!650977))

(assert (=> b!686783 d!94809))

(declare-fun d!94815 () Bool)

(declare-fun res!451942 () Bool)

(declare-fun e!391166 () Bool)

(assert (=> d!94815 (=> res!451942 e!391166)))

(assert (=> d!94815 (= res!451942 (= (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94815 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391166)))

(declare-fun b!686926 () Bool)

(declare-fun e!391167 () Bool)

(assert (=> b!686926 (= e!391166 e!391167)))

(declare-fun res!451943 () Bool)

(assert (=> b!686926 (=> (not res!451943) (not e!391167))))

(assert (=> b!686926 (= res!451943 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19384 a!3626)))))

(declare-fun b!686927 () Bool)

(assert (=> b!686927 (= e!391167 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94815 (not res!451942)) b!686926))

(assert (= (and b!686926 res!451943) b!686927))

(declare-fun m!650979 () Bool)

(assert (=> d!94815 m!650979))

(declare-fun m!650981 () Bool)

(assert (=> b!686927 m!650981))

(assert (=> b!686783 d!94815))

(declare-fun d!94817 () Bool)

(assert (=> d!94817 (= (-!179 ($colon$colon!379 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!315232 () Unit!24217)

(declare-fun choose!16 ((_ BitVec 64) List!13051) Unit!24217)

(assert (=> d!94817 (= lt!315232 (choose!16 k!2843 acc!681))))

(assert (=> d!94817 (not (contains!3628 acc!681 k!2843))))

(assert (=> d!94817 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!315232)))

(declare-fun bs!20134 () Bool)

(assert (= bs!20134 d!94817))

(assert (=> bs!20134 m!650863))

(assert (=> bs!20134 m!650863))

(declare-fun m!651007 () Bool)

(assert (=> bs!20134 m!651007))

(declare-fun m!651009 () Bool)

(assert (=> bs!20134 m!651009))

(assert (=> bs!20134 m!650835))

(assert (=> b!686783 d!94817))

(declare-fun b!686971 () Bool)

(declare-fun e!391205 () Bool)

(declare-fun e!391208 () Bool)

(assert (=> b!686971 (= e!391205 e!391208)))

(declare-fun c!77865 () Bool)

(assert (=> b!686971 (= c!77865 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686972 () Bool)

(declare-fun e!391206 () Bool)

(assert (=> b!686972 (= e!391206 (contains!3628 lt!315203 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686973 () Bool)

(declare-fun call!34122 () Bool)

(assert (=> b!686973 (= e!391208 call!34122)))

(declare-fun b!686974 () Bool)

(assert (=> b!686974 (= e!391208 call!34122)))

(declare-fun b!686975 () Bool)

(declare-fun e!391207 () Bool)

(assert (=> b!686975 (= e!391207 e!391205)))

(declare-fun res!451975 () Bool)

(assert (=> b!686975 (=> (not res!451975) (not e!391205))))

(assert (=> b!686975 (= res!451975 (not e!391206))))

(declare-fun res!451976 () Bool)

(assert (=> b!686975 (=> (not res!451976) (not e!391206))))

(assert (=> b!686975 (= res!451976 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34119 () Bool)

(assert (=> bm!34119 (= call!34122 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77865 (Cons!13047 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315203) lt!315203)))))

(declare-fun d!94827 () Bool)

(declare-fun res!451977 () Bool)

(assert (=> d!94827 (=> res!451977 e!391207)))

(assert (=> d!94827 (= res!451977 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19384 a!3626)))))

(assert (=> d!94827 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315203) e!391207)))

(assert (= (and d!94827 (not res!451977)) b!686975))

(assert (= (and b!686975 res!451976) b!686972))

(assert (= (and b!686975 res!451975) b!686971))

(assert (= (and b!686971 c!77865) b!686974))

(assert (= (and b!686971 (not c!77865)) b!686973))

(assert (= (or b!686974 b!686973) bm!34119))

(assert (=> b!686971 m!650979))

(assert (=> b!686971 m!650979))

(declare-fun m!651033 () Bool)

(assert (=> b!686971 m!651033))

(assert (=> b!686972 m!650979))

(assert (=> b!686972 m!650979))

(declare-fun m!651035 () Bool)

(assert (=> b!686972 m!651035))

(assert (=> b!686975 m!650979))

(assert (=> b!686975 m!650979))

(assert (=> b!686975 m!651033))

(assert (=> bm!34119 m!650979))

(declare-fun m!651037 () Bool)

(assert (=> bm!34119 m!651037))

(assert (=> b!686783 d!94827))

(declare-fun d!94845 () Bool)

(declare-fun res!451978 () Bool)

(declare-fun e!391209 () Bool)

(assert (=> d!94845 (=> res!451978 e!391209)))

(assert (=> d!94845 (= res!451978 (= (select (arr!19010 (array!39669 (store (arr!19010 a!3626) i!1382 k!2843) (size!19384 a!3626))) from!3004) k!2843))))

(assert (=> d!94845 (= (arrayContainsKey!0 (array!39669 (store (arr!19010 a!3626) i!1382 k!2843) (size!19384 a!3626)) k!2843 from!3004) e!391209)))

(declare-fun b!686976 () Bool)

(declare-fun e!391210 () Bool)

(assert (=> b!686976 (= e!391209 e!391210)))

(declare-fun res!451979 () Bool)

(assert (=> b!686976 (=> (not res!451979) (not e!391210))))

(assert (=> b!686976 (= res!451979 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19384 (array!39669 (store (arr!19010 a!3626) i!1382 k!2843) (size!19384 a!3626)))))))

(declare-fun b!686977 () Bool)

(assert (=> b!686977 (= e!391210 (arrayContainsKey!0 (array!39669 (store (arr!19010 a!3626) i!1382 k!2843) (size!19384 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94845 (not res!451978)) b!686976))

(assert (= (and b!686976 res!451979) b!686977))

(declare-fun m!651041 () Bool)

(assert (=> d!94845 m!651041))

(declare-fun m!651043 () Bool)

(assert (=> b!686977 m!651043))

(assert (=> b!686783 d!94845))

(declare-fun d!94849 () Bool)

(assert (=> d!94849 (subseq!214 acc!681 acc!681)))

(declare-fun lt!315249 () Unit!24217)

(declare-fun choose!36 (List!13051) Unit!24217)

(assert (=> d!94849 (= lt!315249 (choose!36 acc!681))))

(assert (=> d!94849 (= (lemmaListSubSeqRefl!0 acc!681) lt!315249)))

(declare-fun bs!20139 () Bool)

(assert (= bs!20139 d!94849))

(assert (=> bs!20139 m!650849))

(declare-fun m!651051 () Bool)

(assert (=> bs!20139 m!651051))

(assert (=> b!686783 d!94849))

(declare-fun d!94861 () Bool)

(assert (=> d!94861 (= (validKeyInArray!0 (select (arr!19010 a!3626) from!3004)) (and (not (= (select (arr!19010 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19010 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!686783 d!94861))

(declare-fun d!94863 () Bool)

(assert (=> d!94863 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315203)))

(declare-fun lt!315255 () Unit!24217)

(declare-fun choose!66 (array!39668 (_ BitVec 64) (_ BitVec 32) List!13051 List!13051) Unit!24217)

(assert (=> d!94863 (= lt!315255 (choose!66 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315203))))

(assert (=> d!94863 (bvslt (size!19384 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94863 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315203) lt!315255)))

(declare-fun bs!20141 () Bool)

(assert (= bs!20141 d!94863))

(assert (=> bs!20141 m!650857))

(declare-fun m!651059 () Bool)

(assert (=> bs!20141 m!651059))

(assert (=> b!686783 d!94863))

(declare-fun d!94869 () Bool)

(assert (=> d!94869 (= ($colon$colon!379 acc!681 k!2843) (Cons!13047 k!2843 acc!681))))

(assert (=> b!686783 d!94869))

(declare-fun b!686989 () Bool)

(declare-fun e!391221 () Bool)

(declare-fun e!391224 () Bool)

(assert (=> b!686989 (= e!391221 e!391224)))

(declare-fun c!77867 () Bool)

(assert (=> b!686989 (= c!77867 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686990 () Bool)

(declare-fun e!391222 () Bool)

(assert (=> b!686990 (= e!391222 (contains!3628 acc!681 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!686991 () Bool)

(declare-fun call!34124 () Bool)

(assert (=> b!686991 (= e!391224 call!34124)))

(declare-fun b!686992 () Bool)

(assert (=> b!686992 (= e!391224 call!34124)))

(declare-fun b!686993 () Bool)

(declare-fun e!391223 () Bool)

(assert (=> b!686993 (= e!391223 e!391221)))

(declare-fun res!451989 () Bool)

(assert (=> b!686993 (=> (not res!451989) (not e!391221))))

(assert (=> b!686993 (= res!451989 (not e!391222))))

(declare-fun res!451990 () Bool)

(assert (=> b!686993 (=> (not res!451990) (not e!391222))))

(assert (=> b!686993 (= res!451990 (validKeyInArray!0 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34121 () Bool)

(assert (=> bm!34121 (= call!34124 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77867 (Cons!13047 (select (arr!19010 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun d!94871 () Bool)

(declare-fun res!451991 () Bool)

(assert (=> d!94871 (=> res!451991 e!391223)))

(assert (=> d!94871 (= res!451991 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19384 a!3626)))))

(assert (=> d!94871 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391223)))

(assert (= (and d!94871 (not res!451991)) b!686993))

(assert (= (and b!686993 res!451990) b!686990))

(assert (= (and b!686993 res!451989) b!686989))

(assert (= (and b!686989 c!77867) b!686992))

(assert (= (and b!686989 (not c!77867)) b!686991))

(assert (= (or b!686992 b!686991) bm!34121))

(assert (=> b!686989 m!650979))

(assert (=> b!686989 m!650979))

(assert (=> b!686989 m!651033))

(assert (=> b!686990 m!650979))

(assert (=> b!686990 m!650979))

(declare-fun m!651067 () Bool)

(assert (=> b!686990 m!651067))

(assert (=> b!686993 m!650979))

(assert (=> b!686993 m!650979))

(assert (=> b!686993 m!651033))

(assert (=> bm!34121 m!650979))

(declare-fun m!651069 () Bool)

(assert (=> bm!34121 m!651069))

(assert (=> b!686783 d!94871))

(declare-fun d!94877 () Bool)

(declare-fun res!452005 () Bool)

(declare-fun e!391239 () Bool)

(assert (=> d!94877 (=> res!452005 e!391239)))

(assert (=> d!94877 (= res!452005 (is-Nil!13048 acc!681))))

(assert (=> d!94877 (= (noDuplicate!875 acc!681) e!391239)))

(declare-fun b!687009 () Bool)

(declare-fun e!391240 () Bool)

(assert (=> b!687009 (= e!391239 e!391240)))

(declare-fun res!452006 () Bool)

(assert (=> b!687009 (=> (not res!452006) (not e!391240))))

(assert (=> b!687009 (= res!452006 (not (contains!3628 (t!19306 acc!681) (h!14092 acc!681))))))

(declare-fun b!687010 () Bool)

(assert (=> b!687010 (= e!391240 (noDuplicate!875 (t!19306 acc!681)))))

(assert (= (and d!94877 (not res!452005)) b!687009))

(assert (= (and b!687009 res!452006) b!687010))

(declare-fun m!651081 () Bool)

(assert (=> b!687009 m!651081))

(declare-fun m!651083 () Bool)

(assert (=> b!687010 m!651083))

(assert (=> b!686772 d!94877))

(declare-fun d!94883 () Bool)

(assert (=> d!94883 (= (array_inv!14806 a!3626) (bvsge (size!19384 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61284 d!94883))

(assert (=> b!686780 d!94795))

(declare-fun d!94885 () Bool)

(assert (=> d!94885 (= ($colon$colon!379 acc!681 (select (arr!19010 a!3626) from!3004)) (Cons!13047 (select (arr!19010 a!3626) from!3004) acc!681))))

(assert (=> b!686770 d!94885))

(assert (=> b!686770 d!94799))

(declare-fun d!94887 () Bool)

(assert (=> d!94887 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

