; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59880 () Bool)

(assert start!59880)

(declare-fun b!662504 () Bool)

(declare-fun res!430509 () Bool)

(declare-fun e!380333 () Bool)

(assert (=> b!662504 (=> (not res!430509) (not e!380333))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12697 0))(
  ( (Nil!12694) (Cons!12693 (h!13738 (_ BitVec 64)) (t!18925 List!12697)) )
))
(declare-fun acc!681 () List!12697)

(declare-datatypes ((array!38927 0))(
  ( (array!38928 (arr!18656 (Array (_ BitVec 32) (_ BitVec 64))) (size!19020 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38927)

(declare-fun arrayNoDuplicates!0 (array!38927 (_ BitVec 32) List!12697) Bool)

(assert (=> b!662504 (= res!430509 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662505 () Bool)

(declare-fun res!430504 () Bool)

(assert (=> b!662505 (=> (not res!430504) (not e!380333))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662505 (= res!430504 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662506 () Bool)

(declare-fun res!430502 () Bool)

(assert (=> b!662506 (=> (not res!430502) (not e!380333))))

(declare-fun contains!3274 (List!12697 (_ BitVec 64)) Bool)

(assert (=> b!662506 (= res!430502 (not (contains!3274 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662507 () Bool)

(declare-fun res!430517 () Bool)

(assert (=> b!662507 (=> (not res!430517) (not e!380333))))

(declare-fun e!380330 () Bool)

(assert (=> b!662507 (= res!430517 e!380330)))

(declare-fun res!430500 () Bool)

(assert (=> b!662507 (=> res!430500 e!380330)))

(declare-fun e!380328 () Bool)

(assert (=> b!662507 (= res!430500 e!380328)))

(declare-fun res!430516 () Bool)

(assert (=> b!662507 (=> (not res!430516) (not e!380328))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!662507 (= res!430516 (bvsgt from!3004 i!1382))))

(declare-fun b!662508 () Bool)

(declare-fun res!430508 () Bool)

(declare-fun e!380329 () Bool)

(assert (=> b!662508 (=> res!430508 e!380329)))

(declare-fun lt!309031 () List!12697)

(declare-fun subseq!13 (List!12697 List!12697) Bool)

(assert (=> b!662508 (= res!430508 (not (subseq!13 acc!681 lt!309031)))))

(declare-fun b!662509 () Bool)

(declare-fun res!430507 () Bool)

(assert (=> b!662509 (=> (not res!430507) (not e!380333))))

(assert (=> b!662509 (= res!430507 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12694))))

(declare-fun b!662510 () Bool)

(declare-datatypes ((Unit!23018 0))(
  ( (Unit!23019) )
))
(declare-fun e!380331 () Unit!23018)

(declare-fun Unit!23020 () Unit!23018)

(assert (=> b!662510 (= e!380331 Unit!23020)))

(declare-fun lt!309034 () Unit!23018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38927 (_ BitVec 64) (_ BitVec 32)) Unit!23018)

(assert (=> b!662510 (= lt!309034 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!662510 false))

(declare-fun b!662511 () Bool)

(declare-fun Unit!23021 () Unit!23018)

(assert (=> b!662511 (= e!380331 Unit!23021)))

(declare-fun b!662512 () Bool)

(declare-fun res!430501 () Bool)

(assert (=> b!662512 (=> res!430501 e!380329)))

(assert (=> b!662512 (= res!430501 (contains!3274 lt!309031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662513 () Bool)

(declare-fun res!430499 () Bool)

(assert (=> b!662513 (=> (not res!430499) (not e!380333))))

(assert (=> b!662513 (= res!430499 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19020 a!3626))))))

(declare-fun b!662514 () Bool)

(declare-fun res!430505 () Bool)

(assert (=> b!662514 (=> (not res!430505) (not e!380333))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662514 (= res!430505 (validKeyInArray!0 k!2843))))

(declare-fun b!662515 () Bool)

(declare-fun e!380334 () Bool)

(assert (=> b!662515 (= e!380334 (not (contains!3274 acc!681 k!2843)))))

(declare-fun b!662516 () Bool)

(assert (=> b!662516 (= e!380328 (contains!3274 acc!681 k!2843))))

(declare-fun b!662517 () Bool)

(declare-fun res!430514 () Bool)

(assert (=> b!662517 (=> res!430514 e!380329)))

(assert (=> b!662517 (= res!430514 (contains!3274 lt!309031 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!430515 () Bool)

(assert (=> start!59880 (=> (not res!430515) (not e!380333))))

(assert (=> start!59880 (= res!430515 (and (bvslt (size!19020 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19020 a!3626))))))

(assert (=> start!59880 e!380333))

(assert (=> start!59880 true))

(declare-fun array_inv!14452 (array!38927) Bool)

(assert (=> start!59880 (array_inv!14452 a!3626)))

(declare-fun b!662518 () Bool)

(declare-fun res!430511 () Bool)

(assert (=> b!662518 (=> (not res!430511) (not e!380333))))

(assert (=> b!662518 (= res!430511 (not (contains!3274 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662519 () Bool)

(declare-fun e!380332 () Bool)

(assert (=> b!662519 (= e!380332 e!380329)))

(declare-fun res!430498 () Bool)

(assert (=> b!662519 (=> res!430498 e!380329)))

(assert (=> b!662519 (= res!430498 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!145 (List!12697 (_ BitVec 64)) List!12697)

(assert (=> b!662519 (= lt!309031 ($colon$colon!145 acc!681 (select (arr!18656 a!3626) from!3004)))))

(assert (=> b!662519 (subseq!13 acc!681 acc!681)))

(declare-fun lt!309032 () Unit!23018)

(declare-fun lemmaListSubSeqRefl!0 (List!12697) Unit!23018)

(assert (=> b!662519 (= lt!309032 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662520 () Bool)

(assert (=> b!662520 (= e!380329 true)))

(declare-fun lt!309029 () Bool)

(assert (=> b!662520 (= lt!309029 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!309031))))

(declare-fun lt!309030 () Unit!23018)

(declare-fun noDuplicateSubseq!13 (List!12697 List!12697) Unit!23018)

(assert (=> b!662520 (= lt!309030 (noDuplicateSubseq!13 acc!681 lt!309031))))

(declare-fun b!662521 () Bool)

(assert (=> b!662521 (= e!380330 e!380334)))

(declare-fun res!430510 () Bool)

(assert (=> b!662521 (=> (not res!430510) (not e!380334))))

(assert (=> b!662521 (= res!430510 (bvsle from!3004 i!1382))))

(declare-fun b!662522 () Bool)

(declare-fun res!430513 () Bool)

(assert (=> b!662522 (=> res!430513 e!380329)))

(declare-fun noDuplicate!521 (List!12697) Bool)

(assert (=> b!662522 (= res!430513 (not (noDuplicate!521 lt!309031)))))

(declare-fun b!662523 () Bool)

(declare-fun res!430512 () Bool)

(assert (=> b!662523 (=> (not res!430512) (not e!380333))))

(assert (=> b!662523 (= res!430512 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19020 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!662524 () Bool)

(declare-fun res!430503 () Bool)

(assert (=> b!662524 (=> (not res!430503) (not e!380333))))

(assert (=> b!662524 (= res!430503 (noDuplicate!521 acc!681))))

(declare-fun b!662525 () Bool)

(assert (=> b!662525 (= e!380333 (not e!380332))))

(declare-fun res!430506 () Bool)

(assert (=> b!662525 (=> res!430506 e!380332)))

(assert (=> b!662525 (= res!430506 (not (validKeyInArray!0 (select (arr!18656 a!3626) from!3004))))))

(declare-fun lt!309033 () Unit!23018)

(assert (=> b!662525 (= lt!309033 e!380331)))

(declare-fun c!76370 () Bool)

(assert (=> b!662525 (= c!76370 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662525 (arrayContainsKey!0 (array!38928 (store (arr!18656 a!3626) i!1382 k!2843) (size!19020 a!3626)) k!2843 from!3004)))

(assert (= (and start!59880 res!430515) b!662524))

(assert (= (and b!662524 res!430503) b!662518))

(assert (= (and b!662518 res!430511) b!662506))

(assert (= (and b!662506 res!430502) b!662507))

(assert (= (and b!662507 res!430516) b!662516))

(assert (= (and b!662507 (not res!430500)) b!662521))

(assert (= (and b!662521 res!430510) b!662515))

(assert (= (and b!662507 res!430517) b!662509))

(assert (= (and b!662509 res!430507) b!662504))

(assert (= (and b!662504 res!430509) b!662513))

(assert (= (and b!662513 res!430499) b!662514))

(assert (= (and b!662514 res!430505) b!662505))

(assert (= (and b!662505 res!430504) b!662523))

(assert (= (and b!662523 res!430512) b!662525))

(assert (= (and b!662525 c!76370) b!662510))

(assert (= (and b!662525 (not c!76370)) b!662511))

(assert (= (and b!662525 (not res!430506)) b!662519))

(assert (= (and b!662519 (not res!430498)) b!662522))

(assert (= (and b!662522 (not res!430513)) b!662512))

(assert (= (and b!662512 (not res!430501)) b!662517))

(assert (= (and b!662517 (not res!430514)) b!662508))

(assert (= (and b!662508 (not res!430508)) b!662520))

(declare-fun m!634325 () Bool)

(assert (=> b!662525 m!634325))

(declare-fun m!634327 () Bool)

(assert (=> b!662525 m!634327))

(declare-fun m!634329 () Bool)

(assert (=> b!662525 m!634329))

(assert (=> b!662525 m!634325))

(declare-fun m!634331 () Bool)

(assert (=> b!662525 m!634331))

(declare-fun m!634333 () Bool)

(assert (=> b!662525 m!634333))

(declare-fun m!634335 () Bool)

(assert (=> b!662518 m!634335))

(declare-fun m!634337 () Bool)

(assert (=> b!662515 m!634337))

(assert (=> b!662516 m!634337))

(declare-fun m!634339 () Bool)

(assert (=> b!662524 m!634339))

(declare-fun m!634341 () Bool)

(assert (=> b!662520 m!634341))

(declare-fun m!634343 () Bool)

(assert (=> b!662520 m!634343))

(assert (=> b!662519 m!634325))

(assert (=> b!662519 m!634325))

(declare-fun m!634345 () Bool)

(assert (=> b!662519 m!634345))

(declare-fun m!634347 () Bool)

(assert (=> b!662519 m!634347))

(declare-fun m!634349 () Bool)

(assert (=> b!662519 m!634349))

(declare-fun m!634351 () Bool)

(assert (=> b!662514 m!634351))

(declare-fun m!634353 () Bool)

(assert (=> b!662509 m!634353))

(declare-fun m!634355 () Bool)

(assert (=> b!662505 m!634355))

(declare-fun m!634357 () Bool)

(assert (=> b!662508 m!634357))

(declare-fun m!634359 () Bool)

(assert (=> b!662517 m!634359))

(declare-fun m!634361 () Bool)

(assert (=> b!662504 m!634361))

(declare-fun m!634363 () Bool)

(assert (=> b!662506 m!634363))

(declare-fun m!634365 () Bool)

(assert (=> b!662510 m!634365))

(declare-fun m!634367 () Bool)

(assert (=> b!662512 m!634367))

(declare-fun m!634369 () Bool)

(assert (=> b!662522 m!634369))

(declare-fun m!634371 () Bool)

(assert (=> start!59880 m!634371))

(push 1)

(assert (not b!662508))

(assert (not b!662509))

(assert (not b!662505))

(assert (not b!662515))

(assert (not b!662506))

(assert (not b!662524))

(assert (not b!662518))

(assert (not b!662525))

(assert (not b!662512))

(assert (not b!662510))

(assert (not b!662517))

(assert (not b!662504))

(assert (not b!662516))

(assert (not b!662519))

(assert (not b!662520))

(assert (not start!59880))

