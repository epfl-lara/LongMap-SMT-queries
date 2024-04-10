; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63356 () Bool)

(assert start!63356)

(declare-fun res!476714 () Bool)

(declare-fun e!401278 () Bool)

(assert (=> start!63356 (=> (not res!476714) (not e!401278))))

(declare-datatypes ((array!40460 0))(
  ( (array!40461 (arr!19370 (Array (_ BitVec 32) (_ BitVec 64))) (size!19781 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40460)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63356 (= res!476714 (and (bvslt (size!19781 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19781 a!3591))))))

(assert (=> start!63356 e!401278))

(assert (=> start!63356 true))

(declare-fun array_inv!15166 (array!40460) Bool)

(assert (=> start!63356 (array_inv!15166 a!3591)))

(declare-fun b!713620 () Bool)

(declare-fun res!476711 () Bool)

(assert (=> b!713620 (=> (not res!476711) (not e!401278))))

(declare-datatypes ((List!13411 0))(
  ( (Nil!13408) (Cons!13407 (h!14452 (_ BitVec 64)) (t!19726 List!13411)) )
))
(declare-fun newAcc!49 () List!13411)

(declare-fun contains!3988 (List!13411 (_ BitVec 64)) Bool)

(assert (=> b!713620 (= res!476711 (not (contains!3988 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713621 () Bool)

(declare-fun res!476704 () Bool)

(assert (=> b!713621 (=> (not res!476704) (not e!401278))))

(declare-fun acc!652 () List!13411)

(assert (=> b!713621 (= res!476704 (not (contains!3988 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713622 () Bool)

(declare-fun res!476706 () Bool)

(assert (=> b!713622 (=> (not res!476706) (not e!401278))))

(assert (=> b!713622 (= res!476706 (not (contains!3988 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713623 () Bool)

(declare-fun res!476705 () Bool)

(assert (=> b!713623 (=> (not res!476705) (not e!401278))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713623 (= res!476705 (validKeyInArray!0 k!2824))))

(declare-fun b!713624 () Bool)

(assert (=> b!713624 (= e!401278 false)))

(declare-fun lt!318704 () Bool)

(assert (=> b!713624 (= lt!318704 (contains!3988 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713625 () Bool)

(declare-fun res!476716 () Bool)

(assert (=> b!713625 (=> (not res!476716) (not e!401278))))

(declare-fun noDuplicate!1235 (List!13411) Bool)

(assert (=> b!713625 (= res!476716 (noDuplicate!1235 newAcc!49))))

(declare-fun b!713626 () Bool)

(declare-fun res!476709 () Bool)

(assert (=> b!713626 (=> (not res!476709) (not e!401278))))

(assert (=> b!713626 (= res!476709 (contains!3988 newAcc!49 k!2824))))

(declare-fun b!713627 () Bool)

(declare-fun res!476708 () Bool)

(assert (=> b!713627 (=> (not res!476708) (not e!401278))))

(assert (=> b!713627 (= res!476708 (noDuplicate!1235 acc!652))))

(declare-fun b!713628 () Bool)

(declare-fun res!476707 () Bool)

(assert (=> b!713628 (=> (not res!476707) (not e!401278))))

(declare-fun arrayContainsKey!0 (array!40460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713628 (= res!476707 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713629 () Bool)

(declare-fun res!476713 () Bool)

(assert (=> b!713629 (=> (not res!476713) (not e!401278))))

(declare-fun -!398 (List!13411 (_ BitVec 64)) List!13411)

(assert (=> b!713629 (= res!476713 (= (-!398 newAcc!49 k!2824) acc!652))))

(declare-fun b!713630 () Bool)

(declare-fun res!476712 () Bool)

(assert (=> b!713630 (=> (not res!476712) (not e!401278))))

(declare-fun subseq!433 (List!13411 List!13411) Bool)

(assert (=> b!713630 (= res!476712 (subseq!433 acc!652 newAcc!49))))

(declare-fun b!713631 () Bool)

(declare-fun res!476715 () Bool)

(assert (=> b!713631 (=> (not res!476715) (not e!401278))))

(declare-fun arrayNoDuplicates!0 (array!40460 (_ BitVec 32) List!13411) Bool)

(assert (=> b!713631 (= res!476715 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713632 () Bool)

(declare-fun res!476710 () Bool)

(assert (=> b!713632 (=> (not res!476710) (not e!401278))))

(assert (=> b!713632 (= res!476710 (not (contains!3988 acc!652 k!2824)))))

(assert (= (and start!63356 res!476714) b!713627))

(assert (= (and b!713627 res!476708) b!713625))

(assert (= (and b!713625 res!476716) b!713621))

(assert (= (and b!713621 res!476704) b!713622))

(assert (= (and b!713622 res!476706) b!713628))

(assert (= (and b!713628 res!476707) b!713632))

(assert (= (and b!713632 res!476710) b!713623))

(assert (= (and b!713623 res!476705) b!713631))

(assert (= (and b!713631 res!476715) b!713630))

(assert (= (and b!713630 res!476712) b!713626))

(assert (= (and b!713626 res!476709) b!713629))

(assert (= (and b!713629 res!476713) b!713620))

(assert (= (and b!713620 res!476711) b!713624))

(declare-fun m!670371 () Bool)

(assert (=> b!713627 m!670371))

(declare-fun m!670373 () Bool)

(assert (=> b!713632 m!670373))

(declare-fun m!670375 () Bool)

(assert (=> b!713626 m!670375))

(declare-fun m!670377 () Bool)

(assert (=> b!713620 m!670377))

(declare-fun m!670379 () Bool)

(assert (=> b!713622 m!670379))

(declare-fun m!670381 () Bool)

(assert (=> b!713631 m!670381))

(declare-fun m!670383 () Bool)

(assert (=> b!713621 m!670383))

(declare-fun m!670385 () Bool)

(assert (=> start!63356 m!670385))

(declare-fun m!670387 () Bool)

(assert (=> b!713624 m!670387))

(declare-fun m!670389 () Bool)

(assert (=> b!713630 m!670389))

(declare-fun m!670391 () Bool)

(assert (=> b!713628 m!670391))

(declare-fun m!670393 () Bool)

(assert (=> b!713625 m!670393))

(declare-fun m!670395 () Bool)

(assert (=> b!713623 m!670395))

(declare-fun m!670397 () Bool)

(assert (=> b!713629 m!670397))

(push 1)

(assert (not b!713624))

(assert (not b!713631))

(assert (not b!713628))

(assert (not b!713630))

(assert (not b!713622))

(assert (not b!713626))

(assert (not b!713627))

(assert (not b!713632))

(assert (not b!713620))

(assert (not b!713629))

(assert (not b!713623))

(assert (not b!713625))

(assert (not start!63356))

(assert (not b!713621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

