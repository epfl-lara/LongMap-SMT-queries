; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62498 () Bool)

(assert start!62498)

(declare-fun b!703684 () Bool)

(declare-fun e!397487 () Bool)

(assert (=> b!703684 (= e!397487 false)))

(declare-datatypes ((array!40188 0))(
  ( (array!40189 (arr!19250 (Array (_ BitVec 32) (_ BitVec 64))) (size!19632 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40188)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13330 0))(
  ( (Nil!13327) (Cons!13326 (h!14371 (_ BitVec 64)) (t!19603 List!13330)) )
))
(declare-fun acc!652 () List!13330)

(declare-fun lt!317565 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40188 (_ BitVec 32) List!13330) Bool)

(assert (=> b!703684 (= lt!317565 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703685 () Bool)

(declare-fun res!467667 () Bool)

(assert (=> b!703685 (=> (not res!467667) (not e!397487))))

(declare-fun newAcc!49 () List!13330)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!279 (List!13330 (_ BitVec 64)) List!13330)

(assert (=> b!703685 (= res!467667 (= (-!279 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703686 () Bool)

(declare-fun res!467665 () Bool)

(assert (=> b!703686 (=> (not res!467665) (not e!397487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703686 (= res!467665 (validKeyInArray!0 k0!2824))))

(declare-fun b!703687 () Bool)

(declare-fun res!467660 () Bool)

(assert (=> b!703687 (=> (not res!467660) (not e!397487))))

(assert (=> b!703687 (= res!467660 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703688 () Bool)

(declare-fun res!467661 () Bool)

(assert (=> b!703688 (=> (not res!467661) (not e!397487))))

(declare-fun contains!3852 (List!13330 (_ BitVec 64)) Bool)

(assert (=> b!703688 (= res!467661 (not (contains!3852 acc!652 k0!2824)))))

(declare-fun b!703689 () Bool)

(declare-fun res!467663 () Bool)

(assert (=> b!703689 (=> (not res!467663) (not e!397487))))

(assert (=> b!703689 (= res!467663 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19632 a!3591)))))

(declare-fun b!703690 () Bool)

(declare-fun res!467658 () Bool)

(assert (=> b!703690 (=> (not res!467658) (not e!397487))))

(declare-fun arrayContainsKey!0 (array!40188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703690 (= res!467658 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703691 () Bool)

(declare-fun res!467671 () Bool)

(assert (=> b!703691 (=> (not res!467671) (not e!397487))))

(declare-fun noDuplicate!1121 (List!13330) Bool)

(assert (=> b!703691 (= res!467671 (noDuplicate!1121 acc!652))))

(declare-fun b!703692 () Bool)

(declare-fun res!467655 () Bool)

(assert (=> b!703692 (=> (not res!467655) (not e!397487))))

(assert (=> b!703692 (= res!467655 (not (contains!3852 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703693 () Bool)

(declare-fun res!467662 () Bool)

(assert (=> b!703693 (=> (not res!467662) (not e!397487))))

(assert (=> b!703693 (= res!467662 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703694 () Bool)

(declare-fun res!467668 () Bool)

(assert (=> b!703694 (=> (not res!467668) (not e!397487))))

(assert (=> b!703694 (= res!467668 (not (contains!3852 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703695 () Bool)

(declare-fun res!467659 () Bool)

(assert (=> b!703695 (=> (not res!467659) (not e!397487))))

(assert (=> b!703695 (= res!467659 (not (contains!3852 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703696 () Bool)

(declare-fun res!467657 () Bool)

(assert (=> b!703696 (=> (not res!467657) (not e!397487))))

(assert (=> b!703696 (= res!467657 (not (validKeyInArray!0 (select (arr!19250 a!3591) from!2969))))))

(declare-fun b!703697 () Bool)

(declare-fun res!467670 () Bool)

(assert (=> b!703697 (=> (not res!467670) (not e!397487))))

(declare-fun subseq!314 (List!13330 List!13330) Bool)

(assert (=> b!703697 (= res!467670 (subseq!314 acc!652 newAcc!49))))

(declare-fun b!703698 () Bool)

(declare-fun res!467654 () Bool)

(assert (=> b!703698 (=> (not res!467654) (not e!397487))))

(assert (=> b!703698 (= res!467654 (not (contains!3852 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703699 () Bool)

(declare-fun res!467669 () Bool)

(assert (=> b!703699 (=> (not res!467669) (not e!397487))))

(assert (=> b!703699 (= res!467669 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!467666 () Bool)

(assert (=> start!62498 (=> (not res!467666) (not e!397487))))

(assert (=> start!62498 (= res!467666 (and (bvslt (size!19632 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19632 a!3591))))))

(assert (=> start!62498 e!397487))

(assert (=> start!62498 true))

(declare-fun array_inv!15133 (array!40188) Bool)

(assert (=> start!62498 (array_inv!15133 a!3591)))

(declare-fun b!703700 () Bool)

(declare-fun res!467664 () Bool)

(assert (=> b!703700 (=> (not res!467664) (not e!397487))))

(assert (=> b!703700 (= res!467664 (contains!3852 newAcc!49 k0!2824))))

(declare-fun b!703701 () Bool)

(declare-fun res!467656 () Bool)

(assert (=> b!703701 (=> (not res!467656) (not e!397487))))

(assert (=> b!703701 (= res!467656 (noDuplicate!1121 newAcc!49))))

(assert (= (and start!62498 res!467666) b!703691))

(assert (= (and b!703691 res!467671) b!703701))

(assert (= (and b!703701 res!467656) b!703692))

(assert (= (and b!703692 res!467655) b!703695))

(assert (= (and b!703695 res!467659) b!703699))

(assert (= (and b!703699 res!467669) b!703688))

(assert (= (and b!703688 res!467661) b!703686))

(assert (= (and b!703686 res!467665) b!703693))

(assert (= (and b!703693 res!467662) b!703697))

(assert (= (and b!703697 res!467670) b!703700))

(assert (= (and b!703700 res!467664) b!703685))

(assert (= (and b!703685 res!467667) b!703698))

(assert (= (and b!703698 res!467654) b!703694))

(assert (= (and b!703694 res!467668) b!703689))

(assert (= (and b!703689 res!467663) b!703696))

(assert (= (and b!703696 res!467657) b!703687))

(assert (= (and b!703687 res!467660) b!703690))

(assert (= (and b!703690 res!467658) b!703684))

(declare-fun m!661863 () Bool)

(assert (=> b!703694 m!661863))

(declare-fun m!661865 () Bool)

(assert (=> b!703696 m!661865))

(assert (=> b!703696 m!661865))

(declare-fun m!661867 () Bool)

(assert (=> b!703696 m!661867))

(declare-fun m!661869 () Bool)

(assert (=> b!703698 m!661869))

(declare-fun m!661871 () Bool)

(assert (=> b!703685 m!661871))

(declare-fun m!661873 () Bool)

(assert (=> b!703690 m!661873))

(declare-fun m!661875 () Bool)

(assert (=> b!703697 m!661875))

(declare-fun m!661877 () Bool)

(assert (=> b!703684 m!661877))

(declare-fun m!661879 () Bool)

(assert (=> b!703700 m!661879))

(declare-fun m!661881 () Bool)

(assert (=> b!703693 m!661881))

(declare-fun m!661883 () Bool)

(assert (=> b!703692 m!661883))

(declare-fun m!661885 () Bool)

(assert (=> b!703691 m!661885))

(declare-fun m!661887 () Bool)

(assert (=> start!62498 m!661887))

(declare-fun m!661889 () Bool)

(assert (=> b!703695 m!661889))

(declare-fun m!661891 () Bool)

(assert (=> b!703701 m!661891))

(declare-fun m!661893 () Bool)

(assert (=> b!703699 m!661893))

(declare-fun m!661895 () Bool)

(assert (=> b!703688 m!661895))

(declare-fun m!661897 () Bool)

(assert (=> b!703686 m!661897))

(check-sat (not b!703700) (not b!703696) (not b!703686) (not b!703701) (not b!703694) (not b!703685) (not b!703695) (not b!703698) (not b!703693) (not b!703692) (not b!703684) (not b!703688) (not start!62498) (not b!703690) (not b!703697) (not b!703699) (not b!703691))
(check-sat)
