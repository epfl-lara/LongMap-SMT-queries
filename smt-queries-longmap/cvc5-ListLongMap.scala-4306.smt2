; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59864 () Bool)

(assert start!59864)

(declare-fun b!661976 () Bool)

(declare-datatypes ((Unit!22986 0))(
  ( (Unit!22987) )
))
(declare-fun e!380140 () Unit!22986)

(declare-fun Unit!22988 () Unit!22986)

(assert (=> b!661976 (= e!380140 Unit!22988)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308886 () Unit!22986)

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!38911 0))(
  ( (array!38912 (arr!18648 (Array (_ BitVec 32) (_ BitVec 64))) (size!19012 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38911 (_ BitVec 64) (_ BitVec 32)) Unit!22986)

(assert (=> b!661976 (= lt!308886 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!661976 false))

(declare-fun b!661977 () Bool)

(declare-fun Unit!22989 () Unit!22986)

(assert (=> b!661977 (= e!380140 Unit!22989)))

(declare-fun b!661978 () Bool)

(declare-fun e!380137 () Bool)

(declare-fun e!380139 () Bool)

(assert (=> b!661978 (= e!380137 e!380139)))

(declare-fun res!430034 () Bool)

(assert (=> b!661978 (=> res!430034 e!380139)))

(assert (=> b!661978 (= res!430034 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12689 0))(
  ( (Nil!12686) (Cons!12685 (h!13730 (_ BitVec 64)) (t!18917 List!12689)) )
))
(declare-fun lt!308890 () List!12689)

(declare-fun acc!681 () List!12689)

(declare-fun $colon$colon!137 (List!12689 (_ BitVec 64)) List!12689)

(assert (=> b!661978 (= lt!308890 ($colon$colon!137 acc!681 (select (arr!18648 a!3626) from!3004)))))

(declare-fun subseq!5 (List!12689 List!12689) Bool)

(assert (=> b!661978 (subseq!5 acc!681 acc!681)))

(declare-fun lt!308889 () Unit!22986)

(declare-fun lemmaListSubSeqRefl!0 (List!12689) Unit!22986)

(assert (=> b!661978 (= lt!308889 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661979 () Bool)

(declare-fun res!430035 () Bool)

(declare-fun e!380138 () Bool)

(assert (=> b!661979 (=> (not res!430035) (not e!380138))))

(declare-fun arrayContainsKey!0 (array!38911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661979 (= res!430035 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661980 () Bool)

(declare-fun res!430022 () Bool)

(assert (=> b!661980 (=> (not res!430022) (not e!380138))))

(declare-fun arrayNoDuplicates!0 (array!38911 (_ BitVec 32) List!12689) Bool)

(assert (=> b!661980 (= res!430022 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661981 () Bool)

(declare-fun res!430030 () Bool)

(assert (=> b!661981 (=> res!430030 e!380139)))

(declare-fun contains!3266 (List!12689 (_ BitVec 64)) Bool)

(assert (=> b!661981 (= res!430030 (contains!3266 lt!308890 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661982 () Bool)

(declare-fun e!380142 () Bool)

(assert (=> b!661982 (= e!380142 (contains!3266 acc!681 k!2843))))

(declare-fun b!661983 () Bool)

(declare-fun res!430031 () Bool)

(assert (=> b!661983 (=> res!430031 e!380139)))

(declare-fun noDuplicate!513 (List!12689) Bool)

(assert (=> b!661983 (= res!430031 (not (noDuplicate!513 lt!308890)))))

(declare-fun b!661984 () Bool)

(declare-fun res!430033 () Bool)

(assert (=> b!661984 (=> (not res!430033) (not e!380138))))

(assert (=> b!661984 (= res!430033 (not (contains!3266 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661985 () Bool)

(declare-fun res!430026 () Bool)

(assert (=> b!661985 (=> (not res!430026) (not e!380138))))

(assert (=> b!661985 (= res!430026 (not (contains!3266 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661987 () Bool)

(declare-fun res!430021 () Bool)

(assert (=> b!661987 (=> (not res!430021) (not e!380138))))

(assert (=> b!661987 (= res!430021 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12686))))

(declare-fun b!661988 () Bool)

(declare-fun res!430020 () Bool)

(assert (=> b!661988 (=> (not res!430020) (not e!380138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661988 (= res!430020 (validKeyInArray!0 k!2843))))

(declare-fun b!661989 () Bool)

(assert (=> b!661989 (= e!380138 (not e!380137))))

(declare-fun res!430027 () Bool)

(assert (=> b!661989 (=> res!430027 e!380137)))

(assert (=> b!661989 (= res!430027 (not (validKeyInArray!0 (select (arr!18648 a!3626) from!3004))))))

(declare-fun lt!308887 () Unit!22986)

(assert (=> b!661989 (= lt!308887 e!380140)))

(declare-fun c!76346 () Bool)

(assert (=> b!661989 (= c!76346 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661989 (arrayContainsKey!0 (array!38912 (store (arr!18648 a!3626) i!1382 k!2843) (size!19012 a!3626)) k!2843 from!3004)))

(declare-fun b!661990 () Bool)

(declare-fun res!430018 () Bool)

(assert (=> b!661990 (=> (not res!430018) (not e!380138))))

(assert (=> b!661990 (= res!430018 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19012 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661991 () Bool)

(declare-fun e!380135 () Bool)

(declare-fun e!380136 () Bool)

(assert (=> b!661991 (= e!380135 e!380136)))

(declare-fun res!430019 () Bool)

(assert (=> b!661991 (=> (not res!430019) (not e!380136))))

(assert (=> b!661991 (= res!430019 (bvsle from!3004 i!1382))))

(declare-fun b!661992 () Bool)

(assert (=> b!661992 (= e!380136 (not (contains!3266 acc!681 k!2843)))))

(declare-fun b!661993 () Bool)

(declare-fun res!430036 () Bool)

(assert (=> b!661993 (=> (not res!430036) (not e!380138))))

(assert (=> b!661993 (= res!430036 (noDuplicate!513 acc!681))))

(declare-fun b!661994 () Bool)

(declare-fun res!430023 () Bool)

(assert (=> b!661994 (=> res!430023 e!380139)))

(assert (=> b!661994 (= res!430023 (contains!3266 lt!308890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661995 () Bool)

(declare-fun res!430028 () Bool)

(assert (=> b!661995 (=> (not res!430028) (not e!380138))))

(assert (=> b!661995 (= res!430028 e!380135)))

(declare-fun res!430025 () Bool)

(assert (=> b!661995 (=> res!430025 e!380135)))

(assert (=> b!661995 (= res!430025 e!380142)))

(declare-fun res!430032 () Bool)

(assert (=> b!661995 (=> (not res!430032) (not e!380142))))

(assert (=> b!661995 (= res!430032 (bvsgt from!3004 i!1382))))

(declare-fun b!661996 () Bool)

(assert (=> b!661996 (= e!380139 true)))

(declare-fun lt!308888 () Bool)

(assert (=> b!661996 (= lt!308888 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308890))))

(declare-fun lt!308885 () Unit!22986)

(declare-fun noDuplicateSubseq!5 (List!12689 List!12689) Unit!22986)

(assert (=> b!661996 (= lt!308885 (noDuplicateSubseq!5 acc!681 lt!308890))))

(declare-fun b!661997 () Bool)

(declare-fun res!430029 () Bool)

(assert (=> b!661997 (=> (not res!430029) (not e!380138))))

(assert (=> b!661997 (= res!430029 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19012 a!3626))))))

(declare-fun b!661986 () Bool)

(declare-fun res!430037 () Bool)

(assert (=> b!661986 (=> res!430037 e!380139)))

(assert (=> b!661986 (= res!430037 (not (subseq!5 acc!681 lt!308890)))))

(declare-fun res!430024 () Bool)

(assert (=> start!59864 (=> (not res!430024) (not e!380138))))

(assert (=> start!59864 (= res!430024 (and (bvslt (size!19012 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19012 a!3626))))))

(assert (=> start!59864 e!380138))

(assert (=> start!59864 true))

(declare-fun array_inv!14444 (array!38911) Bool)

(assert (=> start!59864 (array_inv!14444 a!3626)))

(assert (= (and start!59864 res!430024) b!661993))

(assert (= (and b!661993 res!430036) b!661984))

(assert (= (and b!661984 res!430033) b!661985))

(assert (= (and b!661985 res!430026) b!661995))

(assert (= (and b!661995 res!430032) b!661982))

(assert (= (and b!661995 (not res!430025)) b!661991))

(assert (= (and b!661991 res!430019) b!661992))

(assert (= (and b!661995 res!430028) b!661987))

(assert (= (and b!661987 res!430021) b!661980))

(assert (= (and b!661980 res!430022) b!661997))

(assert (= (and b!661997 res!430029) b!661988))

(assert (= (and b!661988 res!430020) b!661979))

(assert (= (and b!661979 res!430035) b!661990))

(assert (= (and b!661990 res!430018) b!661989))

(assert (= (and b!661989 c!76346) b!661976))

(assert (= (and b!661989 (not c!76346)) b!661977))

(assert (= (and b!661989 (not res!430027)) b!661978))

(assert (= (and b!661978 (not res!430034)) b!661983))

(assert (= (and b!661983 (not res!430031)) b!661994))

(assert (= (and b!661994 (not res!430023)) b!661981))

(assert (= (and b!661981 (not res!430030)) b!661986))

(assert (= (and b!661986 (not res!430037)) b!661996))

(declare-fun m!633941 () Bool)

(assert (=> b!661979 m!633941))

(declare-fun m!633943 () Bool)

(assert (=> b!661996 m!633943))

(declare-fun m!633945 () Bool)

(assert (=> b!661996 m!633945))

(declare-fun m!633947 () Bool)

(assert (=> b!661986 m!633947))

(declare-fun m!633949 () Bool)

(assert (=> b!661988 m!633949))

(declare-fun m!633951 () Bool)

(assert (=> b!661980 m!633951))

(declare-fun m!633953 () Bool)

(assert (=> b!661976 m!633953))

(declare-fun m!633955 () Bool)

(assert (=> b!661981 m!633955))

(declare-fun m!633957 () Bool)

(assert (=> b!661984 m!633957))

(declare-fun m!633959 () Bool)

(assert (=> b!661987 m!633959))

(declare-fun m!633961 () Bool)

(assert (=> b!661994 m!633961))

(declare-fun m!633963 () Bool)

(assert (=> b!661993 m!633963))

(declare-fun m!633965 () Bool)

(assert (=> start!59864 m!633965))

(declare-fun m!633967 () Bool)

(assert (=> b!661989 m!633967))

(declare-fun m!633969 () Bool)

(assert (=> b!661989 m!633969))

(declare-fun m!633971 () Bool)

(assert (=> b!661989 m!633971))

(assert (=> b!661989 m!633967))

(declare-fun m!633973 () Bool)

(assert (=> b!661989 m!633973))

(declare-fun m!633975 () Bool)

(assert (=> b!661989 m!633975))

(declare-fun m!633977 () Bool)

(assert (=> b!661992 m!633977))

(declare-fun m!633979 () Bool)

(assert (=> b!661985 m!633979))

(declare-fun m!633981 () Bool)

(assert (=> b!661983 m!633981))

(assert (=> b!661978 m!633967))

(assert (=> b!661978 m!633967))

(declare-fun m!633983 () Bool)

(assert (=> b!661978 m!633983))

(declare-fun m!633985 () Bool)

(assert (=> b!661978 m!633985))

(declare-fun m!633987 () Bool)

(assert (=> b!661978 m!633987))

(assert (=> b!661982 m!633977))

(push 1)

