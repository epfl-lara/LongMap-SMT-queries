; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63352 () Bool)

(assert start!63352)

(declare-fun res!476730 () Bool)

(declare-fun e!401106 () Bool)

(assert (=> start!63352 (=> (not res!476730) (not e!401106))))

(declare-datatypes ((array!40467 0))(
  ( (array!40468 (arr!19373 (Array (_ BitVec 32) (_ BitVec 64))) (size!19785 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40467)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63352 (= res!476730 (and (bvslt (size!19785 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19785 a!3591))))))

(assert (=> start!63352 e!401106))

(assert (=> start!63352 true))

(declare-fun array_inv!15256 (array!40467) Bool)

(assert (=> start!63352 (array_inv!15256 a!3591)))

(declare-fun b!713471 () Bool)

(declare-fun res!476722 () Bool)

(assert (=> b!713471 (=> (not res!476722) (not e!401106))))

(declare-datatypes ((List!13453 0))(
  ( (Nil!13450) (Cons!13449 (h!14494 (_ BitVec 64)) (t!19759 List!13453)) )
))
(declare-fun acc!652 () List!13453)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3975 (List!13453 (_ BitVec 64)) Bool)

(assert (=> b!713471 (= res!476722 (not (contains!3975 acc!652 k0!2824)))))

(declare-fun b!713472 () Bool)

(declare-fun res!476731 () Bool)

(assert (=> b!713472 (=> (not res!476731) (not e!401106))))

(declare-fun arrayNoDuplicates!0 (array!40467 (_ BitVec 32) List!13453) Bool)

(assert (=> b!713472 (= res!476731 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713473 () Bool)

(declare-fun res!476723 () Bool)

(assert (=> b!713473 (=> (not res!476723) (not e!401106))))

(declare-fun newAcc!49 () List!13453)

(assert (=> b!713473 (= res!476723 (contains!3975 newAcc!49 k0!2824))))

(declare-fun b!713474 () Bool)

(declare-fun res!476732 () Bool)

(assert (=> b!713474 (=> (not res!476732) (not e!401106))))

(assert (=> b!713474 (= res!476732 (not (contains!3975 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713475 () Bool)

(declare-fun res!476724 () Bool)

(assert (=> b!713475 (=> (not res!476724) (not e!401106))))

(declare-fun noDuplicate!1244 (List!13453) Bool)

(assert (=> b!713475 (= res!476724 (noDuplicate!1244 acc!652))))

(declare-fun b!713476 () Bool)

(declare-fun res!476721 () Bool)

(assert (=> b!713476 (=> (not res!476721) (not e!401106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713476 (= res!476721 (validKeyInArray!0 k0!2824))))

(declare-fun b!713477 () Bool)

(declare-fun res!476728 () Bool)

(assert (=> b!713477 (=> (not res!476728) (not e!401106))))

(assert (=> b!713477 (= res!476728 (noDuplicate!1244 newAcc!49))))

(declare-fun b!713478 () Bool)

(assert (=> b!713478 (= e!401106 false)))

(declare-fun lt!318461 () Bool)

(assert (=> b!713478 (= lt!318461 (contains!3975 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713479 () Bool)

(declare-fun res!476725 () Bool)

(assert (=> b!713479 (=> (not res!476725) (not e!401106))))

(assert (=> b!713479 (= res!476725 (not (contains!3975 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713480 () Bool)

(declare-fun res!476726 () Bool)

(assert (=> b!713480 (=> (not res!476726) (not e!401106))))

(assert (=> b!713480 (= res!476726 (not (contains!3975 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713481 () Bool)

(declare-fun res!476729 () Bool)

(assert (=> b!713481 (=> (not res!476729) (not e!401106))))

(declare-fun subseq!437 (List!13453 List!13453) Bool)

(assert (=> b!713481 (= res!476729 (subseq!437 acc!652 newAcc!49))))

(declare-fun b!713482 () Bool)

(declare-fun res!476727 () Bool)

(assert (=> b!713482 (=> (not res!476727) (not e!401106))))

(declare-fun arrayContainsKey!0 (array!40467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713482 (= res!476727 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713483 () Bool)

(declare-fun res!476733 () Bool)

(assert (=> b!713483 (=> (not res!476733) (not e!401106))))

(declare-fun -!402 (List!13453 (_ BitVec 64)) List!13453)

(assert (=> b!713483 (= res!476733 (= (-!402 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!63352 res!476730) b!713475))

(assert (= (and b!713475 res!476724) b!713477))

(assert (= (and b!713477 res!476728) b!713474))

(assert (= (and b!713474 res!476732) b!713479))

(assert (= (and b!713479 res!476725) b!713482))

(assert (= (and b!713482 res!476727) b!713471))

(assert (= (and b!713471 res!476722) b!713476))

(assert (= (and b!713476 res!476721) b!713472))

(assert (= (and b!713472 res!476731) b!713481))

(assert (= (and b!713481 res!476729) b!713473))

(assert (= (and b!713473 res!476723) b!713483))

(assert (= (and b!713483 res!476733) b!713480))

(assert (= (and b!713480 res!476726) b!713478))

(declare-fun m!669693 () Bool)

(assert (=> b!713479 m!669693))

(declare-fun m!669695 () Bool)

(assert (=> b!713475 m!669695))

(declare-fun m!669697 () Bool)

(assert (=> b!713473 m!669697))

(declare-fun m!669699 () Bool)

(assert (=> start!63352 m!669699))

(declare-fun m!669701 () Bool)

(assert (=> b!713480 m!669701))

(declare-fun m!669703 () Bool)

(assert (=> b!713471 m!669703))

(declare-fun m!669705 () Bool)

(assert (=> b!713478 m!669705))

(declare-fun m!669707 () Bool)

(assert (=> b!713483 m!669707))

(declare-fun m!669709 () Bool)

(assert (=> b!713474 m!669709))

(declare-fun m!669711 () Bool)

(assert (=> b!713481 m!669711))

(declare-fun m!669713 () Bool)

(assert (=> b!713476 m!669713))

(declare-fun m!669715 () Bool)

(assert (=> b!713482 m!669715))

(declare-fun m!669717 () Bool)

(assert (=> b!713477 m!669717))

(declare-fun m!669719 () Bool)

(assert (=> b!713472 m!669719))

(check-sat (not b!713482) (not b!713475) (not b!713478) (not b!713474) (not b!713477) (not start!63352) (not b!713479) (not b!713472) (not b!713476) (not b!713481) (not b!713473) (not b!713471) (not b!713483) (not b!713480))
(check-sat)
