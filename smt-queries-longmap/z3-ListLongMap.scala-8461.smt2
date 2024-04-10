; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102902 () Bool)

(assert start!102902)

(declare-fun b!1236721 () Bool)

(declare-fun res!824705 () Bool)

(declare-fun e!700916 () Bool)

(assert (=> b!1236721 (=> (not res!824705) (not e!700916))))

(declare-datatypes ((array!79747 0))(
  ( (array!79748 (arr!38481 (Array (_ BitVec 32) (_ BitVec 64))) (size!39017 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79747)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236721 (= res!824705 (validKeyInArray!0 (select (arr!38481 a!3835) from!3213)))))

(declare-fun res!824703 () Bool)

(assert (=> start!102902 (=> (not res!824703) (not e!700916))))

(assert (=> start!102902 (= res!824703 (and (bvslt (size!39017 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39017 a!3835))))))

(assert (=> start!102902 e!700916))

(declare-fun array_inv!29329 (array!79747) Bool)

(assert (=> start!102902 (array_inv!29329 a!3835)))

(assert (=> start!102902 true))

(declare-fun b!1236722 () Bool)

(declare-fun res!824706 () Bool)

(assert (=> b!1236722 (=> (not res!824706) (not e!700916))))

(declare-datatypes ((List!27254 0))(
  ( (Nil!27251) (Cons!27250 (h!28459 (_ BitVec 64)) (t!40717 List!27254)) )
))
(declare-fun acc!846 () List!27254)

(declare-fun noDuplicate!1913 (List!27254) Bool)

(assert (=> b!1236722 (= res!824706 (noDuplicate!1913 acc!846))))

(declare-fun b!1236723 () Bool)

(declare-fun res!824708 () Bool)

(assert (=> b!1236723 (=> (not res!824708) (not e!700916))))

(assert (=> b!1236723 (= res!824708 (not (= from!3213 (bvsub (size!39017 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236724 () Bool)

(declare-fun res!824704 () Bool)

(assert (=> b!1236724 (=> (not res!824704) (not e!700916))))

(declare-fun contains!7316 (List!27254 (_ BitVec 64)) Bool)

(assert (=> b!1236724 (= res!824704 (not (contains!7316 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236725 () Bool)

(declare-fun res!824710 () Bool)

(assert (=> b!1236725 (=> (not res!824710) (not e!700916))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236725 (= res!824710 (contains!7316 acc!846 k0!2925))))

(declare-fun b!1236726 () Bool)

(assert (=> b!1236726 (= e!700916 (not true))))

(declare-datatypes ((Unit!41026 0))(
  ( (Unit!41027) )
))
(declare-fun lt!560863 () Unit!41026)

(declare-fun lt!560862 () List!27254)

(declare-fun subseqTail!57 (List!27254 List!27254) Unit!41026)

(assert (=> b!1236726 (= lt!560863 (subseqTail!57 lt!560862 lt!560862))))

(declare-fun subseq!570 (List!27254 List!27254) Bool)

(assert (=> b!1236726 (subseq!570 lt!560862 lt!560862)))

(declare-fun lt!560864 () Unit!41026)

(declare-fun lemmaListSubSeqRefl!0 (List!27254) Unit!41026)

(assert (=> b!1236726 (= lt!560864 (lemmaListSubSeqRefl!0 lt!560862))))

(assert (=> b!1236726 (= lt!560862 (Cons!27250 (select (arr!38481 a!3835) from!3213) acc!846))))

(declare-fun b!1236727 () Bool)

(declare-fun res!824707 () Bool)

(assert (=> b!1236727 (=> (not res!824707) (not e!700916))))

(assert (=> b!1236727 (= res!824707 (not (contains!7316 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236728 () Bool)

(declare-fun res!824709 () Bool)

(assert (=> b!1236728 (=> (not res!824709) (not e!700916))))

(declare-fun arrayNoDuplicates!0 (array!79747 (_ BitVec 32) List!27254) Bool)

(assert (=> b!1236728 (= res!824709 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102902 res!824703) b!1236722))

(assert (= (and b!1236722 res!824706) b!1236724))

(assert (= (and b!1236724 res!824704) b!1236727))

(assert (= (and b!1236727 res!824707) b!1236728))

(assert (= (and b!1236728 res!824709) b!1236725))

(assert (= (and b!1236725 res!824710) b!1236723))

(assert (= (and b!1236723 res!824708) b!1236721))

(assert (= (and b!1236721 res!824705) b!1236726))

(declare-fun m!1140473 () Bool)

(assert (=> b!1236722 m!1140473))

(declare-fun m!1140475 () Bool)

(assert (=> start!102902 m!1140475))

(declare-fun m!1140477 () Bool)

(assert (=> b!1236725 m!1140477))

(declare-fun m!1140479 () Bool)

(assert (=> b!1236728 m!1140479))

(declare-fun m!1140481 () Bool)

(assert (=> b!1236726 m!1140481))

(declare-fun m!1140483 () Bool)

(assert (=> b!1236726 m!1140483))

(declare-fun m!1140485 () Bool)

(assert (=> b!1236726 m!1140485))

(declare-fun m!1140487 () Bool)

(assert (=> b!1236726 m!1140487))

(declare-fun m!1140489 () Bool)

(assert (=> b!1236724 m!1140489))

(assert (=> b!1236721 m!1140487))

(assert (=> b!1236721 m!1140487))

(declare-fun m!1140491 () Bool)

(assert (=> b!1236721 m!1140491))

(declare-fun m!1140493 () Bool)

(assert (=> b!1236727 m!1140493))

(check-sat (not b!1236726) (not b!1236724) (not b!1236728) (not b!1236722) (not b!1236725) (not b!1236721) (not b!1236727) (not start!102902))
(check-sat)
