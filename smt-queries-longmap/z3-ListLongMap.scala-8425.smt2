; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102638 () Bool)

(assert start!102638)

(declare-fun b!1233785 () Bool)

(declare-fun res!821973 () Bool)

(declare-fun e!699875 () Bool)

(assert (=> b!1233785 (=> (not res!821973) (not e!699875))))

(declare-datatypes ((array!79528 0))(
  ( (array!79529 (arr!38373 (Array (_ BitVec 32) (_ BitVec 64))) (size!38909 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79528)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233785 (= res!821973 (validKeyInArray!0 (select (arr!38373 a!3806) from!3184)))))

(declare-fun b!1233786 () Bool)

(declare-fun res!821968 () Bool)

(assert (=> b!1233786 (=> (not res!821968) (not e!699875))))

(declare-datatypes ((List!27146 0))(
  ( (Nil!27143) (Cons!27142 (h!28351 (_ BitVec 64)) (t!40609 List!27146)) )
))
(declare-fun acc!823 () List!27146)

(declare-fun contains!7208 (List!27146 (_ BitVec 64)) Bool)

(assert (=> b!1233786 (= res!821968 (not (contains!7208 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233787 () Bool)

(assert (=> b!1233787 (= e!699875 (not true))))

(declare-fun arrayContainsKey!0 (array!79528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233787 (not (arrayContainsKey!0 a!3806 (select (arr!38373 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40852 0))(
  ( (Unit!40853) )
))
(declare-fun lt!559744 () Unit!40852)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79528 (_ BitVec 32) (_ BitVec 64) List!27146) Unit!40852)

(assert (=> b!1233787 (= lt!559744 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38373 a!3806) from!3184) (Cons!27142 (select (arr!38373 a!3806) from!3184) Nil!27143)))))

(declare-fun e!699874 () Bool)

(assert (=> b!1233787 e!699874))

(declare-fun res!821971 () Bool)

(assert (=> b!1233787 (=> (not res!821971) (not e!699874))))

(declare-fun arrayNoDuplicates!0 (array!79528 (_ BitVec 32) List!27146) Bool)

(assert (=> b!1233787 (= res!821971 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27143))))

(declare-fun lt!559745 () Unit!40852)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79528 List!27146 List!27146 (_ BitVec 32)) Unit!40852)

(assert (=> b!1233787 (= lt!559745 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27143 from!3184))))

(assert (=> b!1233787 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27142 (select (arr!38373 a!3806) from!3184) acc!823))))

(declare-fun b!1233788 () Bool)

(declare-fun res!821970 () Bool)

(assert (=> b!1233788 (=> (not res!821970) (not e!699875))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1233788 (= res!821970 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233789 () Bool)

(declare-fun res!821969 () Bool)

(assert (=> b!1233789 (=> (not res!821969) (not e!699875))))

(declare-fun noDuplicate!1805 (List!27146) Bool)

(assert (=> b!1233789 (= res!821969 (noDuplicate!1805 acc!823))))

(declare-fun b!1233790 () Bool)

(assert (=> b!1233790 (= e!699874 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27142 (select (arr!38373 a!3806) from!3184) Nil!27143)))))

(declare-fun res!821974 () Bool)

(assert (=> start!102638 (=> (not res!821974) (not e!699875))))

(assert (=> start!102638 (= res!821974 (bvslt (size!38909 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102638 e!699875))

(declare-fun array_inv!29221 (array!79528) Bool)

(assert (=> start!102638 (array_inv!29221 a!3806)))

(assert (=> start!102638 true))

(declare-fun b!1233791 () Bool)

(declare-fun res!821966 () Bool)

(assert (=> b!1233791 (=> (not res!821966) (not e!699875))))

(assert (=> b!1233791 (= res!821966 (not (contains!7208 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233792 () Bool)

(declare-fun res!821965 () Bool)

(assert (=> b!1233792 (=> (not res!821965) (not e!699875))))

(assert (=> b!1233792 (= res!821965 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233793 () Bool)

(declare-fun res!821967 () Bool)

(assert (=> b!1233793 (=> (not res!821967) (not e!699875))))

(assert (=> b!1233793 (= res!821967 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233794 () Bool)

(declare-fun res!821972 () Bool)

(assert (=> b!1233794 (=> (not res!821972) (not e!699875))))

(assert (=> b!1233794 (= res!821972 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38909 a!3806)) (bvslt from!3184 (size!38909 a!3806))))))

(assert (= (and start!102638 res!821974) b!1233793))

(assert (= (and b!1233793 res!821967) b!1233794))

(assert (= (and b!1233794 res!821972) b!1233789))

(assert (= (and b!1233789 res!821969) b!1233791))

(assert (= (and b!1233791 res!821966) b!1233786))

(assert (= (and b!1233786 res!821968) b!1233788))

(assert (= (and b!1233788 res!821970) b!1233792))

(assert (= (and b!1233792 res!821965) b!1233785))

(assert (= (and b!1233785 res!821973) b!1233787))

(assert (= (and b!1233787 res!821971) b!1233790))

(declare-fun m!1137841 () Bool)

(assert (=> b!1233785 m!1137841))

(assert (=> b!1233785 m!1137841))

(declare-fun m!1137843 () Bool)

(assert (=> b!1233785 m!1137843))

(declare-fun m!1137845 () Bool)

(assert (=> b!1233792 m!1137845))

(declare-fun m!1137847 () Bool)

(assert (=> b!1233793 m!1137847))

(declare-fun m!1137849 () Bool)

(assert (=> b!1233791 m!1137849))

(declare-fun m!1137851 () Bool)

(assert (=> b!1233786 m!1137851))

(declare-fun m!1137853 () Bool)

(assert (=> b!1233788 m!1137853))

(declare-fun m!1137855 () Bool)

(assert (=> b!1233787 m!1137855))

(declare-fun m!1137857 () Bool)

(assert (=> b!1233787 m!1137857))

(assert (=> b!1233787 m!1137841))

(declare-fun m!1137859 () Bool)

(assert (=> b!1233787 m!1137859))

(assert (=> b!1233787 m!1137841))

(declare-fun m!1137861 () Bool)

(assert (=> b!1233787 m!1137861))

(assert (=> b!1233787 m!1137841))

(declare-fun m!1137863 () Bool)

(assert (=> b!1233787 m!1137863))

(declare-fun m!1137865 () Bool)

(assert (=> start!102638 m!1137865))

(assert (=> b!1233790 m!1137841))

(declare-fun m!1137867 () Bool)

(assert (=> b!1233790 m!1137867))

(declare-fun m!1137869 () Bool)

(assert (=> b!1233789 m!1137869))

(check-sat (not b!1233786) (not b!1233789) (not b!1233791) (not b!1233788) (not b!1233785) (not b!1233792) (not b!1233793) (not start!102638) (not b!1233790) (not b!1233787))
(check-sat)
