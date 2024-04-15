; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102814 () Bool)

(assert start!102814)

(declare-fun b!1235643 () Bool)

(declare-fun res!823768 () Bool)

(declare-fun e!700520 () Bool)

(assert (=> b!1235643 (=> (not res!823768) (not e!700520))))

(declare-datatypes ((array!79582 0))(
  ( (array!79583 (arr!38399 (Array (_ BitVec 32) (_ BitVec 64))) (size!38937 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79582)

(declare-datatypes ((List!27273 0))(
  ( (Nil!27270) (Cons!27269 (h!28478 (_ BitVec 64)) (t!40727 List!27273)) )
))
(declare-fun acc!846 () List!27273)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79582 (_ BitVec 32) List!27273) Bool)

(assert (=> b!1235643 (= res!823768 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235644 () Bool)

(declare-datatypes ((Unit!40805 0))(
  ( (Unit!40806) )
))
(declare-fun e!700522 () Unit!40805)

(declare-fun lt!560283 () Unit!40805)

(assert (=> b!1235644 (= e!700522 lt!560283)))

(declare-fun lt!560284 () List!27273)

(assert (=> b!1235644 (= lt!560284 (Cons!27269 (select (arr!38399 a!3835) from!3213) acc!846))))

(declare-fun lt!560285 () Unit!40805)

(declare-fun lemmaListSubSeqRefl!0 (List!27273) Unit!40805)

(assert (=> b!1235644 (= lt!560285 (lemmaListSubSeqRefl!0 lt!560284))))

(declare-fun subseq!545 (List!27273 List!27273) Bool)

(assert (=> b!1235644 (subseq!545 lt!560284 lt!560284)))

(declare-fun lt!560280 () Unit!40805)

(declare-fun subseqTail!38 (List!27273 List!27273) Unit!40805)

(assert (=> b!1235644 (= lt!560280 (subseqTail!38 lt!560284 lt!560284))))

(assert (=> b!1235644 (subseq!545 acc!846 lt!560284)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79582 List!27273 List!27273 (_ BitVec 32)) Unit!40805)

(assert (=> b!1235644 (= lt!560283 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560284 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235644 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235645 () Bool)

(declare-fun Unit!40807 () Unit!40805)

(assert (=> b!1235645 (= e!700522 Unit!40807)))

(declare-fun b!1235646 () Bool)

(declare-fun res!823769 () Bool)

(assert (=> b!1235646 (=> (not res!823769) (not e!700520))))

(declare-fun contains!7245 (List!27273 (_ BitVec 64)) Bool)

(assert (=> b!1235646 (= res!823769 (not (contains!7245 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235648 () Bool)

(declare-fun res!823770 () Bool)

(assert (=> b!1235648 (=> (not res!823770) (not e!700520))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235648 (= res!823770 (contains!7245 acc!846 k0!2925))))

(declare-fun b!1235649 () Bool)

(declare-fun e!700521 () Bool)

(assert (=> b!1235649 (= e!700521 false)))

(declare-fun lt!560282 () Bool)

(assert (=> b!1235649 (= lt!560282 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235650 () Bool)

(declare-fun res!823766 () Bool)

(assert (=> b!1235650 (=> (not res!823766) (not e!700520))))

(declare-fun noDuplicate!1888 (List!27273) Bool)

(assert (=> b!1235650 (= res!823766 (noDuplicate!1888 acc!846))))

(declare-fun b!1235651 () Bool)

(declare-fun res!823772 () Bool)

(assert (=> b!1235651 (=> (not res!823772) (not e!700520))))

(assert (=> b!1235651 (= res!823772 (not (contains!7245 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235652 () Bool)

(declare-fun res!823765 () Bool)

(assert (=> b!1235652 (=> (not res!823765) (not e!700520))))

(assert (=> b!1235652 (= res!823765 (not (= from!3213 (bvsub (size!38937 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!823771 () Bool)

(assert (=> start!102814 (=> (not res!823771) (not e!700520))))

(assert (=> start!102814 (= res!823771 (and (bvslt (size!38937 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38937 a!3835))))))

(assert (=> start!102814 e!700520))

(declare-fun array_inv!29382 (array!79582) Bool)

(assert (=> start!102814 (array_inv!29382 a!3835)))

(assert (=> start!102814 true))

(declare-fun b!1235647 () Bool)

(assert (=> b!1235647 (= e!700520 e!700521)))

(declare-fun res!823767 () Bool)

(assert (=> b!1235647 (=> (not res!823767) (not e!700521))))

(assert (=> b!1235647 (= res!823767 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38937 a!3835))))))

(declare-fun lt!560281 () Unit!40805)

(assert (=> b!1235647 (= lt!560281 e!700522)))

(declare-fun c!120802 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235647 (= c!120802 (validKeyInArray!0 (select (arr!38399 a!3835) from!3213)))))

(assert (= (and start!102814 res!823771) b!1235650))

(assert (= (and b!1235650 res!823766) b!1235651))

(assert (= (and b!1235651 res!823772) b!1235646))

(assert (= (and b!1235646 res!823769) b!1235643))

(assert (= (and b!1235643 res!823768) b!1235648))

(assert (= (and b!1235648 res!823770) b!1235652))

(assert (= (and b!1235652 res!823765) b!1235647))

(assert (= (and b!1235647 c!120802) b!1235644))

(assert (= (and b!1235647 (not c!120802)) b!1235645))

(assert (= (and b!1235647 res!823767) b!1235649))

(declare-fun m!1139079 () Bool)

(assert (=> b!1235643 m!1139079))

(declare-fun m!1139081 () Bool)

(assert (=> b!1235651 m!1139081))

(declare-fun m!1139083 () Bool)

(assert (=> start!102814 m!1139083))

(declare-fun m!1139085 () Bool)

(assert (=> b!1235649 m!1139085))

(declare-fun m!1139087 () Bool)

(assert (=> b!1235646 m!1139087))

(declare-fun m!1139089 () Bool)

(assert (=> b!1235648 m!1139089))

(declare-fun m!1139091 () Bool)

(assert (=> b!1235647 m!1139091))

(assert (=> b!1235647 m!1139091))

(declare-fun m!1139093 () Bool)

(assert (=> b!1235647 m!1139093))

(declare-fun m!1139095 () Bool)

(assert (=> b!1235644 m!1139095))

(declare-fun m!1139097 () Bool)

(assert (=> b!1235644 m!1139097))

(declare-fun m!1139099 () Bool)

(assert (=> b!1235644 m!1139099))

(declare-fun m!1139101 () Bool)

(assert (=> b!1235644 m!1139101))

(declare-fun m!1139103 () Bool)

(assert (=> b!1235644 m!1139103))

(assert (=> b!1235644 m!1139085))

(assert (=> b!1235644 m!1139091))

(declare-fun m!1139105 () Bool)

(assert (=> b!1235650 m!1139105))

(check-sat (not b!1235646) (not b!1235650) (not start!102814) (not b!1235647) (not b!1235649) (not b!1235648) (not b!1235644) (not b!1235651) (not b!1235643))
(check-sat)
