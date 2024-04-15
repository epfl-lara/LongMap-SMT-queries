; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60990 () Bool)

(assert start!60990)

(declare-fun b!684193 () Bool)

(declare-datatypes ((Unit!24075 0))(
  ( (Unit!24076) )
))
(declare-fun e!389602 () Unit!24075)

(declare-fun Unit!24077 () Unit!24075)

(assert (=> b!684193 (= e!389602 Unit!24077)))

(declare-fun lt!314093 () Unit!24075)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39610 0))(
  ( (array!39611 (arr!18985 (Array (_ BitVec 32) (_ BitVec 64))) (size!19352 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39610)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39610 (_ BitVec 64) (_ BitVec 32)) Unit!24075)

(assert (=> b!684193 (= lt!314093 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684193 false))

(declare-fun b!684194 () Bool)

(declare-fun res!449923 () Bool)

(declare-fun e!389600 () Bool)

(assert (=> b!684194 (=> (not res!449923) (not e!389600))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684194 (= res!449923 (validKeyInArray!0 k!2843))))

(declare-fun b!684195 () Bool)

(declare-fun res!449920 () Bool)

(assert (=> b!684195 (=> (not res!449920) (not e!389600))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684195 (= res!449920 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19352 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684196 () Bool)

(declare-fun e!389603 () Bool)

(assert (=> b!684196 (= e!389603 true)))

(declare-fun lt!314092 () Bool)

(declare-datatypes ((List!13065 0))(
  ( (Nil!13062) (Cons!13061 (h!14106 (_ BitVec 64)) (t!19302 List!13065)) )
))
(declare-fun acc!681 () List!13065)

(declare-fun contains!3587 (List!13065 (_ BitVec 64)) Bool)

(assert (=> b!684196 (= lt!314092 (contains!3587 acc!681 k!2843))))

(declare-fun b!684197 () Bool)

(declare-fun res!449911 () Bool)

(assert (=> b!684197 (=> (not res!449911) (not e!389600))))

(declare-fun arrayNoDuplicates!0 (array!39610 (_ BitVec 32) List!13065) Bool)

(assert (=> b!684197 (= res!449911 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13062))))

(declare-fun b!684198 () Bool)

(declare-fun res!449912 () Bool)

(assert (=> b!684198 (=> (not res!449912) (not e!389600))))

(assert (=> b!684198 (= res!449912 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684199 () Bool)

(declare-fun e!389606 () Unit!24075)

(declare-fun Unit!24078 () Unit!24075)

(assert (=> b!684199 (= e!389606 Unit!24078)))

(declare-fun b!684201 () Bool)

(assert (=> b!684201 (= e!389600 (not e!389603))))

(declare-fun res!449907 () Bool)

(assert (=> b!684201 (=> res!449907 e!389603)))

(assert (=> b!684201 (= res!449907 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!314100 () List!13065)

(declare-fun -!155 (List!13065 (_ BitVec 64)) List!13065)

(assert (=> b!684201 (= (-!155 lt!314100 k!2843) acc!681)))

(declare-fun $colon$colon!354 (List!13065 (_ BitVec 64)) List!13065)

(assert (=> b!684201 (= lt!314100 ($colon$colon!354 acc!681 k!2843))))

(declare-fun lt!314097 () Unit!24075)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13065) Unit!24075)

(assert (=> b!684201 (= lt!314097 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!190 (List!13065 List!13065) Bool)

(assert (=> b!684201 (subseq!190 acc!681 acc!681)))

(declare-fun lt!314098 () Unit!24075)

(declare-fun lemmaListSubSeqRefl!0 (List!13065) Unit!24075)

(assert (=> b!684201 (= lt!314098 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684201 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314095 () Unit!24075)

(assert (=> b!684201 (= lt!314095 e!389606)))

(declare-fun c!77511 () Bool)

(assert (=> b!684201 (= c!77511 (validKeyInArray!0 (select (arr!18985 a!3626) from!3004)))))

(declare-fun lt!314096 () Unit!24075)

(assert (=> b!684201 (= lt!314096 e!389602)))

(declare-fun c!77510 () Bool)

(declare-fun lt!314099 () Bool)

(assert (=> b!684201 (= c!77510 lt!314099)))

(declare-fun arrayContainsKey!0 (array!39610 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684201 (= lt!314099 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684201 (arrayContainsKey!0 (array!39611 (store (arr!18985 a!3626) i!1382 k!2843) (size!19352 a!3626)) k!2843 from!3004)))

(declare-fun b!684202 () Bool)

(declare-fun res!449910 () Bool)

(assert (=> b!684202 (=> res!449910 e!389603)))

(assert (=> b!684202 (= res!449910 lt!314099)))

(declare-fun b!684203 () Bool)

(declare-fun e!389604 () Bool)

(declare-fun e!389605 () Bool)

(assert (=> b!684203 (= e!389604 e!389605)))

(declare-fun res!449909 () Bool)

(assert (=> b!684203 (=> (not res!449909) (not e!389605))))

(assert (=> b!684203 (= res!449909 (bvsle from!3004 i!1382))))

(declare-fun b!684204 () Bool)

(declare-fun e!389601 () Bool)

(assert (=> b!684204 (= e!389601 (contains!3587 acc!681 k!2843))))

(declare-fun b!684205 () Bool)

(declare-fun res!449921 () Bool)

(assert (=> b!684205 (=> (not res!449921) (not e!389600))))

(assert (=> b!684205 (= res!449921 (not (contains!3587 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684206 () Bool)

(declare-fun res!449914 () Bool)

(assert (=> b!684206 (=> (not res!449914) (not e!389600))))

(assert (=> b!684206 (= res!449914 e!389604)))

(declare-fun res!449915 () Bool)

(assert (=> b!684206 (=> res!449915 e!389604)))

(assert (=> b!684206 (= res!449915 e!389601)))

(declare-fun res!449913 () Bool)

(assert (=> b!684206 (=> (not res!449913) (not e!389601))))

(assert (=> b!684206 (= res!449913 (bvsgt from!3004 i!1382))))

(declare-fun b!684207 () Bool)

(declare-fun Unit!24079 () Unit!24075)

(assert (=> b!684207 (= e!389602 Unit!24079)))

(declare-fun b!684208 () Bool)

(declare-fun res!449908 () Bool)

(assert (=> b!684208 (=> (not res!449908) (not e!389600))))

(assert (=> b!684208 (= res!449908 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684209 () Bool)

(declare-fun res!449916 () Bool)

(assert (=> b!684209 (=> (not res!449916) (not e!389600))))

(assert (=> b!684209 (= res!449916 (not (contains!3587 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684210 () Bool)

(declare-fun lt!314094 () Unit!24075)

(assert (=> b!684210 (= e!389606 lt!314094)))

(declare-fun lt!314091 () Unit!24075)

(assert (=> b!684210 (= lt!314091 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684210 (subseq!190 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39610 List!13065 List!13065 (_ BitVec 32)) Unit!24075)

(assert (=> b!684210 (= lt!314094 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!354 acc!681 (select (arr!18985 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684210 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684211 () Bool)

(declare-fun res!449917 () Bool)

(assert (=> b!684211 (=> (not res!449917) (not e!389600))))

(declare-fun noDuplicate!856 (List!13065) Bool)

(assert (=> b!684211 (= res!449917 (noDuplicate!856 acc!681))))

(declare-fun b!684212 () Bool)

(declare-fun res!449918 () Bool)

(assert (=> b!684212 (=> (not res!449918) (not e!389600))))

(assert (=> b!684212 (= res!449918 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19352 a!3626))))))

(declare-fun b!684213 () Bool)

(assert (=> b!684213 (= e!389605 (not (contains!3587 acc!681 k!2843)))))

(declare-fun res!449922 () Bool)

(assert (=> start!60990 (=> (not res!449922) (not e!389600))))

(assert (=> start!60990 (= res!449922 (and (bvslt (size!19352 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19352 a!3626))))))

(assert (=> start!60990 e!389600))

(assert (=> start!60990 true))

(declare-fun array_inv!14868 (array!39610) Bool)

(assert (=> start!60990 (array_inv!14868 a!3626)))

(declare-fun b!684200 () Bool)

(declare-fun res!449919 () Bool)

(assert (=> b!684200 (=> res!449919 e!389603)))

(assert (=> b!684200 (= res!449919 (not (noDuplicate!856 lt!314100)))))

(assert (= (and start!60990 res!449922) b!684211))

(assert (= (and b!684211 res!449917) b!684209))

(assert (= (and b!684209 res!449916) b!684205))

(assert (= (and b!684205 res!449921) b!684206))

(assert (= (and b!684206 res!449913) b!684204))

(assert (= (and b!684206 (not res!449915)) b!684203))

(assert (= (and b!684203 res!449909) b!684213))

(assert (= (and b!684206 res!449914) b!684197))

(assert (= (and b!684197 res!449911) b!684198))

(assert (= (and b!684198 res!449912) b!684212))

(assert (= (and b!684212 res!449918) b!684194))

(assert (= (and b!684194 res!449923) b!684208))

(assert (= (and b!684208 res!449908) b!684195))

(assert (= (and b!684195 res!449920) b!684201))

(assert (= (and b!684201 c!77510) b!684193))

(assert (= (and b!684201 (not c!77510)) b!684207))

(assert (= (and b!684201 c!77511) b!684210))

(assert (= (and b!684201 (not c!77511)) b!684199))

(assert (= (and b!684201 (not res!449907)) b!684200))

(assert (= (and b!684200 (not res!449919)) b!684202))

(assert (= (and b!684202 (not res!449910)) b!684196))

(declare-fun m!648051 () Bool)

(assert (=> b!684197 m!648051))

(declare-fun m!648053 () Bool)

(assert (=> b!684209 m!648053))

(declare-fun m!648055 () Bool)

(assert (=> b!684198 m!648055))

(declare-fun m!648057 () Bool)

(assert (=> b!684211 m!648057))

(declare-fun m!648059 () Bool)

(assert (=> b!684210 m!648059))

(declare-fun m!648061 () Bool)

(assert (=> b!684210 m!648061))

(declare-fun m!648063 () Bool)

(assert (=> b!684210 m!648063))

(declare-fun m!648065 () Bool)

(assert (=> b!684210 m!648065))

(assert (=> b!684210 m!648061))

(assert (=> b!684210 m!648063))

(declare-fun m!648067 () Bool)

(assert (=> b!684210 m!648067))

(declare-fun m!648069 () Bool)

(assert (=> b!684210 m!648069))

(declare-fun m!648071 () Bool)

(assert (=> start!60990 m!648071))

(declare-fun m!648073 () Bool)

(assert (=> b!684213 m!648073))

(assert (=> b!684196 m!648073))

(declare-fun m!648075 () Bool)

(assert (=> b!684205 m!648075))

(declare-fun m!648077 () Bool)

(assert (=> b!684208 m!648077))

(declare-fun m!648079 () Bool)

(assert (=> b!684194 m!648079))

(assert (=> b!684204 m!648073))

(assert (=> b!684201 m!648059))

(assert (=> b!684201 m!648061))

(declare-fun m!648081 () Bool)

(assert (=> b!684201 m!648081))

(assert (=> b!684201 m!648067))

(declare-fun m!648083 () Bool)

(assert (=> b!684201 m!648083))

(declare-fun m!648085 () Bool)

(assert (=> b!684201 m!648085))

(assert (=> b!684201 m!648061))

(declare-fun m!648087 () Bool)

(assert (=> b!684201 m!648087))

(declare-fun m!648089 () Bool)

(assert (=> b!684201 m!648089))

(declare-fun m!648091 () Bool)

(assert (=> b!684201 m!648091))

(declare-fun m!648093 () Bool)

(assert (=> b!684201 m!648093))

(assert (=> b!684201 m!648069))

(declare-fun m!648095 () Bool)

(assert (=> b!684193 m!648095))

(declare-fun m!648097 () Bool)

(assert (=> b!684200 m!648097))

(push 1)

(assert (not b!684204))

(assert (not b!684208))

(assert (not b!684196))

(assert (not b!684213))

(assert (not b!684210))

(assert (not b!684200))

(assert (not start!60990))

(assert (not b!684198))

(assert (not b!684197))

(assert (not b!684211))

(assert (not b!684193))

(assert (not b!684209))

(assert (not b!684205))

(assert (not b!684201))

(assert (not b!684194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

