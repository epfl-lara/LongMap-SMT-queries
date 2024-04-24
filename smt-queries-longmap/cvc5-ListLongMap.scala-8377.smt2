; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102106 () Bool)

(assert start!102106)

(declare-fun b!1228147 () Bool)

(declare-fun e!697510 () Bool)

(assert (=> b!1228147 (= e!697510 false)))

(declare-datatypes ((List!27028 0))(
  ( (Nil!27025) (Cons!27024 (h!28242 (_ BitVec 64)) (t!40483 List!27028)) )
))
(declare-fun acc!823 () List!27028)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79245 0))(
  ( (array!79246 (arr!38242 (Array (_ BitVec 32) (_ BitVec 64))) (size!38779 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79245)

(declare-fun lt!559344 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79245 (_ BitVec 32) List!27028) Bool)

(assert (=> b!1228147 (= lt!559344 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228148 () Bool)

(declare-fun res!816016 () Bool)

(assert (=> b!1228148 (=> (not res!816016) (not e!697510))))

(declare-fun contains!7099 (List!27028 (_ BitVec 64)) Bool)

(assert (=> b!1228148 (= res!816016 (not (contains!7099 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228149 () Bool)

(declare-fun res!816015 () Bool)

(assert (=> b!1228149 (=> (not res!816015) (not e!697510))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228149 (= res!816015 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!816014 () Bool)

(assert (=> start!102106 (=> (not res!816014) (not e!697510))))

(assert (=> start!102106 (= res!816014 (bvslt (size!38779 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102106 e!697510))

(declare-fun array_inv!29180 (array!79245) Bool)

(assert (=> start!102106 (array_inv!29180 a!3806)))

(assert (=> start!102106 true))

(declare-fun b!1228150 () Bool)

(declare-fun res!816020 () Bool)

(assert (=> b!1228150 (=> (not res!816020) (not e!697510))))

(declare-fun noDuplicate!1680 (List!27028) Bool)

(assert (=> b!1228150 (= res!816020 (noDuplicate!1680 acc!823))))

(declare-fun b!1228151 () Bool)

(declare-fun res!816019 () Bool)

(assert (=> b!1228151 (=> (not res!816019) (not e!697510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228151 (= res!816019 (validKeyInArray!0 k!2913))))

(declare-fun b!1228152 () Bool)

(declare-fun res!816018 () Bool)

(assert (=> b!1228152 (=> (not res!816018) (not e!697510))))

(assert (=> b!1228152 (= res!816018 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38779 a!3806)) (bvslt from!3184 (size!38779 a!3806))))))

(declare-fun b!1228153 () Bool)

(declare-fun res!816017 () Bool)

(assert (=> b!1228153 (=> (not res!816017) (not e!697510))))

(assert (=> b!1228153 (= res!816017 (not (contains!7099 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102106 res!816014) b!1228151))

(assert (= (and b!1228151 res!816019) b!1228152))

(assert (= (and b!1228152 res!816018) b!1228150))

(assert (= (and b!1228150 res!816020) b!1228148))

(assert (= (and b!1228148 res!816016) b!1228153))

(assert (= (and b!1228153 res!816017) b!1228149))

(assert (= (and b!1228149 res!816015) b!1228147))

(declare-fun m!1133401 () Bool)

(assert (=> b!1228149 m!1133401))

(declare-fun m!1133403 () Bool)

(assert (=> b!1228150 m!1133403))

(declare-fun m!1133405 () Bool)

(assert (=> start!102106 m!1133405))

(declare-fun m!1133407 () Bool)

(assert (=> b!1228148 m!1133407))

(declare-fun m!1133409 () Bool)

(assert (=> b!1228151 m!1133409))

(declare-fun m!1133411 () Bool)

(assert (=> b!1228153 m!1133411))

(declare-fun m!1133413 () Bool)

(assert (=> b!1228147 m!1133413))

(push 1)

(assert (not b!1228150))

(assert (not b!1228151))

(assert (not b!1228148))

(assert (not b!1228153))

(assert (not start!102106))

(assert (not b!1228147))

(assert (not b!1228149))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

