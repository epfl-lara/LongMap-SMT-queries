; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60006 () Bool)

(assert start!60006)

(declare-fun b!666957 () Bool)

(declare-fun res!434357 () Bool)

(declare-fun e!381750 () Bool)

(assert (=> b!666957 (=> (not res!434357) (not e!381750))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39064 0))(
  ( (array!39065 (arr!18724 (Array (_ BitVec 32) (_ BitVec 64))) (size!19089 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39064)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!666957 (= res!434357 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19089 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666958 () Bool)

(declare-fun res!434362 () Bool)

(assert (=> b!666958 (=> (not res!434362) (not e!381750))))

(declare-datatypes ((List!12804 0))(
  ( (Nil!12801) (Cons!12800 (h!13845 (_ BitVec 64)) (t!19023 List!12804)) )
))
(declare-fun acc!681 () List!12804)

(declare-fun contains!3326 (List!12804 (_ BitVec 64)) Bool)

(assert (=> b!666958 (= res!434362 (not (contains!3326 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666959 () Bool)

(declare-datatypes ((Unit!23328 0))(
  ( (Unit!23329) )
))
(declare-fun e!381749 () Unit!23328)

(declare-fun Unit!23330 () Unit!23328)

(assert (=> b!666959 (= e!381749 Unit!23330)))

(declare-fun lt!310495 () Unit!23328)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39064 (_ BitVec 64) (_ BitVec 32)) Unit!23328)

(assert (=> b!666959 (= lt!310495 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!666959 false))

(declare-fun b!666960 () Bool)

(declare-fun res!434360 () Bool)

(assert (=> b!666960 (=> (not res!434360) (not e!381750))))

(declare-fun arrayNoDuplicates!0 (array!39064 (_ BitVec 32) List!12804) Bool)

(assert (=> b!666960 (= res!434360 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12801))))

(declare-fun b!666961 () Bool)

(declare-fun res!434371 () Bool)

(assert (=> b!666961 (=> (not res!434371) (not e!381750))))

(declare-fun noDuplicate!595 (List!12804) Bool)

(assert (=> b!666961 (= res!434371 (noDuplicate!595 acc!681))))

(declare-fun b!666962 () Bool)

(declare-fun e!381748 () Bool)

(assert (=> b!666962 (= e!381750 (not e!381748))))

(declare-fun res!434368 () Bool)

(assert (=> b!666962 (=> res!434368 e!381748)))

(assert (=> b!666962 (= res!434368 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!310490 () List!12804)

(declare-fun -!80 (List!12804 (_ BitVec 64)) List!12804)

(assert (=> b!666962 (= (-!80 lt!310490 k!2843) acc!681)))

(declare-fun $colon$colon!213 (List!12804 (_ BitVec 64)) List!12804)

(assert (=> b!666962 (= lt!310490 ($colon$colon!213 acc!681 k!2843))))

(declare-fun lt!310489 () Unit!23328)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12804) Unit!23328)

(assert (=> b!666962 (= lt!310489 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!82 (List!12804 List!12804) Bool)

(assert (=> b!666962 (subseq!82 acc!681 acc!681)))

(declare-fun lt!310494 () Unit!23328)

(declare-fun lemmaListSubSeqRefl!0 (List!12804) Unit!23328)

(assert (=> b!666962 (= lt!310494 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666962 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310491 () Unit!23328)

(declare-fun e!381752 () Unit!23328)

(assert (=> b!666962 (= lt!310491 e!381752)))

(declare-fun c!76667 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666962 (= c!76667 (validKeyInArray!0 (select (arr!18724 a!3626) from!3004)))))

(declare-fun lt!310493 () Unit!23328)

(assert (=> b!666962 (= lt!310493 e!381749)))

(declare-fun c!76668 () Bool)

(declare-fun lt!310488 () Bool)

(assert (=> b!666962 (= c!76668 lt!310488)))

(declare-fun arrayContainsKey!0 (array!39064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666962 (= lt!310488 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666962 (arrayContainsKey!0 (array!39065 (store (arr!18724 a!3626) i!1382 k!2843) (size!19089 a!3626)) k!2843 from!3004)))

(declare-fun b!666963 () Bool)

(declare-fun e!381753 () Bool)

(assert (=> b!666963 (= e!381753 (not (contains!3326 acc!681 k!2843)))))

(declare-fun b!666964 () Bool)

(declare-fun res!434376 () Bool)

(assert (=> b!666964 (=> res!434376 e!381748)))

(assert (=> b!666964 (= res!434376 (contains!3326 acc!681 k!2843))))

(declare-fun b!666965 () Bool)

(declare-fun res!434366 () Bool)

(assert (=> b!666965 (=> res!434366 e!381748)))

(assert (=> b!666965 (= res!434366 (not (noDuplicate!595 lt!310490)))))

(declare-fun b!666966 () Bool)

(declare-fun lt!310497 () Unit!23328)

(assert (=> b!666966 (= e!381752 lt!310497)))

(declare-fun lt!310496 () Unit!23328)

(assert (=> b!666966 (= lt!310496 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666966 (subseq!82 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39064 List!12804 List!12804 (_ BitVec 32)) Unit!23328)

(assert (=> b!666966 (= lt!310497 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!213 acc!681 (select (arr!18724 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666966 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666968 () Bool)

(declare-fun res!434364 () Bool)

(assert (=> b!666968 (=> res!434364 e!381748)))

(assert (=> b!666968 (= res!434364 (contains!3326 lt!310490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666969 () Bool)

(declare-fun e!381754 () Bool)

(assert (=> b!666969 (= e!381754 e!381753)))

(declare-fun res!434365 () Bool)

(assert (=> b!666969 (=> (not res!434365) (not e!381753))))

(assert (=> b!666969 (= res!434365 (bvsle from!3004 i!1382))))

(declare-fun b!666970 () Bool)

(declare-fun Unit!23331 () Unit!23328)

(assert (=> b!666970 (= e!381752 Unit!23331)))

(declare-fun b!666971 () Bool)

(declare-fun res!434373 () Bool)

(assert (=> b!666971 (=> res!434373 e!381748)))

(assert (=> b!666971 (= res!434373 (not (subseq!82 acc!681 lt!310490)))))

(declare-fun b!666972 () Bool)

(declare-fun res!434358 () Bool)

(assert (=> b!666972 (=> (not res!434358) (not e!381750))))

(assert (=> b!666972 (= res!434358 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666973 () Bool)

(declare-fun res!434367 () Bool)

(assert (=> b!666973 (=> (not res!434367) (not e!381750))))

(assert (=> b!666973 (= res!434367 e!381754)))

(declare-fun res!434377 () Bool)

(assert (=> b!666973 (=> res!434377 e!381754)))

(declare-fun e!381755 () Bool)

(assert (=> b!666973 (= res!434377 e!381755)))

(declare-fun res!434372 () Bool)

(assert (=> b!666973 (=> (not res!434372) (not e!381755))))

(assert (=> b!666973 (= res!434372 (bvsgt from!3004 i!1382))))

(declare-fun b!666974 () Bool)

(declare-fun res!434363 () Bool)

(assert (=> b!666974 (=> (not res!434363) (not e!381750))))

(assert (=> b!666974 (= res!434363 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19089 a!3626))))))

(declare-fun b!666975 () Bool)

(declare-fun Unit!23332 () Unit!23328)

(assert (=> b!666975 (= e!381749 Unit!23332)))

(declare-fun b!666976 () Bool)

(declare-fun res!434374 () Bool)

(assert (=> b!666976 (=> res!434374 e!381748)))

(assert (=> b!666976 (= res!434374 lt!310488)))

(declare-fun b!666977 () Bool)

(declare-fun res!434359 () Bool)

(assert (=> b!666977 (=> res!434359 e!381748)))

(assert (=> b!666977 (= res!434359 (not (contains!3326 lt!310490 k!2843)))))

(declare-fun b!666978 () Bool)

(declare-fun res!434369 () Bool)

(assert (=> b!666978 (=> (not res!434369) (not e!381750))))

(assert (=> b!666978 (= res!434369 (not (contains!3326 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666979 () Bool)

(declare-fun res!434375 () Bool)

(assert (=> b!666979 (=> (not res!434375) (not e!381750))))

(assert (=> b!666979 (= res!434375 (validKeyInArray!0 k!2843))))

(declare-fun b!666980 () Bool)

(assert (=> b!666980 (= e!381748 true)))

(declare-fun lt!310492 () Bool)

(assert (=> b!666980 (= lt!310492 (contains!3326 lt!310490 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666981 () Bool)

(declare-fun res!434361 () Bool)

(assert (=> b!666981 (=> (not res!434361) (not e!381750))))

(assert (=> b!666981 (= res!434361 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666967 () Bool)

(assert (=> b!666967 (= e!381755 (contains!3326 acc!681 k!2843))))

(declare-fun res!434370 () Bool)

(assert (=> start!60006 (=> (not res!434370) (not e!381750))))

(assert (=> start!60006 (= res!434370 (and (bvslt (size!19089 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19089 a!3626))))))

(assert (=> start!60006 e!381750))

(assert (=> start!60006 true))

(declare-fun array_inv!14607 (array!39064) Bool)

(assert (=> start!60006 (array_inv!14607 a!3626)))

(assert (= (and start!60006 res!434370) b!666961))

(assert (= (and b!666961 res!434371) b!666978))

(assert (= (and b!666978 res!434369) b!666958))

(assert (= (and b!666958 res!434362) b!666973))

(assert (= (and b!666973 res!434372) b!666967))

(assert (= (and b!666973 (not res!434377)) b!666969))

(assert (= (and b!666969 res!434365) b!666963))

(assert (= (and b!666973 res!434367) b!666960))

(assert (= (and b!666960 res!434360) b!666972))

(assert (= (and b!666972 res!434358) b!666974))

(assert (= (and b!666974 res!434363) b!666979))

(assert (= (and b!666979 res!434375) b!666981))

(assert (= (and b!666981 res!434361) b!666957))

(assert (= (and b!666957 res!434357) b!666962))

(assert (= (and b!666962 c!76668) b!666959))

(assert (= (and b!666962 (not c!76668)) b!666975))

(assert (= (and b!666962 c!76667) b!666966))

(assert (= (and b!666962 (not c!76667)) b!666970))

(assert (= (and b!666962 (not res!434368)) b!666965))

(assert (= (and b!666965 (not res!434366)) b!666976))

(assert (= (and b!666976 (not res!434374)) b!666964))

(assert (= (and b!666964 (not res!434376)) b!666971))

(assert (= (and b!666971 (not res!434373)) b!666977))

(assert (= (and b!666977 (not res!434359)) b!666968))

(assert (= (and b!666968 (not res!434364)) b!666980))

(declare-fun m!637063 () Bool)

(assert (=> b!666961 m!637063))

(declare-fun m!637065 () Bool)

(assert (=> b!666965 m!637065))

(declare-fun m!637067 () Bool)

(assert (=> b!666959 m!637067))

(declare-fun m!637069 () Bool)

(assert (=> start!60006 m!637069))

(declare-fun m!637071 () Bool)

(assert (=> b!666962 m!637071))

(declare-fun m!637073 () Bool)

(assert (=> b!666962 m!637073))

(declare-fun m!637075 () Bool)

(assert (=> b!666962 m!637075))

(declare-fun m!637077 () Bool)

(assert (=> b!666962 m!637077))

(declare-fun m!637079 () Bool)

(assert (=> b!666962 m!637079))

(declare-fun m!637081 () Bool)

(assert (=> b!666962 m!637081))

(declare-fun m!637083 () Bool)

(assert (=> b!666962 m!637083))

(declare-fun m!637085 () Bool)

(assert (=> b!666962 m!637085))

(assert (=> b!666962 m!637075))

(declare-fun m!637087 () Bool)

(assert (=> b!666962 m!637087))

(declare-fun m!637089 () Bool)

(assert (=> b!666962 m!637089))

(declare-fun m!637091 () Bool)

(assert (=> b!666962 m!637091))

(declare-fun m!637093 () Bool)

(assert (=> b!666964 m!637093))

(assert (=> b!666966 m!637073))

(assert (=> b!666966 m!637075))

(declare-fun m!637095 () Bool)

(assert (=> b!666966 m!637095))

(declare-fun m!637097 () Bool)

(assert (=> b!666966 m!637097))

(assert (=> b!666966 m!637075))

(assert (=> b!666966 m!637095))

(assert (=> b!666966 m!637081))

(assert (=> b!666966 m!637091))

(declare-fun m!637099 () Bool)

(assert (=> b!666960 m!637099))

(assert (=> b!666967 m!637093))

(declare-fun m!637101 () Bool)

(assert (=> b!666971 m!637101))

(declare-fun m!637103 () Bool)

(assert (=> b!666972 m!637103))

(declare-fun m!637105 () Bool)

(assert (=> b!666980 m!637105))

(assert (=> b!666963 m!637093))

(declare-fun m!637107 () Bool)

(assert (=> b!666958 m!637107))

(declare-fun m!637109 () Bool)

(assert (=> b!666979 m!637109))

(declare-fun m!637111 () Bool)

(assert (=> b!666978 m!637111))

(declare-fun m!637113 () Bool)

(assert (=> b!666968 m!637113))

(declare-fun m!637115 () Bool)

(assert (=> b!666981 m!637115))

(declare-fun m!637117 () Bool)

(assert (=> b!666977 m!637117))

(push 1)

(assert (not b!666962))

(assert (not b!666968))

(assert (not b!666981))

(assert (not b!666978))

(assert (not b!666979))

(assert (not b!666971))

(assert (not b!666964))

(assert (not b!666960))

(assert (not b!666958))

(assert (not b!666965))

(assert (not b!666980))

(assert (not start!60006))

(assert (not b!666972))

(assert (not b!666959))

(assert (not b!666967))

(assert (not b!666963))

(assert (not b!666966))

(assert (not b!666961))

(assert (not b!666977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

