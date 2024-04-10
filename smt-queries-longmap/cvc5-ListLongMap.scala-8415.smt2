; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102426 () Bool)

(assert start!102426)

(declare-fun b!1231952 () Bool)

(declare-fun res!820334 () Bool)

(declare-fun e!698846 () Bool)

(assert (=> b!1231952 (=> (not res!820334) (not e!698846))))

(declare-datatypes ((array!79457 0))(
  ( (array!79458 (arr!38342 (Array (_ BitVec 32) (_ BitVec 64))) (size!38878 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79457)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1231952 (= res!820334 (validKeyInArray!0 (select (arr!38342 a!3806) from!3184)))))

(declare-fun b!1231953 () Bool)

(declare-fun res!820331 () Bool)

(assert (=> b!1231953 (=> (not res!820331) (not e!698846))))

(declare-datatypes ((List!27115 0))(
  ( (Nil!27112) (Cons!27111 (h!28320 (_ BitVec 64)) (t!40578 List!27115)) )
))
(declare-fun acc!823 () List!27115)

(declare-fun arrayNoDuplicates!0 (array!79457 (_ BitVec 32) List!27115) Bool)

(assert (=> b!1231953 (= res!820331 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1231954 () Bool)

(declare-fun res!820338 () Bool)

(assert (=> b!1231954 (=> (not res!820338) (not e!698846))))

(declare-fun contains!7177 (List!27115 (_ BitVec 64)) Bool)

(assert (=> b!1231954 (= res!820338 (not (contains!7177 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1231955 () Bool)

(declare-fun res!820336 () Bool)

(assert (=> b!1231955 (=> (not res!820336) (not e!698846))))

(assert (=> b!1231955 (= res!820336 (not (contains!7177 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820339 () Bool)

(assert (=> start!102426 (=> (not res!820339) (not e!698846))))

(assert (=> start!102426 (= res!820339 (bvslt (size!38878 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102426 e!698846))

(declare-fun array_inv!29190 (array!79457) Bool)

(assert (=> start!102426 (array_inv!29190 a!3806)))

(assert (=> start!102426 true))

(declare-fun b!1231956 () Bool)

(declare-fun res!820330 () Bool)

(assert (=> b!1231956 (=> (not res!820330) (not e!698846))))

(declare-fun noDuplicate!1774 (List!27115) Bool)

(assert (=> b!1231956 (= res!820330 (noDuplicate!1774 acc!823))))

(declare-fun b!1231957 () Bool)

(declare-fun e!698845 () Bool)

(assert (=> b!1231957 (= e!698845 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27111 (select (arr!38342 a!3806) from!3184) Nil!27112)))))

(declare-fun b!1231958 () Bool)

(declare-fun res!820332 () Bool)

(assert (=> b!1231958 (=> (not res!820332) (not e!698846))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1231958 (= res!820332 (validKeyInArray!0 k!2913))))

(declare-fun b!1231959 () Bool)

(declare-fun res!820337 () Bool)

(assert (=> b!1231959 (=> (not res!820337) (not e!698846))))

(declare-fun arrayContainsKey!0 (array!79457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1231959 (= res!820337 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1231960 () Bool)

(assert (=> b!1231960 (= e!698846 (not true))))

(assert (=> b!1231960 e!698845))

(declare-fun res!820335 () Bool)

(assert (=> b!1231960 (=> (not res!820335) (not e!698845))))

(assert (=> b!1231960 (= res!820335 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27112))))

(declare-datatypes ((Unit!40790 0))(
  ( (Unit!40791) )
))
(declare-fun lt!559469 () Unit!40790)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79457 List!27115 List!27115 (_ BitVec 32)) Unit!40790)

(assert (=> b!1231960 (= lt!559469 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27112 from!3184))))

(assert (=> b!1231960 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27111 (select (arr!38342 a!3806) from!3184) acc!823))))

(declare-fun b!1231961 () Bool)

(declare-fun res!820333 () Bool)

(assert (=> b!1231961 (=> (not res!820333) (not e!698846))))

(assert (=> b!1231961 (= res!820333 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38878 a!3806)) (bvslt from!3184 (size!38878 a!3806))))))

(assert (= (and start!102426 res!820339) b!1231958))

(assert (= (and b!1231958 res!820332) b!1231961))

(assert (= (and b!1231961 res!820333) b!1231956))

(assert (= (and b!1231956 res!820330) b!1231955))

(assert (= (and b!1231955 res!820336) b!1231954))

(assert (= (and b!1231954 res!820338) b!1231959))

(assert (= (and b!1231959 res!820337) b!1231953))

(assert (= (and b!1231953 res!820331) b!1231952))

(assert (= (and b!1231952 res!820334) b!1231960))

(assert (= (and b!1231960 res!820335) b!1231957))

(declare-fun m!1136005 () Bool)

(assert (=> b!1231955 m!1136005))

(declare-fun m!1136007 () Bool)

(assert (=> b!1231956 m!1136007))

(declare-fun m!1136009 () Bool)

(assert (=> b!1231959 m!1136009))

(declare-fun m!1136011 () Bool)

(assert (=> b!1231954 m!1136011))

(declare-fun m!1136013 () Bool)

(assert (=> b!1231958 m!1136013))

(declare-fun m!1136015 () Bool)

(assert (=> b!1231960 m!1136015))

(declare-fun m!1136017 () Bool)

(assert (=> b!1231960 m!1136017))

(declare-fun m!1136019 () Bool)

(assert (=> b!1231960 m!1136019))

(declare-fun m!1136021 () Bool)

(assert (=> b!1231960 m!1136021))

(assert (=> b!1231952 m!1136019))

(assert (=> b!1231952 m!1136019))

(declare-fun m!1136023 () Bool)

(assert (=> b!1231952 m!1136023))

(declare-fun m!1136025 () Bool)

(assert (=> start!102426 m!1136025))

(assert (=> b!1231957 m!1136019))

(declare-fun m!1136027 () Bool)

(assert (=> b!1231957 m!1136027))

(declare-fun m!1136029 () Bool)

(assert (=> b!1231953 m!1136029))

(push 1)

(assert (not b!1231953))

(assert (not start!102426))

(assert (not b!1231957))

(assert (not b!1231952))

(assert (not b!1231954))

(assert (not b!1231958))

(assert (not b!1231959))

(assert (not b!1231955))

(assert (not b!1231960))

(assert (not b!1231956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

