; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62488 () Bool)

(assert start!62488)

(declare-fun b!703378 () Bool)

(declare-fun res!467202 () Bool)

(declare-fun e!397602 () Bool)

(assert (=> b!703378 (=> (not res!467202) (not e!397602))))

(declare-datatypes ((List!13281 0))(
  ( (Nil!13278) (Cons!13277 (h!14322 (_ BitVec 64)) (t!19563 List!13281)) )
))
(declare-fun acc!652 () List!13281)

(declare-fun contains!3858 (List!13281 (_ BitVec 64)) Bool)

(assert (=> b!703378 (= res!467202 (not (contains!3858 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703380 () Bool)

(declare-fun res!467189 () Bool)

(assert (=> b!703380 (=> (not res!467189) (not e!397602))))

(declare-datatypes ((array!40167 0))(
  ( (array!40168 (arr!19240 (Array (_ BitVec 32) (_ BitVec 64))) (size!19625 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40167)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40167 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703380 (= res!467189 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703381 () Bool)

(declare-fun res!467201 () Bool)

(assert (=> b!703381 (=> (not res!467201) (not e!397602))))

(declare-fun newAcc!49 () List!13281)

(assert (=> b!703381 (= res!467201 (not (contains!3858 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703382 () Bool)

(declare-fun res!467190 () Bool)

(assert (=> b!703382 (=> (not res!467190) (not e!397602))))

(assert (=> b!703382 (= res!467190 (not (contains!3858 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703383 () Bool)

(declare-fun res!467194 () Bool)

(assert (=> b!703383 (=> (not res!467194) (not e!397602))))

(assert (=> b!703383 (= res!467194 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703384 () Bool)

(declare-fun res!467204 () Bool)

(assert (=> b!703384 (=> (not res!467204) (not e!397602))))

(declare-fun noDuplicate!1105 (List!13281) Bool)

(assert (=> b!703384 (= res!467204 (noDuplicate!1105 newAcc!49))))

(declare-fun b!703385 () Bool)

(declare-fun res!467188 () Bool)

(assert (=> b!703385 (=> (not res!467188) (not e!397602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703385 (= res!467188 (not (validKeyInArray!0 (select (arr!19240 a!3591) from!2969))))))

(declare-fun res!467198 () Bool)

(assert (=> start!62488 (=> (not res!467198) (not e!397602))))

(assert (=> start!62488 (= res!467198 (and (bvslt (size!19625 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19625 a!3591))))))

(assert (=> start!62488 e!397602))

(assert (=> start!62488 true))

(declare-fun array_inv!15036 (array!40167) Bool)

(assert (=> start!62488 (array_inv!15036 a!3591)))

(declare-fun b!703379 () Bool)

(declare-fun res!467205 () Bool)

(assert (=> b!703379 (=> (not res!467205) (not e!397602))))

(declare-fun -!268 (List!13281 (_ BitVec 64)) List!13281)

(assert (=> b!703379 (= res!467205 (= (-!268 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703386 () Bool)

(declare-fun res!467197 () Bool)

(assert (=> b!703386 (=> (not res!467197) (not e!397602))))

(assert (=> b!703386 (= res!467197 (validKeyInArray!0 k0!2824))))

(declare-fun b!703387 () Bool)

(declare-fun res!467199 () Bool)

(assert (=> b!703387 (=> (not res!467199) (not e!397602))))

(declare-fun subseq!303 (List!13281 List!13281) Bool)

(assert (=> b!703387 (= res!467199 (subseq!303 acc!652 newAcc!49))))

(declare-fun b!703388 () Bool)

(declare-fun res!467200 () Bool)

(assert (=> b!703388 (=> (not res!467200) (not e!397602))))

(assert (=> b!703388 (= res!467200 (contains!3858 newAcc!49 k0!2824))))

(declare-fun b!703389 () Bool)

(declare-fun res!467192 () Bool)

(assert (=> b!703389 (=> (not res!467192) (not e!397602))))

(assert (=> b!703389 (= res!467192 (noDuplicate!1105 acc!652))))

(declare-fun b!703390 () Bool)

(assert (=> b!703390 (= e!397602 false)))

(declare-fun lt!317784 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40167 (_ BitVec 32) List!13281) Bool)

(assert (=> b!703390 (= lt!317784 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703391 () Bool)

(declare-fun res!467203 () Bool)

(assert (=> b!703391 (=> (not res!467203) (not e!397602))))

(assert (=> b!703391 (= res!467203 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703392 () Bool)

(declare-fun res!467195 () Bool)

(assert (=> b!703392 (=> (not res!467195) (not e!397602))))

(assert (=> b!703392 (= res!467195 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703393 () Bool)

(declare-fun res!467196 () Bool)

(assert (=> b!703393 (=> (not res!467196) (not e!397602))))

(assert (=> b!703393 (= res!467196 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19625 a!3591)))))

(declare-fun b!703394 () Bool)

(declare-fun res!467193 () Bool)

(assert (=> b!703394 (=> (not res!467193) (not e!397602))))

(assert (=> b!703394 (= res!467193 (not (contains!3858 acc!652 k0!2824)))))

(declare-fun b!703395 () Bool)

(declare-fun res!467191 () Bool)

(assert (=> b!703395 (=> (not res!467191) (not e!397602))))

(assert (=> b!703395 (= res!467191 (not (contains!3858 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62488 res!467198) b!703389))

(assert (= (and b!703389 res!467192) b!703384))

(assert (= (and b!703384 res!467204) b!703382))

(assert (= (and b!703382 res!467190) b!703378))

(assert (= (and b!703378 res!467202) b!703391))

(assert (= (and b!703391 res!467203) b!703394))

(assert (= (and b!703394 res!467193) b!703386))

(assert (= (and b!703386 res!467197) b!703392))

(assert (= (and b!703392 res!467195) b!703387))

(assert (= (and b!703387 res!467199) b!703388))

(assert (= (and b!703388 res!467200) b!703379))

(assert (= (and b!703379 res!467205) b!703381))

(assert (= (and b!703381 res!467201) b!703395))

(assert (= (and b!703395 res!467191) b!703393))

(assert (= (and b!703393 res!467196) b!703385))

(assert (= (and b!703385 res!467188) b!703383))

(assert (= (and b!703383 res!467194) b!703380))

(assert (= (and b!703380 res!467189) b!703390))

(declare-fun m!662227 () Bool)

(assert (=> b!703384 m!662227))

(declare-fun m!662229 () Bool)

(assert (=> b!703391 m!662229))

(declare-fun m!662231 () Bool)

(assert (=> b!703386 m!662231))

(declare-fun m!662233 () Bool)

(assert (=> b!703379 m!662233))

(declare-fun m!662235 () Bool)

(assert (=> b!703381 m!662235))

(declare-fun m!662237 () Bool)

(assert (=> b!703394 m!662237))

(declare-fun m!662239 () Bool)

(assert (=> b!703395 m!662239))

(declare-fun m!662241 () Bool)

(assert (=> b!703382 m!662241))

(declare-fun m!662243 () Bool)

(assert (=> b!703378 m!662243))

(declare-fun m!662245 () Bool)

(assert (=> start!62488 m!662245))

(declare-fun m!662247 () Bool)

(assert (=> b!703385 m!662247))

(assert (=> b!703385 m!662247))

(declare-fun m!662249 () Bool)

(assert (=> b!703385 m!662249))

(declare-fun m!662251 () Bool)

(assert (=> b!703388 m!662251))

(declare-fun m!662253 () Bool)

(assert (=> b!703387 m!662253))

(declare-fun m!662255 () Bool)

(assert (=> b!703392 m!662255))

(declare-fun m!662257 () Bool)

(assert (=> b!703390 m!662257))

(declare-fun m!662259 () Bool)

(assert (=> b!703389 m!662259))

(declare-fun m!662261 () Bool)

(assert (=> b!703380 m!662261))

(check-sat (not b!703379) (not b!703386) (not b!703391) (not b!703394) (not b!703380) (not b!703390) (not b!703395) (not b!703382) (not b!703381) (not b!703378) (not b!703389) (not b!703387) (not b!703384) (not b!703392) (not b!703388) (not b!703385) (not start!62488))
(check-sat)
