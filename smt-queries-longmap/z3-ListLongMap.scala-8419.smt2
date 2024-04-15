; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102448 () Bool)

(assert start!102448)

(declare-fun b!1232244 () Bool)

(declare-fun e!698920 () Bool)

(assert (=> b!1232244 (= e!698920 (not true))))

(declare-fun e!698919 () Bool)

(assert (=> b!1232244 e!698919))

(declare-fun res!820658 () Bool)

(assert (=> b!1232244 (=> (not res!820658) (not e!698919))))

(declare-datatypes ((array!79402 0))(
  ( (array!79403 (arr!38315 (Array (_ BitVec 32) (_ BitVec 64))) (size!38853 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79402)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27189 0))(
  ( (Nil!27186) (Cons!27185 (h!28394 (_ BitVec 64)) (t!40643 List!27189)) )
))
(declare-fun arrayNoDuplicates!0 (array!79402 (_ BitVec 32) List!27189) Bool)

(assert (=> b!1232244 (= res!820658 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27186))))

(declare-datatypes ((Unit!40661 0))(
  ( (Unit!40662) )
))
(declare-fun lt!559331 () Unit!40661)

(declare-fun acc!823 () List!27189)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79402 List!27189 List!27189 (_ BitVec 32)) Unit!40661)

(assert (=> b!1232244 (= lt!559331 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27186 from!3184))))

(assert (=> b!1232244 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27185 (select (arr!38315 a!3806) from!3184) acc!823))))

(declare-fun b!1232245 () Bool)

(declare-fun res!820663 () Bool)

(assert (=> b!1232245 (=> (not res!820663) (not e!698920))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79402 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232245 (= res!820663 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232246 () Bool)

(declare-fun res!820665 () Bool)

(assert (=> b!1232246 (=> (not res!820665) (not e!698920))))

(declare-fun contains!7161 (List!27189 (_ BitVec 64)) Bool)

(assert (=> b!1232246 (= res!820665 (not (contains!7161 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232247 () Bool)

(declare-fun res!820660 () Bool)

(assert (=> b!1232247 (=> (not res!820660) (not e!698920))))

(assert (=> b!1232247 (= res!820660 (not (contains!7161 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232248 () Bool)

(declare-fun res!820664 () Bool)

(assert (=> b!1232248 (=> (not res!820664) (not e!698920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232248 (= res!820664 (validKeyInArray!0 (select (arr!38315 a!3806) from!3184)))))

(declare-fun b!1232249 () Bool)

(declare-fun res!820662 () Bool)

(assert (=> b!1232249 (=> (not res!820662) (not e!698920))))

(declare-fun noDuplicate!1804 (List!27189) Bool)

(assert (=> b!1232249 (= res!820662 (noDuplicate!1804 acc!823))))

(declare-fun b!1232250 () Bool)

(declare-fun res!820661 () Bool)

(assert (=> b!1232250 (=> (not res!820661) (not e!698920))))

(assert (=> b!1232250 (= res!820661 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232251 () Bool)

(assert (=> b!1232251 (= e!698919 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27185 (select (arr!38315 a!3806) from!3184) Nil!27186)))))

(declare-fun b!1232252 () Bool)

(declare-fun res!820666 () Bool)

(assert (=> b!1232252 (=> (not res!820666) (not e!698920))))

(assert (=> b!1232252 (= res!820666 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38853 a!3806)) (bvslt from!3184 (size!38853 a!3806))))))

(declare-fun b!1232253 () Bool)

(declare-fun res!820667 () Bool)

(assert (=> b!1232253 (=> (not res!820667) (not e!698920))))

(assert (=> b!1232253 (= res!820667 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!820659 () Bool)

(assert (=> start!102448 (=> (not res!820659) (not e!698920))))

(assert (=> start!102448 (= res!820659 (bvslt (size!38853 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102448 e!698920))

(declare-fun array_inv!29298 (array!79402) Bool)

(assert (=> start!102448 (array_inv!29298 a!3806)))

(assert (=> start!102448 true))

(assert (= (and start!102448 res!820659) b!1232250))

(assert (= (and b!1232250 res!820661) b!1232252))

(assert (= (and b!1232252 res!820666) b!1232249))

(assert (= (and b!1232249 res!820662) b!1232247))

(assert (= (and b!1232247 res!820660) b!1232246))

(assert (= (and b!1232246 res!820665) b!1232245))

(assert (= (and b!1232245 res!820663) b!1232253))

(assert (= (and b!1232253 res!820667) b!1232248))

(assert (= (and b!1232248 res!820664) b!1232244))

(assert (= (and b!1232244 res!820658) b!1232251))

(declare-fun m!1135821 () Bool)

(assert (=> start!102448 m!1135821))

(declare-fun m!1135823 () Bool)

(assert (=> b!1232247 m!1135823))

(declare-fun m!1135825 () Bool)

(assert (=> b!1232245 m!1135825))

(declare-fun m!1135827 () Bool)

(assert (=> b!1232248 m!1135827))

(assert (=> b!1232248 m!1135827))

(declare-fun m!1135829 () Bool)

(assert (=> b!1232248 m!1135829))

(declare-fun m!1135831 () Bool)

(assert (=> b!1232253 m!1135831))

(declare-fun m!1135833 () Bool)

(assert (=> b!1232246 m!1135833))

(declare-fun m!1135835 () Bool)

(assert (=> b!1232244 m!1135835))

(declare-fun m!1135837 () Bool)

(assert (=> b!1232244 m!1135837))

(assert (=> b!1232244 m!1135827))

(declare-fun m!1135839 () Bool)

(assert (=> b!1232244 m!1135839))

(declare-fun m!1135841 () Bool)

(assert (=> b!1232249 m!1135841))

(assert (=> b!1232251 m!1135827))

(declare-fun m!1135843 () Bool)

(assert (=> b!1232251 m!1135843))

(declare-fun m!1135845 () Bool)

(assert (=> b!1232250 m!1135845))

(check-sat (not b!1232249) (not start!102448) (not b!1232250) (not b!1232248) (not b!1232251) (not b!1232245) (not b!1232244) (not b!1232253) (not b!1232246) (not b!1232247))
(check-sat)
