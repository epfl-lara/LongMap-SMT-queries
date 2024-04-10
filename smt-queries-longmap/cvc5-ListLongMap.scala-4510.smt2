; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62528 () Bool)

(assert start!62528)

(declare-fun b!704458 () Bool)

(declare-fun res!468283 () Bool)

(declare-fun e!397723 () Bool)

(assert (=> b!704458 (=> (not res!468283) (not e!397723))))

(declare-datatypes ((List!13301 0))(
  ( (Nil!13298) (Cons!13297 (h!14342 (_ BitVec 64)) (t!19583 List!13301)) )
))
(declare-fun acc!652 () List!13301)

(declare-fun newAcc!49 () List!13301)

(declare-fun subseq!323 (List!13301 List!13301) Bool)

(assert (=> b!704458 (= res!468283 (subseq!323 acc!652 newAcc!49))))

(declare-fun b!704459 () Bool)

(declare-fun res!468277 () Bool)

(assert (=> b!704459 (=> (not res!468277) (not e!397723))))

(declare-fun noDuplicate!1125 (List!13301) Bool)

(assert (=> b!704459 (= res!468277 (noDuplicate!1125 newAcc!49))))

(declare-fun b!704460 () Bool)

(declare-fun res!468272 () Bool)

(assert (=> b!704460 (=> (not res!468272) (not e!397723))))

(declare-fun contains!3878 (List!13301 (_ BitVec 64)) Bool)

(assert (=> b!704460 (= res!468272 (not (contains!3878 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704461 () Bool)

(declare-fun res!468275 () Bool)

(assert (=> b!704461 (=> (not res!468275) (not e!397723))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!704461 (= res!468275 (not (contains!3878 acc!652 k!2824)))))

(declare-fun b!704462 () Bool)

(declare-fun res!468284 () Bool)

(assert (=> b!704462 (=> (not res!468284) (not e!397723))))

(assert (=> b!704462 (= res!468284 (not (contains!3878 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704463 () Bool)

(declare-fun res!468270 () Bool)

(assert (=> b!704463 (=> (not res!468270) (not e!397723))))

(declare-fun -!288 (List!13301 (_ BitVec 64)) List!13301)

(assert (=> b!704463 (= res!468270 (= (-!288 newAcc!49 k!2824) acc!652))))

(declare-fun b!704464 () Bool)

(declare-fun res!468276 () Bool)

(assert (=> b!704464 (=> (not res!468276) (not e!397723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704464 (= res!468276 (validKeyInArray!0 k!2824))))

(declare-fun b!704465 () Bool)

(declare-fun res!468280 () Bool)

(assert (=> b!704465 (=> (not res!468280) (not e!397723))))

(declare-datatypes ((array!40207 0))(
  ( (array!40208 (arr!19260 (Array (_ BitVec 32) (_ BitVec 64))) (size!19645 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40207)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!704465 (= res!468280 (not (validKeyInArray!0 (select (arr!19260 a!3591) from!2969))))))

(declare-fun b!704466 () Bool)

(assert (=> b!704466 (= e!397723 false)))

(declare-fun lt!317844 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40207 (_ BitVec 32) List!13301) Bool)

(assert (=> b!704466 (= lt!317844 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun res!468278 () Bool)

(assert (=> start!62528 (=> (not res!468278) (not e!397723))))

(assert (=> start!62528 (= res!468278 (and (bvslt (size!19645 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19645 a!3591))))))

(assert (=> start!62528 e!397723))

(assert (=> start!62528 true))

(declare-fun array_inv!15056 (array!40207) Bool)

(assert (=> start!62528 (array_inv!15056 a!3591)))

(declare-fun b!704467 () Bool)

(declare-fun res!468285 () Bool)

(assert (=> b!704467 (=> (not res!468285) (not e!397723))))

(assert (=> b!704467 (= res!468285 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704468 () Bool)

(declare-fun res!468282 () Bool)

(assert (=> b!704468 (=> (not res!468282) (not e!397723))))

(assert (=> b!704468 (= res!468282 (contains!3878 newAcc!49 k!2824))))

(declare-fun b!704469 () Bool)

(declare-fun res!468274 () Bool)

(assert (=> b!704469 (=> (not res!468274) (not e!397723))))

(assert (=> b!704469 (= res!468274 (noDuplicate!1125 acc!652))))

(declare-fun b!704470 () Bool)

(declare-fun res!468273 () Bool)

(assert (=> b!704470 (=> (not res!468273) (not e!397723))))

(assert (=> b!704470 (= res!468273 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19645 a!3591)))))

(declare-fun b!704471 () Bool)

(declare-fun res!468281 () Bool)

(assert (=> b!704471 (=> (not res!468281) (not e!397723))))

(assert (=> b!704471 (= res!468281 (not (contains!3878 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704472 () Bool)

(declare-fun res!468279 () Bool)

(assert (=> b!704472 (=> (not res!468279) (not e!397723))))

(declare-fun arrayContainsKey!0 (array!40207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704472 (= res!468279 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704473 () Bool)

(declare-fun res!468269 () Bool)

(assert (=> b!704473 (=> (not res!468269) (not e!397723))))

(assert (=> b!704473 (= res!468269 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704474 () Bool)

(declare-fun res!468271 () Bool)

(assert (=> b!704474 (=> (not res!468271) (not e!397723))))

(assert (=> b!704474 (= res!468271 (not (contains!3878 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704475 () Bool)

(declare-fun res!468268 () Bool)

(assert (=> b!704475 (=> (not res!468268) (not e!397723))))

(assert (=> b!704475 (= res!468268 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62528 res!468278) b!704469))

(assert (= (and b!704469 res!468274) b!704459))

(assert (= (and b!704459 res!468277) b!704460))

(assert (= (and b!704460 res!468272) b!704474))

(assert (= (and b!704474 res!468271) b!704473))

(assert (= (and b!704473 res!468269) b!704461))

(assert (= (and b!704461 res!468275) b!704464))

(assert (= (and b!704464 res!468276) b!704475))

(assert (= (and b!704475 res!468268) b!704458))

(assert (= (and b!704458 res!468283) b!704468))

(assert (= (and b!704468 res!468282) b!704463))

(assert (= (and b!704463 res!468270) b!704471))

(assert (= (and b!704471 res!468281) b!704462))

(assert (= (and b!704462 res!468284) b!704470))

(assert (= (and b!704470 res!468273) b!704465))

(assert (= (and b!704465 res!468280) b!704467))

(assert (= (and b!704467 res!468285) b!704472))

(assert (= (and b!704472 res!468279) b!704466))

(declare-fun m!662947 () Bool)

(assert (=> b!704468 m!662947))

(declare-fun m!662949 () Bool)

(assert (=> b!704461 m!662949))

(declare-fun m!662951 () Bool)

(assert (=> b!704460 m!662951))

(declare-fun m!662953 () Bool)

(assert (=> b!704463 m!662953))

(declare-fun m!662955 () Bool)

(assert (=> b!704472 m!662955))

(declare-fun m!662957 () Bool)

(assert (=> b!704465 m!662957))

(assert (=> b!704465 m!662957))

(declare-fun m!662959 () Bool)

(assert (=> b!704465 m!662959))

(declare-fun m!662961 () Bool)

(assert (=> b!704458 m!662961))

(declare-fun m!662963 () Bool)

(assert (=> b!704462 m!662963))

(declare-fun m!662965 () Bool)

(assert (=> b!704471 m!662965))

(declare-fun m!662967 () Bool)

(assert (=> b!704473 m!662967))

(declare-fun m!662969 () Bool)

(assert (=> b!704474 m!662969))

(declare-fun m!662971 () Bool)

(assert (=> b!704475 m!662971))

(declare-fun m!662973 () Bool)

(assert (=> start!62528 m!662973))

(declare-fun m!662975 () Bool)

(assert (=> b!704459 m!662975))

(declare-fun m!662977 () Bool)

(assert (=> b!704469 m!662977))

(declare-fun m!662979 () Bool)

(assert (=> b!704464 m!662979))

(declare-fun m!662981 () Bool)

(assert (=> b!704466 m!662981))

(push 1)

(assert (not b!704458))

(assert (not b!704468))

(assert (not b!704474))

(assert (not b!704464))

(assert (not b!704473))

(assert (not b!704459))

(assert (not b!704475))

(assert (not b!704471))

(assert (not b!704469))

(assert (not b!704466))

(assert (not b!704461))

(assert (not start!62528))

(assert (not b!704465))

(assert (not b!704463))

(assert (not b!704460))

(assert (not b!704462))

(assert (not b!704472))

(check-sat)

(pop 1)

