; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101852 () Bool)

(assert start!101852)

(declare-fun b!1226673 () Bool)

(declare-fun res!815321 () Bool)

(declare-fun e!696626 () Bool)

(assert (=> b!1226673 (=> (not res!815321) (not e!696626))))

(declare-datatypes ((List!26994 0))(
  ( (Nil!26991) (Cons!26990 (h!28199 (_ BitVec 64)) (t!40457 List!26994)) )
))
(declare-fun acc!823 () List!26994)

(declare-fun noDuplicate!1653 (List!26994) Bool)

(assert (=> b!1226673 (= res!815321 (noDuplicate!1653 acc!823))))

(declare-fun b!1226674 () Bool)

(assert (=> b!1226674 (= e!696626 false)))

(declare-fun lt!558846 () Bool)

(declare-fun contains!7056 (List!26994 (_ BitVec 64)) Bool)

(assert (=> b!1226674 (= lt!558846 (contains!7056 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226675 () Bool)

(declare-fun res!815323 () Bool)

(assert (=> b!1226675 (=> (not res!815323) (not e!696626))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226675 (= res!815323 (validKeyInArray!0 k!2913))))

(declare-fun b!1226676 () Bool)

(declare-fun res!815322 () Bool)

(assert (=> b!1226676 (=> (not res!815322) (not e!696626))))

(assert (=> b!1226676 (= res!815322 (not (contains!7056 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!815324 () Bool)

(assert (=> start!101852 (=> (not res!815324) (not e!696626))))

(declare-datatypes ((array!79191 0))(
  ( (array!79192 (arr!38221 (Array (_ BitVec 32) (_ BitVec 64))) (size!38757 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79191)

(assert (=> start!101852 (= res!815324 (bvslt (size!38757 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101852 e!696626))

(declare-fun array_inv!29069 (array!79191) Bool)

(assert (=> start!101852 (array_inv!29069 a!3806)))

(assert (=> start!101852 true))

(declare-fun b!1226677 () Bool)

(declare-fun res!815325 () Bool)

(assert (=> b!1226677 (=> (not res!815325) (not e!696626))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226677 (= res!815325 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38757 a!3806)) (bvslt from!3184 (size!38757 a!3806))))))

(assert (= (and start!101852 res!815324) b!1226675))

(assert (= (and b!1226675 res!815323) b!1226677))

(assert (= (and b!1226677 res!815325) b!1226673))

(assert (= (and b!1226673 res!815321) b!1226676))

(assert (= (and b!1226676 res!815322) b!1226674))

(declare-fun m!1131689 () Bool)

(assert (=> b!1226674 m!1131689))

(declare-fun m!1131691 () Bool)

(assert (=> b!1226676 m!1131691))

(declare-fun m!1131693 () Bool)

(assert (=> b!1226675 m!1131693))

(declare-fun m!1131695 () Bool)

(assert (=> start!101852 m!1131695))

(declare-fun m!1131697 () Bool)

(assert (=> b!1226673 m!1131697))

(push 1)

(assert (not b!1226674))

(assert (not start!101852))

(assert (not b!1226673))

(assert (not b!1226675))

(assert (not b!1226676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

