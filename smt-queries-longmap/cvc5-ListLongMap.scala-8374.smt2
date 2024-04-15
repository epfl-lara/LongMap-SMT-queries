; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101846 () Bool)

(assert start!101846)

(declare-fun b!1226564 () Bool)

(declare-fun res!815262 () Bool)

(declare-fun e!696557 () Bool)

(assert (=> b!1226564 (=> (not res!815262) (not e!696557))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79112 0))(
  ( (array!79113 (arr!38182 (Array (_ BitVec 32) (_ BitVec 64))) (size!38720 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79112)

(assert (=> b!1226564 (= res!815262 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38720 a!3806)) (bvslt from!3184 (size!38720 a!3806))))))

(declare-fun res!815260 () Bool)

(assert (=> start!101846 (=> (not res!815260) (not e!696557))))

(assert (=> start!101846 (= res!815260 (bvslt (size!38720 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101846 e!696557))

(declare-fun array_inv!29165 (array!79112) Bool)

(assert (=> start!101846 (array_inv!29165 a!3806)))

(assert (=> start!101846 true))

(declare-fun b!1226565 () Bool)

(declare-fun res!815261 () Bool)

(assert (=> b!1226565 (=> (not res!815261) (not e!696557))))

(declare-datatypes ((List!27056 0))(
  ( (Nil!27053) (Cons!27052 (h!28261 (_ BitVec 64)) (t!40510 List!27056)) )
))
(declare-fun acc!823 () List!27056)

(declare-fun noDuplicate!1671 (List!27056) Bool)

(assert (=> b!1226565 (= res!815261 (noDuplicate!1671 acc!823))))

(declare-fun b!1226566 () Bool)

(declare-fun res!815264 () Bool)

(assert (=> b!1226566 (=> (not res!815264) (not e!696557))))

(declare-fun contains!7028 (List!27056 (_ BitVec 64)) Bool)

(assert (=> b!1226566 (= res!815264 (not (contains!7028 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226567 () Bool)

(assert (=> b!1226567 (= e!696557 false)))

(declare-fun lt!558665 () Bool)

(assert (=> b!1226567 (= lt!558665 (contains!7028 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226568 () Bool)

(declare-fun res!815263 () Bool)

(assert (=> b!1226568 (=> (not res!815263) (not e!696557))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226568 (= res!815263 (validKeyInArray!0 k!2913))))

(assert (= (and start!101846 res!815260) b!1226568))

(assert (= (and b!1226568 res!815263) b!1226564))

(assert (= (and b!1226564 res!815262) b!1226565))

(assert (= (and b!1226565 res!815261) b!1226566))

(assert (= (and b!1226566 res!815264) b!1226567))

(declare-fun m!1131125 () Bool)

(assert (=> b!1226567 m!1131125))

(declare-fun m!1131127 () Bool)

(assert (=> b!1226568 m!1131127))

(declare-fun m!1131129 () Bool)

(assert (=> b!1226565 m!1131129))

(declare-fun m!1131131 () Bool)

(assert (=> b!1226566 m!1131131))

(declare-fun m!1131133 () Bool)

(assert (=> start!101846 m!1131133))

(push 1)

(assert (not b!1226566))

(assert (not b!1226565))

(assert (not b!1226567))

(assert (not b!1226568))

(assert (not start!101846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

