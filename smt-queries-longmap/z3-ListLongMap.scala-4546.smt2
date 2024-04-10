; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63354 () Bool)

(assert start!63354)

(declare-fun b!713581 () Bool)

(declare-fun res!476669 () Bool)

(declare-fun e!401273 () Bool)

(assert (=> b!713581 (=> (not res!476669) (not e!401273))))

(declare-datatypes ((List!13410 0))(
  ( (Nil!13407) (Cons!13406 (h!14451 (_ BitVec 64)) (t!19725 List!13410)) )
))
(declare-fun acc!652 () List!13410)

(declare-fun newAcc!49 () List!13410)

(declare-fun subseq!432 (List!13410 List!13410) Bool)

(assert (=> b!713581 (= res!476669 (subseq!432 acc!652 newAcc!49))))

(declare-fun b!713583 () Bool)

(declare-fun res!476666 () Bool)

(assert (=> b!713583 (=> (not res!476666) (not e!401273))))

(declare-fun contains!3987 (List!13410 (_ BitVec 64)) Bool)

(assert (=> b!713583 (= res!476666 (not (contains!3987 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713584 () Bool)

(declare-fun res!476667 () Bool)

(assert (=> b!713584 (=> (not res!476667) (not e!401273))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713584 (= res!476667 (validKeyInArray!0 k0!2824))))

(declare-fun b!713585 () Bool)

(declare-fun res!476677 () Bool)

(assert (=> b!713585 (=> (not res!476677) (not e!401273))))

(assert (=> b!713585 (= res!476677 (not (contains!3987 acc!652 k0!2824)))))

(declare-fun b!713586 () Bool)

(declare-fun res!476673 () Bool)

(assert (=> b!713586 (=> (not res!476673) (not e!401273))))

(declare-datatypes ((array!40458 0))(
  ( (array!40459 (arr!19369 (Array (_ BitVec 32) (_ BitVec 64))) (size!19780 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40458)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40458 (_ BitVec 32) List!13410) Bool)

(assert (=> b!713586 (= res!476673 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713587 () Bool)

(declare-fun res!476674 () Bool)

(assert (=> b!713587 (=> (not res!476674) (not e!401273))))

(assert (=> b!713587 (= res!476674 (not (contains!3987 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713588 () Bool)

(declare-fun res!476668 () Bool)

(assert (=> b!713588 (=> (not res!476668) (not e!401273))))

(assert (=> b!713588 (= res!476668 (contains!3987 newAcc!49 k0!2824))))

(declare-fun res!476672 () Bool)

(assert (=> start!63354 (=> (not res!476672) (not e!401273))))

(assert (=> start!63354 (= res!476672 (and (bvslt (size!19780 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19780 a!3591))))))

(assert (=> start!63354 e!401273))

(assert (=> start!63354 true))

(declare-fun array_inv!15165 (array!40458) Bool)

(assert (=> start!63354 (array_inv!15165 a!3591)))

(declare-fun b!713582 () Bool)

(declare-fun res!476670 () Bool)

(assert (=> b!713582 (=> (not res!476670) (not e!401273))))

(declare-fun -!397 (List!13410 (_ BitVec 64)) List!13410)

(assert (=> b!713582 (= res!476670 (= (-!397 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713589 () Bool)

(declare-fun res!476676 () Bool)

(assert (=> b!713589 (=> (not res!476676) (not e!401273))))

(assert (=> b!713589 (= res!476676 (not (contains!3987 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713590 () Bool)

(declare-fun res!476675 () Bool)

(assert (=> b!713590 (=> (not res!476675) (not e!401273))))

(declare-fun noDuplicate!1234 (List!13410) Bool)

(assert (=> b!713590 (= res!476675 (noDuplicate!1234 newAcc!49))))

(declare-fun b!713591 () Bool)

(declare-fun res!476671 () Bool)

(assert (=> b!713591 (=> (not res!476671) (not e!401273))))

(declare-fun arrayContainsKey!0 (array!40458 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713591 (= res!476671 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713592 () Bool)

(assert (=> b!713592 (= e!401273 false)))

(declare-fun lt!318701 () Bool)

(assert (=> b!713592 (= lt!318701 (contains!3987 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713593 () Bool)

(declare-fun res!476665 () Bool)

(assert (=> b!713593 (=> (not res!476665) (not e!401273))))

(assert (=> b!713593 (= res!476665 (noDuplicate!1234 acc!652))))

(assert (= (and start!63354 res!476672) b!713593))

(assert (= (and b!713593 res!476665) b!713590))

(assert (= (and b!713590 res!476675) b!713589))

(assert (= (and b!713589 res!476676) b!713587))

(assert (= (and b!713587 res!476674) b!713591))

(assert (= (and b!713591 res!476671) b!713585))

(assert (= (and b!713585 res!476677) b!713584))

(assert (= (and b!713584 res!476667) b!713586))

(assert (= (and b!713586 res!476673) b!713581))

(assert (= (and b!713581 res!476669) b!713588))

(assert (= (and b!713588 res!476668) b!713582))

(assert (= (and b!713582 res!476670) b!713583))

(assert (= (and b!713583 res!476666) b!713592))

(declare-fun m!670343 () Bool)

(assert (=> b!713591 m!670343))

(declare-fun m!670345 () Bool)

(assert (=> b!713592 m!670345))

(declare-fun m!670347 () Bool)

(assert (=> b!713590 m!670347))

(declare-fun m!670349 () Bool)

(assert (=> b!713586 m!670349))

(declare-fun m!670351 () Bool)

(assert (=> start!63354 m!670351))

(declare-fun m!670353 () Bool)

(assert (=> b!713588 m!670353))

(declare-fun m!670355 () Bool)

(assert (=> b!713583 m!670355))

(declare-fun m!670357 () Bool)

(assert (=> b!713589 m!670357))

(declare-fun m!670359 () Bool)

(assert (=> b!713593 m!670359))

(declare-fun m!670361 () Bool)

(assert (=> b!713585 m!670361))

(declare-fun m!670363 () Bool)

(assert (=> b!713581 m!670363))

(declare-fun m!670365 () Bool)

(assert (=> b!713587 m!670365))

(declare-fun m!670367 () Bool)

(assert (=> b!713582 m!670367))

(declare-fun m!670369 () Bool)

(assert (=> b!713584 m!670369))

(check-sat (not b!713588) (not b!713583) (not b!713582) (not start!63354) (not b!713587) (not b!713586) (not b!713592) (not b!713590) (not b!713589) (not b!713581) (not b!713584) (not b!713591) (not b!713585) (not b!713593))
(check-sat)
