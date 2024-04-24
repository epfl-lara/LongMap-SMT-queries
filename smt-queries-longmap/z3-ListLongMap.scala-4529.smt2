; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62698 () Bool)

(assert start!62698)

(declare-fun b!707374 () Bool)

(declare-fun res!471091 () Bool)

(declare-fun e!398181 () Bool)

(assert (=> b!707374 (=> (not res!471091) (not e!398181))))

(declare-datatypes ((List!13260 0))(
  ( (Nil!13257) (Cons!13256 (h!14304 (_ BitVec 64)) (t!19534 List!13260)) )
))
(declare-fun newAcc!49 () List!13260)

(declare-fun contains!3912 (List!13260 (_ BitVec 64)) Bool)

(assert (=> b!707374 (= res!471091 (not (contains!3912 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707376 () Bool)

(declare-fun res!471094 () Bool)

(assert (=> b!707376 (=> (not res!471094) (not e!398181))))

(declare-fun acc!652 () List!13260)

(assert (=> b!707376 (= res!471094 (not (contains!3912 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707377 () Bool)

(declare-fun res!471100 () Bool)

(assert (=> b!707377 (=> (not res!471100) (not e!398181))))

(declare-datatypes ((array!40317 0))(
  ( (array!40318 (arr!19312 (Array (_ BitVec 32) (_ BitVec 64))) (size!19695 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40317)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707377 (= res!471100 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707378 () Bool)

(declare-fun res!471085 () Bool)

(assert (=> b!707378 (=> (not res!471085) (not e!398181))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707378 (= res!471085 (validKeyInArray!0 (select (arr!19312 a!3591) from!2969)))))

(declare-fun b!707379 () Bool)

(declare-fun res!471093 () Bool)

(assert (=> b!707379 (=> (not res!471093) (not e!398181))))

(declare-fun -!344 (List!13260 (_ BitVec 64)) List!13260)

(assert (=> b!707379 (= res!471093 (= (-!344 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707380 () Bool)

(declare-fun res!471098 () Bool)

(assert (=> b!707380 (=> (not res!471098) (not e!398181))))

(declare-fun arrayNoDuplicates!0 (array!40317 (_ BitVec 32) List!13260) Bool)

(assert (=> b!707380 (= res!471098 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707381 () Bool)

(declare-fun res!471088 () Bool)

(assert (=> b!707381 (=> (not res!471088) (not e!398181))))

(assert (=> b!707381 (= res!471088 (not (contains!3912 acc!652 k0!2824)))))

(declare-fun b!707382 () Bool)

(declare-fun res!471096 () Bool)

(assert (=> b!707382 (=> (not res!471096) (not e!398181))))

(assert (=> b!707382 (= res!471096 (validKeyInArray!0 k0!2824))))

(declare-fun b!707383 () Bool)

(declare-fun res!471090 () Bool)

(assert (=> b!707383 (=> (not res!471090) (not e!398181))))

(assert (=> b!707383 (= res!471090 (not (contains!3912 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707384 () Bool)

(declare-fun res!471099 () Bool)

(assert (=> b!707384 (=> (not res!471099) (not e!398181))))

(declare-fun noDuplicate!1186 (List!13260) Bool)

(assert (=> b!707384 (= res!471099 (noDuplicate!1186 acc!652))))

(declare-fun b!707385 () Bool)

(declare-fun res!471092 () Bool)

(assert (=> b!707385 (=> (not res!471092) (not e!398181))))

(assert (=> b!707385 (= res!471092 (contains!3912 newAcc!49 k0!2824))))

(declare-fun b!707375 () Bool)

(declare-fun res!471097 () Bool)

(assert (=> b!707375 (=> (not res!471097) (not e!398181))))

(declare-fun subseq!380 (List!13260 List!13260) Bool)

(assert (=> b!707375 (= res!471097 (subseq!380 acc!652 newAcc!49))))

(declare-fun res!471095 () Bool)

(assert (=> start!62698 (=> (not res!471095) (not e!398181))))

(assert (=> start!62698 (= res!471095 (and (bvslt (size!19695 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19695 a!3591))))))

(assert (=> start!62698 e!398181))

(assert (=> start!62698 true))

(declare-fun array_inv!15171 (array!40317) Bool)

(assert (=> start!62698 (array_inv!15171 a!3591)))

(declare-fun b!707386 () Bool)

(declare-fun res!471089 () Bool)

(assert (=> b!707386 (=> (not res!471089) (not e!398181))))

(assert (=> b!707386 (= res!471089 (not (contains!3912 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707387 () Bool)

(declare-fun res!471087 () Bool)

(assert (=> b!707387 (=> (not res!471087) (not e!398181))))

(assert (=> b!707387 (= res!471087 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19695 a!3591)))))

(declare-fun b!707388 () Bool)

(assert (=> b!707388 (= e!398181 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707389 () Bool)

(declare-fun res!471086 () Bool)

(assert (=> b!707389 (=> (not res!471086) (not e!398181))))

(assert (=> b!707389 (= res!471086 (noDuplicate!1186 newAcc!49))))

(assert (= (and start!62698 res!471095) b!707384))

(assert (= (and b!707384 res!471099) b!707389))

(assert (= (and b!707389 res!471086) b!707376))

(assert (= (and b!707376 res!471094) b!707383))

(assert (= (and b!707383 res!471090) b!707377))

(assert (= (and b!707377 res!471100) b!707381))

(assert (= (and b!707381 res!471088) b!707382))

(assert (= (and b!707382 res!471096) b!707380))

(assert (= (and b!707380 res!471098) b!707375))

(assert (= (and b!707375 res!471097) b!707385))

(assert (= (and b!707385 res!471092) b!707379))

(assert (= (and b!707379 res!471093) b!707386))

(assert (= (and b!707386 res!471089) b!707374))

(assert (= (and b!707374 res!471091) b!707387))

(assert (= (and b!707387 res!471087) b!707378))

(assert (= (and b!707378 res!471085) b!707388))

(declare-fun m!665487 () Bool)

(assert (=> b!707378 m!665487))

(assert (=> b!707378 m!665487))

(declare-fun m!665489 () Bool)

(assert (=> b!707378 m!665489))

(declare-fun m!665491 () Bool)

(assert (=> b!707389 m!665491))

(declare-fun m!665493 () Bool)

(assert (=> start!62698 m!665493))

(declare-fun m!665495 () Bool)

(assert (=> b!707375 m!665495))

(declare-fun m!665497 () Bool)

(assert (=> b!707377 m!665497))

(declare-fun m!665499 () Bool)

(assert (=> b!707381 m!665499))

(declare-fun m!665501 () Bool)

(assert (=> b!707385 m!665501))

(declare-fun m!665503 () Bool)

(assert (=> b!707383 m!665503))

(declare-fun m!665505 () Bool)

(assert (=> b!707376 m!665505))

(declare-fun m!665507 () Bool)

(assert (=> b!707374 m!665507))

(declare-fun m!665509 () Bool)

(assert (=> b!707379 m!665509))

(declare-fun m!665511 () Bool)

(assert (=> b!707386 m!665511))

(declare-fun m!665513 () Bool)

(assert (=> b!707382 m!665513))

(declare-fun m!665515 () Bool)

(assert (=> b!707380 m!665515))

(declare-fun m!665517 () Bool)

(assert (=> b!707384 m!665517))

(check-sat (not b!707379) (not b!707386) (not b!707385) (not b!707382) (not b!707383) (not b!707375) (not b!707376) (not b!707381) (not start!62698) (not b!707380) (not b!707377) (not b!707378) (not b!707384) (not b!707389) (not b!707374))
(check-sat)
