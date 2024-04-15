; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59858 () Bool)

(assert start!59858)

(declare-fun b!661878 () Bool)

(declare-datatypes ((Unit!22976 0))(
  ( (Unit!22977) )
))
(declare-fun e!380023 () Unit!22976)

(declare-fun Unit!22978 () Unit!22976)

(assert (=> b!661878 (= e!380023 Unit!22978)))

(declare-fun b!661879 () Bool)

(declare-fun res!430065 () Bool)

(declare-fun e!380022 () Bool)

(assert (=> b!661879 (=> (not res!430065) (not e!380022))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38916 0))(
  ( (array!38917 (arr!18650 (Array (_ BitVec 32) (_ BitVec 64))) (size!19015 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38916)

(assert (=> b!661879 (= res!430065 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19015 a!3626))))))

(declare-fun b!661881 () Bool)

(declare-fun res!430067 () Bool)

(declare-fun e!380024 () Bool)

(assert (=> b!661881 (=> res!430067 e!380024)))

(declare-datatypes ((List!12730 0))(
  ( (Nil!12727) (Cons!12726 (h!13771 (_ BitVec 64)) (t!18949 List!12730)) )
))
(declare-fun lt!308684 () List!12730)

(declare-fun noDuplicate!521 (List!12730) Bool)

(assert (=> b!661881 (= res!430067 (not (noDuplicate!521 lt!308684)))))

(declare-fun b!661882 () Bool)

(assert (=> b!661882 (= e!380024 true)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308688 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38916 (_ BitVec 32) List!12730) Bool)

(assert (=> b!661882 (= lt!308688 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308684))))

(declare-fun lt!308685 () Unit!22976)

(declare-fun acc!681 () List!12730)

(declare-fun noDuplicateSubseq!8 (List!12730 List!12730) Unit!22976)

(assert (=> b!661882 (= lt!308685 (noDuplicateSubseq!8 acc!681 lt!308684))))

(declare-fun b!661883 () Bool)

(declare-fun res!430070 () Bool)

(assert (=> b!661883 (=> (not res!430070) (not e!380022))))

(assert (=> b!661883 (= res!430070 (noDuplicate!521 acc!681))))

(declare-fun b!661884 () Bool)

(declare-fun res!430063 () Bool)

(assert (=> b!661884 (=> (not res!430063) (not e!380022))))

(declare-fun contains!3252 (List!12730 (_ BitVec 64)) Bool)

(assert (=> b!661884 (= res!430063 (not (contains!3252 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661885 () Bool)

(declare-fun res!430078 () Bool)

(assert (=> b!661885 (=> (not res!430078) (not e!380022))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38916 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661885 (= res!430078 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661886 () Bool)

(declare-fun res!430081 () Bool)

(assert (=> b!661886 (=> (not res!430081) (not e!380022))))

(assert (=> b!661886 (= res!430081 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661887 () Bool)

(declare-fun res!430074 () Bool)

(assert (=> b!661887 (=> (not res!430074) (not e!380022))))

(assert (=> b!661887 (= res!430074 (not (contains!3252 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661888 () Bool)

(declare-fun Unit!22979 () Unit!22976)

(assert (=> b!661888 (= e!380023 Unit!22979)))

(declare-fun lt!308683 () Unit!22976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38916 (_ BitVec 64) (_ BitVec 32)) Unit!22976)

(assert (=> b!661888 (= lt!308683 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!661888 false))

(declare-fun b!661889 () Bool)

(declare-fun res!430071 () Bool)

(assert (=> b!661889 (=> (not res!430071) (not e!380022))))

(declare-fun e!380018 () Bool)

(assert (=> b!661889 (= res!430071 e!380018)))

(declare-fun res!430080 () Bool)

(assert (=> b!661889 (=> res!430080 e!380018)))

(declare-fun e!380019 () Bool)

(assert (=> b!661889 (= res!430080 e!380019)))

(declare-fun res!430076 () Bool)

(assert (=> b!661889 (=> (not res!430076) (not e!380019))))

(assert (=> b!661889 (= res!430076 (bvsgt from!3004 i!1382))))

(declare-fun b!661890 () Bool)

(declare-fun res!430075 () Bool)

(assert (=> b!661890 (=> (not res!430075) (not e!380022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661890 (= res!430075 (validKeyInArray!0 k0!2843))))

(declare-fun b!661891 () Bool)

(declare-fun res!430079 () Bool)

(assert (=> b!661891 (=> (not res!430079) (not e!380022))))

(assert (=> b!661891 (= res!430079 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12727))))

(declare-fun res!430062 () Bool)

(assert (=> start!59858 (=> (not res!430062) (not e!380022))))

(assert (=> start!59858 (= res!430062 (and (bvslt (size!19015 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19015 a!3626))))))

(assert (=> start!59858 e!380022))

(assert (=> start!59858 true))

(declare-fun array_inv!14533 (array!38916) Bool)

(assert (=> start!59858 (array_inv!14533 a!3626)))

(declare-fun b!661880 () Bool)

(declare-fun e!380021 () Bool)

(assert (=> b!661880 (= e!380018 e!380021)))

(declare-fun res!430077 () Bool)

(assert (=> b!661880 (=> (not res!430077) (not e!380021))))

(assert (=> b!661880 (= res!430077 (bvsle from!3004 i!1382))))

(declare-fun b!661892 () Bool)

(assert (=> b!661892 (= e!380021 (not (contains!3252 acc!681 k0!2843)))))

(declare-fun b!661893 () Bool)

(declare-fun res!430072 () Bool)

(assert (=> b!661893 (=> res!430072 e!380024)))

(declare-fun subseq!8 (List!12730 List!12730) Bool)

(assert (=> b!661893 (= res!430072 (not (subseq!8 acc!681 lt!308684)))))

(declare-fun b!661894 () Bool)

(declare-fun e!380017 () Bool)

(assert (=> b!661894 (= e!380017 e!380024)))

(declare-fun res!430066 () Bool)

(assert (=> b!661894 (=> res!430066 e!380024)))

(assert (=> b!661894 (= res!430066 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!139 (List!12730 (_ BitVec 64)) List!12730)

(assert (=> b!661894 (= lt!308684 ($colon$colon!139 acc!681 (select (arr!18650 a!3626) from!3004)))))

(assert (=> b!661894 (subseq!8 acc!681 acc!681)))

(declare-fun lt!308687 () Unit!22976)

(declare-fun lemmaListSubSeqRefl!0 (List!12730) Unit!22976)

(assert (=> b!661894 (= lt!308687 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661895 () Bool)

(assert (=> b!661895 (= e!380022 (not e!380017))))

(declare-fun res!430069 () Bool)

(assert (=> b!661895 (=> res!430069 e!380017)))

(assert (=> b!661895 (= res!430069 (not (validKeyInArray!0 (select (arr!18650 a!3626) from!3004))))))

(declare-fun lt!308686 () Unit!22976)

(assert (=> b!661895 (= lt!308686 e!380023)))

(declare-fun c!76275 () Bool)

(assert (=> b!661895 (= c!76275 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!661895 (arrayContainsKey!0 (array!38917 (store (arr!18650 a!3626) i!1382 k0!2843) (size!19015 a!3626)) k0!2843 from!3004)))

(declare-fun b!661896 () Bool)

(declare-fun res!430073 () Bool)

(assert (=> b!661896 (=> (not res!430073) (not e!380022))))

(assert (=> b!661896 (= res!430073 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19015 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661897 () Bool)

(declare-fun res!430064 () Bool)

(assert (=> b!661897 (=> res!430064 e!380024)))

(assert (=> b!661897 (= res!430064 (contains!3252 lt!308684 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661898 () Bool)

(assert (=> b!661898 (= e!380019 (contains!3252 acc!681 k0!2843))))

(declare-fun b!661899 () Bool)

(declare-fun res!430068 () Bool)

(assert (=> b!661899 (=> res!430068 e!380024)))

(assert (=> b!661899 (= res!430068 (contains!3252 lt!308684 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!59858 res!430062) b!661883))

(assert (= (and b!661883 res!430070) b!661884))

(assert (= (and b!661884 res!430063) b!661887))

(assert (= (and b!661887 res!430074) b!661889))

(assert (= (and b!661889 res!430076) b!661898))

(assert (= (and b!661889 (not res!430080)) b!661880))

(assert (= (and b!661880 res!430077) b!661892))

(assert (= (and b!661889 res!430071) b!661891))

(assert (= (and b!661891 res!430079) b!661886))

(assert (= (and b!661886 res!430081) b!661879))

(assert (= (and b!661879 res!430065) b!661890))

(assert (= (and b!661890 res!430075) b!661885))

(assert (= (and b!661885 res!430078) b!661896))

(assert (= (and b!661896 res!430073) b!661895))

(assert (= (and b!661895 c!76275) b!661888))

(assert (= (and b!661895 (not c!76275)) b!661878))

(assert (= (and b!661895 (not res!430069)) b!661894))

(assert (= (and b!661894 (not res!430066)) b!661881))

(assert (= (and b!661881 (not res!430067)) b!661899))

(assert (= (and b!661899 (not res!430068)) b!661897))

(assert (= (and b!661897 (not res!430064)) b!661893))

(assert (= (and b!661893 (not res!430072)) b!661882))

(declare-fun m!633303 () Bool)

(assert (=> b!661882 m!633303))

(declare-fun m!633305 () Bool)

(assert (=> b!661882 m!633305))

(declare-fun m!633307 () Bool)

(assert (=> b!661884 m!633307))

(declare-fun m!633309 () Bool)

(assert (=> b!661883 m!633309))

(declare-fun m!633311 () Bool)

(assert (=> b!661891 m!633311))

(declare-fun m!633313 () Bool)

(assert (=> b!661899 m!633313))

(declare-fun m!633315 () Bool)

(assert (=> b!661885 m!633315))

(declare-fun m!633317 () Bool)

(assert (=> b!661895 m!633317))

(declare-fun m!633319 () Bool)

(assert (=> b!661895 m!633319))

(declare-fun m!633321 () Bool)

(assert (=> b!661895 m!633321))

(assert (=> b!661895 m!633317))

(declare-fun m!633323 () Bool)

(assert (=> b!661895 m!633323))

(declare-fun m!633325 () Bool)

(assert (=> b!661895 m!633325))

(declare-fun m!633327 () Bool)

(assert (=> b!661897 m!633327))

(declare-fun m!633329 () Bool)

(assert (=> b!661886 m!633329))

(declare-fun m!633331 () Bool)

(assert (=> b!661898 m!633331))

(assert (=> b!661892 m!633331))

(declare-fun m!633333 () Bool)

(assert (=> start!59858 m!633333))

(declare-fun m!633335 () Bool)

(assert (=> b!661888 m!633335))

(assert (=> b!661894 m!633317))

(assert (=> b!661894 m!633317))

(declare-fun m!633337 () Bool)

(assert (=> b!661894 m!633337))

(declare-fun m!633339 () Bool)

(assert (=> b!661894 m!633339))

(declare-fun m!633341 () Bool)

(assert (=> b!661894 m!633341))

(declare-fun m!633343 () Bool)

(assert (=> b!661890 m!633343))

(declare-fun m!633345 () Bool)

(assert (=> b!661893 m!633345))

(declare-fun m!633347 () Bool)

(assert (=> b!661887 m!633347))

(declare-fun m!633349 () Bool)

(assert (=> b!661881 m!633349))

(check-sat (not b!661887) (not b!661881) (not b!661898) (not b!661886) (not b!661892) (not b!661885) (not b!661884) (not b!661891) (not b!661893) (not b!661883) (not b!661899) (not b!661895) (not b!661888) (not b!661890) (not b!661894) (not b!661897) (not start!59858) (not b!661882))
(check-sat)
