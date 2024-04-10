; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62558 () Bool)

(assert start!62558)

(declare-fun b!705268 () Bool)

(declare-fun res!469081 () Bool)

(declare-fun e!397812 () Bool)

(assert (=> b!705268 (=> (not res!469081) (not e!397812))))

(declare-datatypes ((array!40237 0))(
  ( (array!40238 (arr!19275 (Array (_ BitVec 32) (_ BitVec 64))) (size!19660 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40237)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705268 (= res!469081 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705269 () Bool)

(declare-fun res!469083 () Bool)

(assert (=> b!705269 (=> (not res!469083) (not e!397812))))

(declare-datatypes ((List!13316 0))(
  ( (Nil!13313) (Cons!13312 (h!14357 (_ BitVec 64)) (t!19598 List!13316)) )
))
(declare-fun acc!652 () List!13316)

(declare-fun contains!3893 (List!13316 (_ BitVec 64)) Bool)

(assert (=> b!705269 (= res!469083 (not (contains!3893 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705270 () Bool)

(declare-fun res!469089 () Bool)

(assert (=> b!705270 (=> (not res!469089) (not e!397812))))

(assert (=> b!705270 (= res!469089 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705271 () Bool)

(declare-fun res!469084 () Bool)

(assert (=> b!705271 (=> (not res!469084) (not e!397812))))

(declare-fun arrayNoDuplicates!0 (array!40237 (_ BitVec 32) List!13316) Bool)

(assert (=> b!705271 (= res!469084 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705272 () Bool)

(declare-fun res!469092 () Bool)

(assert (=> b!705272 (=> (not res!469092) (not e!397812))))

(declare-fun newAcc!49 () List!13316)

(assert (=> b!705272 (= res!469092 (not (contains!3893 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705273 () Bool)

(declare-fun res!469082 () Bool)

(assert (=> b!705273 (=> (not res!469082) (not e!397812))))

(declare-fun -!303 (List!13316 (_ BitVec 64)) List!13316)

(assert (=> b!705273 (= res!469082 (= (-!303 newAcc!49 k!2824) acc!652))))

(declare-fun b!705274 () Bool)

(assert (=> b!705274 (= e!397812 false)))

(declare-fun lt!317889 () Bool)

(assert (=> b!705274 (= lt!317889 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705275 () Bool)

(declare-fun res!469078 () Bool)

(assert (=> b!705275 (=> (not res!469078) (not e!397812))))

(assert (=> b!705275 (= res!469078 (contains!3893 newAcc!49 k!2824))))

(declare-fun b!705276 () Bool)

(declare-fun res!469080 () Bool)

(assert (=> b!705276 (=> (not res!469080) (not e!397812))))

(assert (=> b!705276 (= res!469080 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!469091 () Bool)

(assert (=> start!62558 (=> (not res!469091) (not e!397812))))

(assert (=> start!62558 (= res!469091 (and (bvslt (size!19660 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19660 a!3591))))))

(assert (=> start!62558 e!397812))

(assert (=> start!62558 true))

(declare-fun array_inv!15071 (array!40237) Bool)

(assert (=> start!62558 (array_inv!15071 a!3591)))

(declare-fun b!705277 () Bool)

(declare-fun res!469085 () Bool)

(assert (=> b!705277 (=> (not res!469085) (not e!397812))))

(declare-fun noDuplicate!1140 (List!13316) Bool)

(assert (=> b!705277 (= res!469085 (noDuplicate!1140 acc!652))))

(declare-fun b!705278 () Bool)

(declare-fun res!469087 () Bool)

(assert (=> b!705278 (=> (not res!469087) (not e!397812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705278 (= res!469087 (validKeyInArray!0 k!2824))))

(declare-fun b!705279 () Bool)

(declare-fun res!469093 () Bool)

(assert (=> b!705279 (=> (not res!469093) (not e!397812))))

(assert (=> b!705279 (= res!469093 (not (contains!3893 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705280 () Bool)

(declare-fun res!469088 () Bool)

(assert (=> b!705280 (=> (not res!469088) (not e!397812))))

(declare-fun subseq!338 (List!13316 List!13316) Bool)

(assert (=> b!705280 (= res!469088 (subseq!338 acc!652 newAcc!49))))

(declare-fun b!705281 () Bool)

(declare-fun res!469095 () Bool)

(assert (=> b!705281 (=> (not res!469095) (not e!397812))))

(assert (=> b!705281 (= res!469095 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19660 a!3591)))))

(declare-fun b!705282 () Bool)

(declare-fun res!469079 () Bool)

(assert (=> b!705282 (=> (not res!469079) (not e!397812))))

(assert (=> b!705282 (= res!469079 (noDuplicate!1140 newAcc!49))))

(declare-fun b!705283 () Bool)

(declare-fun res!469086 () Bool)

(assert (=> b!705283 (=> (not res!469086) (not e!397812))))

(assert (=> b!705283 (= res!469086 (not (contains!3893 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705284 () Bool)

(declare-fun res!469094 () Bool)

(assert (=> b!705284 (=> (not res!469094) (not e!397812))))

(assert (=> b!705284 (= res!469094 (not (validKeyInArray!0 (select (arr!19275 a!3591) from!2969))))))

(declare-fun b!705285 () Bool)

(declare-fun res!469090 () Bool)

(assert (=> b!705285 (=> (not res!469090) (not e!397812))))

(assert (=> b!705285 (= res!469090 (not (contains!3893 acc!652 k!2824)))))

(assert (= (and start!62558 res!469091) b!705277))

(assert (= (and b!705277 res!469085) b!705282))

(assert (= (and b!705282 res!469079) b!705269))

(assert (= (and b!705269 res!469083) b!705279))

(assert (= (and b!705279 res!469093) b!705268))

(assert (= (and b!705268 res!469081) b!705285))

(assert (= (and b!705285 res!469090) b!705278))

(assert (= (and b!705278 res!469087) b!705271))

(assert (= (and b!705271 res!469084) b!705280))

(assert (= (and b!705280 res!469088) b!705275))

(assert (= (and b!705275 res!469078) b!705273))

(assert (= (and b!705273 res!469082) b!705283))

(assert (= (and b!705283 res!469086) b!705272))

(assert (= (and b!705272 res!469092) b!705281))

(assert (= (and b!705281 res!469095) b!705284))

(assert (= (and b!705284 res!469094) b!705276))

(assert (= (and b!705276 res!469080) b!705270))

(assert (= (and b!705270 res!469089) b!705274))

(declare-fun m!663487 () Bool)

(assert (=> b!705271 m!663487))

(declare-fun m!663489 () Bool)

(assert (=> b!705273 m!663489))

(declare-fun m!663491 () Bool)

(assert (=> b!705274 m!663491))

(declare-fun m!663493 () Bool)

(assert (=> b!705275 m!663493))

(declare-fun m!663495 () Bool)

(assert (=> b!705284 m!663495))

(assert (=> b!705284 m!663495))

(declare-fun m!663497 () Bool)

(assert (=> b!705284 m!663497))

(declare-fun m!663499 () Bool)

(assert (=> b!705285 m!663499))

(declare-fun m!663501 () Bool)

(assert (=> b!705282 m!663501))

(declare-fun m!663503 () Bool)

(assert (=> b!705278 m!663503))

(declare-fun m!663505 () Bool)

(assert (=> b!705272 m!663505))

(declare-fun m!663507 () Bool)

(assert (=> b!705280 m!663507))

(declare-fun m!663509 () Bool)

(assert (=> b!705283 m!663509))

(declare-fun m!663511 () Bool)

(assert (=> b!705269 m!663511))

(declare-fun m!663513 () Bool)

(assert (=> b!705268 m!663513))

(declare-fun m!663515 () Bool)

(assert (=> b!705270 m!663515))

(declare-fun m!663517 () Bool)

(assert (=> start!62558 m!663517))

(declare-fun m!663519 () Bool)

(assert (=> b!705277 m!663519))

(declare-fun m!663521 () Bool)

(assert (=> b!705279 m!663521))

(push 1)

(assert (not b!705277))

(assert (not b!705268))

(assert (not b!705271))

(assert (not b!705273))

(assert (not b!705270))

(assert (not b!705284))

(assert (not b!705274))

(assert (not start!62558))

(assert (not b!705278))

(assert (not b!705269))

(assert (not b!705283))

(assert (not b!705275))

(assert (not b!705285))

(assert (not b!705279))

(assert (not b!705280))

(assert (not b!705272))

(assert (not b!705282))

(check-sat)

(pop 1)

