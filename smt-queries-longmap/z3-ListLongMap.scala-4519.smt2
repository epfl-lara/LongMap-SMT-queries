; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62570 () Bool)

(assert start!62570)

(declare-fun b!705657 () Bool)

(declare-fun res!469638 () Bool)

(declare-fun e!397702 () Bool)

(assert (=> b!705657 (=> (not res!469638) (not e!397702))))

(declare-datatypes ((array!40260 0))(
  ( (array!40261 (arr!19286 (Array (_ BitVec 32) (_ BitVec 64))) (size!19668 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40260)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705657 (= res!469638 (not (validKeyInArray!0 (select (arr!19286 a!3591) from!2969))))))

(declare-fun b!705658 () Bool)

(declare-fun res!469639 () Bool)

(assert (=> b!705658 (=> (not res!469639) (not e!397702))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!705658 (= res!469639 (validKeyInArray!0 k0!2824))))

(declare-fun b!705659 () Bool)

(declare-fun res!469631 () Bool)

(assert (=> b!705659 (=> (not res!469631) (not e!397702))))

(declare-fun arrayContainsKey!0 (array!40260 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705659 (= res!469631 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705660 () Bool)

(assert (=> b!705660 (= e!397702 (not true))))

(declare-datatypes ((List!13366 0))(
  ( (Nil!13363) (Cons!13362 (h!14407 (_ BitVec 64)) (t!19639 List!13366)) )
))
(declare-fun newAcc!49 () List!13366)

(declare-fun arrayNoDuplicates!0 (array!40260 (_ BitVec 32) List!13366) Bool)

(assert (=> b!705660 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24602 0))(
  ( (Unit!24603) )
))
(declare-fun lt!317673 () Unit!24602)

(declare-fun acc!652 () List!13366)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40260 (_ BitVec 64) (_ BitVec 32) List!13366 List!13366) Unit!24602)

(assert (=> b!705660 (= lt!317673 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705661 () Bool)

(declare-fun res!469633 () Bool)

(assert (=> b!705661 (=> (not res!469633) (not e!397702))))

(declare-fun contains!3888 (List!13366 (_ BitVec 64)) Bool)

(assert (=> b!705661 (= res!469633 (not (contains!3888 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705662 () Bool)

(declare-fun res!469629 () Bool)

(assert (=> b!705662 (=> (not res!469629) (not e!397702))))

(declare-fun noDuplicate!1157 (List!13366) Bool)

(assert (=> b!705662 (= res!469629 (noDuplicate!1157 acc!652))))

(declare-fun b!705663 () Bool)

(declare-fun res!469645 () Bool)

(assert (=> b!705663 (=> (not res!469645) (not e!397702))))

(declare-fun -!315 (List!13366 (_ BitVec 64)) List!13366)

(assert (=> b!705663 (= res!469645 (= (-!315 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705664 () Bool)

(declare-fun res!469643 () Bool)

(assert (=> b!705664 (=> (not res!469643) (not e!397702))))

(assert (=> b!705664 (= res!469643 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705665 () Bool)

(declare-fun res!469640 () Bool)

(assert (=> b!705665 (=> (not res!469640) (not e!397702))))

(assert (=> b!705665 (= res!469640 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!469628 () Bool)

(assert (=> start!62570 (=> (not res!469628) (not e!397702))))

(assert (=> start!62570 (= res!469628 (and (bvslt (size!19668 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19668 a!3591))))))

(assert (=> start!62570 e!397702))

(assert (=> start!62570 true))

(declare-fun array_inv!15169 (array!40260) Bool)

(assert (=> start!62570 (array_inv!15169 a!3591)))

(declare-fun b!705666 () Bool)

(declare-fun res!469632 () Bool)

(assert (=> b!705666 (=> (not res!469632) (not e!397702))))

(assert (=> b!705666 (= res!469632 (contains!3888 newAcc!49 k0!2824))))

(declare-fun b!705667 () Bool)

(declare-fun res!469635 () Bool)

(assert (=> b!705667 (=> (not res!469635) (not e!397702))))

(assert (=> b!705667 (= res!469635 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705668 () Bool)

(declare-fun res!469642 () Bool)

(assert (=> b!705668 (=> (not res!469642) (not e!397702))))

(assert (=> b!705668 (= res!469642 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19668 a!3591)))))

(declare-fun b!705669 () Bool)

(declare-fun res!469637 () Bool)

(assert (=> b!705669 (=> (not res!469637) (not e!397702))))

(assert (=> b!705669 (= res!469637 (not (contains!3888 acc!652 k0!2824)))))

(declare-fun b!705670 () Bool)

(declare-fun res!469630 () Bool)

(assert (=> b!705670 (=> (not res!469630) (not e!397702))))

(assert (=> b!705670 (= res!469630 (not (contains!3888 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705671 () Bool)

(declare-fun res!469634 () Bool)

(assert (=> b!705671 (=> (not res!469634) (not e!397702))))

(assert (=> b!705671 (= res!469634 (noDuplicate!1157 newAcc!49))))

(declare-fun b!705672 () Bool)

(declare-fun res!469627 () Bool)

(assert (=> b!705672 (=> (not res!469627) (not e!397702))))

(assert (=> b!705672 (= res!469627 (not (contains!3888 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705673 () Bool)

(declare-fun res!469644 () Bool)

(assert (=> b!705673 (=> (not res!469644) (not e!397702))))

(declare-fun subseq!350 (List!13366 List!13366) Bool)

(assert (=> b!705673 (= res!469644 (subseq!350 acc!652 newAcc!49))))

(declare-fun b!705674 () Bool)

(declare-fun res!469641 () Bool)

(assert (=> b!705674 (=> (not res!469641) (not e!397702))))

(assert (=> b!705674 (= res!469641 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705675 () Bool)

(declare-fun res!469636 () Bool)

(assert (=> b!705675 (=> (not res!469636) (not e!397702))))

(assert (=> b!705675 (= res!469636 (not (contains!3888 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62570 res!469628) b!705662))

(assert (= (and b!705662 res!469629) b!705671))

(assert (= (and b!705671 res!469634) b!705675))

(assert (= (and b!705675 res!469636) b!705661))

(assert (= (and b!705661 res!469633) b!705659))

(assert (= (and b!705659 res!469631) b!705669))

(assert (= (and b!705669 res!469637) b!705658))

(assert (= (and b!705658 res!469639) b!705665))

(assert (= (and b!705665 res!469640) b!705673))

(assert (= (and b!705673 res!469644) b!705666))

(assert (= (and b!705666 res!469632) b!705663))

(assert (= (and b!705663 res!469645) b!705672))

(assert (= (and b!705672 res!469627) b!705670))

(assert (= (and b!705670 res!469630) b!705668))

(assert (= (and b!705668 res!469642) b!705657))

(assert (= (and b!705657 res!469638) b!705664))

(assert (= (and b!705664 res!469643) b!705674))

(assert (= (and b!705674 res!469641) b!705667))

(assert (= (and b!705667 res!469635) b!705660))

(declare-fun m!663195 () Bool)

(assert (=> b!705672 m!663195))

(declare-fun m!663197 () Bool)

(assert (=> b!705657 m!663197))

(assert (=> b!705657 m!663197))

(declare-fun m!663199 () Bool)

(assert (=> b!705657 m!663199))

(declare-fun m!663201 () Bool)

(assert (=> b!705660 m!663201))

(declare-fun m!663203 () Bool)

(assert (=> b!705660 m!663203))

(declare-fun m!663205 () Bool)

(assert (=> b!705662 m!663205))

(declare-fun m!663207 () Bool)

(assert (=> b!705673 m!663207))

(declare-fun m!663209 () Bool)

(assert (=> start!62570 m!663209))

(declare-fun m!663211 () Bool)

(assert (=> b!705674 m!663211))

(declare-fun m!663213 () Bool)

(assert (=> b!705665 m!663213))

(declare-fun m!663215 () Bool)

(assert (=> b!705675 m!663215))

(declare-fun m!663217 () Bool)

(assert (=> b!705666 m!663217))

(declare-fun m!663219 () Bool)

(assert (=> b!705669 m!663219))

(declare-fun m!663221 () Bool)

(assert (=> b!705670 m!663221))

(declare-fun m!663223 () Bool)

(assert (=> b!705658 m!663223))

(declare-fun m!663225 () Bool)

(assert (=> b!705667 m!663225))

(declare-fun m!663227 () Bool)

(assert (=> b!705659 m!663227))

(declare-fun m!663229 () Bool)

(assert (=> b!705661 m!663229))

(declare-fun m!663231 () Bool)

(assert (=> b!705671 m!663231))

(declare-fun m!663233 () Bool)

(assert (=> b!705663 m!663233))

(check-sat (not b!705665) (not b!705671) (not b!705674) (not b!705659) (not b!705675) (not b!705666) (not start!62570) (not b!705661) (not b!705667) (not b!705657) (not b!705658) (not b!705660) (not b!705662) (not b!705672) (not b!705663) (not b!705669) (not b!705670) (not b!705673))
(check-sat)
