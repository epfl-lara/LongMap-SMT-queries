; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102658 () Bool)

(assert start!102658)

(declare-fun b!1234061 () Bool)

(declare-fun res!822243 () Bool)

(declare-fun e!699956 () Bool)

(assert (=> b!1234061 (=> (not res!822243) (not e!699956))))

(declare-datatypes ((List!27156 0))(
  ( (Nil!27153) (Cons!27152 (h!28361 (_ BitVec 64)) (t!40619 List!27156)) )
))
(declare-fun acc!823 () List!27156)

(declare-fun contains!7218 (List!27156 (_ BitVec 64)) Bool)

(assert (=> b!1234061 (= res!822243 (not (contains!7218 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234062 () Bool)

(declare-fun res!822246 () Bool)

(assert (=> b!1234062 (=> (not res!822246) (not e!699956))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79548 0))(
  ( (array!79549 (arr!38383 (Array (_ BitVec 32) (_ BitVec 64))) (size!38919 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79548)

(assert (=> b!1234062 (= res!822246 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38919 a!3806)) (bvslt from!3184 (size!38919 a!3806))))))

(declare-fun b!1234063 () Bool)

(declare-fun res!822242 () Bool)

(assert (=> b!1234063 (=> (not res!822242) (not e!699956))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234063 (= res!822242 (validKeyInArray!0 k!2913))))

(declare-fun b!1234064 () Bool)

(declare-fun res!822241 () Bool)

(assert (=> b!1234064 (=> (not res!822241) (not e!699956))))

(declare-fun noDuplicate!1815 (List!27156) Bool)

(assert (=> b!1234064 (= res!822241 (noDuplicate!1815 acc!823))))

(declare-fun b!1234065 () Bool)

(assert (=> b!1234065 (= e!699956 false)))

(declare-fun lt!559796 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79548 (_ BitVec 32) List!27156) Bool)

(assert (=> b!1234065 (= lt!559796 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!822245 () Bool)

(assert (=> start!102658 (=> (not res!822245) (not e!699956))))

(assert (=> start!102658 (= res!822245 (bvslt (size!38919 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102658 e!699956))

(declare-fun array_inv!29231 (array!79548) Bool)

(assert (=> start!102658 (array_inv!29231 a!3806)))

(assert (=> start!102658 true))

(declare-fun b!1234066 () Bool)

(declare-fun res!822247 () Bool)

(assert (=> b!1234066 (=> (not res!822247) (not e!699956))))

(assert (=> b!1234066 (= res!822247 (not (contains!7218 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234067 () Bool)

(declare-fun res!822244 () Bool)

(assert (=> b!1234067 (=> (not res!822244) (not e!699956))))

(declare-fun arrayContainsKey!0 (array!79548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234067 (= res!822244 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(assert (= (and start!102658 res!822245) b!1234063))

(assert (= (and b!1234063 res!822242) b!1234062))

(assert (= (and b!1234062 res!822246) b!1234064))

(assert (= (and b!1234064 res!822241) b!1234066))

(assert (= (and b!1234066 res!822247) b!1234061))

(assert (= (and b!1234061 res!822243) b!1234067))

(assert (= (and b!1234067 res!822244) b!1234065))

(declare-fun m!1138109 () Bool)

(assert (=> b!1234065 m!1138109))

(declare-fun m!1138111 () Bool)

(assert (=> b!1234063 m!1138111))

(declare-fun m!1138113 () Bool)

(assert (=> b!1234061 m!1138113))

(declare-fun m!1138115 () Bool)

(assert (=> b!1234066 m!1138115))

(declare-fun m!1138117 () Bool)

(assert (=> b!1234067 m!1138117))

(declare-fun m!1138119 () Bool)

(assert (=> start!102658 m!1138119))

(declare-fun m!1138121 () Bool)

(assert (=> b!1234064 m!1138121))

(push 1)

(assert (not b!1234065))

(assert (not b!1234064))

(assert (not b!1234063))

(assert (not b!1234067))

(assert (not start!102658))

(assert (not b!1234066))

(assert (not b!1234061))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

