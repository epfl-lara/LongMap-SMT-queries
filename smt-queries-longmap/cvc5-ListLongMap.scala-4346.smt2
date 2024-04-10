; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60104 () Bool)

(assert start!60104)

(declare-fun b!670507 () Bool)

(declare-fun res!437250 () Bool)

(declare-fun e!383357 () Bool)

(assert (=> b!670507 (=> (not res!437250) (not e!383357))))

(declare-datatypes ((List!12809 0))(
  ( (Nil!12806) (Cons!12805 (h!13850 (_ BitVec 64)) (t!19037 List!12809)) )
))
(declare-fun acc!681 () List!12809)

(declare-fun contains!3386 (List!12809 (_ BitVec 64)) Bool)

(assert (=> b!670507 (= res!437250 (not (contains!3386 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670508 () Bool)

(declare-fun e!383355 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!670508 (= e!383355 (contains!3386 acc!681 k!2843))))

(declare-fun b!670509 () Bool)

(declare-fun e!383364 () Bool)

(assert (=> b!670509 (= e!383364 (not (contains!3386 acc!681 k!2843)))))

(declare-fun b!670510 () Bool)

(declare-fun res!437247 () Bool)

(assert (=> b!670510 (=> (not res!437247) (not e!383357))))

(declare-fun e!383359 () Bool)

(assert (=> b!670510 (= res!437247 e!383359)))

(declare-fun res!437246 () Bool)

(assert (=> b!670510 (=> res!437246 e!383359)))

(assert (=> b!670510 (= res!437246 e!383355)))

(declare-fun res!437233 () Bool)

(assert (=> b!670510 (=> (not res!437233) (not e!383355))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670510 (= res!437233 (bvsgt from!3004 i!1382))))

(declare-fun b!670511 () Bool)

(declare-fun e!383362 () Bool)

(declare-fun e!383358 () Bool)

(assert (=> b!670511 (= e!383362 e!383358)))

(declare-fun res!437244 () Bool)

(assert (=> b!670511 (=> res!437244 e!383358)))

(assert (=> b!670511 (= res!437244 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670512 () Bool)

(declare-fun res!437245 () Bool)

(assert (=> b!670512 (=> (not res!437245) (not e!383357))))

(declare-fun noDuplicate!633 (List!12809) Bool)

(assert (=> b!670512 (= res!437245 (noDuplicate!633 acc!681))))

(declare-fun b!670513 () Bool)

(declare-fun e!383361 () Bool)

(assert (=> b!670513 (= e!383357 (not e!383361))))

(declare-fun res!437238 () Bool)

(assert (=> b!670513 (=> res!437238 e!383361)))

(assert (=> b!670513 (= res!437238 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39151 0))(
  ( (array!39152 (arr!18768 (Array (_ BitVec 32) (_ BitVec 64))) (size!19132 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39151)

(declare-fun lt!312070 () List!12809)

(declare-fun arrayNoDuplicates!0 (array!39151 (_ BitVec 32) List!12809) Bool)

(assert (=> b!670513 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312070)))

(declare-datatypes ((Unit!23565 0))(
  ( (Unit!23566) )
))
(declare-fun lt!312069 () Unit!23565)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39151 (_ BitVec 64) (_ BitVec 32) List!12809 List!12809) Unit!23565)

(assert (=> b!670513 (= lt!312069 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312070))))

(declare-fun -!123 (List!12809 (_ BitVec 64)) List!12809)

(assert (=> b!670513 (= (-!123 lt!312070 k!2843) acc!681)))

(declare-fun $colon$colon!257 (List!12809 (_ BitVec 64)) List!12809)

(assert (=> b!670513 (= lt!312070 ($colon$colon!257 acc!681 k!2843))))

(declare-fun lt!312064 () Unit!23565)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12809) Unit!23565)

(assert (=> b!670513 (= lt!312064 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!125 (List!12809 List!12809) Bool)

(assert (=> b!670513 (subseq!125 acc!681 acc!681)))

(declare-fun lt!312072 () Unit!23565)

(declare-fun lemmaListSubSeqRefl!0 (List!12809) Unit!23565)

(assert (=> b!670513 (= lt!312072 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670513 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312066 () Unit!23565)

(declare-fun e!383356 () Unit!23565)

(assert (=> b!670513 (= lt!312066 e!383356)))

(declare-fun c!77005 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670513 (= c!77005 (validKeyInArray!0 (select (arr!18768 a!3626) from!3004)))))

(declare-fun lt!312063 () Unit!23565)

(declare-fun e!383363 () Unit!23565)

(assert (=> b!670513 (= lt!312063 e!383363)))

(declare-fun c!77006 () Bool)

(declare-fun arrayContainsKey!0 (array!39151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670513 (= c!77006 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!312067 () array!39151)

(assert (=> b!670513 (arrayContainsKey!0 lt!312067 k!2843 from!3004)))

(assert (=> b!670513 (= lt!312067 (array!39152 (store (arr!18768 a!3626) i!1382 k!2843) (size!19132 a!3626)))))

(declare-fun res!437235 () Bool)

(assert (=> start!60104 (=> (not res!437235) (not e!383357))))

(assert (=> start!60104 (= res!437235 (and (bvslt (size!19132 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19132 a!3626))))))

(assert (=> start!60104 e!383357))

(assert (=> start!60104 true))

(declare-fun array_inv!14564 (array!39151) Bool)

(assert (=> start!60104 (array_inv!14564 a!3626)))

(declare-fun b!670514 () Bool)

(declare-fun res!437237 () Bool)

(assert (=> b!670514 (=> (not res!437237) (not e!383357))))

(assert (=> b!670514 (= res!437237 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670515 () Bool)

(assert (=> b!670515 (= e!383359 e!383364)))

(declare-fun res!437243 () Bool)

(assert (=> b!670515 (=> (not res!437243) (not e!383364))))

(assert (=> b!670515 (= res!437243 (bvsle from!3004 i!1382))))

(declare-fun b!670516 () Bool)

(declare-fun Unit!23567 () Unit!23565)

(assert (=> b!670516 (= e!383363 Unit!23567)))

(declare-fun lt!312071 () Unit!23565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39151 (_ BitVec 64) (_ BitVec 32)) Unit!23565)

(assert (=> b!670516 (= lt!312071 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670516 false))

(declare-fun b!670517 () Bool)

(declare-fun Unit!23568 () Unit!23565)

(assert (=> b!670517 (= e!383363 Unit!23568)))

(declare-fun b!670518 () Bool)

(declare-fun Unit!23569 () Unit!23565)

(assert (=> b!670518 (= e!383356 Unit!23569)))

(declare-fun b!670519 () Bool)

(assert (=> b!670519 (= e!383361 true)))

(assert (=> b!670519 (arrayNoDuplicates!0 lt!312067 (bvadd #b00000000000000000000000000000001 from!3004) lt!312070)))

(declare-fun lt!312073 () Unit!23565)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39151 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12809) Unit!23565)

(assert (=> b!670519 (= lt!312073 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312070))))

(declare-fun b!670520 () Bool)

(declare-fun res!437241 () Bool)

(assert (=> b!670520 (=> (not res!437241) (not e!383357))))

(assert (=> b!670520 (= res!437241 (validKeyInArray!0 k!2843))))

(declare-fun b!670521 () Bool)

(declare-fun res!437234 () Bool)

(assert (=> b!670521 (=> res!437234 e!383361)))

(assert (=> b!670521 (= res!437234 e!383362)))

(declare-fun res!437240 () Bool)

(assert (=> b!670521 (=> (not res!437240) (not e!383362))))

(declare-fun e!383360 () Bool)

(assert (=> b!670521 (= res!437240 e!383360)))

(declare-fun res!437239 () Bool)

(assert (=> b!670521 (=> res!437239 e!383360)))

(assert (=> b!670521 (= res!437239 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670522 () Bool)

(assert (=> b!670522 (= e!383360 (not (contains!3386 lt!312070 k!2843)))))

(declare-fun b!670523 () Bool)

(declare-fun res!437232 () Bool)

(assert (=> b!670523 (=> (not res!437232) (not e!383357))))

(assert (=> b!670523 (= res!437232 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19132 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670524 () Bool)

(assert (=> b!670524 (= e!383358 (contains!3386 lt!312070 k!2843))))

(declare-fun b!670525 () Bool)

(declare-fun res!437251 () Bool)

(assert (=> b!670525 (=> (not res!437251) (not e!383357))))

(assert (=> b!670525 (= res!437251 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19132 a!3626))))))

(declare-fun b!670526 () Bool)

(declare-fun res!437236 () Bool)

(assert (=> b!670526 (=> res!437236 e!383361)))

(assert (=> b!670526 (= res!437236 (not (noDuplicate!633 lt!312070)))))

(declare-fun b!670527 () Bool)

(declare-fun res!437248 () Bool)

(assert (=> b!670527 (=> (not res!437248) (not e!383357))))

(assert (=> b!670527 (= res!437248 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12806))))

(declare-fun b!670528 () Bool)

(declare-fun res!437231 () Bool)

(assert (=> b!670528 (=> res!437231 e!383361)))

(assert (=> b!670528 (= res!437231 (contains!3386 lt!312070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670529 () Bool)

(declare-fun res!437249 () Bool)

(assert (=> b!670529 (=> (not res!437249) (not e!383357))))

(assert (=> b!670529 (= res!437249 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670530 () Bool)

(declare-fun res!437242 () Bool)

(assert (=> b!670530 (=> res!437242 e!383361)))

(assert (=> b!670530 (= res!437242 (contains!3386 lt!312070 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670531 () Bool)

(declare-fun lt!312068 () Unit!23565)

(assert (=> b!670531 (= e!383356 lt!312068)))

(declare-fun lt!312065 () Unit!23565)

(assert (=> b!670531 (= lt!312065 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670531 (subseq!125 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39151 List!12809 List!12809 (_ BitVec 32)) Unit!23565)

(assert (=> b!670531 (= lt!312068 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!257 acc!681 (select (arr!18768 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670531 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670532 () Bool)

(declare-fun res!437252 () Bool)

(assert (=> b!670532 (=> (not res!437252) (not e!383357))))

(assert (=> b!670532 (= res!437252 (not (contains!3386 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60104 res!437235) b!670512))

(assert (= (and b!670512 res!437245) b!670532))

(assert (= (and b!670532 res!437252) b!670507))

(assert (= (and b!670507 res!437250) b!670510))

(assert (= (and b!670510 res!437233) b!670508))

(assert (= (and b!670510 (not res!437246)) b!670515))

(assert (= (and b!670515 res!437243) b!670509))

(assert (= (and b!670510 res!437247) b!670527))

(assert (= (and b!670527 res!437248) b!670529))

(assert (= (and b!670529 res!437249) b!670525))

(assert (= (and b!670525 res!437251) b!670520))

(assert (= (and b!670520 res!437241) b!670514))

(assert (= (and b!670514 res!437237) b!670523))

(assert (= (and b!670523 res!437232) b!670513))

(assert (= (and b!670513 c!77006) b!670516))

(assert (= (and b!670513 (not c!77006)) b!670517))

(assert (= (and b!670513 c!77005) b!670531))

(assert (= (and b!670513 (not c!77005)) b!670518))

(assert (= (and b!670513 (not res!437238)) b!670526))

(assert (= (and b!670526 (not res!437236)) b!670528))

(assert (= (and b!670528 (not res!437231)) b!670530))

(assert (= (and b!670530 (not res!437242)) b!670521))

(assert (= (and b!670521 (not res!437239)) b!670522))

(assert (= (and b!670521 res!437240) b!670511))

(assert (= (and b!670511 (not res!437244)) b!670524))

(assert (= (and b!670521 (not res!437234)) b!670519))

(declare-fun m!640373 () Bool)

(assert (=> b!670529 m!640373))

(declare-fun m!640375 () Bool)

(assert (=> b!670527 m!640375))

(declare-fun m!640377 () Bool)

(assert (=> b!670526 m!640377))

(declare-fun m!640379 () Bool)

(assert (=> b!670507 m!640379))

(declare-fun m!640381 () Bool)

(assert (=> b!670509 m!640381))

(declare-fun m!640383 () Bool)

(assert (=> b!670524 m!640383))

(declare-fun m!640385 () Bool)

(assert (=> b!670530 m!640385))

(declare-fun m!640387 () Bool)

(assert (=> b!670531 m!640387))

(declare-fun m!640389 () Bool)

(assert (=> b!670531 m!640389))

(declare-fun m!640391 () Bool)

(assert (=> b!670531 m!640391))

(declare-fun m!640393 () Bool)

(assert (=> b!670531 m!640393))

(assert (=> b!670531 m!640389))

(assert (=> b!670531 m!640391))

(declare-fun m!640395 () Bool)

(assert (=> b!670531 m!640395))

(declare-fun m!640397 () Bool)

(assert (=> b!670531 m!640397))

(declare-fun m!640399 () Bool)

(assert (=> b!670519 m!640399))

(declare-fun m!640401 () Bool)

(assert (=> b!670519 m!640401))

(declare-fun m!640403 () Bool)

(assert (=> b!670512 m!640403))

(declare-fun m!640405 () Bool)

(assert (=> b!670516 m!640405))

(declare-fun m!640407 () Bool)

(assert (=> b!670532 m!640407))

(declare-fun m!640409 () Bool)

(assert (=> b!670520 m!640409))

(assert (=> b!670513 m!640387))

(declare-fun m!640411 () Bool)

(assert (=> b!670513 m!640411))

(assert (=> b!670513 m!640389))

(declare-fun m!640413 () Bool)

(assert (=> b!670513 m!640413))

(declare-fun m!640415 () Bool)

(assert (=> b!670513 m!640415))

(declare-fun m!640417 () Bool)

(assert (=> b!670513 m!640417))

(assert (=> b!670513 m!640395))

(declare-fun m!640419 () Bool)

(assert (=> b!670513 m!640419))

(declare-fun m!640421 () Bool)

(assert (=> b!670513 m!640421))

(assert (=> b!670513 m!640389))

(declare-fun m!640423 () Bool)

(assert (=> b!670513 m!640423))

(assert (=> b!670513 m!640397))

(declare-fun m!640425 () Bool)

(assert (=> b!670513 m!640425))

(declare-fun m!640427 () Bool)

(assert (=> b!670513 m!640427))

(declare-fun m!640429 () Bool)

(assert (=> b!670528 m!640429))

(assert (=> b!670522 m!640383))

(declare-fun m!640431 () Bool)

(assert (=> start!60104 m!640431))

(assert (=> b!670508 m!640381))

(declare-fun m!640433 () Bool)

(assert (=> b!670514 m!640433))

(push 1)

(assert (not b!670513))

(assert (not b!670520))

(assert (not b!670528))

(assert (not b!670529))

(assert (not b!670512))

(assert (not b!670507))

(assert (not b!670522))

(assert (not b!670524))

(assert (not b!670509))

(assert (not b!670508))

(assert (not b!670532))

(assert (not b!670516))

(assert (not b!670531))

(assert (not b!670526))

(assert (not b!670527))

(assert (not b!670514))

(assert (not b!670530))

(assert (not start!60104))

(assert (not b!670519))

(check-sat)

(pop 1)

