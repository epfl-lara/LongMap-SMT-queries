; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102400 () Bool)

(assert start!102400)

(declare-fun b!1231056 () Bool)

(declare-fun res!818756 () Bool)

(declare-fun e!698762 () Bool)

(assert (=> b!1231056 (=> res!818756 e!698762)))

(declare-datatypes ((List!27085 0))(
  ( (Nil!27082) (Cons!27081 (h!28299 (_ BitVec 64)) (t!40540 List!27085)) )
))
(declare-fun lt!559730 () List!27085)

(declare-fun contains!7156 (List!27085 (_ BitVec 64)) Bool)

(assert (=> b!1231056 (= res!818756 (contains!7156 lt!559730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231057 () Bool)

(declare-fun res!818762 () Bool)

(assert (=> b!1231057 (=> res!818762 e!698762)))

(assert (=> b!1231057 (= res!818762 (contains!7156 lt!559730 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1231058 () Bool)

(declare-fun res!818753 () Bool)

(declare-fun e!698763 () Bool)

(assert (=> b!1231058 (=> (not res!818753) (not e!698763))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79371 0))(
  ( (array!79372 (arr!38299 (Array (_ BitVec 32) (_ BitVec 64))) (size!38836 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79371)

(assert (=> b!1231058 (= res!818753 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38836 a!3806)) (bvslt from!3184 (size!38836 a!3806))))))

(declare-fun b!1231059 () Bool)

(declare-fun e!698764 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79371 (_ BitVec 32) List!27085) Bool)

(assert (=> b!1231059 (= e!698764 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27081 (select (arr!38299 a!3806) from!3184) Nil!27082)))))

(declare-fun b!1231060 () Bool)

(declare-fun res!818760 () Bool)

(assert (=> b!1231060 (=> res!818760 e!698762)))

(declare-fun noDuplicate!1737 (List!27085) Bool)

(assert (=> b!1231060 (= res!818760 (not (noDuplicate!1737 lt!559730)))))

(declare-fun b!1231061 () Bool)

(declare-fun res!818759 () Bool)

(assert (=> b!1231061 (=> (not res!818759) (not e!698763))))

(declare-fun acc!823 () List!27085)

(assert (=> b!1231061 (= res!818759 (noDuplicate!1737 acc!823))))

(declare-fun b!1231062 () Bool)

(assert (=> b!1231062 (= e!698762 true)))

(declare-fun lt!559729 () Bool)

(assert (=> b!1231062 (= lt!559729 (contains!7156 lt!559730 (select (arr!38299 a!3806) from!3184)))))

(declare-fun b!1231063 () Bool)

(declare-fun res!818751 () Bool)

(assert (=> b!1231063 (=> (not res!818751) (not e!698763))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231063 (= res!818751 (validKeyInArray!0 (select (arr!38299 a!3806) from!3184)))))

(declare-fun b!1231064 () Bool)

(declare-fun res!818750 () Bool)

(assert (=> b!1231064 (=> (not res!818750) (not e!698763))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231064 (= res!818750 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!818758 () Bool)

(assert (=> start!102400 (=> (not res!818758) (not e!698763))))

(assert (=> start!102400 (= res!818758 (bvslt (size!38836 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102400 e!698763))

(declare-fun array_inv!29237 (array!79371) Bool)

(assert (=> start!102400 (array_inv!29237 a!3806)))

(assert (=> start!102400 true))

(declare-fun b!1231065 () Bool)

(declare-fun res!818754 () Bool)

(assert (=> b!1231065 (=> (not res!818754) (not e!698763))))

(assert (=> b!1231065 (= res!818754 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231066 () Bool)

(declare-fun res!818749 () Bool)

(assert (=> b!1231066 (=> (not res!818749) (not e!698763))))

(assert (=> b!1231066 (= res!818749 (validKeyInArray!0 k!2913))))

(declare-fun b!1231067 () Bool)

(declare-fun res!818752 () Bool)

(assert (=> b!1231067 (=> (not res!818752) (not e!698763))))

(assert (=> b!1231067 (= res!818752 (not (contains!7156 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231068 () Bool)

(declare-fun res!818761 () Bool)

(assert (=> b!1231068 (=> (not res!818761) (not e!698763))))

(assert (=> b!1231068 (= res!818761 (not (contains!7156 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231069 () Bool)

(assert (=> b!1231069 (= e!698763 (not e!698762))))

(declare-fun res!818755 () Bool)

(assert (=> b!1231069 (=> res!818755 e!698762)))

(assert (=> b!1231069 (= res!818755 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1231069 (= lt!559730 (Cons!27081 (select (arr!38299 a!3806) from!3184) Nil!27082))))

(assert (=> b!1231069 e!698764))

(declare-fun res!818757 () Bool)

(assert (=> b!1231069 (=> (not res!818757) (not e!698764))))

(assert (=> b!1231069 (= res!818757 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27082))))

(declare-datatypes ((Unit!40713 0))(
  ( (Unit!40714) )
))
(declare-fun lt!559731 () Unit!40713)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79371 List!27085 List!27085 (_ BitVec 32)) Unit!40713)

(assert (=> b!1231069 (= lt!559731 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27082 from!3184))))

(assert (=> b!1231069 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27081 (select (arr!38299 a!3806) from!3184) acc!823))))

(assert (= (and start!102400 res!818758) b!1231066))

(assert (= (and b!1231066 res!818749) b!1231058))

(assert (= (and b!1231058 res!818753) b!1231061))

(assert (= (and b!1231061 res!818759) b!1231067))

(assert (= (and b!1231067 res!818752) b!1231068))

(assert (= (and b!1231068 res!818761) b!1231064))

(assert (= (and b!1231064 res!818750) b!1231065))

(assert (= (and b!1231065 res!818754) b!1231063))

(assert (= (and b!1231063 res!818751) b!1231069))

(assert (= (and b!1231069 res!818757) b!1231059))

(assert (= (and b!1231069 (not res!818755)) b!1231060))

(assert (= (and b!1231060 (not res!818760)) b!1231056))

(assert (= (and b!1231056 (not res!818756)) b!1231057))

(assert (= (and b!1231057 (not res!818762)) b!1231062))

(declare-fun m!1135889 () Bool)

(assert (=> b!1231067 m!1135889))

(declare-fun m!1135891 () Bool)

(assert (=> b!1231063 m!1135891))

(assert (=> b!1231063 m!1135891))

(declare-fun m!1135893 () Bool)

(assert (=> b!1231063 m!1135893))

(declare-fun m!1135895 () Bool)

(assert (=> b!1231066 m!1135895))

(declare-fun m!1135897 () Bool)

(assert (=> b!1231068 m!1135897))

(assert (=> b!1231062 m!1135891))

(assert (=> b!1231062 m!1135891))

(declare-fun m!1135899 () Bool)

(assert (=> b!1231062 m!1135899))

(declare-fun m!1135901 () Bool)

(assert (=> b!1231065 m!1135901))

(declare-fun m!1135903 () Bool)

(assert (=> b!1231056 m!1135903))

(assert (=> b!1231059 m!1135891))

(declare-fun m!1135905 () Bool)

(assert (=> b!1231059 m!1135905))

(assert (=> b!1231069 m!1135891))

(declare-fun m!1135907 () Bool)

(assert (=> b!1231069 m!1135907))

(declare-fun m!1135909 () Bool)

(assert (=> b!1231069 m!1135909))

(declare-fun m!1135911 () Bool)

(assert (=> b!1231069 m!1135911))

(declare-fun m!1135913 () Bool)

(assert (=> b!1231061 m!1135913))

(declare-fun m!1135915 () Bool)

(assert (=> b!1231057 m!1135915))

(declare-fun m!1135917 () Bool)

(assert (=> b!1231060 m!1135917))

(declare-fun m!1135919 () Bool)

(assert (=> b!1231064 m!1135919))

(declare-fun m!1135921 () Bool)

(assert (=> start!102400 m!1135921))

(push 1)

(assert (not b!1231069))

(assert (not b!1231061))

(assert (not b!1231066))

(assert (not b!1231062))

(assert (not b!1231068))

(assert (not b!1231060))

(assert (not start!102400))

(assert (not b!1231063))

(assert (not b!1231064))

(assert (not b!1231056))

(assert (not b!1231065))

(assert (not b!1231059))

(assert (not b!1231057))

(assert (not b!1231067))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

