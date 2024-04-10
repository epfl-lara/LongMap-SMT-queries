; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102752 () Bool)

(assert start!102752)

(declare-fun b!1234635 () Bool)

(declare-fun res!822798 () Bool)

(declare-fun e!700230 () Bool)

(assert (=> b!1234635 (=> res!822798 e!700230)))

(declare-datatypes ((List!27179 0))(
  ( (Nil!27176) (Cons!27175 (h!28384 (_ BitVec 64)) (t!40642 List!27179)) )
))
(declare-fun lt!559938 () List!27179)

(declare-fun noDuplicate!1838 (List!27179) Bool)

(assert (=> b!1234635 (= res!822798 (not (noDuplicate!1838 lt!559938)))))

(declare-fun b!1234636 () Bool)

(declare-fun res!822802 () Bool)

(declare-fun e!700229 () Bool)

(assert (=> b!1234636 (=> (not res!822802) (not e!700229))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79597 0))(
  ( (array!79598 (arr!38406 (Array (_ BitVec 32) (_ BitVec 64))) (size!38942 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79597)

(assert (=> b!1234636 (= res!822802 (not (= from!3213 (bvsub (size!38942 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!822806 () Bool)

(assert (=> start!102752 (=> (not res!822806) (not e!700229))))

(assert (=> start!102752 (= res!822806 (and (bvslt (size!38942 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38942 a!3835))))))

(assert (=> start!102752 e!700229))

(declare-fun array_inv!29254 (array!79597) Bool)

(assert (=> start!102752 (array_inv!29254 a!3835)))

(assert (=> start!102752 true))

(declare-fun b!1234637 () Bool)

(declare-fun res!822799 () Bool)

(assert (=> b!1234637 (=> (not res!822799) (not e!700229))))

(declare-fun acc!846 () List!27179)

(declare-fun contains!7241 (List!27179 (_ BitVec 64)) Bool)

(assert (=> b!1234637 (= res!822799 (not (contains!7241 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234638 () Bool)

(assert (=> b!1234638 (= e!700229 (not e!700230))))

(declare-fun res!822801 () Bool)

(assert (=> b!1234638 (=> res!822801 e!700230)))

(assert (=> b!1234638 (= res!822801 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!513 (List!27179 List!27179) Bool)

(assert (=> b!1234638 (subseq!513 acc!846 lt!559938)))

(declare-datatypes ((Unit!40882 0))(
  ( (Unit!40883) )
))
(declare-fun lt!559940 () Unit!40882)

(declare-fun subseqTail!6 (List!27179 List!27179) Unit!40882)

(assert (=> b!1234638 (= lt!559940 (subseqTail!6 lt!559938 lt!559938))))

(assert (=> b!1234638 (subseq!513 lt!559938 lt!559938)))

(declare-fun lt!559939 () Unit!40882)

(declare-fun lemmaListSubSeqRefl!0 (List!27179) Unit!40882)

(assert (=> b!1234638 (= lt!559939 (lemmaListSubSeqRefl!0 lt!559938))))

(assert (=> b!1234638 (= lt!559938 (Cons!27175 (select (arr!38406 a!3835) from!3213) acc!846))))

(declare-fun b!1234639 () Bool)

(declare-fun res!822803 () Bool)

(assert (=> b!1234639 (=> (not res!822803) (not e!700229))))

(assert (=> b!1234639 (= res!822803 (not (contains!7241 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234640 () Bool)

(assert (=> b!1234640 (= e!700230 true)))

(declare-fun lt!559937 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79597 (_ BitVec 32) List!27179) Bool)

(assert (=> b!1234640 (= lt!559937 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559938))))

(declare-fun lt!559936 () Unit!40882)

(declare-fun noDuplicateSubseq!60 (List!27179 List!27179) Unit!40882)

(assert (=> b!1234640 (= lt!559936 (noDuplicateSubseq!60 acc!846 lt!559938))))

(declare-fun b!1234641 () Bool)

(declare-fun res!822808 () Bool)

(assert (=> b!1234641 (=> (not res!822808) (not e!700229))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234641 (= res!822808 (contains!7241 acc!846 k0!2925))))

(declare-fun b!1234642 () Bool)

(declare-fun res!822805 () Bool)

(assert (=> b!1234642 (=> (not res!822805) (not e!700229))))

(assert (=> b!1234642 (= res!822805 (noDuplicate!1838 acc!846))))

(declare-fun b!1234643 () Bool)

(declare-fun res!822804 () Bool)

(assert (=> b!1234643 (=> res!822804 e!700230)))

(assert (=> b!1234643 (= res!822804 (contains!7241 lt!559938 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234644 () Bool)

(declare-fun res!822807 () Bool)

(assert (=> b!1234644 (=> res!822807 e!700230)))

(assert (=> b!1234644 (= res!822807 (contains!7241 lt!559938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234645 () Bool)

(declare-fun res!822800 () Bool)

(assert (=> b!1234645 (=> (not res!822800) (not e!700229))))

(assert (=> b!1234645 (= res!822800 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234646 () Bool)

(declare-fun res!822797 () Bool)

(assert (=> b!1234646 (=> (not res!822797) (not e!700229))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234646 (= res!822797 (validKeyInArray!0 (select (arr!38406 a!3835) from!3213)))))

(assert (= (and start!102752 res!822806) b!1234642))

(assert (= (and b!1234642 res!822805) b!1234637))

(assert (= (and b!1234637 res!822799) b!1234639))

(assert (= (and b!1234639 res!822803) b!1234645))

(assert (= (and b!1234645 res!822800) b!1234641))

(assert (= (and b!1234641 res!822808) b!1234636))

(assert (= (and b!1234636 res!822802) b!1234646))

(assert (= (and b!1234646 res!822797) b!1234638))

(assert (= (and b!1234638 (not res!822801)) b!1234635))

(assert (= (and b!1234635 (not res!822798)) b!1234644))

(assert (= (and b!1234644 (not res!822807)) b!1234643))

(assert (= (and b!1234643 (not res!822804)) b!1234640))

(declare-fun m!1138559 () Bool)

(assert (=> b!1234643 m!1138559))

(declare-fun m!1138561 () Bool)

(assert (=> b!1234642 m!1138561))

(declare-fun m!1138563 () Bool)

(assert (=> b!1234639 m!1138563))

(declare-fun m!1138565 () Bool)

(assert (=> b!1234637 m!1138565))

(declare-fun m!1138567 () Bool)

(assert (=> b!1234644 m!1138567))

(declare-fun m!1138569 () Bool)

(assert (=> b!1234640 m!1138569))

(declare-fun m!1138571 () Bool)

(assert (=> b!1234640 m!1138571))

(declare-fun m!1138573 () Bool)

(assert (=> b!1234638 m!1138573))

(declare-fun m!1138575 () Bool)

(assert (=> b!1234638 m!1138575))

(declare-fun m!1138577 () Bool)

(assert (=> b!1234638 m!1138577))

(declare-fun m!1138579 () Bool)

(assert (=> b!1234638 m!1138579))

(declare-fun m!1138581 () Bool)

(assert (=> b!1234638 m!1138581))

(assert (=> b!1234646 m!1138581))

(assert (=> b!1234646 m!1138581))

(declare-fun m!1138583 () Bool)

(assert (=> b!1234646 m!1138583))

(declare-fun m!1138585 () Bool)

(assert (=> start!102752 m!1138585))

(declare-fun m!1138587 () Bool)

(assert (=> b!1234641 m!1138587))

(declare-fun m!1138589 () Bool)

(assert (=> b!1234645 m!1138589))

(declare-fun m!1138591 () Bool)

(assert (=> b!1234635 m!1138591))

(check-sat (not b!1234635) (not b!1234644) (not b!1234638) (not b!1234643) (not b!1234646) (not b!1234637) (not b!1234642) (not b!1234640) (not b!1234641) (not start!102752) (not b!1234645) (not b!1234639))
