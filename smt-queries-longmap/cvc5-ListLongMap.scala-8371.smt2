; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101828 () Bool)

(assert start!101828)

(declare-fun b!1226411 () Bool)

(declare-fun res!815108 () Bool)

(declare-fun e!696502 () Bool)

(assert (=> b!1226411 (=> (not res!815108) (not e!696502))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79094 0))(
  ( (array!79095 (arr!38173 (Array (_ BitVec 32) (_ BitVec 64))) (size!38711 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79094)

(assert (=> b!1226411 (= res!815108 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38711 a!3806)) (bvslt from!3184 (size!38711 a!3806))))))

(declare-fun b!1226412 () Bool)

(declare-fun res!815109 () Bool)

(assert (=> b!1226412 (=> (not res!815109) (not e!696502))))

(declare-datatypes ((List!27047 0))(
  ( (Nil!27044) (Cons!27043 (h!28252 (_ BitVec 64)) (t!40501 List!27047)) )
))
(declare-fun acc!823 () List!27047)

(declare-fun noDuplicate!1662 (List!27047) Bool)

(assert (=> b!1226412 (= res!815109 (noDuplicate!1662 acc!823))))

(declare-fun b!1226413 () Bool)

(assert (=> b!1226413 (= e!696502 false)))

(declare-fun lt!558647 () Bool)

(declare-fun contains!7019 (List!27047 (_ BitVec 64)) Bool)

(assert (=> b!1226413 (= lt!558647 (contains!7019 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226415 () Bool)

(declare-fun res!815111 () Bool)

(assert (=> b!1226415 (=> (not res!815111) (not e!696502))))

(assert (=> b!1226415 (= res!815111 (not (contains!7019 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226414 () Bool)

(declare-fun res!815110 () Bool)

(assert (=> b!1226414 (=> (not res!815110) (not e!696502))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226414 (= res!815110 (validKeyInArray!0 k!2913))))

(declare-fun res!815107 () Bool)

(assert (=> start!101828 (=> (not res!815107) (not e!696502))))

(assert (=> start!101828 (= res!815107 (bvslt (size!38711 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101828 e!696502))

(declare-fun array_inv!29156 (array!79094) Bool)

(assert (=> start!101828 (array_inv!29156 a!3806)))

(assert (=> start!101828 true))

(assert (= (and start!101828 res!815107) b!1226414))

(assert (= (and b!1226414 res!815110) b!1226411))

(assert (= (and b!1226411 res!815108) b!1226412))

(assert (= (and b!1226412 res!815109) b!1226415))

(assert (= (and b!1226415 res!815111) b!1226413))

(declare-fun m!1131029 () Bool)

(assert (=> b!1226412 m!1131029))

(declare-fun m!1131031 () Bool)

(assert (=> b!1226413 m!1131031))

(declare-fun m!1131033 () Bool)

(assert (=> b!1226415 m!1131033))

(declare-fun m!1131035 () Bool)

(assert (=> b!1226414 m!1131035))

(declare-fun m!1131037 () Bool)

(assert (=> start!101828 m!1131037))

(push 1)

(assert (not b!1226412))

(assert (not b!1226413))

(assert (not start!101828))

(assert (not b!1226414))

(assert (not b!1226415))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

