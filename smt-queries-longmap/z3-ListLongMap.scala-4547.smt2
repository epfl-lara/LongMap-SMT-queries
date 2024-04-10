; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63360 () Bool)

(assert start!63360)

(declare-fun b!713698 () Bool)

(declare-fun res!476784 () Bool)

(declare-fun e!401290 () Bool)

(assert (=> b!713698 (=> (not res!476784) (not e!401290))))

(declare-datatypes ((List!13413 0))(
  ( (Nil!13410) (Cons!13409 (h!14454 (_ BitVec 64)) (t!19728 List!13413)) )
))
(declare-fun acc!652 () List!13413)

(declare-fun contains!3990 (List!13413 (_ BitVec 64)) Bool)

(assert (=> b!713698 (= res!476784 (not (contains!3990 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713699 () Bool)

(declare-fun res!476789 () Bool)

(assert (=> b!713699 (=> (not res!476789) (not e!401290))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!713699 (= res!476789 (not (contains!3990 acc!652 k0!2824)))))

(declare-fun b!713700 () Bool)

(declare-fun res!476786 () Bool)

(assert (=> b!713700 (=> (not res!476786) (not e!401290))))

(declare-fun newAcc!49 () List!13413)

(declare-fun noDuplicate!1237 (List!13413) Bool)

(assert (=> b!713700 (= res!476786 (noDuplicate!1237 newAcc!49))))

(declare-fun b!713701 () Bool)

(declare-fun res!476793 () Bool)

(assert (=> b!713701 (=> (not res!476793) (not e!401290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713701 (= res!476793 (validKeyInArray!0 k0!2824))))

(declare-fun b!713702 () Bool)

(assert (=> b!713702 (= e!401290 false)))

(declare-fun lt!318710 () Bool)

(assert (=> b!713702 (= lt!318710 (contains!3990 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713703 () Bool)

(declare-fun res!476783 () Bool)

(assert (=> b!713703 (=> (not res!476783) (not e!401290))))

(declare-fun -!400 (List!13413 (_ BitVec 64)) List!13413)

(assert (=> b!713703 (= res!476783 (= (-!400 newAcc!49 k0!2824) acc!652))))

(declare-fun res!476785 () Bool)

(assert (=> start!63360 (=> (not res!476785) (not e!401290))))

(declare-datatypes ((array!40464 0))(
  ( (array!40465 (arr!19372 (Array (_ BitVec 32) (_ BitVec 64))) (size!19783 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40464)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63360 (= res!476785 (and (bvslt (size!19783 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19783 a!3591))))))

(assert (=> start!63360 e!401290))

(assert (=> start!63360 true))

(declare-fun array_inv!15168 (array!40464) Bool)

(assert (=> start!63360 (array_inv!15168 a!3591)))

(declare-fun b!713704 () Bool)

(declare-fun res!476790 () Bool)

(assert (=> b!713704 (=> (not res!476790) (not e!401290))))

(declare-fun arrayNoDuplicates!0 (array!40464 (_ BitVec 32) List!13413) Bool)

(assert (=> b!713704 (= res!476790 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713705 () Bool)

(declare-fun res!476788 () Bool)

(assert (=> b!713705 (=> (not res!476788) (not e!401290))))

(assert (=> b!713705 (= res!476788 (not (contains!3990 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713706 () Bool)

(declare-fun res!476782 () Bool)

(assert (=> b!713706 (=> (not res!476782) (not e!401290))))

(assert (=> b!713706 (= res!476782 (not (contains!3990 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713707 () Bool)

(declare-fun res!476791 () Bool)

(assert (=> b!713707 (=> (not res!476791) (not e!401290))))

(declare-fun arrayContainsKey!0 (array!40464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713707 (= res!476791 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713708 () Bool)

(declare-fun res!476787 () Bool)

(assert (=> b!713708 (=> (not res!476787) (not e!401290))))

(assert (=> b!713708 (= res!476787 (contains!3990 newAcc!49 k0!2824))))

(declare-fun b!713709 () Bool)

(declare-fun res!476792 () Bool)

(assert (=> b!713709 (=> (not res!476792) (not e!401290))))

(declare-fun subseq!435 (List!13413 List!13413) Bool)

(assert (=> b!713709 (= res!476792 (subseq!435 acc!652 newAcc!49))))

(declare-fun b!713710 () Bool)

(declare-fun res!476794 () Bool)

(assert (=> b!713710 (=> (not res!476794) (not e!401290))))

(assert (=> b!713710 (= res!476794 (noDuplicate!1237 acc!652))))

(assert (= (and start!63360 res!476785) b!713710))

(assert (= (and b!713710 res!476794) b!713700))

(assert (= (and b!713700 res!476786) b!713705))

(assert (= (and b!713705 res!476788) b!713698))

(assert (= (and b!713698 res!476784) b!713707))

(assert (= (and b!713707 res!476791) b!713699))

(assert (= (and b!713699 res!476789) b!713701))

(assert (= (and b!713701 res!476793) b!713704))

(assert (= (and b!713704 res!476790) b!713709))

(assert (= (and b!713709 res!476792) b!713708))

(assert (= (and b!713708 res!476787) b!713703))

(assert (= (and b!713703 res!476783) b!713706))

(assert (= (and b!713706 res!476782) b!713702))

(declare-fun m!670427 () Bool)

(assert (=> b!713708 m!670427))

(declare-fun m!670429 () Bool)

(assert (=> b!713703 m!670429))

(declare-fun m!670431 () Bool)

(assert (=> start!63360 m!670431))

(declare-fun m!670433 () Bool)

(assert (=> b!713704 m!670433))

(declare-fun m!670435 () Bool)

(assert (=> b!713699 m!670435))

(declare-fun m!670437 () Bool)

(assert (=> b!713698 m!670437))

(declare-fun m!670439 () Bool)

(assert (=> b!713707 m!670439))

(declare-fun m!670441 () Bool)

(assert (=> b!713706 m!670441))

(declare-fun m!670443 () Bool)

(assert (=> b!713701 m!670443))

(declare-fun m!670445 () Bool)

(assert (=> b!713702 m!670445))

(declare-fun m!670447 () Bool)

(assert (=> b!713710 m!670447))

(declare-fun m!670449 () Bool)

(assert (=> b!713709 m!670449))

(declare-fun m!670451 () Bool)

(assert (=> b!713705 m!670451))

(declare-fun m!670453 () Bool)

(assert (=> b!713700 m!670453))

(check-sat (not b!713706) (not b!713702) (not b!713704) (not b!713705) (not b!713707) (not b!713703) (not start!63360) (not b!713710) (not b!713701) (not b!713709) (not b!713708) (not b!713698) (not b!713699) (not b!713700))
(check-sat)
