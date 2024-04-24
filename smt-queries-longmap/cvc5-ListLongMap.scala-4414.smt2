; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61036 () Bool)

(assert start!61036)

(declare-fun b!683968 () Bool)

(declare-fun e!389646 () Bool)

(assert (=> b!683968 (= e!389646 true)))

(declare-fun lt!314115 () Bool)

(declare-datatypes ((List!12917 0))(
  ( (Nil!12914) (Cons!12913 (h!13961 (_ BitVec 64)) (t!19155 List!12917)) )
))
(declare-fun lt!314108 () List!12917)

(declare-fun noDuplicate!843 (List!12917) Bool)

(assert (=> b!683968 (= lt!314115 (noDuplicate!843 lt!314108))))

(declare-fun b!683969 () Bool)

(declare-fun res!449562 () Bool)

(declare-fun e!389645 () Bool)

(assert (=> b!683969 (=> (not res!449562) (not e!389645))))

(declare-datatypes ((array!39583 0))(
  ( (array!39584 (arr!18969 (Array (_ BitVec 32) (_ BitVec 64))) (size!19336 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39583)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!12917)

(declare-fun arrayNoDuplicates!0 (array!39583 (_ BitVec 32) List!12917) Bool)

(assert (=> b!683969 (= res!449562 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683970 () Bool)

(declare-fun res!449568 () Bool)

(assert (=> b!683970 (=> (not res!449568) (not e!389645))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683970 (= res!449568 (validKeyInArray!0 k!2843))))

(declare-fun b!683971 () Bool)

(declare-fun res!449567 () Bool)

(assert (=> b!683971 (=> (not res!449567) (not e!389645))))

(declare-fun e!389649 () Bool)

(assert (=> b!683971 (= res!449567 e!389649)))

(declare-fun res!449564 () Bool)

(assert (=> b!683971 (=> res!449564 e!389649)))

(declare-fun e!389644 () Bool)

(assert (=> b!683971 (= res!449564 e!389644)))

(declare-fun res!449557 () Bool)

(assert (=> b!683971 (=> (not res!449557) (not e!389644))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683971 (= res!449557 (bvsgt from!3004 i!1382))))

(declare-fun b!683972 () Bool)

(declare-fun res!449565 () Bool)

(assert (=> b!683972 (=> (not res!449565) (not e!389645))))

(assert (=> b!683972 (= res!449565 (noDuplicate!843 acc!681))))

(declare-fun b!683973 () Bool)

(declare-fun res!449556 () Bool)

(assert (=> b!683973 (=> (not res!449556) (not e!389645))))

(assert (=> b!683973 (= res!449556 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19336 a!3626))))))

(declare-fun b!683974 () Bool)

(declare-fun res!449560 () Bool)

(assert (=> b!683974 (=> (not res!449560) (not e!389645))))

(assert (=> b!683974 (= res!449560 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12914))))

(declare-fun b!683975 () Bool)

(declare-datatypes ((Unit!24016 0))(
  ( (Unit!24017) )
))
(declare-fun e!389642 () Unit!24016)

(declare-fun Unit!24018 () Unit!24016)

(assert (=> b!683975 (= e!389642 Unit!24018)))

(declare-fun b!683976 () Bool)

(declare-fun res!449559 () Bool)

(assert (=> b!683976 (=> (not res!449559) (not e!389645))))

(declare-fun arrayContainsKey!0 (array!39583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683976 (= res!449559 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683977 () Bool)

(declare-fun res!449555 () Bool)

(assert (=> b!683977 (=> (not res!449555) (not e!389645))))

(declare-fun contains!3569 (List!12917 (_ BitVec 64)) Bool)

(assert (=> b!683977 (= res!449555 (not (contains!3569 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683978 () Bool)

(declare-fun e!389648 () Bool)

(assert (=> b!683978 (= e!389648 (not (contains!3569 acc!681 k!2843)))))

(declare-fun b!683979 () Bool)

(declare-fun Unit!24019 () Unit!24016)

(assert (=> b!683979 (= e!389642 Unit!24019)))

(declare-fun lt!314109 () Unit!24016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39583 (_ BitVec 64) (_ BitVec 32)) Unit!24016)

(assert (=> b!683979 (= lt!314109 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683979 false))

(declare-fun b!683980 () Bool)

(declare-fun res!449563 () Bool)

(assert (=> b!683980 (=> (not res!449563) (not e!389645))))

(assert (=> b!683980 (= res!449563 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19336 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683981 () Bool)

(declare-fun res!449561 () Bool)

(assert (=> b!683981 (=> (not res!449561) (not e!389645))))

(assert (=> b!683981 (= res!449561 (not (contains!3569 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683982 () Bool)

(assert (=> b!683982 (= e!389645 (not e!389646))))

(declare-fun res!449566 () Bool)

(assert (=> b!683982 (=> res!449566 e!389646)))

(assert (=> b!683982 (= res!449566 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!142 (List!12917 (_ BitVec 64)) List!12917)

(assert (=> b!683982 (= (-!142 lt!314108 k!2843) acc!681)))

(declare-fun $colon$colon!340 (List!12917 (_ BitVec 64)) List!12917)

(assert (=> b!683982 (= lt!314108 ($colon$colon!340 acc!681 k!2843))))

(declare-fun lt!314111 () Unit!24016)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12917) Unit!24016)

(assert (=> b!683982 (= lt!314111 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!178 (List!12917 List!12917) Bool)

(assert (=> b!683982 (subseq!178 acc!681 acc!681)))

(declare-fun lt!314114 () Unit!24016)

(declare-fun lemmaListSubSeqRefl!0 (List!12917) Unit!24016)

(assert (=> b!683982 (= lt!314114 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683982 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314110 () Unit!24016)

(declare-fun e!389647 () Unit!24016)

(assert (=> b!683982 (= lt!314110 e!389647)))

(declare-fun c!77575 () Bool)

(assert (=> b!683982 (= c!77575 (validKeyInArray!0 (select (arr!18969 a!3626) from!3004)))))

(declare-fun lt!314116 () Unit!24016)

(assert (=> b!683982 (= lt!314116 e!389642)))

(declare-fun c!77576 () Bool)

(assert (=> b!683982 (= c!77576 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683982 (arrayContainsKey!0 (array!39584 (store (arr!18969 a!3626) i!1382 k!2843) (size!19336 a!3626)) k!2843 from!3004)))

(declare-fun res!449569 () Bool)

(assert (=> start!61036 (=> (not res!449569) (not e!389645))))

(assert (=> start!61036 (= res!449569 (and (bvslt (size!19336 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19336 a!3626))))))

(assert (=> start!61036 e!389645))

(assert (=> start!61036 true))

(declare-fun array_inv!14828 (array!39583) Bool)

(assert (=> start!61036 (array_inv!14828 a!3626)))

(declare-fun b!683983 () Bool)

(assert (=> b!683983 (= e!389649 e!389648)))

(declare-fun res!449558 () Bool)

(assert (=> b!683983 (=> (not res!449558) (not e!389648))))

(assert (=> b!683983 (= res!449558 (bvsle from!3004 i!1382))))

(declare-fun b!683984 () Bool)

(declare-fun lt!314112 () Unit!24016)

(assert (=> b!683984 (= e!389647 lt!314112)))

(declare-fun lt!314113 () Unit!24016)

(assert (=> b!683984 (= lt!314113 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683984 (subseq!178 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39583 List!12917 List!12917 (_ BitVec 32)) Unit!24016)

(assert (=> b!683984 (= lt!314112 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!340 acc!681 (select (arr!18969 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683984 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683985 () Bool)

(declare-fun Unit!24020 () Unit!24016)

(assert (=> b!683985 (= e!389647 Unit!24020)))

(declare-fun b!683986 () Bool)

(assert (=> b!683986 (= e!389644 (contains!3569 acc!681 k!2843))))

(assert (= (and start!61036 res!449569) b!683972))

(assert (= (and b!683972 res!449565) b!683977))

(assert (= (and b!683977 res!449555) b!683981))

(assert (= (and b!683981 res!449561) b!683971))

(assert (= (and b!683971 res!449557) b!683986))

(assert (= (and b!683971 (not res!449564)) b!683983))

(assert (= (and b!683983 res!449558) b!683978))

(assert (= (and b!683971 res!449567) b!683974))

(assert (= (and b!683974 res!449560) b!683969))

(assert (= (and b!683969 res!449562) b!683973))

(assert (= (and b!683973 res!449556) b!683970))

(assert (= (and b!683970 res!449568) b!683976))

(assert (= (and b!683976 res!449559) b!683980))

(assert (= (and b!683980 res!449563) b!683982))

(assert (= (and b!683982 c!77576) b!683979))

(assert (= (and b!683982 (not c!77576)) b!683975))

(assert (= (and b!683982 c!77575) b!683984))

(assert (= (and b!683982 (not c!77575)) b!683985))

(assert (= (and b!683982 (not res!449566)) b!683968))

(declare-fun m!648955 () Bool)

(assert (=> b!683984 m!648955))

(declare-fun m!648957 () Bool)

(assert (=> b!683984 m!648957))

(declare-fun m!648959 () Bool)

(assert (=> b!683984 m!648959))

(declare-fun m!648961 () Bool)

(assert (=> b!683984 m!648961))

(assert (=> b!683984 m!648957))

(assert (=> b!683984 m!648959))

(declare-fun m!648963 () Bool)

(assert (=> b!683984 m!648963))

(declare-fun m!648965 () Bool)

(assert (=> b!683984 m!648965))

(declare-fun m!648967 () Bool)

(assert (=> b!683981 m!648967))

(declare-fun m!648969 () Bool)

(assert (=> b!683986 m!648969))

(declare-fun m!648971 () Bool)

(assert (=> b!683979 m!648971))

(declare-fun m!648973 () Bool)

(assert (=> b!683969 m!648973))

(declare-fun m!648975 () Bool)

(assert (=> b!683972 m!648975))

(declare-fun m!648977 () Bool)

(assert (=> b!683974 m!648977))

(declare-fun m!648979 () Bool)

(assert (=> b!683977 m!648979))

(declare-fun m!648981 () Bool)

(assert (=> b!683968 m!648981))

(declare-fun m!648983 () Bool)

(assert (=> b!683976 m!648983))

(declare-fun m!648985 () Bool)

(assert (=> start!61036 m!648985))

(assert (=> b!683978 m!648969))

(assert (=> b!683982 m!648955))

(assert (=> b!683982 m!648957))

(declare-fun m!648987 () Bool)

(assert (=> b!683982 m!648987))

(declare-fun m!648989 () Bool)

(assert (=> b!683982 m!648989))

(declare-fun m!648991 () Bool)

(assert (=> b!683982 m!648991))

(assert (=> b!683982 m!648963))

(declare-fun m!648993 () Bool)

(assert (=> b!683982 m!648993))

(declare-fun m!648995 () Bool)

(assert (=> b!683982 m!648995))

(assert (=> b!683982 m!648957))

(declare-fun m!648997 () Bool)

(assert (=> b!683982 m!648997))

(declare-fun m!648999 () Bool)

(assert (=> b!683982 m!648999))

(assert (=> b!683982 m!648965))

(declare-fun m!649001 () Bool)

(assert (=> b!683970 m!649001))

(push 1)

(assert (not b!683972))

(assert (not b!683979))

(assert (not b!683977))

(assert (not b!683984))

(assert (not b!683976))

(assert (not b!683974))

(assert (not start!61036))

(assert (not b!683982))

(assert (not b!683970))

(assert (not b!683978))

(assert (not b!683969))

(assert (not b!683981))

(assert (not b!683986))

(assert (not b!683968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

