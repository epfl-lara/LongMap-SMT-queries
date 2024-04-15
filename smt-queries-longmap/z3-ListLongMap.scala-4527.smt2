; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62618 () Bool)

(assert start!62618)

(declare-fun b!706653 () Bool)

(declare-fun e!397847 () Bool)

(assert (=> b!706653 (= e!397847 false)))

(declare-fun lt!317727 () Bool)

(declare-datatypes ((List!13390 0))(
  ( (Nil!13387) (Cons!13386 (h!14431 (_ BitVec 64)) (t!19663 List!13390)) )
))
(declare-fun newAcc!49 () List!13390)

(declare-fun contains!3912 (List!13390 (_ BitVec 64)) Bool)

(assert (=> b!706653 (= lt!317727 (contains!3912 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706654 () Bool)

(declare-fun res!470629 () Bool)

(assert (=> b!706654 (=> (not res!470629) (not e!397847))))

(declare-fun acc!652 () List!13390)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!706654 (= res!470629 (not (contains!3912 acc!652 k0!2824)))))

(declare-fun b!706655 () Bool)

(declare-fun res!470633 () Bool)

(assert (=> b!706655 (=> (not res!470633) (not e!397847))))

(assert (=> b!706655 (= res!470633 (not (contains!3912 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706656 () Bool)

(declare-fun res!470634 () Bool)

(assert (=> b!706656 (=> (not res!470634) (not e!397847))))

(assert (=> b!706656 (= res!470634 (not (contains!3912 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706657 () Bool)

(declare-fun res!470628 () Bool)

(assert (=> b!706657 (=> (not res!470628) (not e!397847))))

(declare-datatypes ((array!40308 0))(
  ( (array!40309 (arr!19310 (Array (_ BitVec 32) (_ BitVec 64))) (size!19692 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40308)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706657 (= res!470628 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun res!470624 () Bool)

(assert (=> start!62618 (=> (not res!470624) (not e!397847))))

(assert (=> start!62618 (= res!470624 (and (bvslt (size!19692 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19692 a!3591))))))

(assert (=> start!62618 e!397847))

(assert (=> start!62618 true))

(declare-fun array_inv!15193 (array!40308) Bool)

(assert (=> start!62618 (array_inv!15193 a!3591)))

(declare-fun b!706658 () Bool)

(declare-fun res!470627 () Bool)

(assert (=> b!706658 (=> (not res!470627) (not e!397847))))

(assert (=> b!706658 (= res!470627 (not (contains!3912 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706659 () Bool)

(declare-fun res!470631 () Bool)

(assert (=> b!706659 (=> (not res!470631) (not e!397847))))

(declare-fun -!339 (List!13390 (_ BitVec 64)) List!13390)

(assert (=> b!706659 (= res!470631 (= (-!339 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706660 () Bool)

(declare-fun res!470632 () Bool)

(assert (=> b!706660 (=> (not res!470632) (not e!397847))))

(declare-fun arrayNoDuplicates!0 (array!40308 (_ BitVec 32) List!13390) Bool)

(assert (=> b!706660 (= res!470632 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706661 () Bool)

(declare-fun res!470630 () Bool)

(assert (=> b!706661 (=> (not res!470630) (not e!397847))))

(declare-fun subseq!374 (List!13390 List!13390) Bool)

(assert (=> b!706661 (= res!470630 (subseq!374 acc!652 newAcc!49))))

(declare-fun b!706662 () Bool)

(declare-fun res!470623 () Bool)

(assert (=> b!706662 (=> (not res!470623) (not e!397847))))

(declare-fun noDuplicate!1181 (List!13390) Bool)

(assert (=> b!706662 (= res!470623 (noDuplicate!1181 newAcc!49))))

(declare-fun b!706663 () Bool)

(declare-fun res!470625 () Bool)

(assert (=> b!706663 (=> (not res!470625) (not e!397847))))

(assert (=> b!706663 (= res!470625 (contains!3912 newAcc!49 k0!2824))))

(declare-fun b!706664 () Bool)

(declare-fun res!470626 () Bool)

(assert (=> b!706664 (=> (not res!470626) (not e!397847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706664 (= res!470626 (validKeyInArray!0 k0!2824))))

(declare-fun b!706665 () Bool)

(declare-fun res!470635 () Bool)

(assert (=> b!706665 (=> (not res!470635) (not e!397847))))

(assert (=> b!706665 (= res!470635 (noDuplicate!1181 acc!652))))

(assert (= (and start!62618 res!470624) b!706665))

(assert (= (and b!706665 res!470635) b!706662))

(assert (= (and b!706662 res!470623) b!706658))

(assert (= (and b!706658 res!470627) b!706656))

(assert (= (and b!706656 res!470634) b!706657))

(assert (= (and b!706657 res!470628) b!706654))

(assert (= (and b!706654 res!470629) b!706664))

(assert (= (and b!706664 res!470626) b!706660))

(assert (= (and b!706660 res!470632) b!706661))

(assert (= (and b!706661 res!470630) b!706663))

(assert (= (and b!706663 res!470625) b!706659))

(assert (= (and b!706659 res!470631) b!706655))

(assert (= (and b!706655 res!470633) b!706653))

(declare-fun m!663903 () Bool)

(assert (=> b!706653 m!663903))

(declare-fun m!663905 () Bool)

(assert (=> b!706656 m!663905))

(declare-fun m!663907 () Bool)

(assert (=> b!706654 m!663907))

(declare-fun m!663909 () Bool)

(assert (=> b!706655 m!663909))

(declare-fun m!663911 () Bool)

(assert (=> b!706657 m!663911))

(declare-fun m!663913 () Bool)

(assert (=> b!706665 m!663913))

(declare-fun m!663915 () Bool)

(assert (=> b!706664 m!663915))

(declare-fun m!663917 () Bool)

(assert (=> b!706658 m!663917))

(declare-fun m!663919 () Bool)

(assert (=> b!706659 m!663919))

(declare-fun m!663921 () Bool)

(assert (=> b!706661 m!663921))

(declare-fun m!663923 () Bool)

(assert (=> start!62618 m!663923))

(declare-fun m!663925 () Bool)

(assert (=> b!706662 m!663925))

(declare-fun m!663927 () Bool)

(assert (=> b!706663 m!663927))

(declare-fun m!663929 () Bool)

(assert (=> b!706660 m!663929))

(check-sat (not b!706654) (not b!706656) (not b!706657) (not start!62618) (not b!706653) (not b!706662) (not b!706665) (not b!706655) (not b!706658) (not b!706660) (not b!706663) (not b!706659) (not b!706661) (not b!706664))
(check-sat)
