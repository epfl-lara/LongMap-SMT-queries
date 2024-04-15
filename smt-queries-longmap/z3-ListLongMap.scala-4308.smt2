; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59864 () Bool)

(assert start!59864)

(declare-fun b!662076 () Bool)

(declare-fun res!430252 () Bool)

(declare-fun e!380091 () Bool)

(assert (=> b!662076 (=> res!430252 e!380091)))

(declare-datatypes ((List!12733 0))(
  ( (Nil!12730) (Cons!12729 (h!13774 (_ BitVec 64)) (t!18952 List!12733)) )
))
(declare-fun lt!308739 () List!12733)

(declare-fun noDuplicate!524 (List!12733) Bool)

(assert (=> b!662076 (= res!430252 (not (noDuplicate!524 lt!308739)))))

(declare-fun b!662077 () Bool)

(declare-fun res!430256 () Bool)

(assert (=> b!662077 (=> res!430256 e!380091)))

(declare-fun contains!3255 (List!12733 (_ BitVec 64)) Bool)

(assert (=> b!662077 (= res!430256 (contains!3255 lt!308739 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662078 () Bool)

(declare-datatypes ((Unit!22988 0))(
  ( (Unit!22989) )
))
(declare-fun e!380096 () Unit!22988)

(declare-fun Unit!22990 () Unit!22988)

(assert (=> b!662078 (= e!380096 Unit!22990)))

(declare-fun b!662079 () Bool)

(declare-fun Unit!22991 () Unit!22988)

(assert (=> b!662079 (= e!380096 Unit!22991)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!308741 () Unit!22988)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-datatypes ((array!38922 0))(
  ( (array!38923 (arr!18653 (Array (_ BitVec 32) (_ BitVec 64))) (size!19018 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38922)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38922 (_ BitVec 64) (_ BitVec 32)) Unit!22988)

(assert (=> b!662079 (= lt!308741 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662079 false))

(declare-fun b!662080 () Bool)

(declare-fun res!430248 () Bool)

(declare-fun e!380090 () Bool)

(assert (=> b!662080 (=> (not res!430248) (not e!380090))))

(declare-fun acc!681 () List!12733)

(declare-fun arrayNoDuplicates!0 (array!38922 (_ BitVec 32) List!12733) Bool)

(assert (=> b!662080 (= res!430248 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662081 () Bool)

(declare-fun res!430243 () Bool)

(assert (=> b!662081 (=> (not res!430243) (not e!380090))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662081 (= res!430243 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19018 a!3626))))))

(declare-fun b!662082 () Bool)

(declare-fun e!380095 () Bool)

(assert (=> b!662082 (= e!380095 (not (contains!3255 acc!681 k0!2843)))))

(declare-fun b!662083 () Bool)

(declare-fun res!430249 () Bool)

(assert (=> b!662083 (=> res!430249 e!380091)))

(declare-fun subseq!11 (List!12733 List!12733) Bool)

(assert (=> b!662083 (= res!430249 (not (subseq!11 acc!681 lt!308739)))))

(declare-fun b!662084 () Bool)

(declare-fun res!430260 () Bool)

(assert (=> b!662084 (=> (not res!430260) (not e!380090))))

(declare-fun arrayContainsKey!0 (array!38922 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662084 (= res!430260 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!430244 () Bool)

(assert (=> start!59864 (=> (not res!430244) (not e!380090))))

(assert (=> start!59864 (= res!430244 (and (bvslt (size!19018 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19018 a!3626))))))

(assert (=> start!59864 e!380090))

(assert (=> start!59864 true))

(declare-fun array_inv!14536 (array!38922) Bool)

(assert (=> start!59864 (array_inv!14536 a!3626)))

(declare-fun b!662085 () Bool)

(declare-fun res!430253 () Bool)

(assert (=> b!662085 (=> res!430253 e!380091)))

(assert (=> b!662085 (= res!430253 (contains!3255 lt!308739 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662086 () Bool)

(assert (=> b!662086 (= e!380091 true)))

(declare-fun lt!308738 () Bool)

(assert (=> b!662086 (= lt!308738 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308739))))

(declare-fun lt!308740 () Unit!22988)

(declare-fun noDuplicateSubseq!11 (List!12733 List!12733) Unit!22988)

(assert (=> b!662086 (= lt!308740 (noDuplicateSubseq!11 acc!681 lt!308739))))

(declare-fun b!662087 () Bool)

(declare-fun res!430246 () Bool)

(assert (=> b!662087 (=> (not res!430246) (not e!380090))))

(assert (=> b!662087 (= res!430246 (noDuplicate!524 acc!681))))

(declare-fun b!662088 () Bool)

(declare-fun e!380094 () Bool)

(assert (=> b!662088 (= e!380094 e!380095)))

(declare-fun res!430261 () Bool)

(assert (=> b!662088 (=> (not res!430261) (not e!380095))))

(assert (=> b!662088 (= res!430261 (bvsle from!3004 i!1382))))

(declare-fun b!662089 () Bool)

(declare-fun res!430251 () Bool)

(assert (=> b!662089 (=> (not res!430251) (not e!380090))))

(assert (=> b!662089 (= res!430251 (not (contains!3255 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662090 () Bool)

(declare-fun res!430250 () Bool)

(assert (=> b!662090 (=> (not res!430250) (not e!380090))))

(assert (=> b!662090 (= res!430250 e!380094)))

(declare-fun res!430259 () Bool)

(assert (=> b!662090 (=> res!430259 e!380094)))

(declare-fun e!380093 () Bool)

(assert (=> b!662090 (= res!430259 e!380093)))

(declare-fun res!430255 () Bool)

(assert (=> b!662090 (=> (not res!430255) (not e!380093))))

(assert (=> b!662090 (= res!430255 (bvsgt from!3004 i!1382))))

(declare-fun b!662091 () Bool)

(declare-fun res!430257 () Bool)

(assert (=> b!662091 (=> (not res!430257) (not e!380090))))

(assert (=> b!662091 (= res!430257 (not (contains!3255 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662092 () Bool)

(declare-fun res!430254 () Bool)

(assert (=> b!662092 (=> (not res!430254) (not e!380090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662092 (= res!430254 (validKeyInArray!0 k0!2843))))

(declare-fun b!662093 () Bool)

(declare-fun res!430242 () Bool)

(assert (=> b!662093 (=> (not res!430242) (not e!380090))))

(assert (=> b!662093 (= res!430242 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12730))))

(declare-fun b!662094 () Bool)

(declare-fun res!430245 () Bool)

(assert (=> b!662094 (=> (not res!430245) (not e!380090))))

(assert (=> b!662094 (= res!430245 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19018 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662095 () Bool)

(declare-fun e!380092 () Bool)

(assert (=> b!662095 (= e!380090 (not e!380092))))

(declare-fun res!430247 () Bool)

(assert (=> b!662095 (=> res!430247 e!380092)))

(assert (=> b!662095 (= res!430247 (not (validKeyInArray!0 (select (arr!18653 a!3626) from!3004))))))

(declare-fun lt!308737 () Unit!22988)

(assert (=> b!662095 (= lt!308737 e!380096)))

(declare-fun c!76284 () Bool)

(assert (=> b!662095 (= c!76284 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662095 (arrayContainsKey!0 (array!38923 (store (arr!18653 a!3626) i!1382 k0!2843) (size!19018 a!3626)) k0!2843 from!3004)))

(declare-fun b!662096 () Bool)

(assert (=> b!662096 (= e!380092 e!380091)))

(declare-fun res!430258 () Bool)

(assert (=> b!662096 (=> res!430258 e!380091)))

(assert (=> b!662096 (= res!430258 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!142 (List!12733 (_ BitVec 64)) List!12733)

(assert (=> b!662096 (= lt!308739 ($colon$colon!142 acc!681 (select (arr!18653 a!3626) from!3004)))))

(assert (=> b!662096 (subseq!11 acc!681 acc!681)))

(declare-fun lt!308742 () Unit!22988)

(declare-fun lemmaListSubSeqRefl!0 (List!12733) Unit!22988)

(assert (=> b!662096 (= lt!308742 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662097 () Bool)

(assert (=> b!662097 (= e!380093 (contains!3255 acc!681 k0!2843))))

(assert (= (and start!59864 res!430244) b!662087))

(assert (= (and b!662087 res!430246) b!662089))

(assert (= (and b!662089 res!430251) b!662091))

(assert (= (and b!662091 res!430257) b!662090))

(assert (= (and b!662090 res!430255) b!662097))

(assert (= (and b!662090 (not res!430259)) b!662088))

(assert (= (and b!662088 res!430261) b!662082))

(assert (= (and b!662090 res!430250) b!662093))

(assert (= (and b!662093 res!430242) b!662080))

(assert (= (and b!662080 res!430248) b!662081))

(assert (= (and b!662081 res!430243) b!662092))

(assert (= (and b!662092 res!430254) b!662084))

(assert (= (and b!662084 res!430260) b!662094))

(assert (= (and b!662094 res!430245) b!662095))

(assert (= (and b!662095 c!76284) b!662079))

(assert (= (and b!662095 (not c!76284)) b!662078))

(assert (= (and b!662095 (not res!430247)) b!662096))

(assert (= (and b!662096 (not res!430258)) b!662076))

(assert (= (and b!662076 (not res!430252)) b!662085))

(assert (= (and b!662085 (not res!430253)) b!662077))

(assert (= (and b!662077 (not res!430256)) b!662083))

(assert (= (and b!662083 (not res!430249)) b!662086))

(declare-fun m!633447 () Bool)

(assert (=> b!662096 m!633447))

(assert (=> b!662096 m!633447))

(declare-fun m!633449 () Bool)

(assert (=> b!662096 m!633449))

(declare-fun m!633451 () Bool)

(assert (=> b!662096 m!633451))

(declare-fun m!633453 () Bool)

(assert (=> b!662096 m!633453))

(declare-fun m!633455 () Bool)

(assert (=> b!662076 m!633455))

(declare-fun m!633457 () Bool)

(assert (=> start!59864 m!633457))

(declare-fun m!633459 () Bool)

(assert (=> b!662083 m!633459))

(declare-fun m!633461 () Bool)

(assert (=> b!662085 m!633461))

(declare-fun m!633463 () Bool)

(assert (=> b!662093 m!633463))

(declare-fun m!633465 () Bool)

(assert (=> b!662082 m!633465))

(declare-fun m!633467 () Bool)

(assert (=> b!662077 m!633467))

(assert (=> b!662097 m!633465))

(declare-fun m!633469 () Bool)

(assert (=> b!662087 m!633469))

(declare-fun m!633471 () Bool)

(assert (=> b!662092 m!633471))

(declare-fun m!633473 () Bool)

(assert (=> b!662091 m!633473))

(declare-fun m!633475 () Bool)

(assert (=> b!662079 m!633475))

(declare-fun m!633477 () Bool)

(assert (=> b!662086 m!633477))

(declare-fun m!633479 () Bool)

(assert (=> b!662086 m!633479))

(declare-fun m!633481 () Bool)

(assert (=> b!662089 m!633481))

(declare-fun m!633483 () Bool)

(assert (=> b!662080 m!633483))

(assert (=> b!662095 m!633447))

(declare-fun m!633485 () Bool)

(assert (=> b!662095 m!633485))

(declare-fun m!633487 () Bool)

(assert (=> b!662095 m!633487))

(assert (=> b!662095 m!633447))

(declare-fun m!633489 () Bool)

(assert (=> b!662095 m!633489))

(declare-fun m!633491 () Bool)

(assert (=> b!662095 m!633491))

(declare-fun m!633493 () Bool)

(assert (=> b!662084 m!633493))

(check-sat (not b!662089) (not b!662092) (not b!662097) (not b!662096) (not b!662084) (not b!662076) (not b!662087) (not start!59864) (not b!662079) (not b!662083) (not b!662095) (not b!662082) (not b!662091) (not b!662086) (not b!662093) (not b!662080) (not b!662077) (not b!662085))
(check-sat)
