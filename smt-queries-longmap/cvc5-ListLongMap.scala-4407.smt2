; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60788 () Bool)

(assert start!60788)

(declare-fun b!682056 () Bool)

(declare-datatypes ((Unit!23922 0))(
  ( (Unit!23923) )
))
(declare-fun e!388623 () Unit!23922)

(declare-fun lt!313420 () Unit!23922)

(assert (=> b!682056 (= e!388623 lt!313420)))

(declare-fun lt!313423 () Unit!23922)

(declare-datatypes ((List!12992 0))(
  ( (Nil!12989) (Cons!12988 (h!14033 (_ BitVec 64)) (t!19232 List!12992)) )
))
(declare-fun acc!681 () List!12992)

(declare-fun lemmaListSubSeqRefl!0 (List!12992) Unit!23922)

(assert (=> b!682056 (= lt!313423 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!155 (List!12992 List!12992) Bool)

(assert (=> b!682056 (subseq!155 acc!681 acc!681)))

(declare-datatypes ((array!39535 0))(
  ( (array!39536 (arr!18951 (Array (_ BitVec 32) (_ BitVec 64))) (size!19315 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39535)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39535 List!12992 List!12992 (_ BitVec 32)) Unit!23922)

(declare-fun $colon$colon!320 (List!12992 (_ BitVec 64)) List!12992)

(assert (=> b!682056 (= lt!313420 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!320 acc!681 (select (arr!18951 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39535 (_ BitVec 32) List!12992) Bool)

(assert (=> b!682056 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682057 () Bool)

(declare-fun res!448129 () Bool)

(declare-fun e!388619 () Bool)

(assert (=> b!682057 (=> (not res!448129) (not e!388619))))

(assert (=> b!682057 (= res!448129 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682058 () Bool)

(declare-fun e!388617 () Unit!23922)

(declare-fun Unit!23924 () Unit!23922)

(assert (=> b!682058 (= e!388617 Unit!23924)))

(declare-fun b!682059 () Bool)

(declare-fun res!448138 () Bool)

(assert (=> b!682059 (=> (not res!448138) (not e!388619))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!682059 (= res!448138 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19315 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682060 () Bool)

(declare-fun e!388622 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3569 (List!12992 (_ BitVec 64)) Bool)

(assert (=> b!682060 (= e!388622 (contains!3569 acc!681 k!2843))))

(declare-fun b!682061 () Bool)

(declare-fun Unit!23925 () Unit!23922)

(assert (=> b!682061 (= e!388623 Unit!23925)))

(declare-fun b!682062 () Bool)

(declare-fun res!448137 () Bool)

(assert (=> b!682062 (=> (not res!448137) (not e!388619))))

(assert (=> b!682062 (= res!448137 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19315 a!3626))))))

(declare-fun b!682063 () Bool)

(declare-fun res!448133 () Bool)

(assert (=> b!682063 (=> (not res!448133) (not e!388619))))

(assert (=> b!682063 (= res!448133 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12989))))

(declare-fun b!682064 () Bool)

(declare-fun res!448132 () Bool)

(assert (=> b!682064 (=> (not res!448132) (not e!388619))))

(assert (=> b!682064 (= res!448132 (not (contains!3569 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682065 () Bool)

(declare-fun res!448126 () Bool)

(assert (=> b!682065 (=> (not res!448126) (not e!388619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682065 (= res!448126 (validKeyInArray!0 k!2843))))

(declare-fun b!682066 () Bool)

(declare-fun res!448135 () Bool)

(assert (=> b!682066 (=> (not res!448135) (not e!388619))))

(declare-fun noDuplicate!816 (List!12992) Bool)

(assert (=> b!682066 (= res!448135 (noDuplicate!816 acc!681))))

(declare-fun b!682067 () Bool)

(declare-fun res!448128 () Bool)

(assert (=> b!682067 (=> (not res!448128) (not e!388619))))

(declare-fun arrayContainsKey!0 (array!39535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682067 (= res!448128 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682068 () Bool)

(declare-fun e!388621 () Bool)

(declare-fun e!388618 () Bool)

(assert (=> b!682068 (= e!388621 e!388618)))

(declare-fun res!448136 () Bool)

(assert (=> b!682068 (=> (not res!448136) (not e!388618))))

(assert (=> b!682068 (= res!448136 (bvsle from!3004 i!1382))))

(declare-fun b!682069 () Bool)

(declare-fun Unit!23926 () Unit!23922)

(assert (=> b!682069 (= e!388617 Unit!23926)))

(declare-fun lt!313419 () Unit!23922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39535 (_ BitVec 64) (_ BitVec 32)) Unit!23922)

(assert (=> b!682069 (= lt!313419 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682069 false))

(declare-fun b!682070 () Bool)

(assert (=> b!682070 (= e!388619 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun lt!313422 () Unit!23922)

(assert (=> b!682070 (= lt!313422 e!388623)))

(declare-fun c!77332 () Bool)

(assert (=> b!682070 (= c!77332 (validKeyInArray!0 (select (arr!18951 a!3626) from!3004)))))

(declare-fun lt!313421 () Unit!23922)

(assert (=> b!682070 (= lt!313421 e!388617)))

(declare-fun c!77333 () Bool)

(assert (=> b!682070 (= c!77333 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682070 (arrayContainsKey!0 (array!39536 (store (arr!18951 a!3626) i!1382 k!2843) (size!19315 a!3626)) k!2843 from!3004)))

(declare-fun res!448130 () Bool)

(assert (=> start!60788 (=> (not res!448130) (not e!388619))))

(assert (=> start!60788 (= res!448130 (and (bvslt (size!19315 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19315 a!3626))))))

(assert (=> start!60788 e!388619))

(assert (=> start!60788 true))

(declare-fun array_inv!14747 (array!39535) Bool)

(assert (=> start!60788 (array_inv!14747 a!3626)))

(declare-fun b!682071 () Bool)

(assert (=> b!682071 (= e!388618 (not (contains!3569 acc!681 k!2843)))))

(declare-fun b!682072 () Bool)

(declare-fun res!448127 () Bool)

(assert (=> b!682072 (=> (not res!448127) (not e!388619))))

(assert (=> b!682072 (= res!448127 (not (contains!3569 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682073 () Bool)

(declare-fun res!448139 () Bool)

(assert (=> b!682073 (=> (not res!448139) (not e!388619))))

(assert (=> b!682073 (= res!448139 e!388621)))

(declare-fun res!448131 () Bool)

(assert (=> b!682073 (=> res!448131 e!388621)))

(assert (=> b!682073 (= res!448131 e!388622)))

(declare-fun res!448134 () Bool)

(assert (=> b!682073 (=> (not res!448134) (not e!388622))))

(assert (=> b!682073 (= res!448134 (bvsgt from!3004 i!1382))))

(assert (= (and start!60788 res!448130) b!682066))

(assert (= (and b!682066 res!448135) b!682064))

(assert (= (and b!682064 res!448132) b!682072))

(assert (= (and b!682072 res!448127) b!682073))

(assert (= (and b!682073 res!448134) b!682060))

(assert (= (and b!682073 (not res!448131)) b!682068))

(assert (= (and b!682068 res!448136) b!682071))

(assert (= (and b!682073 res!448139) b!682063))

(assert (= (and b!682063 res!448133) b!682057))

(assert (= (and b!682057 res!448129) b!682062))

(assert (= (and b!682062 res!448137) b!682065))

(assert (= (and b!682065 res!448126) b!682067))

(assert (= (and b!682067 res!448128) b!682059))

(assert (= (and b!682059 res!448138) b!682070))

(assert (= (and b!682070 c!77333) b!682069))

(assert (= (and b!682070 (not c!77333)) b!682058))

(assert (= (and b!682070 c!77332) b!682056))

(assert (= (and b!682070 (not c!77332)) b!682061))

(declare-fun m!646829 () Bool)

(assert (=> b!682064 m!646829))

(declare-fun m!646831 () Bool)

(assert (=> b!682066 m!646831))

(declare-fun m!646833 () Bool)

(assert (=> start!60788 m!646833))

(declare-fun m!646835 () Bool)

(assert (=> b!682071 m!646835))

(declare-fun m!646837 () Bool)

(assert (=> b!682065 m!646837))

(declare-fun m!646839 () Bool)

(assert (=> b!682057 m!646839))

(declare-fun m!646841 () Bool)

(assert (=> b!682056 m!646841))

(declare-fun m!646843 () Bool)

(assert (=> b!682056 m!646843))

(declare-fun m!646845 () Bool)

(assert (=> b!682056 m!646845))

(declare-fun m!646847 () Bool)

(assert (=> b!682056 m!646847))

(assert (=> b!682056 m!646843))

(assert (=> b!682056 m!646845))

(declare-fun m!646849 () Bool)

(assert (=> b!682056 m!646849))

(declare-fun m!646851 () Bool)

(assert (=> b!682056 m!646851))

(declare-fun m!646853 () Bool)

(assert (=> b!682069 m!646853))

(declare-fun m!646855 () Bool)

(assert (=> b!682067 m!646855))

(assert (=> b!682060 m!646835))

(declare-fun m!646857 () Bool)

(assert (=> b!682063 m!646857))

(declare-fun m!646859 () Bool)

(assert (=> b!682072 m!646859))

(assert (=> b!682070 m!646841))

(assert (=> b!682070 m!646843))

(declare-fun m!646861 () Bool)

(assert (=> b!682070 m!646861))

(declare-fun m!646863 () Bool)

(assert (=> b!682070 m!646863))

(assert (=> b!682070 m!646843))

(declare-fun m!646865 () Bool)

(assert (=> b!682070 m!646865))

(declare-fun m!646867 () Bool)

(assert (=> b!682070 m!646867))

(push 1)

(assert (not b!682065))

(assert (not start!60788))

(assert (not b!682071))

(assert (not b!682069))

(assert (not b!682070))

(assert (not b!682072))

(assert (not b!682064))

(assert (not b!682067))

(assert (not b!682066))

(assert (not b!682060))

(assert (not b!682063))

(assert (not b!682056))

(assert (not b!682057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94095 () Bool)

(declare-fun lt!313464 () Bool)

(declare-fun content!280 (List!12992) (Set (_ BitVec 64)))

(assert (=> d!94095 (= lt!313464 (set.member k!2843 (content!280 acc!681)))))

(declare-fun e!388757 () Bool)

(assert (=> d!94095 (= lt!313464 e!388757)))

(declare-fun res!448307 () Bool)

(assert (=> d!94095 (=> (not res!448307) (not e!388757))))

(assert (=> d!94095 (= res!448307 (is-Cons!12988 acc!681))))

(assert (=> d!94095 (= (contains!3569 acc!681 k!2843) lt!313464)))

(declare-fun b!682279 () Bool)

(declare-fun e!388756 () Bool)

(assert (=> b!682279 (= e!388757 e!388756)))

(declare-fun res!448308 () Bool)

(assert (=> b!682279 (=> res!448308 e!388756)))

(assert (=> b!682279 (= res!448308 (= (h!14033 acc!681) k!2843))))

(declare-fun b!682280 () Bool)

(assert (=> b!682280 (= e!388756 (contains!3569 (t!19232 acc!681) k!2843))))

(assert (= (and d!94095 res!448307) b!682279))

(assert (= (and b!682279 (not res!448308)) b!682280))

(declare-fun m!647013 () Bool)

(assert (=> d!94095 m!647013))

(declare-fun m!647015 () Bool)

(assert (=> d!94095 m!647015))

(declare-fun m!647017 () Bool)

(assert (=> b!682280 m!647017))

(assert (=> b!682071 d!94095))

(assert (=> b!682060 d!94095))

(declare-fun b!682303 () Bool)

(declare-fun e!388779 () Bool)

(declare-fun call!34001 () Bool)

(assert (=> b!682303 (= e!388779 call!34001)))

(declare-fun d!94101 () Bool)

(declare-fun res!448325 () Bool)

(declare-fun e!388776 () Bool)

(assert (=> d!94101 (=> res!448325 e!388776)))

(assert (=> d!94101 (= res!448325 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19315 a!3626)))))

(assert (=> d!94101 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!388776)))

(declare-fun e!388778 () Bool)

(declare-fun b!682304 () Bool)

(assert (=> b!682304 (= e!388778 (contains!3569 acc!681 (select (arr!18951 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682305 () Bool)

(assert (=> b!682305 (= e!388779 call!34001)))

(declare-fun b!682306 () Bool)

(declare-fun e!388777 () Bool)

(assert (=> b!682306 (= e!388776 e!388777)))

(declare-fun res!448323 () Bool)

(assert (=> b!682306 (=> (not res!448323) (not e!388777))))

(assert (=> b!682306 (= res!448323 (not e!388778))))

(declare-fun res!448324 () Bool)

(assert (=> b!682306 (=> (not res!448324) (not e!388778))))

(assert (=> b!682306 (= res!448324 (validKeyInArray!0 (select (arr!18951 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!682307 () Bool)

(assert (=> b!682307 (= e!388777 e!388779)))

(declare-fun c!77357 () Bool)

(assert (=> b!682307 (= c!77357 (validKeyInArray!0 (select (arr!18951 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!33998 () Bool)

(assert (=> bm!33998 (= call!34001 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77357 (Cons!12988 (select (arr!18951 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94101 (not res!448325)) b!682306))

(assert (= (and b!682306 res!448324) b!682304))

(assert (= (and b!682306 res!448323) b!682307))

(assert (= (and b!682307 c!77357) b!682303))

(assert (= (and b!682307 (not c!77357)) b!682305))

(assert (= (or b!682303 b!682305) bm!33998))

(declare-fun m!647043 () Bool)

(assert (=> b!682304 m!647043))

(assert (=> b!682304 m!647043))

(declare-fun m!647045 () Bool)

(assert (=> b!682304 m!647045))

(assert (=> b!682306 m!647043))

(assert (=> b!682306 m!647043))

(declare-fun m!647047 () Bool)

(assert (=> b!682306 m!647047))

(assert (=> b!682307 m!647043))

(assert (=> b!682307 m!647043))

(assert (=> b!682307 m!647047))

(assert (=> bm!33998 m!647043))

(declare-fun m!647049 () Bool)

(assert (=> bm!33998 m!647049))

(assert (=> b!682070 d!94101))

(declare-fun d!94117 () Bool)

(assert (=> d!94117 (= (validKeyInArray!0 (select (arr!18951 a!3626) from!3004)) (and (not (= (select (arr!18951 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18951 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!682070 d!94117))

(declare-fun d!94119 () Bool)

(declare-fun res!448342 () Bool)

(declare-fun e!388796 () Bool)

(assert (=> d!94119 (=> res!448342 e!388796)))

(assert (=> d!94119 (= res!448342 (= (select (arr!18951 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94119 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!388796)))

(declare-fun b!682324 () Bool)

(declare-fun e!388797 () Bool)

(assert (=> b!682324 (= e!388796 e!388797)))

(declare-fun res!448343 () Bool)

(assert (=> b!682324 (=> (not res!448343) (not e!388797))))

(assert (=> b!682324 (= res!448343 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19315 a!3626)))))

(declare-fun b!682325 () Bool)

(assert (=> b!682325 (= e!388797 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94119 (not res!448342)) b!682324))

(assert (= (and b!682324 res!448343) b!682325))

(assert (=> d!94119 m!647043))

(declare-fun m!647061 () Bool)

(assert (=> b!682325 m!647061))

(assert (=> b!682070 d!94119))

(declare-fun d!94125 () Bool)

(declare-fun res!448346 () Bool)

(declare-fun e!388800 () Bool)

(assert (=> d!94125 (=> res!448346 e!388800)))

(assert (=> d!94125 (= res!448346 (= (select (arr!18951 (array!39536 (store (arr!18951 a!3626) i!1382 k!2843) (size!19315 a!3626))) from!3004) k!2843))))

(assert (=> d!94125 (= (arrayContainsKey!0 (array!39536 (store (arr!18951 a!3626) i!1382 k!2843) (size!19315 a!3626)) k!2843 from!3004) e!388800)))

(declare-fun b!682328 () Bool)

(declare-fun e!388801 () Bool)

(assert (=> b!682328 (= e!388800 e!388801)))

(declare-fun res!448347 () Bool)

(assert (=> b!682328 (=> (not res!448347) (not e!388801))))

(assert (=> b!682328 (= res!448347 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19315 (array!39536 (store (arr!18951 a!3626) i!1382 k!2843) (size!19315 a!3626)))))))

(declare-fun b!682329 () Bool)

(assert (=> b!682329 (= e!388801 (arrayContainsKey!0 (array!39536 (store (arr!18951 a!3626) i!1382 k!2843) (size!19315 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94125 (not res!448346)) b!682328))

(assert (= (and b!682328 res!448347) b!682329))

(declare-fun m!647067 () Bool)

(assert (=> d!94125 m!647067))

(declare-fun m!647069 () Bool)

(assert (=> b!682329 m!647069))

(assert (=> b!682070 d!94125))

(declare-fun d!94129 () Bool)

(assert (=> d!94129 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!313486 () Unit!23922)

(declare-fun choose!13 (array!39535 (_ BitVec 64) (_ BitVec 32)) Unit!23922)

(assert (=> d!94129 (= lt!313486 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94129 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94129 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!313486)))

(declare-fun bs!20023 () Bool)

(assert (= bs!20023 d!94129))

(assert (=> bs!20023 m!646855))

(declare-fun m!647073 () Bool)

(assert (=> bs!20023 m!647073))

(assert (=> b!682069 d!94129))

(declare-fun b!682335 () Bool)

(declare-fun e!388809 () Bool)

(declare-fun call!34003 () Bool)

(assert (=> b!682335 (= e!388809 call!34003)))

(declare-fun d!94133 () Bool)

(declare-fun res!448353 () Bool)

(declare-fun e!388806 () Bool)

(assert (=> d!94133 (=> res!448353 e!388806)))

(assert (=> d!94133 (= res!448353 (bvsge from!3004 (size!19315 a!3626)))))

(assert (=> d!94133 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!388806)))

(declare-fun b!682336 () Bool)

(declare-fun e!388808 () Bool)

(assert (=> b!682336 (= e!388808 (contains!3569 acc!681 (select (arr!18951 a!3626) from!3004)))))

(declare-fun b!682337 () Bool)

(assert (=> b!682337 (= e!388809 call!34003)))

(declare-fun b!682338 () Bool)

(declare-fun e!388807 () Bool)

(assert (=> b!682338 (= e!388806 e!388807)))

(declare-fun res!448351 () Bool)

(assert (=> b!682338 (=> (not res!448351) (not e!388807))))

(assert (=> b!682338 (= res!448351 (not e!388808))))

(declare-fun res!448352 () Bool)

(assert (=> b!682338 (=> (not res!448352) (not e!388808))))

(assert (=> b!682338 (= res!448352 (validKeyInArray!0 (select (arr!18951 a!3626) from!3004)))))

(declare-fun b!682339 () Bool)

(assert (=> b!682339 (= e!388807 e!388809)))

(declare-fun c!77359 () Bool)

(assert (=> b!682339 (= c!77359 (validKeyInArray!0 (select (arr!18951 a!3626) from!3004)))))

(declare-fun bm!34000 () Bool)

(assert (=> bm!34000 (= call!34003 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77359 (Cons!12988 (select (arr!18951 a!3626) from!3004) acc!681) acc!681)))))

(assert (= (and d!94133 (not res!448353)) b!682338))

(assert (= (and b!682338 res!448352) b!682336))

(assert (= (and b!682338 res!448351) b!682339))

(assert (= (and b!682339 c!77359) b!682335))

(assert (= (and b!682339 (not c!77359)) b!682337))

(assert (= (or b!682335 b!682337) bm!34000))

(assert (=> b!682336 m!646843))

(assert (=> b!682336 m!646843))

(declare-fun m!647079 () Bool)

(assert (=> b!682336 m!647079))

(assert (=> b!682338 m!646843))

(assert (=> b!682338 m!646843))

(assert (=> b!682338 m!646865))

(assert (=> b!682339 m!646843))

(assert (=> b!682339 m!646843))

(assert (=> b!682339 m!646865))

(assert (=> bm!34000 m!646843))

(declare-fun m!647081 () Bool)

(assert (=> bm!34000 m!647081))

(assert (=> b!682057 d!94133))

(declare-fun d!94137 () Bool)

(declare-fun res!448356 () Bool)

(declare-fun e!388812 () Bool)

(assert (=> d!94137 (=> res!448356 e!388812)))

(assert (=> d!94137 (= res!448356 (= (select (arr!18951 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94137 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!388812)))

(declare-fun b!682342 () Bool)

(declare-fun e!388813 () Bool)

(assert (=> b!682342 (= e!388812 e!388813)))

(declare-fun res!448357 () Bool)

(assert (=> b!682342 (=> (not res!448357) (not e!388813))))

(assert (=> b!682342 (= res!448357 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19315 a!3626)))))

(declare-fun b!682343 () Bool)

(assert (=> b!682343 (= e!388813 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94137 (not res!448356)) b!682342))

(assert (= (and b!682342 res!448357) b!682343))

(declare-fun m!647087 () Bool)

(assert (=> d!94137 m!647087))

(declare-fun m!647089 () Bool)

(assert (=> b!682343 m!647089))

(assert (=> b!682067 d!94137))

(declare-fun d!94139 () Bool)

(assert (=> d!94139 (= ($colon$colon!320 acc!681 (select (arr!18951 a!3626) from!3004)) (Cons!12988 (select (arr!18951 a!3626) from!3004) acc!681))))

(assert (=> b!682056 d!94139))

(declare-fun b!682354 () Bool)

(declare-fun e!388825 () Bool)

(assert (=> b!682354 (= e!388825 (subseq!155 (t!19232 acc!681) (t!19232 acc!681)))))

(declare-fun b!682355 () Bool)

(declare-fun e!388822 () Bool)

(assert (=> b!682355 (= e!388822 (subseq!155 acc!681 (t!19232 acc!681)))))

(declare-fun b!682352 () Bool)

(declare-fun e!388823 () Bool)

(declare-fun e!388824 () Bool)

(assert (=> b!682352 (= e!388823 e!388824)))

(declare-fun res!448368 () Bool)

(assert (=> b!682352 (=> (not res!448368) (not e!388824))))

(assert (=> b!682352 (= res!448368 (is-Cons!12988 acc!681))))

(declare-fun d!94141 () Bool)

(declare-fun res!448366 () Bool)

(assert (=> d!94141 (=> res!448366 e!388823)))

(assert (=> d!94141 (= res!448366 (is-Nil!12989 acc!681))))

(assert (=> d!94141 (= (subseq!155 acc!681 acc!681) e!388823)))

(declare-fun b!682353 () Bool)

(assert (=> b!682353 (= e!388824 e!388822)))

(declare-fun res!448367 () Bool)

(assert (=> b!682353 (=> res!448367 e!388822)))

(assert (=> b!682353 (= res!448367 e!388825)))

(declare-fun res!448369 () Bool)

(assert (=> b!682353 (=> (not res!448369) (not e!388825))))

(assert (=> b!682353 (= res!448369 (= (h!14033 acc!681) (h!14033 acc!681)))))

(assert (= (and d!94141 (not res!448366)) b!682352))

(assert (= (and b!682352 res!448368) b!682353))

(assert (= (and b!682353 res!448369) b!682354))

(assert (= (and b!682353 (not res!448367)) b!682355))

(declare-fun m!647091 () Bool)

(assert (=> b!682354 m!647091))

(declare-fun m!647093 () Bool)

(assert (=> b!682355 m!647093))

(assert (=> b!682056 d!94141))

(declare-fun d!94143 () Bool)

(assert (=> d!94143 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313490 () Unit!23922)

(declare-fun choose!80 (array!39535 List!12992 List!12992 (_ BitVec 32)) Unit!23922)

(assert (=> d!94143 (= lt!313490 (choose!80 a!3626 ($colon$colon!320 acc!681 (select (arr!18951 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94143 (bvslt (size!19315 a!3626) #b01111111111111111111111111111111)))

