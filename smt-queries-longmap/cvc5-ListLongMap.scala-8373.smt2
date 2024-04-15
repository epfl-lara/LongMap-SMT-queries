; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101840 () Bool)

(assert start!101840)

(declare-fun res!815219 () Bool)

(declare-fun e!696539 () Bool)

(assert (=> start!101840 (=> (not res!815219) (not e!696539))))

(declare-datatypes ((array!79106 0))(
  ( (array!79107 (arr!38179 (Array (_ BitVec 32) (_ BitVec 64))) (size!38717 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79106)

(assert (=> start!101840 (= res!815219 (bvslt (size!38717 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101840 e!696539))

(declare-fun array_inv!29162 (array!79106) Bool)

(assert (=> start!101840 (array_inv!29162 a!3806)))

(assert (=> start!101840 true))

(declare-fun b!1226519 () Bool)

(declare-fun res!815216 () Bool)

(assert (=> b!1226519 (=> (not res!815216) (not e!696539))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226519 (= res!815216 (validKeyInArray!0 k!2913))))

(declare-fun b!1226520 () Bool)

(declare-fun res!815217 () Bool)

(assert (=> b!1226520 (=> (not res!815217) (not e!696539))))

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1226520 (= res!815217 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38717 a!3806)) (bvslt from!3184 (size!38717 a!3806))))))

(declare-fun b!1226521 () Bool)

(declare-fun res!815218 () Bool)

(assert (=> b!1226521 (=> (not res!815218) (not e!696539))))

(declare-datatypes ((List!27053 0))(
  ( (Nil!27050) (Cons!27049 (h!28258 (_ BitVec 64)) (t!40507 List!27053)) )
))
(declare-fun acc!823 () List!27053)

(declare-fun noDuplicate!1668 (List!27053) Bool)

(assert (=> b!1226521 (= res!815218 (noDuplicate!1668 acc!823))))

(declare-fun b!1226522 () Bool)

(assert (=> b!1226522 (= e!696539 false)))

(declare-fun lt!558656 () Bool)

(declare-fun contains!7025 (List!27053 (_ BitVec 64)) Bool)

(assert (=> b!1226522 (= lt!558656 (contains!7025 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226523 () Bool)

(declare-fun res!815215 () Bool)

(assert (=> b!1226523 (=> (not res!815215) (not e!696539))))

(assert (=> b!1226523 (= res!815215 (not (contains!7025 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101840 res!815219) b!1226519))

(assert (= (and b!1226519 res!815216) b!1226520))

(assert (= (and b!1226520 res!815217) b!1226521))

(assert (= (and b!1226521 res!815218) b!1226523))

(assert (= (and b!1226523 res!815215) b!1226522))

(declare-fun m!1131095 () Bool)

(assert (=> b!1226522 m!1131095))

(declare-fun m!1131097 () Bool)

(assert (=> b!1226521 m!1131097))

(declare-fun m!1131099 () Bool)

(assert (=> b!1226519 m!1131099))

(declare-fun m!1131101 () Bool)

(assert (=> b!1226523 m!1131101))

(declare-fun m!1131103 () Bool)

(assert (=> start!101840 m!1131103))

(push 1)

(assert (not b!1226519))

(assert (not b!1226523))

(assert (not b!1226522))

(assert (not start!101840))

(assert (not b!1226521))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

