; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101834 () Bool)

(assert start!101834)

(declare-fun b!1226520 () Bool)

(declare-fun e!696572 () Bool)

(assert (=> b!1226520 (= e!696572 false)))

(declare-fun lt!558828 () Bool)

(declare-datatypes ((List!26985 0))(
  ( (Nil!26982) (Cons!26981 (h!28190 (_ BitVec 64)) (t!40448 List!26985)) )
))
(declare-fun acc!823 () List!26985)

(declare-fun contains!7047 (List!26985 (_ BitVec 64)) Bool)

(assert (=> b!1226520 (= lt!558828 (contains!7047 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226521 () Bool)

(declare-fun res!815170 () Bool)

(assert (=> b!1226521 (=> (not res!815170) (not e!696572))))

(assert (=> b!1226521 (= res!815170 (not (contains!7047 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226522 () Bool)

(declare-fun res!815169 () Bool)

(assert (=> b!1226522 (=> (not res!815169) (not e!696572))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79173 0))(
  ( (array!79174 (arr!38212 (Array (_ BitVec 32) (_ BitVec 64))) (size!38748 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79173)

(assert (=> b!1226522 (= res!815169 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38748 a!3806)) (bvslt from!3184 (size!38748 a!3806))))))

(declare-fun b!1226523 () Bool)

(declare-fun res!815168 () Bool)

(assert (=> b!1226523 (=> (not res!815168) (not e!696572))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226523 (= res!815168 (validKeyInArray!0 k!2913))))

(declare-fun b!1226524 () Bool)

(declare-fun res!815172 () Bool)

(assert (=> b!1226524 (=> (not res!815172) (not e!696572))))

(declare-fun noDuplicate!1644 (List!26985) Bool)

(assert (=> b!1226524 (= res!815172 (noDuplicate!1644 acc!823))))

(declare-fun res!815171 () Bool)

(assert (=> start!101834 (=> (not res!815171) (not e!696572))))

(assert (=> start!101834 (= res!815171 (bvslt (size!38748 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101834 e!696572))

(declare-fun array_inv!29060 (array!79173) Bool)

(assert (=> start!101834 (array_inv!29060 a!3806)))

(assert (=> start!101834 true))

(assert (= (and start!101834 res!815171) b!1226523))

(assert (= (and b!1226523 res!815168) b!1226522))

(assert (= (and b!1226522 res!815169) b!1226524))

(assert (= (and b!1226524 res!815172) b!1226521))

(assert (= (and b!1226521 res!815170) b!1226520))

(declare-fun m!1131593 () Bool)

(assert (=> b!1226523 m!1131593))

(declare-fun m!1131595 () Bool)

(assert (=> b!1226524 m!1131595))

(declare-fun m!1131597 () Bool)

(assert (=> b!1226521 m!1131597))

(declare-fun m!1131599 () Bool)

(assert (=> b!1226520 m!1131599))

(declare-fun m!1131601 () Bool)

(assert (=> start!101834 m!1131601))

(push 1)

(assert (not b!1226524))

(assert (not b!1226521))

(assert (not start!101834))

(assert (not b!1226523))

(assert (not b!1226520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

