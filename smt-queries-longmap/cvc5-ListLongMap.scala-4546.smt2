; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63352 () Bool)

(assert start!63352)

(declare-fun b!713542 () Bool)

(declare-fun res!476637 () Bool)

(declare-fun e!401267 () Bool)

(assert (=> b!713542 (=> (not res!476637) (not e!401267))))

(declare-datatypes ((List!13409 0))(
  ( (Nil!13406) (Cons!13405 (h!14450 (_ BitVec 64)) (t!19724 List!13409)) )
))
(declare-fun acc!652 () List!13409)

(declare-fun newAcc!49 () List!13409)

(declare-fun subseq!431 (List!13409 List!13409) Bool)

(assert (=> b!713542 (= res!476637 (subseq!431 acc!652 newAcc!49))))

(declare-fun b!713543 () Bool)

(declare-fun res!476631 () Bool)

(assert (=> b!713543 (=> (not res!476631) (not e!401267))))

(declare-fun noDuplicate!1233 (List!13409) Bool)

(assert (=> b!713543 (= res!476631 (noDuplicate!1233 acc!652))))

(declare-fun b!713544 () Bool)

(declare-fun res!476632 () Bool)

(assert (=> b!713544 (=> (not res!476632) (not e!401267))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3986 (List!13409 (_ BitVec 64)) Bool)

(assert (=> b!713544 (= res!476632 (contains!3986 newAcc!49 k!2824))))

(declare-fun b!713545 () Bool)

(declare-fun res!476634 () Bool)

(assert (=> b!713545 (=> (not res!476634) (not e!401267))))

(declare-fun -!396 (List!13409 (_ BitVec 64)) List!13409)

(assert (=> b!713545 (= res!476634 (= (-!396 newAcc!49 k!2824) acc!652))))

(declare-fun b!713546 () Bool)

(declare-fun res!476633 () Bool)

(assert (=> b!713546 (=> (not res!476633) (not e!401267))))

(assert (=> b!713546 (= res!476633 (not (contains!3986 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713547 () Bool)

(declare-fun res!476627 () Bool)

(assert (=> b!713547 (=> (not res!476627) (not e!401267))))

(assert (=> b!713547 (= res!476627 (not (contains!3986 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713548 () Bool)

(assert (=> b!713548 (= e!401267 false)))

(declare-fun lt!318698 () Bool)

(assert (=> b!713548 (= lt!318698 (contains!3986 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713549 () Bool)

(declare-fun res!476629 () Bool)

(assert (=> b!713549 (=> (not res!476629) (not e!401267))))

(assert (=> b!713549 (= res!476629 (not (contains!3986 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476626 () Bool)

(assert (=> start!63352 (=> (not res!476626) (not e!401267))))

(declare-datatypes ((array!40456 0))(
  ( (array!40457 (arr!19368 (Array (_ BitVec 32) (_ BitVec 64))) (size!19779 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40456)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63352 (= res!476626 (and (bvslt (size!19779 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19779 a!3591))))))

(assert (=> start!63352 e!401267))

(assert (=> start!63352 true))

(declare-fun array_inv!15164 (array!40456) Bool)

(assert (=> start!63352 (array_inv!15164 a!3591)))

(declare-fun b!713550 () Bool)

(declare-fun res!476628 () Bool)

(assert (=> b!713550 (=> (not res!476628) (not e!401267))))

(assert (=> b!713550 (= res!476628 (noDuplicate!1233 newAcc!49))))

(declare-fun b!713551 () Bool)

(declare-fun res!476636 () Bool)

(assert (=> b!713551 (=> (not res!476636) (not e!401267))))

(declare-fun arrayContainsKey!0 (array!40456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713551 (= res!476636 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713552 () Bool)

(declare-fun res!476638 () Bool)

(assert (=> b!713552 (=> (not res!476638) (not e!401267))))

(declare-fun arrayNoDuplicates!0 (array!40456 (_ BitVec 32) List!13409) Bool)

(assert (=> b!713552 (= res!476638 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713553 () Bool)

(declare-fun res!476630 () Bool)

(assert (=> b!713553 (=> (not res!476630) (not e!401267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713553 (= res!476630 (validKeyInArray!0 k!2824))))

(declare-fun b!713554 () Bool)

(declare-fun res!476635 () Bool)

(assert (=> b!713554 (=> (not res!476635) (not e!401267))))

(assert (=> b!713554 (= res!476635 (not (contains!3986 acc!652 k!2824)))))

(assert (= (and start!63352 res!476626) b!713543))

(assert (= (and b!713543 res!476631) b!713550))

(assert (= (and b!713550 res!476628) b!713549))

(assert (= (and b!713549 res!476629) b!713546))

(assert (= (and b!713546 res!476633) b!713551))

(assert (= (and b!713551 res!476636) b!713554))

(assert (= (and b!713554 res!476635) b!713553))

(assert (= (and b!713553 res!476630) b!713552))

(assert (= (and b!713552 res!476638) b!713542))

(assert (= (and b!713542 res!476637) b!713544))

(assert (= (and b!713544 res!476632) b!713545))

(assert (= (and b!713545 res!476634) b!713547))

(assert (= (and b!713547 res!476627) b!713548))

(declare-fun m!670315 () Bool)

(assert (=> b!713548 m!670315))

(declare-fun m!670317 () Bool)

(assert (=> b!713549 m!670317))

(declare-fun m!670319 () Bool)

(assert (=> b!713546 m!670319))

(declare-fun m!670321 () Bool)

(assert (=> b!713544 m!670321))

(declare-fun m!670323 () Bool)

(assert (=> b!713553 m!670323))

(declare-fun m!670325 () Bool)

(assert (=> b!713542 m!670325))

(declare-fun m!670327 () Bool)

(assert (=> b!713552 m!670327))

(declare-fun m!670329 () Bool)

(assert (=> b!713545 m!670329))

(declare-fun m!670331 () Bool)

(assert (=> b!713543 m!670331))

(declare-fun m!670333 () Bool)

(assert (=> b!713547 m!670333))

(declare-fun m!670335 () Bool)

(assert (=> b!713554 m!670335))

(declare-fun m!670337 () Bool)

(assert (=> start!63352 m!670337))

(declare-fun m!670339 () Bool)

(assert (=> b!713551 m!670339))

(declare-fun m!670341 () Bool)

(assert (=> b!713550 m!670341))

(push 1)

(assert (not b!713549))

(assert (not b!713545))

(assert (not b!713552))

(assert (not b!713542))

(assert (not b!713548))

(assert (not b!713544))

(assert (not b!713543))

(assert (not b!713546))

(assert (not b!713554))

(assert (not b!713547))

(assert (not b!713550))

(assert (not b!713551))

(assert (not b!713553))

(assert (not start!63352))

(check-sat)

