; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101852 () Bool)

(assert start!101852)

(declare-fun b!1226609 () Bool)

(declare-fun res!815308 () Bool)

(declare-fun e!696574 () Bool)

(assert (=> b!1226609 (=> (not res!815308) (not e!696574))))

(declare-datatypes ((List!27059 0))(
  ( (Nil!27056) (Cons!27055 (h!28264 (_ BitVec 64)) (t!40513 List!27059)) )
))
(declare-fun acc!823 () List!27059)

(declare-fun noDuplicate!1674 (List!27059) Bool)

(assert (=> b!1226609 (= res!815308 (noDuplicate!1674 acc!823))))

(declare-fun b!1226610 () Bool)

(declare-fun res!815307 () Bool)

(assert (=> b!1226610 (=> (not res!815307) (not e!696574))))

(declare-fun contains!7031 (List!27059 (_ BitVec 64)) Bool)

(assert (=> b!1226610 (= res!815307 (not (contains!7031 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226611 () Bool)

(declare-fun res!815309 () Bool)

(assert (=> b!1226611 (=> (not res!815309) (not e!696574))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226611 (= res!815309 (validKeyInArray!0 k!2913))))

(declare-fun res!815305 () Bool)

(assert (=> start!101852 (=> (not res!815305) (not e!696574))))

(declare-datatypes ((array!79118 0))(
  ( (array!79119 (arr!38185 (Array (_ BitVec 32) (_ BitVec 64))) (size!38723 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79118)

(assert (=> start!101852 (= res!815305 (bvslt (size!38723 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101852 e!696574))

(declare-fun array_inv!29168 (array!79118) Bool)

(assert (=> start!101852 (array_inv!29168 a!3806)))

(assert (=> start!101852 true))

(declare-fun b!1226612 () Bool)

(assert (=> b!1226612 (= e!696574 false)))

(declare-fun lt!558674 () Bool)

(assert (=> b!1226612 (= lt!558674 (contains!7031 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226613 () Bool)

(declare-fun res!815306 () Bool)

(assert (=> b!1226613 (=> (not res!815306) (not e!696574))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226613 (= res!815306 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38723 a!3806)) (bvslt from!3184 (size!38723 a!3806))))))

(assert (= (and start!101852 res!815305) b!1226611))

(assert (= (and b!1226611 res!815309) b!1226613))

(assert (= (and b!1226613 res!815306) b!1226609))

(assert (= (and b!1226609 res!815308) b!1226610))

(assert (= (and b!1226610 res!815307) b!1226612))

(declare-fun m!1131155 () Bool)

(assert (=> b!1226612 m!1131155))

(declare-fun m!1131157 () Bool)

(assert (=> b!1226611 m!1131157))

(declare-fun m!1131159 () Bool)

(assert (=> b!1226610 m!1131159))

(declare-fun m!1131161 () Bool)

(assert (=> b!1226609 m!1131161))

(declare-fun m!1131163 () Bool)

(assert (=> start!101852 m!1131163))

(push 1)

(assert (not b!1226612))

(assert (not b!1226611))

(assert (not b!1226609))

(assert (not b!1226610))

(assert (not start!101852))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

