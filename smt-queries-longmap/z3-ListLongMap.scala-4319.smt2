; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59930 () Bool)

(assert start!59930)

(declare-fun b!664107 () Bool)

(declare-datatypes ((Unit!23138 0))(
  ( (Unit!23139) )
))
(declare-fun e!380841 () Unit!23138)

(declare-fun Unit!23140 () Unit!23138)

(assert (=> b!664107 (= e!380841 Unit!23140)))

(declare-fun b!664108 () Bool)

(declare-fun res!431982 () Bool)

(declare-fun e!380843 () Bool)

(assert (=> b!664108 (=> (not res!431982) (not e!380843))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664108 (= res!431982 (validKeyInArray!0 k0!2843))))

(declare-fun b!664109 () Bool)

(declare-fun res!431978 () Bool)

(assert (=> b!664109 (=> (not res!431978) (not e!380843))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38988 0))(
  ( (array!38989 (arr!18686 (Array (_ BitVec 32) (_ BitVec 64))) (size!19051 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38988)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!664109 (= res!431978 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19051 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664110 () Bool)

(declare-fun res!431975 () Bool)

(assert (=> b!664110 (=> (not res!431975) (not e!380843))))

(declare-datatypes ((List!12766 0))(
  ( (Nil!12763) (Cons!12762 (h!13807 (_ BitVec 64)) (t!18985 List!12766)) )
))
(declare-fun acc!681 () List!12766)

(declare-fun arrayNoDuplicates!0 (array!38988 (_ BitVec 32) List!12766) Bool)

(assert (=> b!664110 (= res!431975 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664111 () Bool)

(declare-fun res!431976 () Bool)

(assert (=> b!664111 (=> (not res!431976) (not e!380843))))

(declare-fun noDuplicate!557 (List!12766) Bool)

(assert (=> b!664111 (= res!431976 (noDuplicate!557 acc!681))))

(declare-fun b!664112 () Bool)

(declare-fun res!431964 () Bool)

(declare-fun e!380836 () Bool)

(assert (=> b!664112 (=> res!431964 e!380836)))

(declare-fun lt!309349 () Bool)

(assert (=> b!664112 (= res!431964 lt!309349)))

(declare-fun b!664113 () Bool)

(declare-fun res!431980 () Bool)

(assert (=> b!664113 (=> res!431980 e!380836)))

(declare-fun lt!309352 () List!12766)

(declare-fun contains!3288 (List!12766 (_ BitVec 64)) Bool)

(assert (=> b!664113 (= res!431980 (not (contains!3288 lt!309352 k0!2843)))))

(declare-fun b!664114 () Bool)

(assert (=> b!664114 (= e!380836 true)))

(declare-fun lt!309348 () Bool)

(assert (=> b!664114 (= lt!309348 (contains!3288 lt!309352 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664116 () Bool)

(declare-fun e!380837 () Bool)

(declare-fun e!380838 () Bool)

(assert (=> b!664116 (= e!380837 e!380838)))

(declare-fun res!431974 () Bool)

(assert (=> b!664116 (=> (not res!431974) (not e!380838))))

(assert (=> b!664116 (= res!431974 (bvsle from!3004 i!1382))))

(declare-fun b!664117 () Bool)

(assert (=> b!664117 (= e!380843 (not e!380836))))

(declare-fun res!431968 () Bool)

(assert (=> b!664117 (=> res!431968 e!380836)))

(assert (=> b!664117 (= res!431968 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!42 (List!12766 (_ BitVec 64)) List!12766)

(assert (=> b!664117 (= (-!42 lt!309352 k0!2843) acc!681)))

(declare-fun $colon$colon!175 (List!12766 (_ BitVec 64)) List!12766)

(assert (=> b!664117 (= lt!309352 ($colon$colon!175 acc!681 k0!2843))))

(declare-fun lt!309355 () Unit!23138)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12766) Unit!23138)

(assert (=> b!664117 (= lt!309355 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!44 (List!12766 List!12766) Bool)

(assert (=> b!664117 (subseq!44 acc!681 acc!681)))

(declare-fun lt!309356 () Unit!23138)

(declare-fun lemmaListSubSeqRefl!0 (List!12766) Unit!23138)

(assert (=> b!664117 (= lt!309356 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664117 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309353 () Unit!23138)

(assert (=> b!664117 (= lt!309353 e!380841)))

(declare-fun c!76440 () Bool)

(assert (=> b!664117 (= c!76440 (validKeyInArray!0 (select (arr!18686 a!3626) from!3004)))))

(declare-fun lt!309354 () Unit!23138)

(declare-fun e!380842 () Unit!23138)

(assert (=> b!664117 (= lt!309354 e!380842)))

(declare-fun c!76439 () Bool)

(assert (=> b!664117 (= c!76439 lt!309349)))

(declare-fun arrayContainsKey!0 (array!38988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664117 (= lt!309349 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664117 (arrayContainsKey!0 (array!38989 (store (arr!18686 a!3626) i!1382 k0!2843) (size!19051 a!3626)) k0!2843 from!3004)))

(declare-fun b!664118 () Bool)

(declare-fun res!431966 () Bool)

(assert (=> b!664118 (=> (not res!431966) (not e!380843))))

(assert (=> b!664118 (= res!431966 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19051 a!3626))))))

(declare-fun b!664119 () Bool)

(declare-fun res!431973 () Bool)

(assert (=> b!664119 (=> res!431973 e!380836)))

(assert (=> b!664119 (= res!431973 (not (noDuplicate!557 lt!309352)))))

(declare-fun b!664120 () Bool)

(declare-fun res!431981 () Bool)

(assert (=> b!664120 (=> (not res!431981) (not e!380843))))

(assert (=> b!664120 (= res!431981 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12763))))

(declare-fun b!664121 () Bool)

(declare-fun res!431967 () Bool)

(assert (=> b!664121 (=> (not res!431967) (not e!380843))))

(assert (=> b!664121 (= res!431967 (not (contains!3288 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664122 () Bool)

(declare-fun res!431983 () Bool)

(assert (=> b!664122 (=> res!431983 e!380836)))

(assert (=> b!664122 (= res!431983 (contains!3288 acc!681 k0!2843))))

(declare-fun b!664123 () Bool)

(declare-fun res!431963 () Bool)

(assert (=> b!664123 (=> res!431963 e!380836)))

(assert (=> b!664123 (= res!431963 (not (subseq!44 acc!681 lt!309352)))))

(declare-fun b!664124 () Bool)

(declare-fun res!431971 () Bool)

(assert (=> b!664124 (=> res!431971 e!380836)))

(assert (=> b!664124 (= res!431971 (contains!3288 lt!309352 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664125 () Bool)

(assert (=> b!664125 (= e!380838 (not (contains!3288 acc!681 k0!2843)))))

(declare-fun b!664126 () Bool)

(declare-fun Unit!23141 () Unit!23138)

(assert (=> b!664126 (= e!380842 Unit!23141)))

(declare-fun lt!309350 () Unit!23138)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38988 (_ BitVec 64) (_ BitVec 32)) Unit!23138)

(assert (=> b!664126 (= lt!309350 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664126 false))

(declare-fun b!664127 () Bool)

(declare-fun lt!309357 () Unit!23138)

(assert (=> b!664127 (= e!380841 lt!309357)))

(declare-fun lt!309351 () Unit!23138)

(assert (=> b!664127 (= lt!309351 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664127 (subseq!44 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38988 List!12766 List!12766 (_ BitVec 32)) Unit!23138)

(assert (=> b!664127 (= lt!309357 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!175 acc!681 (select (arr!18686 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664127 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664128 () Bool)

(declare-fun res!431969 () Bool)

(assert (=> b!664128 (=> (not res!431969) (not e!380843))))

(assert (=> b!664128 (= res!431969 e!380837)))

(declare-fun res!431977 () Bool)

(assert (=> b!664128 (=> res!431977 e!380837)))

(declare-fun e!380840 () Bool)

(assert (=> b!664128 (= res!431977 e!380840)))

(declare-fun res!431979 () Bool)

(assert (=> b!664128 (=> (not res!431979) (not e!380840))))

(assert (=> b!664128 (= res!431979 (bvsgt from!3004 i!1382))))

(declare-fun b!664115 () Bool)

(assert (=> b!664115 (= e!380840 (contains!3288 acc!681 k0!2843))))

(declare-fun res!431972 () Bool)

(assert (=> start!59930 (=> (not res!431972) (not e!380843))))

(assert (=> start!59930 (= res!431972 (and (bvslt (size!19051 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19051 a!3626))))))

(assert (=> start!59930 e!380843))

(assert (=> start!59930 true))

(declare-fun array_inv!14569 (array!38988) Bool)

(assert (=> start!59930 (array_inv!14569 a!3626)))

(declare-fun b!664129 () Bool)

(declare-fun res!431970 () Bool)

(assert (=> b!664129 (=> (not res!431970) (not e!380843))))

(assert (=> b!664129 (= res!431970 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664130 () Bool)

(declare-fun res!431965 () Bool)

(assert (=> b!664130 (=> (not res!431965) (not e!380843))))

(assert (=> b!664130 (= res!431965 (not (contains!3288 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664131 () Bool)

(declare-fun Unit!23142 () Unit!23138)

(assert (=> b!664131 (= e!380842 Unit!23142)))

(assert (= (and start!59930 res!431972) b!664111))

(assert (= (and b!664111 res!431976) b!664130))

(assert (= (and b!664130 res!431965) b!664121))

(assert (= (and b!664121 res!431967) b!664128))

(assert (= (and b!664128 res!431979) b!664115))

(assert (= (and b!664128 (not res!431977)) b!664116))

(assert (= (and b!664116 res!431974) b!664125))

(assert (= (and b!664128 res!431969) b!664120))

(assert (= (and b!664120 res!431981) b!664110))

(assert (= (and b!664110 res!431975) b!664118))

(assert (= (and b!664118 res!431966) b!664108))

(assert (= (and b!664108 res!431982) b!664129))

(assert (= (and b!664129 res!431970) b!664109))

(assert (= (and b!664109 res!431978) b!664117))

(assert (= (and b!664117 c!76439) b!664126))

(assert (= (and b!664117 (not c!76439)) b!664131))

(assert (= (and b!664117 c!76440) b!664127))

(assert (= (and b!664117 (not c!76440)) b!664107))

(assert (= (and b!664117 (not res!431968)) b!664119))

(assert (= (and b!664119 (not res!431973)) b!664112))

(assert (= (and b!664112 (not res!431964)) b!664122))

(assert (= (and b!664122 (not res!431983)) b!664123))

(assert (= (and b!664123 (not res!431963)) b!664113))

(assert (= (and b!664113 (not res!431980)) b!664124))

(assert (= (and b!664124 (not res!431971)) b!664114))

(declare-fun m!634935 () Bool)

(assert (=> b!664117 m!634935))

(declare-fun m!634937 () Bool)

(assert (=> b!664117 m!634937))

(declare-fun m!634939 () Bool)

(assert (=> b!664117 m!634939))

(declare-fun m!634941 () Bool)

(assert (=> b!664117 m!634941))

(declare-fun m!634943 () Bool)

(assert (=> b!664117 m!634943))

(declare-fun m!634945 () Bool)

(assert (=> b!664117 m!634945))

(assert (=> b!664117 m!634937))

(declare-fun m!634947 () Bool)

(assert (=> b!664117 m!634947))

(declare-fun m!634949 () Bool)

(assert (=> b!664117 m!634949))

(declare-fun m!634951 () Bool)

(assert (=> b!664117 m!634951))

(declare-fun m!634953 () Bool)

(assert (=> b!664117 m!634953))

(declare-fun m!634955 () Bool)

(assert (=> b!664117 m!634955))

(declare-fun m!634957 () Bool)

(assert (=> b!664110 m!634957))

(declare-fun m!634959 () Bool)

(assert (=> b!664124 m!634959))

(declare-fun m!634961 () Bool)

(assert (=> b!664113 m!634961))

(assert (=> b!664127 m!634935))

(assert (=> b!664127 m!634937))

(declare-fun m!634963 () Bool)

(assert (=> b!664127 m!634963))

(declare-fun m!634965 () Bool)

(assert (=> b!664127 m!634965))

(assert (=> b!664127 m!634937))

(assert (=> b!664127 m!634963))

(assert (=> b!664127 m!634943))

(assert (=> b!664127 m!634955))

(declare-fun m!634967 () Bool)

(assert (=> b!664125 m!634967))

(declare-fun m!634969 () Bool)

(assert (=> start!59930 m!634969))

(declare-fun m!634971 () Bool)

(assert (=> b!664121 m!634971))

(declare-fun m!634973 () Bool)

(assert (=> b!664126 m!634973))

(declare-fun m!634975 () Bool)

(assert (=> b!664119 m!634975))

(declare-fun m!634977 () Bool)

(assert (=> b!664123 m!634977))

(assert (=> b!664115 m!634967))

(declare-fun m!634979 () Bool)

(assert (=> b!664111 m!634979))

(declare-fun m!634981 () Bool)

(assert (=> b!664129 m!634981))

(declare-fun m!634983 () Bool)

(assert (=> b!664120 m!634983))

(assert (=> b!664122 m!634967))

(declare-fun m!634985 () Bool)

(assert (=> b!664108 m!634985))

(declare-fun m!634987 () Bool)

(assert (=> b!664130 m!634987))

(declare-fun m!634989 () Bool)

(assert (=> b!664114 m!634989))

(check-sat (not b!664129) (not b!664111) (not b!664119) (not b!664115) (not b!664117) (not b!664124) (not b!664108) (not b!664110) (not b!664130) (not b!664125) (not b!664127) (not b!664120) (not start!59930) (not b!664123) (not b!664121) (not b!664113) (not b!664114) (not b!664122) (not b!664126))
(check-sat)
