; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62534 () Bool)

(assert start!62534)

(declare-fun b!704656 () Bool)

(declare-fun res!468631 () Bool)

(declare-fun e!397594 () Bool)

(assert (=> b!704656 (=> (not res!468631) (not e!397594))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704656 (= res!468631 (validKeyInArray!0 k0!2824))))

(declare-fun b!704657 () Bool)

(declare-fun res!468629 () Bool)

(assert (=> b!704657 (=> (not res!468629) (not e!397594))))

(declare-datatypes ((List!13348 0))(
  ( (Nil!13345) (Cons!13344 (h!14389 (_ BitVec 64)) (t!19621 List!13348)) )
))
(declare-fun newAcc!49 () List!13348)

(declare-fun contains!3870 (List!13348 (_ BitVec 64)) Bool)

(assert (=> b!704657 (= res!468629 (not (contains!3870 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704658 () Bool)

(declare-fun res!468640 () Bool)

(assert (=> b!704658 (=> (not res!468640) (not e!397594))))

(assert (=> b!704658 (= res!468640 (not (contains!3870 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704659 () Bool)

(declare-fun res!468643 () Bool)

(assert (=> b!704659 (=> (not res!468643) (not e!397594))))

(declare-fun acc!652 () List!13348)

(declare-fun -!297 (List!13348 (_ BitVec 64)) List!13348)

(assert (=> b!704659 (= res!468643 (= (-!297 newAcc!49 k0!2824) acc!652))))

(declare-fun res!468630 () Bool)

(assert (=> start!62534 (=> (not res!468630) (not e!397594))))

(declare-datatypes ((array!40224 0))(
  ( (array!40225 (arr!19268 (Array (_ BitVec 32) (_ BitVec 64))) (size!19650 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40224)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62534 (= res!468630 (and (bvslt (size!19650 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19650 a!3591))))))

(assert (=> start!62534 e!397594))

(assert (=> start!62534 true))

(declare-fun array_inv!15151 (array!40224) Bool)

(assert (=> start!62534 (array_inv!15151 a!3591)))

(declare-fun b!704660 () Bool)

(declare-fun res!468639 () Bool)

(assert (=> b!704660 (=> (not res!468639) (not e!397594))))

(assert (=> b!704660 (= res!468639 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704661 () Bool)

(declare-fun res!468634 () Bool)

(assert (=> b!704661 (=> (not res!468634) (not e!397594))))

(assert (=> b!704661 (= res!468634 (not (contains!3870 acc!652 k0!2824)))))

(declare-fun b!704662 () Bool)

(assert (=> b!704662 (= e!397594 false)))

(declare-fun lt!317619 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40224 (_ BitVec 32) List!13348) Bool)

(assert (=> b!704662 (= lt!317619 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704663 () Bool)

(declare-fun res!468628 () Bool)

(assert (=> b!704663 (=> (not res!468628) (not e!397594))))

(assert (=> b!704663 (= res!468628 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19650 a!3591)))))

(declare-fun b!704664 () Bool)

(declare-fun res!468635 () Bool)

(assert (=> b!704664 (=> (not res!468635) (not e!397594))))

(declare-fun subseq!332 (List!13348 List!13348) Bool)

(assert (=> b!704664 (= res!468635 (subseq!332 acc!652 newAcc!49))))

(declare-fun b!704665 () Bool)

(declare-fun res!468626 () Bool)

(assert (=> b!704665 (=> (not res!468626) (not e!397594))))

(assert (=> b!704665 (= res!468626 (not (validKeyInArray!0 (select (arr!19268 a!3591) from!2969))))))

(declare-fun b!704666 () Bool)

(declare-fun res!468627 () Bool)

(assert (=> b!704666 (=> (not res!468627) (not e!397594))))

(assert (=> b!704666 (= res!468627 (contains!3870 newAcc!49 k0!2824))))

(declare-fun b!704667 () Bool)

(declare-fun res!468637 () Bool)

(assert (=> b!704667 (=> (not res!468637) (not e!397594))))

(declare-fun noDuplicate!1139 (List!13348) Bool)

(assert (=> b!704667 (= res!468637 (noDuplicate!1139 newAcc!49))))

(declare-fun b!704668 () Bool)

(declare-fun res!468638 () Bool)

(assert (=> b!704668 (=> (not res!468638) (not e!397594))))

(assert (=> b!704668 (= res!468638 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704669 () Bool)

(declare-fun res!468632 () Bool)

(assert (=> b!704669 (=> (not res!468632) (not e!397594))))

(assert (=> b!704669 (= res!468632 (noDuplicate!1139 acc!652))))

(declare-fun b!704670 () Bool)

(declare-fun res!468636 () Bool)

(assert (=> b!704670 (=> (not res!468636) (not e!397594))))

(declare-fun arrayContainsKey!0 (array!40224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704670 (= res!468636 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704671 () Bool)

(declare-fun res!468633 () Bool)

(assert (=> b!704671 (=> (not res!468633) (not e!397594))))

(assert (=> b!704671 (= res!468633 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704672 () Bool)

(declare-fun res!468641 () Bool)

(assert (=> b!704672 (=> (not res!468641) (not e!397594))))

(assert (=> b!704672 (= res!468641 (not (contains!3870 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704673 () Bool)

(declare-fun res!468642 () Bool)

(assert (=> b!704673 (=> (not res!468642) (not e!397594))))

(assert (=> b!704673 (= res!468642 (not (contains!3870 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62534 res!468630) b!704669))

(assert (= (and b!704669 res!468632) b!704667))

(assert (= (and b!704667 res!468637) b!704672))

(assert (= (and b!704672 res!468641) b!704673))

(assert (= (and b!704673 res!468642) b!704671))

(assert (= (and b!704671 res!468633) b!704661))

(assert (= (and b!704661 res!468634) b!704656))

(assert (= (and b!704656 res!468631) b!704668))

(assert (= (and b!704668 res!468638) b!704664))

(assert (= (and b!704664 res!468635) b!704666))

(assert (= (and b!704666 res!468627) b!704659))

(assert (= (and b!704659 res!468643) b!704658))

(assert (= (and b!704658 res!468640) b!704657))

(assert (= (and b!704657 res!468629) b!704663))

(assert (= (and b!704663 res!468628) b!704665))

(assert (= (and b!704665 res!468626) b!704660))

(assert (= (and b!704660 res!468639) b!704670))

(assert (= (and b!704670 res!468636) b!704662))

(declare-fun m!662511 () Bool)

(assert (=> b!704662 m!662511))

(declare-fun m!662513 () Bool)

(assert (=> b!704669 m!662513))

(declare-fun m!662515 () Bool)

(assert (=> b!704664 m!662515))

(declare-fun m!662517 () Bool)

(assert (=> b!704659 m!662517))

(declare-fun m!662519 () Bool)

(assert (=> b!704658 m!662519))

(declare-fun m!662521 () Bool)

(assert (=> b!704661 m!662521))

(declare-fun m!662523 () Bool)

(assert (=> b!704672 m!662523))

(declare-fun m!662525 () Bool)

(assert (=> b!704656 m!662525))

(declare-fun m!662527 () Bool)

(assert (=> b!704671 m!662527))

(declare-fun m!662529 () Bool)

(assert (=> start!62534 m!662529))

(declare-fun m!662531 () Bool)

(assert (=> b!704670 m!662531))

(declare-fun m!662533 () Bool)

(assert (=> b!704666 m!662533))

(declare-fun m!662535 () Bool)

(assert (=> b!704665 m!662535))

(assert (=> b!704665 m!662535))

(declare-fun m!662537 () Bool)

(assert (=> b!704665 m!662537))

(declare-fun m!662539 () Bool)

(assert (=> b!704673 m!662539))

(declare-fun m!662541 () Bool)

(assert (=> b!704667 m!662541))

(declare-fun m!662543 () Bool)

(assert (=> b!704668 m!662543))

(declare-fun m!662545 () Bool)

(assert (=> b!704657 m!662545))

(check-sat (not b!704664) (not b!704672) (not b!704666) (not b!704656) (not b!704673) (not b!704669) (not b!704671) (not b!704665) (not start!62534) (not b!704670) (not b!704659) (not b!704662) (not b!704668) (not b!704657) (not b!704661) (not b!704667) (not b!704658))
(check-sat)
