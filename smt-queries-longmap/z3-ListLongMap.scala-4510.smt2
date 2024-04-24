; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62584 () Bool)

(assert start!62584)

(declare-fun b!704651 () Bool)

(declare-fun res!468372 () Bool)

(declare-fun e!397839 () Bool)

(assert (=> b!704651 (=> (not res!468372) (not e!397839))))

(declare-datatypes ((List!13203 0))(
  ( (Nil!13200) (Cons!13199 (h!14247 (_ BitVec 64)) (t!19477 List!13203)) )
))
(declare-fun newAcc!49 () List!13203)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13203)

(declare-fun -!287 (List!13203 (_ BitVec 64)) List!13203)

(assert (=> b!704651 (= res!468372 (= (-!287 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704652 () Bool)

(assert (=> b!704652 (= e!397839 false)))

(declare-datatypes ((array!40203 0))(
  ( (array!40204 (arr!19255 (Array (_ BitVec 32) (_ BitVec 64))) (size!19638 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40203)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun lt!317943 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40203 (_ BitVec 32) List!13203) Bool)

(assert (=> b!704652 (= lt!317943 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704653 () Bool)

(declare-fun res!468368 () Bool)

(assert (=> b!704653 (=> (not res!468368) (not e!397839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704653 (= res!468368 (not (validKeyInArray!0 (select (arr!19255 a!3591) from!2969))))))

(declare-fun b!704654 () Bool)

(declare-fun res!468365 () Bool)

(assert (=> b!704654 (=> (not res!468365) (not e!397839))))

(declare-fun contains!3855 (List!13203 (_ BitVec 64)) Bool)

(assert (=> b!704654 (= res!468365 (not (contains!3855 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704655 () Bool)

(declare-fun res!468367 () Bool)

(assert (=> b!704655 (=> (not res!468367) (not e!397839))))

(assert (=> b!704655 (= res!468367 (not (contains!3855 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704656 () Bool)

(declare-fun res!468373 () Bool)

(assert (=> b!704656 (=> (not res!468373) (not e!397839))))

(assert (=> b!704656 (= res!468373 (not (contains!3855 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704657 () Bool)

(declare-fun res!468377 () Bool)

(assert (=> b!704657 (=> (not res!468377) (not e!397839))))

(assert (=> b!704657 (= res!468377 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19638 a!3591)))))

(declare-fun b!704658 () Bool)

(declare-fun res!468369 () Bool)

(assert (=> b!704658 (=> (not res!468369) (not e!397839))))

(declare-fun arrayContainsKey!0 (array!40203 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704658 (= res!468369 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704659 () Bool)

(declare-fun res!468371 () Bool)

(assert (=> b!704659 (=> (not res!468371) (not e!397839))))

(assert (=> b!704659 (= res!468371 (validKeyInArray!0 k0!2824))))

(declare-fun b!704660 () Bool)

(declare-fun res!468375 () Bool)

(assert (=> b!704660 (=> (not res!468375) (not e!397839))))

(assert (=> b!704660 (= res!468375 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!468378 () Bool)

(assert (=> start!62584 (=> (not res!468378) (not e!397839))))

(assert (=> start!62584 (= res!468378 (and (bvslt (size!19638 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19638 a!3591))))))

(assert (=> start!62584 e!397839))

(assert (=> start!62584 true))

(declare-fun array_inv!15114 (array!40203) Bool)

(assert (=> start!62584 (array_inv!15114 a!3591)))

(declare-fun b!704661 () Bool)

(declare-fun res!468362 () Bool)

(assert (=> b!704661 (=> (not res!468362) (not e!397839))))

(declare-fun subseq!323 (List!13203 List!13203) Bool)

(assert (=> b!704661 (= res!468362 (subseq!323 acc!652 newAcc!49))))

(declare-fun b!704662 () Bool)

(declare-fun res!468379 () Bool)

(assert (=> b!704662 (=> (not res!468379) (not e!397839))))

(assert (=> b!704662 (= res!468379 (not (contains!3855 acc!652 k0!2824)))))

(declare-fun b!704663 () Bool)

(declare-fun res!468366 () Bool)

(assert (=> b!704663 (=> (not res!468366) (not e!397839))))

(assert (=> b!704663 (= res!468366 (not (contains!3855 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704664 () Bool)

(declare-fun res!468363 () Bool)

(assert (=> b!704664 (=> (not res!468363) (not e!397839))))

(assert (=> b!704664 (= res!468363 (contains!3855 newAcc!49 k0!2824))))

(declare-fun b!704665 () Bool)

(declare-fun res!468376 () Bool)

(assert (=> b!704665 (=> (not res!468376) (not e!397839))))

(declare-fun noDuplicate!1129 (List!13203) Bool)

(assert (=> b!704665 (= res!468376 (noDuplicate!1129 newAcc!49))))

(declare-fun b!704666 () Bool)

(declare-fun res!468364 () Bool)

(assert (=> b!704666 (=> (not res!468364) (not e!397839))))

(assert (=> b!704666 (= res!468364 (noDuplicate!1129 acc!652))))

(declare-fun b!704667 () Bool)

(declare-fun res!468374 () Bool)

(assert (=> b!704667 (=> (not res!468374) (not e!397839))))

(assert (=> b!704667 (= res!468374 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704668 () Bool)

(declare-fun res!468370 () Bool)

(assert (=> b!704668 (=> (not res!468370) (not e!397839))))

(assert (=> b!704668 (= res!468370 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and start!62584 res!468378) b!704666))

(assert (= (and b!704666 res!468364) b!704665))

(assert (= (and b!704665 res!468376) b!704655))

(assert (= (and b!704655 res!468367) b!704663))

(assert (= (and b!704663 res!468366) b!704658))

(assert (= (and b!704658 res!468369) b!704662))

(assert (= (and b!704662 res!468379) b!704659))

(assert (= (and b!704659 res!468371) b!704667))

(assert (= (and b!704667 res!468374) b!704661))

(assert (= (and b!704661 res!468362) b!704664))

(assert (= (and b!704664 res!468363) b!704651))

(assert (= (and b!704651 res!468372) b!704654))

(assert (= (and b!704654 res!468365) b!704656))

(assert (= (and b!704656 res!468373) b!704657))

(assert (= (and b!704657 res!468377) b!704653))

(assert (= (and b!704653 res!468368) b!704660))

(assert (= (and b!704660 res!468375) b!704668))

(assert (= (and b!704668 res!468370) b!704652))

(declare-fun m!663603 () Bool)

(assert (=> b!704655 m!663603))

(declare-fun m!663605 () Bool)

(assert (=> b!704656 m!663605))

(declare-fun m!663607 () Bool)

(assert (=> b!704666 m!663607))

(declare-fun m!663609 () Bool)

(assert (=> b!704652 m!663609))

(declare-fun m!663611 () Bool)

(assert (=> b!704664 m!663611))

(declare-fun m!663613 () Bool)

(assert (=> b!704661 m!663613))

(declare-fun m!663615 () Bool)

(assert (=> b!704665 m!663615))

(declare-fun m!663617 () Bool)

(assert (=> b!704663 m!663617))

(declare-fun m!663619 () Bool)

(assert (=> b!704653 m!663619))

(assert (=> b!704653 m!663619))

(declare-fun m!663621 () Bool)

(assert (=> b!704653 m!663621))

(declare-fun m!663623 () Bool)

(assert (=> b!704658 m!663623))

(declare-fun m!663625 () Bool)

(assert (=> b!704662 m!663625))

(declare-fun m!663627 () Bool)

(assert (=> b!704667 m!663627))

(declare-fun m!663629 () Bool)

(assert (=> b!704651 m!663629))

(declare-fun m!663631 () Bool)

(assert (=> b!704654 m!663631))

(declare-fun m!663633 () Bool)

(assert (=> b!704668 m!663633))

(declare-fun m!663635 () Bool)

(assert (=> b!704659 m!663635))

(declare-fun m!663637 () Bool)

(assert (=> start!62584 m!663637))

(check-sat (not b!704656) (not b!704654) (not start!62584) (not b!704664) (not b!704652) (not b!704651) (not b!704662) (not b!704667) (not b!704653) (not b!704663) (not b!704661) (not b!704666) (not b!704668) (not b!704655) (not b!704658) (not b!704659) (not b!704665))
(check-sat)
