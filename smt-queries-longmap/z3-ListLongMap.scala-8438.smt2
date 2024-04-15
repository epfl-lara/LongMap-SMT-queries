; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102760 () Bool)

(assert start!102760)

(declare-fun b!1234747 () Bool)

(declare-fun res!822946 () Bool)

(declare-fun e!700239 () Bool)

(assert (=> b!1234747 (=> (not res!822946) (not e!700239))))

(declare-datatypes ((array!79528 0))(
  ( (array!79529 (arr!38372 (Array (_ BitVec 32) (_ BitVec 64))) (size!38910 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79528)

(declare-datatypes ((List!27246 0))(
  ( (Nil!27243) (Cons!27242 (h!28451 (_ BitVec 64)) (t!40700 List!27246)) )
))
(declare-fun acc!846 () List!27246)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79528 (_ BitVec 32) List!27246) Bool)

(assert (=> b!1234747 (= res!822946 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234748 () Bool)

(declare-fun res!822950 () Bool)

(assert (=> b!1234748 (=> (not res!822950) (not e!700239))))

(assert (=> b!1234748 (= res!822950 (not (= from!3213 (bvsub (size!38910 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234749 () Bool)

(declare-fun res!822956 () Bool)

(declare-fun e!700241 () Bool)

(assert (=> b!1234749 (=> res!822956 e!700241)))

(declare-fun lt!559839 () List!27246)

(declare-fun contains!7218 (List!27246 (_ BitVec 64)) Bool)

(assert (=> b!1234749 (= res!822956 (contains!7218 lt!559839 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!822953 () Bool)

(assert (=> start!102760 (=> (not res!822953) (not e!700239))))

(assert (=> start!102760 (= res!822953 (and (bvslt (size!38910 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38910 a!3835))))))

(assert (=> start!102760 e!700239))

(declare-fun array_inv!29355 (array!79528) Bool)

(assert (=> start!102760 (array_inv!29355 a!3835)))

(assert (=> start!102760 true))

(declare-fun b!1234750 () Bool)

(declare-fun res!822954 () Bool)

(assert (=> b!1234750 (=> res!822954 e!700241)))

(declare-fun noDuplicate!1861 (List!27246) Bool)

(assert (=> b!1234750 (= res!822954 (not (noDuplicate!1861 lt!559839)))))

(declare-fun b!1234751 () Bool)

(assert (=> b!1234751 (= e!700239 (not e!700241))))

(declare-fun res!822955 () Bool)

(assert (=> b!1234751 (=> res!822955 e!700241)))

(assert (=> b!1234751 (= res!822955 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!518 (List!27246 List!27246) Bool)

(assert (=> b!1234751 (subseq!518 acc!846 lt!559839)))

(declare-datatypes ((Unit!40739 0))(
  ( (Unit!40740) )
))
(declare-fun lt!559841 () Unit!40739)

(declare-fun subseqTail!11 (List!27246 List!27246) Unit!40739)

(assert (=> b!1234751 (= lt!559841 (subseqTail!11 lt!559839 lt!559839))))

(assert (=> b!1234751 (subseq!518 lt!559839 lt!559839)))

(declare-fun lt!559837 () Unit!40739)

(declare-fun lemmaListSubSeqRefl!0 (List!27246) Unit!40739)

(assert (=> b!1234751 (= lt!559837 (lemmaListSubSeqRefl!0 lt!559839))))

(assert (=> b!1234751 (= lt!559839 (Cons!27242 (select (arr!38372 a!3835) from!3213) acc!846))))

(declare-fun b!1234752 () Bool)

(declare-fun res!822951 () Bool)

(assert (=> b!1234752 (=> (not res!822951) (not e!700239))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234752 (= res!822951 (contains!7218 acc!846 k0!2925))))

(declare-fun b!1234753 () Bool)

(assert (=> b!1234753 (= e!700241 true)))

(declare-fun lt!559840 () Bool)

(assert (=> b!1234753 (= lt!559840 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559839))))

(declare-fun lt!559838 () Unit!40739)

(declare-fun noDuplicateSubseq!65 (List!27246 List!27246) Unit!40739)

(assert (=> b!1234753 (= lt!559838 (noDuplicateSubseq!65 acc!846 lt!559839))))

(declare-fun b!1234754 () Bool)

(declare-fun res!822949 () Bool)

(assert (=> b!1234754 (=> (not res!822949) (not e!700239))))

(assert (=> b!1234754 (= res!822949 (not (contains!7218 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234755 () Bool)

(declare-fun res!822945 () Bool)

(assert (=> b!1234755 (=> (not res!822945) (not e!700239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234755 (= res!822945 (validKeyInArray!0 (select (arr!38372 a!3835) from!3213)))))

(declare-fun b!1234756 () Bool)

(declare-fun res!822952 () Bool)

(assert (=> b!1234756 (=> (not res!822952) (not e!700239))))

(assert (=> b!1234756 (= res!822952 (not (contains!7218 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234757 () Bool)

(declare-fun res!822948 () Bool)

(assert (=> b!1234757 (=> res!822948 e!700241)))

(assert (=> b!1234757 (= res!822948 (contains!7218 lt!559839 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234758 () Bool)

(declare-fun res!822947 () Bool)

(assert (=> b!1234758 (=> (not res!822947) (not e!700239))))

(assert (=> b!1234758 (= res!822947 (noDuplicate!1861 acc!846))))

(assert (= (and start!102760 res!822953) b!1234758))

(assert (= (and b!1234758 res!822947) b!1234756))

(assert (= (and b!1234756 res!822952) b!1234754))

(assert (= (and b!1234754 res!822949) b!1234747))

(assert (= (and b!1234747 res!822946) b!1234752))

(assert (= (and b!1234752 res!822951) b!1234748))

(assert (= (and b!1234748 res!822950) b!1234755))

(assert (= (and b!1234755 res!822945) b!1234751))

(assert (= (and b!1234751 (not res!822955)) b!1234750))

(assert (= (and b!1234750 (not res!822954)) b!1234749))

(assert (= (and b!1234749 (not res!822956)) b!1234757))

(assert (= (and b!1234757 (not res!822948)) b!1234753))

(declare-fun m!1138233 () Bool)

(assert (=> b!1234758 m!1138233))

(declare-fun m!1138235 () Bool)

(assert (=> b!1234755 m!1138235))

(assert (=> b!1234755 m!1138235))

(declare-fun m!1138237 () Bool)

(assert (=> b!1234755 m!1138237))

(declare-fun m!1138239 () Bool)

(assert (=> start!102760 m!1138239))

(declare-fun m!1138241 () Bool)

(assert (=> b!1234756 m!1138241))

(declare-fun m!1138243 () Bool)

(assert (=> b!1234752 m!1138243))

(declare-fun m!1138245 () Bool)

(assert (=> b!1234751 m!1138245))

(declare-fun m!1138247 () Bool)

(assert (=> b!1234751 m!1138247))

(declare-fun m!1138249 () Bool)

(assert (=> b!1234751 m!1138249))

(declare-fun m!1138251 () Bool)

(assert (=> b!1234751 m!1138251))

(assert (=> b!1234751 m!1138235))

(declare-fun m!1138253 () Bool)

(assert (=> b!1234754 m!1138253))

(declare-fun m!1138255 () Bool)

(assert (=> b!1234757 m!1138255))

(declare-fun m!1138257 () Bool)

(assert (=> b!1234747 m!1138257))

(declare-fun m!1138259 () Bool)

(assert (=> b!1234749 m!1138259))

(declare-fun m!1138261 () Bool)

(assert (=> b!1234753 m!1138261))

(declare-fun m!1138263 () Bool)

(assert (=> b!1234753 m!1138263))

(declare-fun m!1138265 () Bool)

(assert (=> b!1234750 m!1138265))

(check-sat (not b!1234751) (not b!1234757) (not b!1234755) (not b!1234754) (not b!1234758) (not b!1234749) (not b!1234752) (not b!1234753) (not b!1234747) (not b!1234750) (not b!1234756) (not start!102760))
(check-sat)
