; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102758 () Bool)

(assert start!102758)

(declare-fun b!1234743 () Bool)

(declare-fun res!822908 () Bool)

(declare-fun e!700256 () Bool)

(assert (=> b!1234743 (=> (not res!822908) (not e!700256))))

(declare-datatypes ((List!27182 0))(
  ( (Nil!27179) (Cons!27178 (h!28387 (_ BitVec 64)) (t!40645 List!27182)) )
))
(declare-fun acc!846 () List!27182)

(declare-fun contains!7244 (List!27182 (_ BitVec 64)) Bool)

(assert (=> b!1234743 (= res!822908 (not (contains!7244 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234744 () Bool)

(declare-fun e!700257 () Bool)

(assert (=> b!1234744 (= e!700256 (not e!700257))))

(declare-fun res!822911 () Bool)

(assert (=> b!1234744 (=> res!822911 e!700257)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1234744 (= res!822911 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!559985 () List!27182)

(declare-fun subseq!516 (List!27182 List!27182) Bool)

(assert (=> b!1234744 (subseq!516 acc!846 lt!559985)))

(declare-datatypes ((Unit!40888 0))(
  ( (Unit!40889) )
))
(declare-fun lt!559981 () Unit!40888)

(declare-fun subseqTail!9 (List!27182 List!27182) Unit!40888)

(assert (=> b!1234744 (= lt!559981 (subseqTail!9 lt!559985 lt!559985))))

(assert (=> b!1234744 (subseq!516 lt!559985 lt!559985)))

(declare-fun lt!559984 () Unit!40888)

(declare-fun lemmaListSubSeqRefl!0 (List!27182) Unit!40888)

(assert (=> b!1234744 (= lt!559984 (lemmaListSubSeqRefl!0 lt!559985))))

(declare-datatypes ((array!79603 0))(
  ( (array!79604 (arr!38409 (Array (_ BitVec 32) (_ BitVec 64))) (size!38945 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79603)

(assert (=> b!1234744 (= lt!559985 (Cons!27178 (select (arr!38409 a!3835) from!3213) acc!846))))

(declare-fun b!1234745 () Bool)

(assert (=> b!1234745 (= e!700257 true)))

(declare-fun lt!559983 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79603 (_ BitVec 32) List!27182) Bool)

(assert (=> b!1234745 (= lt!559983 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559985))))

(declare-fun lt!559982 () Unit!40888)

(declare-fun noDuplicateSubseq!63 (List!27182 List!27182) Unit!40888)

(assert (=> b!1234745 (= lt!559982 (noDuplicateSubseq!63 acc!846 lt!559985))))

(declare-fun res!822916 () Bool)

(assert (=> start!102758 (=> (not res!822916) (not e!700256))))

(assert (=> start!102758 (= res!822916 (and (bvslt (size!38945 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38945 a!3835))))))

(assert (=> start!102758 e!700256))

(declare-fun array_inv!29257 (array!79603) Bool)

(assert (=> start!102758 (array_inv!29257 a!3835)))

(assert (=> start!102758 true))

(declare-fun b!1234746 () Bool)

(declare-fun res!822910 () Bool)

(assert (=> b!1234746 (=> (not res!822910) (not e!700256))))

(assert (=> b!1234746 (= res!822910 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234747 () Bool)

(declare-fun res!822915 () Bool)

(assert (=> b!1234747 (=> res!822915 e!700257)))

(declare-fun noDuplicate!1841 (List!27182) Bool)

(assert (=> b!1234747 (= res!822915 (not (noDuplicate!1841 lt!559985)))))

(declare-fun b!1234748 () Bool)

(declare-fun res!822906 () Bool)

(assert (=> b!1234748 (=> (not res!822906) (not e!700256))))

(assert (=> b!1234748 (= res!822906 (noDuplicate!1841 acc!846))))

(declare-fun b!1234749 () Bool)

(declare-fun res!822907 () Bool)

(assert (=> b!1234749 (=> res!822907 e!700257)))

(assert (=> b!1234749 (= res!822907 (contains!7244 lt!559985 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234750 () Bool)

(declare-fun res!822913 () Bool)

(assert (=> b!1234750 (=> (not res!822913) (not e!700256))))

(assert (=> b!1234750 (= res!822913 (not (contains!7244 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234751 () Bool)

(declare-fun res!822905 () Bool)

(assert (=> b!1234751 (=> res!822905 e!700257)))

(assert (=> b!1234751 (= res!822905 (contains!7244 lt!559985 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234752 () Bool)

(declare-fun res!822909 () Bool)

(assert (=> b!1234752 (=> (not res!822909) (not e!700256))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234752 (= res!822909 (contains!7244 acc!846 k0!2925))))

(declare-fun b!1234753 () Bool)

(declare-fun res!822914 () Bool)

(assert (=> b!1234753 (=> (not res!822914) (not e!700256))))

(assert (=> b!1234753 (= res!822914 (not (= from!3213 (bvsub (size!38945 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234754 () Bool)

(declare-fun res!822912 () Bool)

(assert (=> b!1234754 (=> (not res!822912) (not e!700256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234754 (= res!822912 (validKeyInArray!0 (select (arr!38409 a!3835) from!3213)))))

(assert (= (and start!102758 res!822916) b!1234748))

(assert (= (and b!1234748 res!822906) b!1234750))

(assert (= (and b!1234750 res!822913) b!1234743))

(assert (= (and b!1234743 res!822908) b!1234746))

(assert (= (and b!1234746 res!822910) b!1234752))

(assert (= (and b!1234752 res!822909) b!1234753))

(assert (= (and b!1234753 res!822914) b!1234754))

(assert (= (and b!1234754 res!822912) b!1234744))

(assert (= (and b!1234744 (not res!822911)) b!1234747))

(assert (= (and b!1234747 (not res!822915)) b!1234751))

(assert (= (and b!1234751 (not res!822905)) b!1234749))

(assert (= (and b!1234749 (not res!822907)) b!1234745))

(declare-fun m!1138661 () Bool)

(assert (=> b!1234744 m!1138661))

(declare-fun m!1138663 () Bool)

(assert (=> b!1234744 m!1138663))

(declare-fun m!1138665 () Bool)

(assert (=> b!1234744 m!1138665))

(declare-fun m!1138667 () Bool)

(assert (=> b!1234744 m!1138667))

(declare-fun m!1138669 () Bool)

(assert (=> b!1234744 m!1138669))

(declare-fun m!1138671 () Bool)

(assert (=> start!102758 m!1138671))

(declare-fun m!1138673 () Bool)

(assert (=> b!1234743 m!1138673))

(declare-fun m!1138675 () Bool)

(assert (=> b!1234748 m!1138675))

(declare-fun m!1138677 () Bool)

(assert (=> b!1234745 m!1138677))

(declare-fun m!1138679 () Bool)

(assert (=> b!1234745 m!1138679))

(declare-fun m!1138681 () Bool)

(assert (=> b!1234751 m!1138681))

(assert (=> b!1234754 m!1138669))

(assert (=> b!1234754 m!1138669))

(declare-fun m!1138683 () Bool)

(assert (=> b!1234754 m!1138683))

(declare-fun m!1138685 () Bool)

(assert (=> b!1234750 m!1138685))

(declare-fun m!1138687 () Bool)

(assert (=> b!1234747 m!1138687))

(declare-fun m!1138689 () Bool)

(assert (=> b!1234752 m!1138689))

(declare-fun m!1138691 () Bool)

(assert (=> b!1234749 m!1138691))

(declare-fun m!1138693 () Bool)

(assert (=> b!1234746 m!1138693))

(check-sat (not b!1234751) (not b!1234743) (not start!102758) (not b!1234752) (not b!1234747) (not b!1234754) (not b!1234748) (not b!1234750) (not b!1234749) (not b!1234745) (not b!1234744) (not b!1234746))
(check-sat)
