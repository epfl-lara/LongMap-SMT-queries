; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63490 () Bool)

(assert start!63490)

(declare-fun b!714646 () Bool)

(declare-fun res!477556 () Bool)

(declare-fun e!401726 () Bool)

(assert (=> b!714646 (=> (not res!477556) (not e!401726))))

(declare-datatypes ((List!13326 0))(
  ( (Nil!13323) (Cons!13322 (h!14370 (_ BitVec 64)) (t!19633 List!13326)) )
))
(declare-fun acc!652 () List!13326)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3978 (List!13326 (_ BitVec 64)) Bool)

(assert (=> b!714646 (= res!477556 (not (contains!3978 acc!652 k0!2824)))))

(declare-fun b!714647 () Bool)

(declare-fun res!477563 () Bool)

(assert (=> b!714647 (=> (not res!477563) (not e!401726))))

(declare-fun newAcc!49 () List!13326)

(assert (=> b!714647 (= res!477563 (not (contains!3978 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714648 () Bool)

(declare-fun res!477557 () Bool)

(assert (=> b!714648 (=> (not res!477557) (not e!401726))))

(declare-fun noDuplicate!1252 (List!13326) Bool)

(assert (=> b!714648 (= res!477557 (noDuplicate!1252 newAcc!49))))

(declare-fun res!477561 () Bool)

(assert (=> start!63490 (=> (not res!477561) (not e!401726))))

(declare-datatypes ((array!40485 0))(
  ( (array!40486 (arr!19378 (Array (_ BitVec 32) (_ BitVec 64))) (size!19791 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40485)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63490 (= res!477561 (and (bvslt (size!19791 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19791 a!3591))))))

(assert (=> start!63490 e!401726))

(assert (=> start!63490 true))

(declare-fun array_inv!15237 (array!40485) Bool)

(assert (=> start!63490 (array_inv!15237 a!3591)))

(declare-fun b!714649 () Bool)

(declare-fun res!477555 () Bool)

(assert (=> b!714649 (=> (not res!477555) (not e!401726))))

(declare-fun subseq!446 (List!13326 List!13326) Bool)

(assert (=> b!714649 (= res!477555 (subseq!446 acc!652 newAcc!49))))

(declare-fun b!714650 () Bool)

(declare-fun res!477565 () Bool)

(assert (=> b!714650 (=> (not res!477565) (not e!401726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714650 (= res!477565 (validKeyInArray!0 k0!2824))))

(declare-fun b!714651 () Bool)

(declare-fun res!477564 () Bool)

(assert (=> b!714651 (=> (not res!477564) (not e!401726))))

(assert (=> b!714651 (= res!477564 (noDuplicate!1252 acc!652))))

(declare-fun b!714652 () Bool)

(assert (=> b!714652 (= e!401726 false)))

(declare-fun lt!318882 () Bool)

(assert (=> b!714652 (= lt!318882 (contains!3978 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714653 () Bool)

(declare-fun res!477558 () Bool)

(assert (=> b!714653 (=> (not res!477558) (not e!401726))))

(declare-fun arrayNoDuplicates!0 (array!40485 (_ BitVec 32) List!13326) Bool)

(assert (=> b!714653 (= res!477558 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714654 () Bool)

(declare-fun res!477553 () Bool)

(assert (=> b!714654 (=> (not res!477553) (not e!401726))))

(declare-fun arrayContainsKey!0 (array!40485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714654 (= res!477553 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714655 () Bool)

(declare-fun res!477560 () Bool)

(assert (=> b!714655 (=> (not res!477560) (not e!401726))))

(declare-fun -!410 (List!13326 (_ BitVec 64)) List!13326)

(assert (=> b!714655 (= res!477560 (= (-!410 newAcc!49 k0!2824) acc!652))))

(declare-fun b!714656 () Bool)

(declare-fun res!477562 () Bool)

(assert (=> b!714656 (=> (not res!477562) (not e!401726))))

(assert (=> b!714656 (= res!477562 (not (contains!3978 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714657 () Bool)

(declare-fun res!477554 () Bool)

(assert (=> b!714657 (=> (not res!477554) (not e!401726))))

(assert (=> b!714657 (= res!477554 (not (contains!3978 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714658 () Bool)

(declare-fun res!477559 () Bool)

(assert (=> b!714658 (=> (not res!477559) (not e!401726))))

(assert (=> b!714658 (= res!477559 (contains!3978 newAcc!49 k0!2824))))

(assert (= (and start!63490 res!477561) b!714651))

(assert (= (and b!714651 res!477564) b!714648))

(assert (= (and b!714648 res!477557) b!714656))

(assert (= (and b!714656 res!477562) b!714657))

(assert (= (and b!714657 res!477554) b!714654))

(assert (= (and b!714654 res!477553) b!714646))

(assert (= (and b!714646 res!477556) b!714650))

(assert (= (and b!714650 res!477565) b!714653))

(assert (= (and b!714653 res!477558) b!714649))

(assert (= (and b!714649 res!477555) b!714658))

(assert (= (and b!714658 res!477559) b!714655))

(assert (= (and b!714655 res!477560) b!714647))

(assert (= (and b!714647 res!477563) b!714652))

(declare-fun m!671691 () Bool)

(assert (=> b!714652 m!671691))

(declare-fun m!671693 () Bool)

(assert (=> b!714650 m!671693))

(declare-fun m!671695 () Bool)

(assert (=> b!714655 m!671695))

(declare-fun m!671697 () Bool)

(assert (=> b!714658 m!671697))

(declare-fun m!671699 () Bool)

(assert (=> b!714648 m!671699))

(declare-fun m!671701 () Bool)

(assert (=> b!714657 m!671701))

(declare-fun m!671703 () Bool)

(assert (=> b!714656 m!671703))

(declare-fun m!671705 () Bool)

(assert (=> b!714646 m!671705))

(declare-fun m!671707 () Bool)

(assert (=> start!63490 m!671707))

(declare-fun m!671709 () Bool)

(assert (=> b!714654 m!671709))

(declare-fun m!671711 () Bool)

(assert (=> b!714649 m!671711))

(declare-fun m!671713 () Bool)

(assert (=> b!714651 m!671713))

(declare-fun m!671715 () Bool)

(assert (=> b!714653 m!671715))

(declare-fun m!671717 () Bool)

(assert (=> b!714647 m!671717))

(check-sat (not b!714654) (not b!714649) (not b!714652) (not b!714646) (not start!63490) (not b!714655) (not b!714656) (not b!714651) (not b!714657) (not b!714650) (not b!714648) (not b!714658) (not b!714653) (not b!714647))
(check-sat)
