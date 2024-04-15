; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101864 () Bool)

(assert start!101864)

(declare-fun b!1226751 () Bool)

(declare-fun res!815452 () Bool)

(declare-fun e!696610 () Bool)

(assert (=> b!1226751 (=> (not res!815452) (not e!696610))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79130 0))(
  ( (array!79131 (arr!38191 (Array (_ BitVec 32) (_ BitVec 64))) (size!38729 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79130)

(assert (=> b!1226751 (= res!815452 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38729 a!3806)) (bvslt from!3184 (size!38729 a!3806))))))

(declare-fun b!1226752 () Bool)

(declare-fun res!815448 () Bool)

(assert (=> b!1226752 (=> (not res!815448) (not e!696610))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226752 (= res!815448 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226753 () Bool)

(declare-fun res!815451 () Bool)

(assert (=> b!1226753 (=> (not res!815451) (not e!696610))))

(declare-datatypes ((List!27065 0))(
  ( (Nil!27062) (Cons!27061 (h!28270 (_ BitVec 64)) (t!40519 List!27065)) )
))
(declare-fun acc!823 () List!27065)

(declare-fun contains!7037 (List!27065 (_ BitVec 64)) Bool)

(assert (=> b!1226753 (= res!815451 (not (contains!7037 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226754 () Bool)

(declare-fun res!815453 () Bool)

(assert (=> b!1226754 (=> (not res!815453) (not e!696610))))

(assert (=> b!1226754 (= res!815453 (not (contains!7037 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226756 () Bool)

(declare-fun res!815447 () Bool)

(assert (=> b!1226756 (=> (not res!815447) (not e!696610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226756 (= res!815447 (validKeyInArray!0 k!2913))))

(declare-fun b!1226757 () Bool)

(assert (=> b!1226757 (= e!696610 false)))

(declare-fun lt!558683 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79130 (_ BitVec 32) List!27065) Bool)

(assert (=> b!1226757 (= lt!558683 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun res!815449 () Bool)

(assert (=> start!101864 (=> (not res!815449) (not e!696610))))

(assert (=> start!101864 (= res!815449 (bvslt (size!38729 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101864 e!696610))

(declare-fun array_inv!29174 (array!79130) Bool)

(assert (=> start!101864 (array_inv!29174 a!3806)))

(assert (=> start!101864 true))

(declare-fun b!1226755 () Bool)

(declare-fun res!815450 () Bool)

(assert (=> b!1226755 (=> (not res!815450) (not e!696610))))

(declare-fun noDuplicate!1680 (List!27065) Bool)

(assert (=> b!1226755 (= res!815450 (noDuplicate!1680 acc!823))))

(assert (= (and start!101864 res!815449) b!1226756))

(assert (= (and b!1226756 res!815447) b!1226751))

(assert (= (and b!1226751 res!815452) b!1226755))

(assert (= (and b!1226755 res!815450) b!1226754))

(assert (= (and b!1226754 res!815453) b!1226753))

(assert (= (and b!1226753 res!815451) b!1226752))

(assert (= (and b!1226752 res!815448) b!1226757))

(declare-fun m!1131247 () Bool)

(assert (=> b!1226756 m!1131247))

(declare-fun m!1131249 () Bool)

(assert (=> b!1226754 m!1131249))

(declare-fun m!1131251 () Bool)

(assert (=> b!1226755 m!1131251))

(declare-fun m!1131253 () Bool)

(assert (=> start!101864 m!1131253))

(declare-fun m!1131255 () Bool)

(assert (=> b!1226753 m!1131255))

(declare-fun m!1131257 () Bool)

(assert (=> b!1226752 m!1131257))

(declare-fun m!1131259 () Bool)

(assert (=> b!1226757 m!1131259))

(push 1)

(assert (not b!1226756))

(assert (not b!1226753))

(assert (not b!1226757))

(assert (not b!1226752))

(assert (not b!1226755))

(assert (not start!101864))

(assert (not b!1226754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

