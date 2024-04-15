; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60966 () Bool)

(assert start!60966)

(declare-fun b!683448 () Bool)

(declare-fun e!389313 () Bool)

(declare-datatypes ((List!13053 0))(
  ( (Nil!13050) (Cons!13049 (h!14094 (_ BitVec 64)) (t!19290 List!13053)) )
))
(declare-fun acc!681 () List!13053)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3575 (List!13053 (_ BitVec 64)) Bool)

(assert (=> b!683448 (= e!389313 (contains!3575 acc!681 k!2843))))

(declare-fun b!683449 () Bool)

(declare-fun res!449308 () Bool)

(declare-fun e!389312 () Bool)

(assert (=> b!683449 (=> (not res!449308) (not e!389312))))

(assert (=> b!683449 (= res!449308 (not (contains!3575 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683450 () Bool)

(declare-datatypes ((Unit!24015 0))(
  ( (Unit!24016) )
))
(declare-fun e!389315 () Unit!24015)

(declare-fun Unit!24017 () Unit!24015)

(assert (=> b!683450 (= e!389315 Unit!24017)))

(declare-fun res!449318 () Bool)

(assert (=> start!60966 (=> (not res!449318) (not e!389312))))

(declare-datatypes ((array!39586 0))(
  ( (array!39587 (arr!18973 (Array (_ BitVec 32) (_ BitVec 64))) (size!19340 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39586)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60966 (= res!449318 (and (bvslt (size!19340 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19340 a!3626))))))

(assert (=> start!60966 e!389312))

(assert (=> start!60966 true))

(declare-fun array_inv!14856 (array!39586) Bool)

(assert (=> start!60966 (array_inv!14856 a!3626)))

(declare-fun b!683451 () Bool)

(declare-fun e!389316 () Unit!24015)

(declare-fun Unit!24018 () Unit!24015)

(assert (=> b!683451 (= e!389316 Unit!24018)))

(declare-fun b!683452 () Bool)

(declare-fun res!449317 () Bool)

(assert (=> b!683452 (=> (not res!449317) (not e!389312))))

(declare-fun e!389317 () Bool)

(assert (=> b!683452 (= res!449317 e!389317)))

(declare-fun res!449319 () Bool)

(assert (=> b!683452 (=> res!449319 e!389317)))

(assert (=> b!683452 (= res!449319 e!389313)))

(declare-fun res!449320 () Bool)

(assert (=> b!683452 (=> (not res!449320) (not e!389313))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683452 (= res!449320 (bvsgt from!3004 i!1382))))

(declare-fun b!683453 () Bool)

(declare-fun e!389314 () Bool)

(assert (=> b!683453 (= e!389314 true)))

(declare-fun lt!313750 () Bool)

(declare-fun lt!313752 () List!13053)

(declare-fun noDuplicate!844 (List!13053) Bool)

(assert (=> b!683453 (= lt!313750 (noDuplicate!844 lt!313752))))

(declare-fun b!683454 () Bool)

(declare-fun res!449309 () Bool)

(assert (=> b!683454 (=> (not res!449309) (not e!389312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683454 (= res!449309 (validKeyInArray!0 k!2843))))

(declare-fun b!683455 () Bool)

(declare-fun lt!313756 () Unit!24015)

(assert (=> b!683455 (= e!389316 lt!313756)))

(declare-fun lt!313758 () Unit!24015)

(declare-fun lemmaListSubSeqRefl!0 (List!13053) Unit!24015)

(assert (=> b!683455 (= lt!313758 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!178 (List!13053 List!13053) Bool)

(assert (=> b!683455 (subseq!178 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39586 List!13053 List!13053 (_ BitVec 32)) Unit!24015)

(declare-fun $colon$colon!342 (List!13053 (_ BitVec 64)) List!13053)

(assert (=> b!683455 (= lt!313756 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!342 acc!681 (select (arr!18973 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39586 (_ BitVec 32) List!13053) Bool)

(assert (=> b!683455 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683456 () Bool)

(declare-fun e!389311 () Bool)

(assert (=> b!683456 (= e!389311 (not (contains!3575 acc!681 k!2843)))))

(declare-fun b!683457 () Bool)

(assert (=> b!683457 (= e!389317 e!389311)))

(declare-fun res!449315 () Bool)

(assert (=> b!683457 (=> (not res!449315) (not e!389311))))

(assert (=> b!683457 (= res!449315 (bvsle from!3004 i!1382))))

(declare-fun b!683458 () Bool)

(declare-fun res!449314 () Bool)

(assert (=> b!683458 (=> (not res!449314) (not e!389312))))

(assert (=> b!683458 (= res!449314 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19340 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683459 () Bool)

(declare-fun res!449316 () Bool)

(assert (=> b!683459 (=> (not res!449316) (not e!389312))))

(assert (=> b!683459 (= res!449316 (not (contains!3575 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683460 () Bool)

(declare-fun res!449307 () Bool)

(assert (=> b!683460 (=> (not res!449307) (not e!389312))))

(assert (=> b!683460 (= res!449307 (noDuplicate!844 acc!681))))

(declare-fun b!683461 () Bool)

(assert (=> b!683461 (= e!389312 (not e!389314))))

(declare-fun res!449312 () Bool)

(assert (=> b!683461 (=> res!449312 e!389314)))

(assert (=> b!683461 (= res!449312 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!143 (List!13053 (_ BitVec 64)) List!13053)

(assert (=> b!683461 (= (-!143 lt!313752 k!2843) acc!681)))

(assert (=> b!683461 (= lt!313752 ($colon$colon!342 acc!681 k!2843))))

(declare-fun lt!313757 () Unit!24015)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13053) Unit!24015)

(assert (=> b!683461 (= lt!313757 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!683461 (subseq!178 acc!681 acc!681)))

(declare-fun lt!313753 () Unit!24015)

(assert (=> b!683461 (= lt!313753 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683461 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313755 () Unit!24015)

(assert (=> b!683461 (= lt!313755 e!389316)))

(declare-fun c!77439 () Bool)

(assert (=> b!683461 (= c!77439 (validKeyInArray!0 (select (arr!18973 a!3626) from!3004)))))

(declare-fun lt!313754 () Unit!24015)

(assert (=> b!683461 (= lt!313754 e!389315)))

(declare-fun c!77438 () Bool)

(declare-fun arrayContainsKey!0 (array!39586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683461 (= c!77438 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683461 (arrayContainsKey!0 (array!39587 (store (arr!18973 a!3626) i!1382 k!2843) (size!19340 a!3626)) k!2843 from!3004)))

(declare-fun b!683462 () Bool)

(declare-fun res!449306 () Bool)

(assert (=> b!683462 (=> (not res!449306) (not e!389312))))

(assert (=> b!683462 (= res!449306 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19340 a!3626))))))

(declare-fun b!683463 () Bool)

(declare-fun Unit!24019 () Unit!24015)

(assert (=> b!683463 (= e!389315 Unit!24019)))

(declare-fun lt!313751 () Unit!24015)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39586 (_ BitVec 64) (_ BitVec 32)) Unit!24015)

(assert (=> b!683463 (= lt!313751 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683463 false))

(declare-fun b!683464 () Bool)

(declare-fun res!449311 () Bool)

(assert (=> b!683464 (=> (not res!449311) (not e!389312))))

(assert (=> b!683464 (= res!449311 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683465 () Bool)

(declare-fun res!449310 () Bool)

(assert (=> b!683465 (=> (not res!449310) (not e!389312))))

(assert (=> b!683465 (= res!449310 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13050))))

(declare-fun b!683466 () Bool)

(declare-fun res!449313 () Bool)

(assert (=> b!683466 (=> (not res!449313) (not e!389312))))

(assert (=> b!683466 (= res!449313 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!60966 res!449318) b!683460))

(assert (= (and b!683460 res!449307) b!683459))

(assert (= (and b!683459 res!449316) b!683449))

(assert (= (and b!683449 res!449308) b!683452))

(assert (= (and b!683452 res!449320) b!683448))

(assert (= (and b!683452 (not res!449319)) b!683457))

(assert (= (and b!683457 res!449315) b!683456))

(assert (= (and b!683452 res!449317) b!683465))

(assert (= (and b!683465 res!449310) b!683466))

(assert (= (and b!683466 res!449313) b!683462))

(assert (= (and b!683462 res!449306) b!683454))

(assert (= (and b!683454 res!449309) b!683464))

(assert (= (and b!683464 res!449311) b!683458))

(assert (= (and b!683458 res!449314) b!683461))

(assert (= (and b!683461 c!77438) b!683463))

(assert (= (and b!683461 (not c!77438)) b!683450))

(assert (= (and b!683461 c!77439) b!683455))

(assert (= (and b!683461 (not c!77439)) b!683451))

(assert (= (and b!683461 (not res!449312)) b!683453))

(declare-fun m!647475 () Bool)

(assert (=> b!683454 m!647475))

(declare-fun m!647477 () Bool)

(assert (=> b!683461 m!647477))

(declare-fun m!647479 () Bool)

(assert (=> b!683461 m!647479))

(declare-fun m!647481 () Bool)

(assert (=> b!683461 m!647481))

(declare-fun m!647483 () Bool)

(assert (=> b!683461 m!647483))

(declare-fun m!647485 () Bool)

(assert (=> b!683461 m!647485))

(declare-fun m!647487 () Bool)

(assert (=> b!683461 m!647487))

(declare-fun m!647489 () Bool)

(assert (=> b!683461 m!647489))

(declare-fun m!647491 () Bool)

(assert (=> b!683461 m!647491))

(assert (=> b!683461 m!647489))

(declare-fun m!647493 () Bool)

(assert (=> b!683461 m!647493))

(declare-fun m!647495 () Bool)

(assert (=> b!683461 m!647495))

(declare-fun m!647497 () Bool)

(assert (=> b!683461 m!647497))

(declare-fun m!647499 () Bool)

(assert (=> b!683453 m!647499))

(declare-fun m!647501 () Bool)

(assert (=> b!683448 m!647501))

(declare-fun m!647503 () Bool)

(assert (=> start!60966 m!647503))

(declare-fun m!647505 () Bool)

(assert (=> b!683449 m!647505))

(assert (=> b!683455 m!647477))

(assert (=> b!683455 m!647489))

(declare-fun m!647507 () Bool)

(assert (=> b!683455 m!647507))

(declare-fun m!647509 () Bool)

(assert (=> b!683455 m!647509))

(assert (=> b!683455 m!647489))

(assert (=> b!683455 m!647507))

(assert (=> b!683455 m!647483))

(assert (=> b!683455 m!647497))

(declare-fun m!647511 () Bool)

(assert (=> b!683465 m!647511))

(assert (=> b!683456 m!647501))

(declare-fun m!647513 () Bool)

(assert (=> b!683464 m!647513))

(declare-fun m!647515 () Bool)

(assert (=> b!683466 m!647515))

(declare-fun m!647517 () Bool)

(assert (=> b!683459 m!647517))

(declare-fun m!647519 () Bool)

(assert (=> b!683460 m!647519))

(declare-fun m!647521 () Bool)

(assert (=> b!683463 m!647521))

(push 1)

(assert (not b!683453))

(assert (not b!683466))

(assert (not start!60966))

(assert (not b!683449))

(assert (not b!683464))

(assert (not b!683456))

(assert (not b!683465))

(assert (not b!683455))

(assert (not b!683454))

(assert (not b!683448))

(assert (not b!683463))

(assert (not b!683461))

(assert (not b!683460))

(assert (not b!683459))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

