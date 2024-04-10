; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62492 () Bool)

(assert start!62492)

(declare-fun b!703486 () Bool)

(declare-fun res!467299 () Bool)

(declare-fun e!397614 () Bool)

(assert (=> b!703486 (=> (not res!467299) (not e!397614))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40171 0))(
  ( (array!40172 (arr!19242 (Array (_ BitVec 32) (_ BitVec 64))) (size!19627 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40171)

(assert (=> b!703486 (= res!467299 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19627 a!3591)))))

(declare-fun b!703487 () Bool)

(declare-fun res!467307 () Bool)

(assert (=> b!703487 (=> (not res!467307) (not e!397614))))

(declare-datatypes ((List!13283 0))(
  ( (Nil!13280) (Cons!13279 (h!14324 (_ BitVec 64)) (t!19565 List!13283)) )
))
(declare-fun newAcc!49 () List!13283)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13283)

(declare-fun -!270 (List!13283 (_ BitVec 64)) List!13283)

(assert (=> b!703487 (= res!467307 (= (-!270 newAcc!49 k!2824) acc!652))))

(declare-fun b!703488 () Bool)

(declare-fun res!467308 () Bool)

(assert (=> b!703488 (=> (not res!467308) (not e!397614))))

(assert (=> b!703488 (= res!467308 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703489 () Bool)

(declare-fun res!467302 () Bool)

(assert (=> b!703489 (=> (not res!467302) (not e!397614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703489 (= res!467302 (not (validKeyInArray!0 (select (arr!19242 a!3591) from!2969))))))

(declare-fun b!703490 () Bool)

(declare-fun res!467298 () Bool)

(assert (=> b!703490 (=> (not res!467298) (not e!397614))))

(declare-fun contains!3860 (List!13283 (_ BitVec 64)) Bool)

(assert (=> b!703490 (= res!467298 (not (contains!3860 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703492 () Bool)

(declare-fun res!467304 () Bool)

(assert (=> b!703492 (=> (not res!467304) (not e!397614))))

(declare-fun noDuplicate!1107 (List!13283) Bool)

(assert (=> b!703492 (= res!467304 (noDuplicate!1107 newAcc!49))))

(declare-fun b!703493 () Bool)

(declare-fun res!467305 () Bool)

(assert (=> b!703493 (=> (not res!467305) (not e!397614))))

(assert (=> b!703493 (= res!467305 (not (contains!3860 acc!652 k!2824)))))

(declare-fun b!703494 () Bool)

(declare-fun res!467303 () Bool)

(assert (=> b!703494 (=> (not res!467303) (not e!397614))))

(assert (=> b!703494 (= res!467303 (validKeyInArray!0 k!2824))))

(declare-fun b!703495 () Bool)

(declare-fun res!467312 () Bool)

(assert (=> b!703495 (=> (not res!467312) (not e!397614))))

(assert (=> b!703495 (= res!467312 (contains!3860 newAcc!49 k!2824))))

(declare-fun b!703496 () Bool)

(declare-fun res!467306 () Bool)

(assert (=> b!703496 (=> (not res!467306) (not e!397614))))

(assert (=> b!703496 (= res!467306 (not (contains!3860 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703497 () Bool)

(assert (=> b!703497 (= e!397614 false)))

(declare-fun lt!317790 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40171 (_ BitVec 32) List!13283) Bool)

(assert (=> b!703497 (= lt!317790 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703498 () Bool)

(declare-fun res!467310 () Bool)

(assert (=> b!703498 (=> (not res!467310) (not e!397614))))

(assert (=> b!703498 (= res!467310 (noDuplicate!1107 acc!652))))

(declare-fun b!703499 () Bool)

(declare-fun res!467313 () Bool)

(assert (=> b!703499 (=> (not res!467313) (not e!397614))))

(assert (=> b!703499 (= res!467313 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703500 () Bool)

(declare-fun res!467309 () Bool)

(assert (=> b!703500 (=> (not res!467309) (not e!397614))))

(assert (=> b!703500 (= res!467309 (not (contains!3860 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703501 () Bool)

(declare-fun res!467311 () Bool)

(assert (=> b!703501 (=> (not res!467311) (not e!397614))))

(declare-fun subseq!305 (List!13283 List!13283) Bool)

(assert (=> b!703501 (= res!467311 (subseq!305 acc!652 newAcc!49))))

(declare-fun res!467300 () Bool)

(assert (=> start!62492 (=> (not res!467300) (not e!397614))))

(assert (=> start!62492 (= res!467300 (and (bvslt (size!19627 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19627 a!3591))))))

(assert (=> start!62492 e!397614))

(assert (=> start!62492 true))

(declare-fun array_inv!15038 (array!40171) Bool)

(assert (=> start!62492 (array_inv!15038 a!3591)))

(declare-fun b!703491 () Bool)

(declare-fun res!467296 () Bool)

(assert (=> b!703491 (=> (not res!467296) (not e!397614))))

(declare-fun arrayContainsKey!0 (array!40171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703491 (= res!467296 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703502 () Bool)

(declare-fun res!467297 () Bool)

(assert (=> b!703502 (=> (not res!467297) (not e!397614))))

(assert (=> b!703502 (= res!467297 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703503 () Bool)

(declare-fun res!467301 () Bool)

(assert (=> b!703503 (=> (not res!467301) (not e!397614))))

(assert (=> b!703503 (= res!467301 (not (contains!3860 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62492 res!467300) b!703498))

(assert (= (and b!703498 res!467310) b!703492))

(assert (= (and b!703492 res!467304) b!703503))

(assert (= (and b!703503 res!467301) b!703496))

(assert (= (and b!703496 res!467306) b!703502))

(assert (= (and b!703502 res!467297) b!703493))

(assert (= (and b!703493 res!467305) b!703494))

(assert (= (and b!703494 res!467303) b!703499))

(assert (= (and b!703499 res!467313) b!703501))

(assert (= (and b!703501 res!467311) b!703495))

(assert (= (and b!703495 res!467312) b!703487))

(assert (= (and b!703487 res!467307) b!703490))

(assert (= (and b!703490 res!467298) b!703500))

(assert (= (and b!703500 res!467309) b!703486))

(assert (= (and b!703486 res!467299) b!703489))

(assert (= (and b!703489 res!467302) b!703488))

(assert (= (and b!703488 res!467308) b!703491))

(assert (= (and b!703491 res!467296) b!703497))

(declare-fun m!662299 () Bool)

(assert (=> b!703489 m!662299))

(assert (=> b!703489 m!662299))

(declare-fun m!662301 () Bool)

(assert (=> b!703489 m!662301))

(declare-fun m!662303 () Bool)

(assert (=> b!703495 m!662303))

(declare-fun m!662305 () Bool)

(assert (=> start!62492 m!662305))

(declare-fun m!662307 () Bool)

(assert (=> b!703500 m!662307))

(declare-fun m!662309 () Bool)

(assert (=> b!703499 m!662309))

(declare-fun m!662311 () Bool)

(assert (=> b!703493 m!662311))

(declare-fun m!662313 () Bool)

(assert (=> b!703497 m!662313))

(declare-fun m!662315 () Bool)

(assert (=> b!703491 m!662315))

(declare-fun m!662317 () Bool)

(assert (=> b!703494 m!662317))

(declare-fun m!662319 () Bool)

(assert (=> b!703502 m!662319))

(declare-fun m!662321 () Bool)

(assert (=> b!703501 m!662321))

(declare-fun m!662323 () Bool)

(assert (=> b!703503 m!662323))

(declare-fun m!662325 () Bool)

(assert (=> b!703496 m!662325))

(declare-fun m!662327 () Bool)

(assert (=> b!703487 m!662327))

(declare-fun m!662329 () Bool)

(assert (=> b!703492 m!662329))

(declare-fun m!662331 () Bool)

(assert (=> b!703490 m!662331))

(declare-fun m!662333 () Bool)

(assert (=> b!703498 m!662333))

(push 1)

(assert (not b!703500))

(assert (not b!703492))

(assert (not b!703499))

(assert (not b!703502))

(assert (not b!703497))

(assert (not b!703503))

(assert (not b!703489))

(assert (not b!703495))

(assert (not b!703493))

(assert (not b!703490))

(assert (not b!703498))

(assert (not start!62492))

(assert (not b!703496))

(assert (not b!703494))

(assert (not b!703491))

(assert (not b!703501))

(assert (not b!703487))

(check-sat)

(pop 1)

