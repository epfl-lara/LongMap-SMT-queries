; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61586 () Bool)

(assert start!61586)

(declare-fun b!689404 () Bool)

(declare-fun res!453976 () Bool)

(declare-fun e!392536 () Bool)

(assert (=> b!689404 (=> res!453976 e!392536)))

(declare-datatypes ((List!13076 0))(
  ( (Nil!13073) (Cons!13072 (h!14117 (_ BitVec 64)) (t!19340 List!13076)) )
))
(declare-fun lt!316148 () List!13076)

(declare-fun contains!3653 (List!13076 (_ BitVec 64)) Bool)

(assert (=> b!689404 (= res!453976 (contains!3653 lt!316148 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689405 () Bool)

(declare-fun res!453974 () Bool)

(declare-fun e!392531 () Bool)

(assert (=> b!689405 (=> (not res!453974) (not e!392531))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun acc!681 () List!13076)

(declare-datatypes ((array!39727 0))(
  ( (array!39728 (arr!19035 (Array (_ BitVec 32) (_ BitVec 64))) (size!19417 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39727)

(declare-fun arrayNoDuplicates!0 (array!39727 (_ BitVec 32) List!13076) Bool)

(assert (=> b!689405 (= res!453974 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689406 () Bool)

(declare-fun e!392528 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!689406 (= e!392528 (not (contains!3653 acc!681 k!2843)))))

(declare-fun b!689407 () Bool)

(declare-fun res!453966 () Bool)

(assert (=> b!689407 (=> (not res!453966) (not e!392531))))

(declare-fun arrayContainsKey!0 (array!39727 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689407 (= res!453966 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689408 () Bool)

(assert (=> b!689408 (= e!392531 (not e!392536))))

(declare-fun res!453973 () Bool)

(assert (=> b!689408 (=> res!453973 e!392536)))

(assert (=> b!689408 (= res!453973 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689408 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316148)))

(declare-datatypes ((Unit!24342 0))(
  ( (Unit!24343) )
))
(declare-fun lt!316146 () Unit!24342)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39727 (_ BitVec 64) (_ BitVec 32) List!13076 List!13076) Unit!24342)

(assert (=> b!689408 (= lt!316146 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316148))))

(declare-fun -!204 (List!13076 (_ BitVec 64)) List!13076)

(assert (=> b!689408 (= (-!204 lt!316148 k!2843) acc!681)))

(declare-fun $colon$colon!404 (List!13076 (_ BitVec 64)) List!13076)

(assert (=> b!689408 (= lt!316148 ($colon$colon!404 acc!681 k!2843))))

(declare-fun lt!316147 () Unit!24342)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13076) Unit!24342)

(assert (=> b!689408 (= lt!316147 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!239 (List!13076 List!13076) Bool)

(assert (=> b!689408 (subseq!239 acc!681 acc!681)))

(declare-fun lt!316143 () Unit!24342)

(declare-fun lemmaListSubSeqRefl!0 (List!13076) Unit!24342)

(assert (=> b!689408 (= lt!316143 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689408 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316152 () Unit!24342)

(declare-fun e!392533 () Unit!24342)

(assert (=> b!689408 (= lt!316152 e!392533)))

(declare-fun c!78092 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689408 (= c!78092 (validKeyInArray!0 (select (arr!19035 a!3626) from!3004)))))

(declare-fun lt!316145 () Unit!24342)

(declare-fun e!392530 () Unit!24342)

(assert (=> b!689408 (= lt!316145 e!392530)))

(declare-fun c!78091 () Bool)

(assert (=> b!689408 (= c!78091 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!316151 () array!39727)

(assert (=> b!689408 (arrayContainsKey!0 lt!316151 k!2843 from!3004)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689408 (= lt!316151 (array!39728 (store (arr!19035 a!3626) i!1382 k!2843) (size!19417 a!3626)))))

(declare-fun b!689409 () Bool)

(declare-fun res!453963 () Bool)

(assert (=> b!689409 (=> (not res!453963) (not e!392531))))

(assert (=> b!689409 (= res!453963 (not (contains!3653 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689410 () Bool)

(declare-fun Unit!24344 () Unit!24342)

(assert (=> b!689410 (= e!392533 Unit!24344)))

(declare-fun b!689411 () Bool)

(declare-fun Unit!24345 () Unit!24342)

(assert (=> b!689411 (= e!392530 Unit!24345)))

(declare-fun b!689412 () Bool)

(declare-fun res!453967 () Bool)

(assert (=> b!689412 (=> (not res!453967) (not e!392531))))

(declare-fun noDuplicate!900 (List!13076) Bool)

(assert (=> b!689412 (= res!453967 (noDuplicate!900 acc!681))))

(declare-fun b!689413 () Bool)

(declare-fun res!453975 () Bool)

(assert (=> b!689413 (=> (not res!453975) (not e!392531))))

(assert (=> b!689413 (= res!453975 (not (contains!3653 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689415 () Bool)

(declare-fun e!392537 () Bool)

(assert (=> b!689415 (= e!392537 (contains!3653 lt!316148 k!2843))))

(declare-fun b!689416 () Bool)

(declare-fun res!453957 () Bool)

(assert (=> b!689416 (=> res!453957 e!392536)))

(assert (=> b!689416 (= res!453957 (not (noDuplicate!900 lt!316148)))))

(declare-fun b!689417 () Bool)

(declare-fun e!392532 () Bool)

(assert (=> b!689417 (= e!392532 e!392528)))

(declare-fun res!453962 () Bool)

(assert (=> b!689417 (=> (not res!453962) (not e!392528))))

(assert (=> b!689417 (= res!453962 (bvsle from!3004 i!1382))))

(declare-fun b!689418 () Bool)

(declare-fun lt!316153 () Unit!24342)

(assert (=> b!689418 (= e!392533 lt!316153)))

(declare-fun lt!316144 () Unit!24342)

(assert (=> b!689418 (= lt!316144 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689418 (subseq!239 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39727 List!13076 List!13076 (_ BitVec 32)) Unit!24342)

(assert (=> b!689418 (= lt!316153 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!404 acc!681 (select (arr!19035 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689418 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689419 () Bool)

(declare-fun res!453969 () Bool)

(assert (=> b!689419 (=> (not res!453969) (not e!392531))))

(assert (=> b!689419 (= res!453969 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13073))))

(declare-fun b!689420 () Bool)

(declare-fun Unit!24346 () Unit!24342)

(assert (=> b!689420 (= e!392530 Unit!24346)))

(declare-fun lt!316150 () Unit!24342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39727 (_ BitVec 64) (_ BitVec 32)) Unit!24342)

(assert (=> b!689420 (= lt!316150 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689420 false))

(declare-fun b!689421 () Bool)

(declare-fun e!392538 () Bool)

(assert (=> b!689421 (= e!392538 (not (contains!3653 lt!316148 k!2843)))))

(declare-fun b!689422 () Bool)

(declare-fun res!453958 () Bool)

(assert (=> b!689422 (=> (not res!453958) (not e!392531))))

(assert (=> b!689422 (= res!453958 e!392532)))

(declare-fun res!453961 () Bool)

(assert (=> b!689422 (=> res!453961 e!392532)))

(declare-fun e!392534 () Bool)

(assert (=> b!689422 (= res!453961 e!392534)))

(declare-fun res!453956 () Bool)

(assert (=> b!689422 (=> (not res!453956) (not e!392534))))

(assert (=> b!689422 (= res!453956 (bvsgt from!3004 i!1382))))

(declare-fun b!689423 () Bool)

(declare-fun res!453977 () Bool)

(assert (=> b!689423 (=> res!453977 e!392536)))

(assert (=> b!689423 (= res!453977 (contains!3653 lt!316148 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689424 () Bool)

(declare-fun res!453968 () Bool)

(assert (=> b!689424 (=> (not res!453968) (not e!392531))))

(assert (=> b!689424 (= res!453968 (validKeyInArray!0 k!2843))))

(declare-fun b!689425 () Bool)

(declare-fun res!453964 () Bool)

(assert (=> b!689425 (=> res!453964 e!392536)))

(declare-fun e!392535 () Bool)

(assert (=> b!689425 (= res!453964 e!392535)))

(declare-fun res!453959 () Bool)

(assert (=> b!689425 (=> (not res!453959) (not e!392535))))

(assert (=> b!689425 (= res!453959 e!392538)))

(declare-fun res!453971 () Bool)

(assert (=> b!689425 (=> res!453971 e!392538)))

(assert (=> b!689425 (= res!453971 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689426 () Bool)

(assert (=> b!689426 (= e!392534 (contains!3653 acc!681 k!2843))))

(declare-fun b!689427 () Bool)

(assert (=> b!689427 (= e!392536 true)))

(assert (=> b!689427 (arrayNoDuplicates!0 lt!316151 (bvadd #b00000000000000000000000000000001 from!3004) lt!316148)))

(declare-fun lt!316149 () Unit!24342)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39727 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13076) Unit!24342)

(assert (=> b!689427 (= lt!316149 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316148))))

(declare-fun b!689428 () Bool)

(declare-fun res!453972 () Bool)

(assert (=> b!689428 (=> (not res!453972) (not e!392531))))

(assert (=> b!689428 (= res!453972 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19417 a!3626))))))

(declare-fun b!689429 () Bool)

(declare-fun res!453960 () Bool)

(assert (=> b!689429 (=> (not res!453960) (not e!392531))))

(assert (=> b!689429 (= res!453960 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19417 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!453970 () Bool)

(assert (=> start!61586 (=> (not res!453970) (not e!392531))))

(assert (=> start!61586 (= res!453970 (and (bvslt (size!19417 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19417 a!3626))))))

(assert (=> start!61586 e!392531))

(assert (=> start!61586 true))

(declare-fun array_inv!14831 (array!39727) Bool)

(assert (=> start!61586 (array_inv!14831 a!3626)))

(declare-fun b!689414 () Bool)

(assert (=> b!689414 (= e!392535 e!392537)))

(declare-fun res!453965 () Bool)

(assert (=> b!689414 (=> res!453965 e!392537)))

(assert (=> b!689414 (= res!453965 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!61586 res!453970) b!689412))

(assert (= (and b!689412 res!453967) b!689413))

(assert (= (and b!689413 res!453975) b!689409))

(assert (= (and b!689409 res!453963) b!689422))

(assert (= (and b!689422 res!453956) b!689426))

(assert (= (and b!689422 (not res!453961)) b!689417))

(assert (= (and b!689417 res!453962) b!689406))

(assert (= (and b!689422 res!453958) b!689419))

(assert (= (and b!689419 res!453969) b!689405))

(assert (= (and b!689405 res!453974) b!689428))

(assert (= (and b!689428 res!453972) b!689424))

(assert (= (and b!689424 res!453968) b!689407))

(assert (= (and b!689407 res!453966) b!689429))

(assert (= (and b!689429 res!453960) b!689408))

(assert (= (and b!689408 c!78091) b!689420))

(assert (= (and b!689408 (not c!78091)) b!689411))

(assert (= (and b!689408 c!78092) b!689418))

(assert (= (and b!689408 (not c!78092)) b!689410))

(assert (= (and b!689408 (not res!453973)) b!689416))

(assert (= (and b!689416 (not res!453957)) b!689404))

(assert (= (and b!689404 (not res!453976)) b!689423))

(assert (= (and b!689423 (not res!453977)) b!689425))

(assert (= (and b!689425 (not res!453971)) b!689421))

(assert (= (and b!689425 res!453959) b!689414))

(assert (= (and b!689414 (not res!453965)) b!689415))

(assert (= (and b!689425 (not res!453964)) b!689427))

(declare-fun m!653069 () Bool)

(assert (=> b!689416 m!653069))

(declare-fun m!653071 () Bool)

(assert (=> b!689418 m!653071))

(declare-fun m!653073 () Bool)

(assert (=> b!689418 m!653073))

(declare-fun m!653075 () Bool)

(assert (=> b!689418 m!653075))

(declare-fun m!653077 () Bool)

(assert (=> b!689418 m!653077))

(assert (=> b!689418 m!653073))

(assert (=> b!689418 m!653075))

(declare-fun m!653079 () Bool)

(assert (=> b!689418 m!653079))

(declare-fun m!653081 () Bool)

(assert (=> b!689418 m!653081))

(declare-fun m!653083 () Bool)

(assert (=> b!689419 m!653083))

(declare-fun m!653085 () Bool)

(assert (=> b!689405 m!653085))

(declare-fun m!653087 () Bool)

(assert (=> b!689427 m!653087))

(declare-fun m!653089 () Bool)

(assert (=> b!689427 m!653089))

(declare-fun m!653091 () Bool)

(assert (=> b!689424 m!653091))

(declare-fun m!653093 () Bool)

(assert (=> b!689407 m!653093))

(declare-fun m!653095 () Bool)

(assert (=> b!689412 m!653095))

(declare-fun m!653097 () Bool)

(assert (=> start!61586 m!653097))

(declare-fun m!653099 () Bool)

(assert (=> b!689406 m!653099))

(declare-fun m!653101 () Bool)

(assert (=> b!689413 m!653101))

(declare-fun m!653103 () Bool)

(assert (=> b!689415 m!653103))

(assert (=> b!689421 m!653103))

(declare-fun m!653105 () Bool)

(assert (=> b!689409 m!653105))

(declare-fun m!653107 () Bool)

(assert (=> b!689420 m!653107))

(declare-fun m!653109 () Bool)

(assert (=> b!689408 m!653109))

(assert (=> b!689408 m!653071))

(declare-fun m!653111 () Bool)

(assert (=> b!689408 m!653111))

(declare-fun m!653113 () Bool)

(assert (=> b!689408 m!653113))

(declare-fun m!653115 () Bool)

(assert (=> b!689408 m!653115))

(assert (=> b!689408 m!653079))

(declare-fun m!653117 () Bool)

(assert (=> b!689408 m!653117))

(declare-fun m!653119 () Bool)

(assert (=> b!689408 m!653119))

(assert (=> b!689408 m!653081))

(assert (=> b!689408 m!653073))

(declare-fun m!653121 () Bool)

(assert (=> b!689408 m!653121))

(declare-fun m!653123 () Bool)

(assert (=> b!689408 m!653123))

(assert (=> b!689408 m!653073))

(declare-fun m!653125 () Bool)

(assert (=> b!689408 m!653125))

(declare-fun m!653127 () Bool)

(assert (=> b!689423 m!653127))

(declare-fun m!653129 () Bool)

(assert (=> b!689404 m!653129))

(assert (=> b!689426 m!653099))

(push 1)

(assert (not b!689421))

(assert (not b!689405))

(assert (not b!689423))

(assert (not b!689420))

(assert (not b!689413))

(assert (not b!689416))

(assert (not b!689409))

(assert (not b!689426))

(assert (not b!689419))

(assert (not b!689407))

(assert (not b!689412))

(assert (not b!689418))

(assert (not b!689415))

(assert (not start!61586))

(assert (not b!689406))

(assert (not b!689427))

(assert (not b!689424))

(assert (not b!689408))

(assert (not b!689404))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

