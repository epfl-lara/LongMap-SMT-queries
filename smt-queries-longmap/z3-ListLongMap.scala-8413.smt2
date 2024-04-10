; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102374 () Bool)

(assert start!102374)

(declare-fun b!1231665 () Bool)

(declare-fun res!820087 () Bool)

(declare-fun e!698681 () Bool)

(assert (=> b!1231665 (=> (not res!820087) (not e!698681))))

(declare-datatypes ((List!27110 0))(
  ( (Nil!27107) (Cons!27106 (h!28315 (_ BitVec 64)) (t!40573 List!27110)) )
))
(declare-fun acc!823 () List!27110)

(declare-fun noDuplicate!1769 (List!27110) Bool)

(assert (=> b!1231665 (= res!820087 (noDuplicate!1769 acc!823))))

(declare-fun b!1231666 () Bool)

(declare-fun res!820084 () Bool)

(assert (=> b!1231666 (=> (not res!820084) (not e!698681))))

(declare-datatypes ((array!79444 0))(
  ( (array!79445 (arr!38337 (Array (_ BitVec 32) (_ BitVec 64))) (size!38873 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79444)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231666 (= res!820084 (validKeyInArray!0 (select (arr!38337 a!3806) from!3184)))))

(declare-fun b!1231667 () Bool)

(declare-fun res!820085 () Bool)

(assert (=> b!1231667 (=> (not res!820085) (not e!698681))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79444 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231667 (= res!820085 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231668 () Bool)

(declare-fun res!820086 () Bool)

(assert (=> b!1231668 (=> (not res!820086) (not e!698681))))

(assert (=> b!1231668 (= res!820086 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38873 a!3806)) (bvslt from!3184 (size!38873 a!3806))))))

(declare-fun b!1231669 () Bool)

(assert (=> b!1231669 (= e!698681 (not true))))

(declare-fun arrayNoDuplicates!0 (array!79444 (_ BitVec 32) List!27110) Bool)

(assert (=> b!1231669 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27107)))

(declare-datatypes ((Unit!40780 0))(
  ( (Unit!40781) )
))
(declare-fun lt!559433 () Unit!40780)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79444 List!27110 List!27110 (_ BitVec 32)) Unit!40780)

(assert (=> b!1231669 (= lt!559433 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27107 from!3184))))

(assert (=> b!1231669 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27106 (select (arr!38337 a!3806) from!3184) acc!823))))

(declare-fun res!820082 () Bool)

(assert (=> start!102374 (=> (not res!820082) (not e!698681))))

(assert (=> start!102374 (= res!820082 (bvslt (size!38873 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102374 e!698681))

(declare-fun array_inv!29185 (array!79444) Bool)

(assert (=> start!102374 (array_inv!29185 a!3806)))

(assert (=> start!102374 true))

(declare-fun b!1231670 () Bool)

(declare-fun res!820083 () Bool)

(assert (=> b!1231670 (=> (not res!820083) (not e!698681))))

(assert (=> b!1231670 (= res!820083 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231671 () Bool)

(declare-fun res!820081 () Bool)

(assert (=> b!1231671 (=> (not res!820081) (not e!698681))))

(declare-fun contains!7172 (List!27110 (_ BitVec 64)) Bool)

(assert (=> b!1231671 (= res!820081 (not (contains!7172 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231672 () Bool)

(declare-fun res!820079 () Bool)

(assert (=> b!1231672 (=> (not res!820079) (not e!698681))))

(assert (=> b!1231672 (= res!820079 (validKeyInArray!0 k0!2913))))

(declare-fun b!1231673 () Bool)

(declare-fun res!820080 () Bool)

(assert (=> b!1231673 (=> (not res!820080) (not e!698681))))

(assert (=> b!1231673 (= res!820080 (not (contains!7172 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102374 res!820082) b!1231672))

(assert (= (and b!1231672 res!820079) b!1231668))

(assert (= (and b!1231668 res!820086) b!1231665))

(assert (= (and b!1231665 res!820087) b!1231673))

(assert (= (and b!1231673 res!820080) b!1231671))

(assert (= (and b!1231671 res!820081) b!1231667))

(assert (= (and b!1231667 res!820085) b!1231670))

(assert (= (and b!1231670 res!820083) b!1231666))

(assert (= (and b!1231666 res!820084) b!1231669))

(declare-fun m!1135765 () Bool)

(assert (=> b!1231673 m!1135765))

(declare-fun m!1135767 () Bool)

(assert (=> b!1231665 m!1135767))

(declare-fun m!1135769 () Bool)

(assert (=> b!1231672 m!1135769))

(declare-fun m!1135771 () Bool)

(assert (=> b!1231671 m!1135771))

(declare-fun m!1135773 () Bool)

(assert (=> b!1231670 m!1135773))

(declare-fun m!1135775 () Bool)

(assert (=> b!1231667 m!1135775))

(declare-fun m!1135777 () Bool)

(assert (=> b!1231669 m!1135777))

(declare-fun m!1135779 () Bool)

(assert (=> b!1231669 m!1135779))

(declare-fun m!1135781 () Bool)

(assert (=> b!1231669 m!1135781))

(declare-fun m!1135783 () Bool)

(assert (=> b!1231669 m!1135783))

(assert (=> b!1231666 m!1135781))

(assert (=> b!1231666 m!1135781))

(declare-fun m!1135785 () Bool)

(assert (=> b!1231666 m!1135785))

(declare-fun m!1135787 () Bool)

(assert (=> start!102374 m!1135787))

(check-sat (not start!102374) (not b!1231673) (not b!1231672) (not b!1231665) (not b!1231671) (not b!1231670) (not b!1231669) (not b!1231666) (not b!1231667))
(check-sat)
