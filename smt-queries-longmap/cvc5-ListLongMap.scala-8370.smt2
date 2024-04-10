; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101824 () Bool)

(assert start!101824)

(declare-fun b!1226445 () Bool)

(declare-fun res!815093 () Bool)

(declare-fun e!696542 () Bool)

(assert (=> b!1226445 (=> (not res!815093) (not e!696542))))

(declare-datatypes ((List!26980 0))(
  ( (Nil!26977) (Cons!26976 (h!28185 (_ BitVec 64)) (t!40443 List!26980)) )
))
(declare-fun acc!823 () List!26980)

(declare-fun contains!7042 (List!26980 (_ BitVec 64)) Bool)

(assert (=> b!1226445 (= res!815093 (not (contains!7042 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226446 () Bool)

(assert (=> b!1226446 (= e!696542 false)))

(declare-fun lt!558813 () Bool)

(assert (=> b!1226446 (= lt!558813 (contains!7042 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226447 () Bool)

(declare-fun res!815096 () Bool)

(assert (=> b!1226447 (=> (not res!815096) (not e!696542))))

(declare-fun noDuplicate!1639 (List!26980) Bool)

(assert (=> b!1226447 (= res!815096 (noDuplicate!1639 acc!823))))

(declare-fun res!815095 () Bool)

(assert (=> start!101824 (=> (not res!815095) (not e!696542))))

(declare-datatypes ((array!79163 0))(
  ( (array!79164 (arr!38207 (Array (_ BitVec 32) (_ BitVec 64))) (size!38743 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79163)

(assert (=> start!101824 (= res!815095 (bvslt (size!38743 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101824 e!696542))

(declare-fun array_inv!29055 (array!79163) Bool)

(assert (=> start!101824 (array_inv!29055 a!3806)))

(assert (=> start!101824 true))

(declare-fun b!1226448 () Bool)

(declare-fun res!815097 () Bool)

(assert (=> b!1226448 (=> (not res!815097) (not e!696542))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226448 (= res!815097 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38743 a!3806)) (bvslt from!3184 (size!38743 a!3806))))))

(declare-fun b!1226449 () Bool)

(declare-fun res!815094 () Bool)

(assert (=> b!1226449 (=> (not res!815094) (not e!696542))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226449 (= res!815094 (validKeyInArray!0 k!2913))))

(assert (= (and start!101824 res!815095) b!1226449))

(assert (= (and b!1226449 res!815094) b!1226448))

(assert (= (and b!1226448 res!815097) b!1226447))

(assert (= (and b!1226447 res!815096) b!1226445))

(assert (= (and b!1226445 res!815093) b!1226446))

(declare-fun m!1131543 () Bool)

(assert (=> start!101824 m!1131543))

(declare-fun m!1131545 () Bool)

(assert (=> b!1226449 m!1131545))

(declare-fun m!1131547 () Bool)

(assert (=> b!1226447 m!1131547))

(declare-fun m!1131549 () Bool)

(assert (=> b!1226445 m!1131549))

(declare-fun m!1131551 () Bool)

(assert (=> b!1226446 m!1131551))

(push 1)

(assert (not b!1226447))

(assert (not start!101824))

(assert (not b!1226449))

(assert (not b!1226446))

(assert (not b!1226445))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

