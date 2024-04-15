; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59904 () Bool)

(assert start!59904)

(declare-fun b!663328 () Bool)

(declare-fun res!431352 () Bool)

(declare-fun e!380556 () Bool)

(assert (=> b!663328 (=> (not res!431352) (not e!380556))))

(declare-datatypes ((array!38962 0))(
  ( (array!38963 (arr!18673 (Array (_ BitVec 32) (_ BitVec 64))) (size!19038 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38962)

(declare-datatypes ((List!12753 0))(
  ( (Nil!12750) (Cons!12749 (h!13794 (_ BitVec 64)) (t!18972 List!12753)) )
))
(declare-fun arrayNoDuplicates!0 (array!38962 (_ BitVec 32) List!12753) Bool)

(assert (=> b!663328 (= res!431352 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12750))))

(declare-fun b!663329 () Bool)

(declare-fun res!431349 () Bool)

(assert (=> b!663329 (=> (not res!431349) (not e!380556))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663329 (= res!431349 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19038 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663330 () Bool)

(declare-fun res!431340 () Bool)

(assert (=> b!663330 (=> (not res!431340) (not e!380556))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663330 (= res!431340 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663332 () Bool)

(declare-fun res!431351 () Bool)

(assert (=> b!663332 (=> (not res!431351) (not e!380556))))

(declare-fun acc!681 () List!12753)

(declare-fun contains!3275 (List!12753 (_ BitVec 64)) Bool)

(assert (=> b!663332 (= res!431351 (not (contains!3275 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663333 () Bool)

(declare-datatypes ((Unit!23073 0))(
  ( (Unit!23074) )
))
(declare-fun e!380554 () Unit!23073)

(declare-fun Unit!23075 () Unit!23073)

(assert (=> b!663333 (= e!380554 Unit!23075)))

(declare-fun b!663334 () Bool)

(declare-fun res!431344 () Bool)

(assert (=> b!663334 (=> (not res!431344) (not e!380556))))

(declare-fun noDuplicate!544 (List!12753) Bool)

(assert (=> b!663334 (= res!431344 (noDuplicate!544 acc!681))))

(declare-fun b!663335 () Bool)

(declare-fun e!380555 () Bool)

(assert (=> b!663335 (= e!380555 (not (contains!3275 acc!681 k!2843)))))

(declare-fun b!663336 () Bool)

(assert (=> b!663336 (= e!380556 (not true))))

(declare-fun lt!309082 () Unit!23073)

(assert (=> b!663336 (= lt!309082 e!380554)))

(declare-fun c!76361 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663336 (= c!76361 (validKeyInArray!0 (select (arr!18673 a!3626) from!3004)))))

(declare-fun lt!309081 () Unit!23073)

(declare-fun e!380552 () Unit!23073)

(assert (=> b!663336 (= lt!309081 e!380552)))

(declare-fun c!76362 () Bool)

(assert (=> b!663336 (= c!76362 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663336 (arrayContainsKey!0 (array!38963 (store (arr!18673 a!3626) i!1382 k!2843) (size!19038 a!3626)) k!2843 from!3004)))

(declare-fun b!663337 () Bool)

(declare-fun res!431353 () Bool)

(assert (=> b!663337 (=> (not res!431353) (not e!380556))))

(assert (=> b!663337 (= res!431353 (not (contains!3275 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663338 () Bool)

(declare-fun Unit!23076 () Unit!23073)

(assert (=> b!663338 (= e!380552 Unit!23076)))

(declare-fun lt!309084 () Unit!23073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38962 (_ BitVec 64) (_ BitVec 32)) Unit!23073)

(assert (=> b!663338 (= lt!309084 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!663338 false))

(declare-fun b!663339 () Bool)

(declare-fun e!380553 () Bool)

(assert (=> b!663339 (= e!380553 (contains!3275 acc!681 k!2843))))

(declare-fun res!431345 () Bool)

(assert (=> start!59904 (=> (not res!431345) (not e!380556))))

(assert (=> start!59904 (= res!431345 (and (bvslt (size!19038 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19038 a!3626))))))

(assert (=> start!59904 e!380556))

(assert (=> start!59904 true))

(declare-fun array_inv!14556 (array!38962) Bool)

(assert (=> start!59904 (array_inv!14556 a!3626)))

(declare-fun b!663331 () Bool)

(declare-fun res!431341 () Bool)

(assert (=> b!663331 (=> (not res!431341) (not e!380556))))

(assert (=> b!663331 (= res!431341 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19038 a!3626))))))

(declare-fun b!663340 () Bool)

(declare-fun res!431342 () Bool)

(assert (=> b!663340 (=> (not res!431342) (not e!380556))))

(assert (=> b!663340 (= res!431342 (validKeyInArray!0 k!2843))))

(declare-fun b!663341 () Bool)

(declare-fun Unit!23077 () Unit!23073)

(assert (=> b!663341 (= e!380552 Unit!23077)))

(declare-fun b!663342 () Bool)

(declare-fun lt!309083 () Unit!23073)

(assert (=> b!663342 (= e!380554 lt!309083)))

(declare-fun lt!309080 () Unit!23073)

(declare-fun lemmaListSubSeqRefl!0 (List!12753) Unit!23073)

(assert (=> b!663342 (= lt!309080 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!31 (List!12753 List!12753) Bool)

(assert (=> b!663342 (subseq!31 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38962 List!12753 List!12753 (_ BitVec 32)) Unit!23073)

(declare-fun $colon$colon!162 (List!12753 (_ BitVec 64)) List!12753)

(assert (=> b!663342 (= lt!309083 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!162 acc!681 (select (arr!18673 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663342 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663343 () Bool)

(declare-fun e!380558 () Bool)

(assert (=> b!663343 (= e!380558 e!380555)))

(declare-fun res!431348 () Bool)

(assert (=> b!663343 (=> (not res!431348) (not e!380555))))

(assert (=> b!663343 (= res!431348 (bvsle from!3004 i!1382))))

(declare-fun b!663344 () Bool)

(declare-fun res!431343 () Bool)

(assert (=> b!663344 (=> (not res!431343) (not e!380556))))

(assert (=> b!663344 (= res!431343 e!380558)))

(declare-fun res!431347 () Bool)

(assert (=> b!663344 (=> res!431347 e!380558)))

(assert (=> b!663344 (= res!431347 e!380553)))

(declare-fun res!431346 () Bool)

(assert (=> b!663344 (=> (not res!431346) (not e!380553))))

(assert (=> b!663344 (= res!431346 (bvsgt from!3004 i!1382))))

(declare-fun b!663345 () Bool)

(declare-fun res!431350 () Bool)

(assert (=> b!663345 (=> (not res!431350) (not e!380556))))

(assert (=> b!663345 (= res!431350 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!59904 res!431345) b!663334))

(assert (= (and b!663334 res!431344) b!663332))

(assert (= (and b!663332 res!431351) b!663337))

(assert (= (and b!663337 res!431353) b!663344))

(assert (= (and b!663344 res!431346) b!663339))

(assert (= (and b!663344 (not res!431347)) b!663343))

(assert (= (and b!663343 res!431348) b!663335))

(assert (= (and b!663344 res!431343) b!663328))

(assert (= (and b!663328 res!431352) b!663345))

(assert (= (and b!663345 res!431350) b!663331))

(assert (= (and b!663331 res!431341) b!663340))

(assert (= (and b!663340 res!431342) b!663330))

(assert (= (and b!663330 res!431340) b!663329))

(assert (= (and b!663329 res!431349) b!663336))

(assert (= (and b!663336 c!76362) b!663338))

(assert (= (and b!663336 (not c!76362)) b!663341))

(assert (= (and b!663336 c!76361) b!663342))

(assert (= (and b!663336 (not c!76361)) b!663333))

(declare-fun m!634367 () Bool)

(assert (=> start!59904 m!634367))

(declare-fun m!634369 () Bool)

(assert (=> b!663337 m!634369))

(declare-fun m!634371 () Bool)

(assert (=> b!663332 m!634371))

(declare-fun m!634373 () Bool)

(assert (=> b!663342 m!634373))

(declare-fun m!634375 () Bool)

(assert (=> b!663342 m!634375))

(declare-fun m!634377 () Bool)

(assert (=> b!663342 m!634377))

(declare-fun m!634379 () Bool)

(assert (=> b!663342 m!634379))

(assert (=> b!663342 m!634375))

(assert (=> b!663342 m!634377))

(declare-fun m!634381 () Bool)

(assert (=> b!663342 m!634381))

(declare-fun m!634383 () Bool)

(assert (=> b!663342 m!634383))

(declare-fun m!634385 () Bool)

(assert (=> b!663334 m!634385))

(declare-fun m!634387 () Bool)

(assert (=> b!663335 m!634387))

(declare-fun m!634389 () Bool)

(assert (=> b!663345 m!634389))

(assert (=> b!663336 m!634375))

(declare-fun m!634391 () Bool)

(assert (=> b!663336 m!634391))

(declare-fun m!634393 () Bool)

(assert (=> b!663336 m!634393))

(assert (=> b!663336 m!634375))

(declare-fun m!634395 () Bool)

(assert (=> b!663336 m!634395))

(declare-fun m!634397 () Bool)

(assert (=> b!663336 m!634397))

(declare-fun m!634399 () Bool)

(assert (=> b!663338 m!634399))

(assert (=> b!663339 m!634387))

(declare-fun m!634401 () Bool)

(assert (=> b!663328 m!634401))

(declare-fun m!634403 () Bool)

(assert (=> b!663340 m!634403))

(declare-fun m!634405 () Bool)

(assert (=> b!663330 m!634405))

(push 1)

(assert (not b!663336))

(assert (not b!663337))

(assert (not b!663345))

(assert (not b!663338))

(assert (not b!663339))

(assert (not b!663332))

(assert (not b!663334))

(assert (not start!59904))

(assert (not b!663335))

(assert (not b!663340))

(assert (not b!663330))

(assert (not b!663328))

(assert (not b!663342))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

