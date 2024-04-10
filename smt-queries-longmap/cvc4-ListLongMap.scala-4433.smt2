; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61578 () Bool)

(assert start!61578)

(declare-fun b!689093 () Bool)

(declare-fun res!453702 () Bool)

(declare-fun e!392400 () Bool)

(assert (=> b!689093 (=> res!453702 e!392400)))

(declare-datatypes ((List!13072 0))(
  ( (Nil!13069) (Cons!13068 (h!14113 (_ BitVec 64)) (t!19336 List!13072)) )
))
(declare-fun lt!316035 () List!13072)

(declare-fun contains!3649 (List!13072 (_ BitVec 64)) Bool)

(assert (=> b!689093 (= res!453702 (contains!3649 lt!316035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689094 () Bool)

(declare-datatypes ((Unit!24322 0))(
  ( (Unit!24323) )
))
(declare-fun e!392405 () Unit!24322)

(declare-fun Unit!24324 () Unit!24322)

(assert (=> b!689094 (= e!392405 Unit!24324)))

(declare-fun b!689095 () Bool)

(declare-fun res!453700 () Bool)

(declare-fun e!392403 () Bool)

(assert (=> b!689095 (=> (not res!453700) (not e!392403))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!13072)

(declare-datatypes ((array!39719 0))(
  ( (array!39720 (arr!19031 (Array (_ BitVec 32) (_ BitVec 64))) (size!19413 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39719)

(declare-fun arrayNoDuplicates!0 (array!39719 (_ BitVec 32) List!13072) Bool)

(assert (=> b!689095 (= res!453700 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689096 () Bool)

(declare-fun e!392401 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!689096 (= e!392401 (not (contains!3649 acc!681 k!2843)))))

(declare-fun b!689098 () Bool)

(declare-fun res!453711 () Bool)

(assert (=> b!689098 (=> (not res!453711) (not e!392403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689098 (= res!453711 (validKeyInArray!0 k!2843))))

(declare-fun b!689099 () Bool)

(declare-fun e!392406 () Bool)

(assert (=> b!689099 (= e!392406 (contains!3649 lt!316035 k!2843))))

(declare-fun b!689100 () Bool)

(declare-fun e!392396 () Bool)

(declare-fun e!392399 () Bool)

(assert (=> b!689100 (= e!392396 e!392399)))

(declare-fun res!453701 () Bool)

(assert (=> b!689100 (=> (not res!453701) (not e!392399))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689100 (= res!453701 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689101 () Bool)

(declare-fun Unit!24325 () Unit!24322)

(assert (=> b!689101 (= e!392405 Unit!24325)))

(declare-fun lt!316031 () Unit!24322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39719 (_ BitVec 64) (_ BitVec 32)) Unit!24322)

(assert (=> b!689101 (= lt!316031 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689101 false))

(declare-fun b!689102 () Bool)

(declare-fun res!453713 () Bool)

(assert (=> b!689102 (=> (not res!453713) (not e!392403))))

(assert (=> b!689102 (= res!453713 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19413 a!3626))))))

(declare-fun b!689103 () Bool)

(declare-fun e!392402 () Bool)

(assert (=> b!689103 (= e!392402 e!392401)))

(declare-fun res!453697 () Bool)

(assert (=> b!689103 (=> (not res!453697) (not e!392401))))

(assert (=> b!689103 (= res!453697 (bvsle from!3004 i!1382))))

(declare-fun b!689104 () Bool)

(declare-fun e!392398 () Unit!24322)

(declare-fun lt!316039 () Unit!24322)

(assert (=> b!689104 (= e!392398 lt!316039)))

(declare-fun lt!316030 () Unit!24322)

(declare-fun lemmaListSubSeqRefl!0 (List!13072) Unit!24322)

(assert (=> b!689104 (= lt!316030 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!235 (List!13072 List!13072) Bool)

(assert (=> b!689104 (subseq!235 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39719 List!13072 List!13072 (_ BitVec 32)) Unit!24322)

(declare-fun $colon$colon!400 (List!13072 (_ BitVec 64)) List!13072)

(assert (=> b!689104 (= lt!316039 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!400 acc!681 (select (arr!19031 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689104 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689105 () Bool)

(assert (=> b!689105 (= e!392403 (not e!392400))))

(declare-fun res!453704 () Bool)

(assert (=> b!689105 (=> res!453704 e!392400)))

(assert (=> b!689105 (= res!453704 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689105 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316035)))

(declare-fun lt!316032 () Unit!24322)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39719 (_ BitVec 64) (_ BitVec 32) List!13072 List!13072) Unit!24322)

(assert (=> b!689105 (= lt!316032 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316035))))

(declare-fun -!200 (List!13072 (_ BitVec 64)) List!13072)

(assert (=> b!689105 (= (-!200 lt!316035 k!2843) acc!681)))

(assert (=> b!689105 (= lt!316035 ($colon$colon!400 acc!681 k!2843))))

(declare-fun lt!316038 () Unit!24322)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13072) Unit!24322)

(assert (=> b!689105 (= lt!316038 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!689105 (subseq!235 acc!681 acc!681)))

(declare-fun lt!316036 () Unit!24322)

(assert (=> b!689105 (= lt!316036 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689105 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316037 () Unit!24322)

(assert (=> b!689105 (= lt!316037 e!392398)))

(declare-fun c!78067 () Bool)

(assert (=> b!689105 (= c!78067 (validKeyInArray!0 (select (arr!19031 a!3626) from!3004)))))

(declare-fun lt!316034 () Unit!24322)

(assert (=> b!689105 (= lt!316034 e!392405)))

(declare-fun c!78068 () Bool)

(declare-fun arrayContainsKey!0 (array!39719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689105 (= c!78068 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689105 (arrayContainsKey!0 (array!39720 (store (arr!19031 a!3626) i!1382 k!2843) (size!19413 a!3626)) k!2843 from!3004)))

(declare-fun b!689106 () Bool)

(declare-fun res!453712 () Bool)

(assert (=> b!689106 (=> (not res!453712) (not e!392403))))

(assert (=> b!689106 (= res!453712 (not (contains!3649 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689107 () Bool)

(declare-fun res!453706 () Bool)

(assert (=> b!689107 (=> res!453706 e!392400)))

(declare-fun noDuplicate!896 (List!13072) Bool)

(assert (=> b!689107 (= res!453706 (not (noDuplicate!896 lt!316035)))))

(declare-fun b!689108 () Bool)

(declare-fun res!453694 () Bool)

(assert (=> b!689108 (=> (not res!453694) (not e!392403))))

(assert (=> b!689108 (= res!453694 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19413 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689109 () Bool)

(declare-fun res!453698 () Bool)

(assert (=> b!689109 (=> (not res!453698) (not e!392403))))

(assert (=> b!689109 (= res!453698 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13069))))

(declare-fun b!689110 () Bool)

(declare-fun res!453699 () Bool)

(assert (=> b!689110 (=> (not res!453699) (not e!392403))))

(assert (=> b!689110 (= res!453699 (not (contains!3649 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689111 () Bool)

(assert (=> b!689111 (= e!392400 true)))

(declare-fun lt!316033 () Bool)

(assert (=> b!689111 (= lt!316033 e!392396)))

(declare-fun res!453695 () Bool)

(assert (=> b!689111 (=> res!453695 e!392396)))

(assert (=> b!689111 (= res!453695 e!392406)))

(declare-fun res!453696 () Bool)

(assert (=> b!689111 (=> (not res!453696) (not e!392406))))

(assert (=> b!689111 (= res!453696 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689097 () Bool)

(declare-fun res!453707 () Bool)

(assert (=> b!689097 (=> (not res!453707) (not e!392403))))

(assert (=> b!689097 (= res!453707 e!392402)))

(declare-fun res!453710 () Bool)

(assert (=> b!689097 (=> res!453710 e!392402)))

(declare-fun e!392404 () Bool)

(assert (=> b!689097 (= res!453710 e!392404)))

(declare-fun res!453703 () Bool)

(assert (=> b!689097 (=> (not res!453703) (not e!392404))))

(assert (=> b!689097 (= res!453703 (bvsgt from!3004 i!1382))))

(declare-fun res!453705 () Bool)

(assert (=> start!61578 (=> (not res!453705) (not e!392403))))

(assert (=> start!61578 (= res!453705 (and (bvslt (size!19413 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19413 a!3626))))))

(assert (=> start!61578 e!392403))

(assert (=> start!61578 true))

(declare-fun array_inv!14827 (array!39719) Bool)

(assert (=> start!61578 (array_inv!14827 a!3626)))

(declare-fun b!689112 () Bool)

(declare-fun Unit!24326 () Unit!24322)

(assert (=> b!689112 (= e!392398 Unit!24326)))

(declare-fun b!689113 () Bool)

(assert (=> b!689113 (= e!392404 (contains!3649 acc!681 k!2843))))

(declare-fun b!689114 () Bool)

(assert (=> b!689114 (= e!392399 (not (contains!3649 lt!316035 k!2843)))))

(declare-fun b!689115 () Bool)

(declare-fun res!453693 () Bool)

(assert (=> b!689115 (=> (not res!453693) (not e!392403))))

(assert (=> b!689115 (= res!453693 (noDuplicate!896 acc!681))))

(declare-fun b!689116 () Bool)

(declare-fun res!453709 () Bool)

(assert (=> b!689116 (=> res!453709 e!392400)))

(assert (=> b!689116 (= res!453709 (contains!3649 lt!316035 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689117 () Bool)

(declare-fun res!453708 () Bool)

(assert (=> b!689117 (=> (not res!453708) (not e!392403))))

(assert (=> b!689117 (= res!453708 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61578 res!453705) b!689115))

(assert (= (and b!689115 res!453693) b!689110))

(assert (= (and b!689110 res!453699) b!689106))

(assert (= (and b!689106 res!453712) b!689097))

(assert (= (and b!689097 res!453703) b!689113))

(assert (= (and b!689097 (not res!453710)) b!689103))

(assert (= (and b!689103 res!453697) b!689096))

(assert (= (and b!689097 res!453707) b!689109))

(assert (= (and b!689109 res!453698) b!689095))

(assert (= (and b!689095 res!453700) b!689102))

(assert (= (and b!689102 res!453713) b!689098))

(assert (= (and b!689098 res!453711) b!689117))

(assert (= (and b!689117 res!453708) b!689108))

(assert (= (and b!689108 res!453694) b!689105))

(assert (= (and b!689105 c!78068) b!689101))

(assert (= (and b!689105 (not c!78068)) b!689094))

(assert (= (and b!689105 c!78067) b!689104))

(assert (= (and b!689105 (not c!78067)) b!689112))

(assert (= (and b!689105 (not res!453704)) b!689107))

(assert (= (and b!689107 (not res!453706)) b!689093))

(assert (= (and b!689093 (not res!453702)) b!689116))

(assert (= (and b!689116 (not res!453709)) b!689111))

(assert (= (and b!689111 res!453696) b!689099))

(assert (= (and b!689111 (not res!453695)) b!689100))

(assert (= (and b!689100 res!453701) b!689114))

(declare-fun m!652837 () Bool)

(assert (=> b!689117 m!652837))

(declare-fun m!652839 () Bool)

(assert (=> b!689104 m!652839))

(declare-fun m!652841 () Bool)

(assert (=> b!689104 m!652841))

(declare-fun m!652843 () Bool)

(assert (=> b!689104 m!652843))

(declare-fun m!652845 () Bool)

(assert (=> b!689104 m!652845))

(assert (=> b!689104 m!652841))

(assert (=> b!689104 m!652843))

(declare-fun m!652847 () Bool)

(assert (=> b!689104 m!652847))

(declare-fun m!652849 () Bool)

(assert (=> b!689104 m!652849))

(declare-fun m!652851 () Bool)

(assert (=> b!689113 m!652851))

(declare-fun m!652853 () Bool)

(assert (=> b!689109 m!652853))

(declare-fun m!652855 () Bool)

(assert (=> b!689098 m!652855))

(declare-fun m!652857 () Bool)

(assert (=> b!689106 m!652857))

(declare-fun m!652859 () Bool)

(assert (=> b!689107 m!652859))

(declare-fun m!652861 () Bool)

(assert (=> b!689095 m!652861))

(declare-fun m!652863 () Bool)

(assert (=> start!61578 m!652863))

(assert (=> b!689105 m!652839))

(assert (=> b!689105 m!652841))

(declare-fun m!652865 () Bool)

(assert (=> b!689105 m!652865))

(assert (=> b!689105 m!652847))

(declare-fun m!652867 () Bool)

(assert (=> b!689105 m!652867))

(declare-fun m!652869 () Bool)

(assert (=> b!689105 m!652869))

(declare-fun m!652871 () Bool)

(assert (=> b!689105 m!652871))

(assert (=> b!689105 m!652841))

(declare-fun m!652873 () Bool)

(assert (=> b!689105 m!652873))

(declare-fun m!652875 () Bool)

(assert (=> b!689105 m!652875))

(declare-fun m!652877 () Bool)

(assert (=> b!689105 m!652877))

(declare-fun m!652879 () Bool)

(assert (=> b!689105 m!652879))

(assert (=> b!689105 m!652849))

(declare-fun m!652881 () Bool)

(assert (=> b!689105 m!652881))

(declare-fun m!652883 () Bool)

(assert (=> b!689099 m!652883))

(declare-fun m!652885 () Bool)

(assert (=> b!689115 m!652885))

(assert (=> b!689114 m!652883))

(assert (=> b!689096 m!652851))

(declare-fun m!652887 () Bool)

(assert (=> b!689116 m!652887))

(declare-fun m!652889 () Bool)

(assert (=> b!689101 m!652889))

(declare-fun m!652891 () Bool)

(assert (=> b!689093 m!652891))

(declare-fun m!652893 () Bool)

(assert (=> b!689110 m!652893))

(push 1)

(assert (not b!689098))

(assert (not b!689095))

(assert (not b!689093))

(assert (not b!689114))

(assert (not b!689099))

(assert (not b!689109))

(assert (not b!689110))

(assert (not start!61578))

(assert (not b!689101))

(assert (not b!689117))

(assert (not b!689116))

(assert (not b!689113))

(assert (not b!689105))

(assert (not b!689096))

(assert (not b!689104))

(assert (not b!689106))

(assert (not b!689107))

(assert (not b!689115))

(check-sat)

