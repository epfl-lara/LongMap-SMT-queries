; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102682 () Bool)

(assert start!102682)

(declare-fun b!1233520 () Bool)

(declare-fun e!699784 () Bool)

(assert (=> b!1233520 (= e!699784 (not true))))

(declare-fun e!699785 () Bool)

(assert (=> b!1233520 e!699785))

(declare-fun res!821112 () Bool)

(assert (=> b!1233520 (=> (not res!821112) (not e!699785))))

(declare-datatypes ((array!79509 0))(
  ( (array!79510 (arr!38362 (Array (_ BitVec 32) (_ BitVec 64))) (size!38899 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79509)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27148 0))(
  ( (Nil!27145) (Cons!27144 (h!28362 (_ BitVec 64)) (t!40603 List!27148)) )
))
(declare-fun arrayNoDuplicates!0 (array!79509 (_ BitVec 32) List!27148) Bool)

(assert (=> b!1233520 (= res!821112 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27145))))

(declare-fun acc!823 () List!27148)

(declare-datatypes ((Unit!40779 0))(
  ( (Unit!40780) )
))
(declare-fun lt!559980 () Unit!40779)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79509 List!27148 List!27148 (_ BitVec 32)) Unit!40779)

(assert (=> b!1233520 (= lt!559980 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27145 from!3184))))

(assert (=> b!1233520 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27144 (select (arr!38362 a!3806) from!3184) acc!823))))

(declare-fun b!1233521 () Bool)

(declare-fun res!821106 () Bool)

(assert (=> b!1233521 (=> (not res!821106) (not e!699784))))

(declare-fun contains!7219 (List!27148 (_ BitVec 64)) Bool)

(assert (=> b!1233521 (= res!821106 (not (contains!7219 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233522 () Bool)

(declare-fun res!821107 () Bool)

(assert (=> b!1233522 (=> (not res!821107) (not e!699784))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233522 (= res!821107 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!821114 () Bool)

(assert (=> start!102682 (=> (not res!821114) (not e!699784))))

(assert (=> start!102682 (= res!821114 (bvslt (size!38899 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102682 e!699784))

(declare-fun array_inv!29300 (array!79509) Bool)

(assert (=> start!102682 (array_inv!29300 a!3806)))

(assert (=> start!102682 true))

(declare-fun b!1233523 () Bool)

(declare-fun res!821111 () Bool)

(assert (=> b!1233523 (=> (not res!821111) (not e!699784))))

(declare-fun noDuplicate!1800 (List!27148) Bool)

(assert (=> b!1233523 (= res!821111 (noDuplicate!1800 acc!823))))

(declare-fun b!1233524 () Bool)

(declare-fun res!821108 () Bool)

(assert (=> b!1233524 (=> (not res!821108) (not e!699784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233524 (= res!821108 (validKeyInArray!0 k!2913))))

(declare-fun b!1233525 () Bool)

(declare-fun res!821109 () Bool)

(assert (=> b!1233525 (=> (not res!821109) (not e!699784))))

(assert (=> b!1233525 (= res!821109 (validKeyInArray!0 (select (arr!38362 a!3806) from!3184)))))

(declare-fun b!1233526 () Bool)

(assert (=> b!1233526 (= e!699785 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27144 (select (arr!38362 a!3806) from!3184) Nil!27145)))))

(declare-fun b!1233527 () Bool)

(declare-fun res!821110 () Bool)

(assert (=> b!1233527 (=> (not res!821110) (not e!699784))))

(assert (=> b!1233527 (= res!821110 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38899 a!3806)) (bvslt from!3184 (size!38899 a!3806))))))

(declare-fun b!1233528 () Bool)

(declare-fun res!821105 () Bool)

(assert (=> b!1233528 (=> (not res!821105) (not e!699784))))

(assert (=> b!1233528 (= res!821105 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233529 () Bool)

(declare-fun res!821113 () Bool)

(assert (=> b!1233529 (=> (not res!821113) (not e!699784))))

(assert (=> b!1233529 (= res!821113 (not (contains!7219 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102682 res!821114) b!1233524))

(assert (= (and b!1233524 res!821108) b!1233527))

(assert (= (and b!1233527 res!821110) b!1233523))

(assert (= (and b!1233523 res!821111) b!1233521))

(assert (= (and b!1233521 res!821106) b!1233529))

(assert (= (and b!1233529 res!821113) b!1233522))

(assert (= (and b!1233522 res!821107) b!1233528))

(assert (= (and b!1233528 res!821105) b!1233525))

(assert (= (and b!1233525 res!821109) b!1233520))

(assert (= (and b!1233520 res!821112) b!1233526))

(declare-fun m!1137871 () Bool)

(assert (=> b!1233528 m!1137871))

(declare-fun m!1137873 () Bool)

(assert (=> b!1233523 m!1137873))

(declare-fun m!1137875 () Bool)

(assert (=> b!1233525 m!1137875))

(assert (=> b!1233525 m!1137875))

(declare-fun m!1137877 () Bool)

(assert (=> b!1233525 m!1137877))

(declare-fun m!1137879 () Bool)

(assert (=> b!1233529 m!1137879))

(declare-fun m!1137881 () Bool)

(assert (=> b!1233521 m!1137881))

(declare-fun m!1137883 () Bool)

(assert (=> b!1233520 m!1137883))

(declare-fun m!1137885 () Bool)

(assert (=> b!1233520 m!1137885))

(assert (=> b!1233520 m!1137875))

(declare-fun m!1137887 () Bool)

(assert (=> b!1233520 m!1137887))

(declare-fun m!1137889 () Bool)

(assert (=> start!102682 m!1137889))

(assert (=> b!1233526 m!1137875))

(declare-fun m!1137891 () Bool)

(assert (=> b!1233526 m!1137891))

(declare-fun m!1137893 () Bool)

(assert (=> b!1233524 m!1137893))

(declare-fun m!1137895 () Bool)

(assert (=> b!1233522 m!1137895))

(push 1)

(assert (not start!102682))

(assert (not b!1233528))

(assert (not b!1233529))

(assert (not b!1233524))

(assert (not b!1233523))

(assert (not b!1233521))

(assert (not b!1233525))

(assert (not b!1233520))

(assert (not b!1233526))

(assert (not b!1233522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

