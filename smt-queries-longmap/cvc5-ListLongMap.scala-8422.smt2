; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102576 () Bool)

(assert start!102576)

(declare-fun b!1233254 () Bool)

(declare-fun res!821477 () Bool)

(declare-fun e!699614 () Bool)

(assert (=> b!1233254 (=> (not res!821477) (not e!699614))))

(declare-datatypes ((array!79505 0))(
  ( (array!79506 (arr!38363 (Array (_ BitVec 32) (_ BitVec 64))) (size!38899 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79505)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233254 (= res!821477 (validKeyInArray!0 (select (arr!38363 a!3806) from!3184)))))

(declare-fun res!821471 () Bool)

(assert (=> start!102576 (=> (not res!821471) (not e!699614))))

(assert (=> start!102576 (= res!821471 (bvslt (size!38899 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102576 e!699614))

(declare-fun array_inv!29211 (array!79505) Bool)

(assert (=> start!102576 (array_inv!29211 a!3806)))

(assert (=> start!102576 true))

(declare-fun b!1233255 () Bool)

(declare-fun e!699615 () Bool)

(assert (=> b!1233255 (= e!699615 true)))

(declare-fun lt!559648 () Bool)

(declare-datatypes ((List!27136 0))(
  ( (Nil!27133) (Cons!27132 (h!28341 (_ BitVec 64)) (t!40599 List!27136)) )
))
(declare-fun lt!559647 () List!27136)

(declare-fun contains!7198 (List!27136 (_ BitVec 64)) Bool)

(assert (=> b!1233255 (= lt!559648 (contains!7198 lt!559647 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233256 () Bool)

(declare-fun res!821473 () Bool)

(assert (=> b!1233256 (=> res!821473 e!699615)))

(declare-fun noDuplicate!1795 (List!27136) Bool)

(assert (=> b!1233256 (= res!821473 (not (noDuplicate!1795 lt!559647)))))

(declare-fun b!1233257 () Bool)

(declare-fun res!821475 () Bool)

(assert (=> b!1233257 (=> (not res!821475) (not e!699614))))

(declare-fun acc!823 () List!27136)

(assert (=> b!1233257 (= res!821475 (not (contains!7198 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233258 () Bool)

(declare-fun res!821480 () Bool)

(assert (=> b!1233258 (=> (not res!821480) (not e!699614))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233258 (= res!821480 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233259 () Bool)

(declare-fun res!821482 () Bool)

(assert (=> b!1233259 (=> (not res!821482) (not e!699614))))

(assert (=> b!1233259 (= res!821482 (not (contains!7198 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233260 () Bool)

(declare-fun res!821478 () Bool)

(assert (=> b!1233260 (=> res!821478 e!699615)))

(assert (=> b!1233260 (= res!821478 (contains!7198 lt!559647 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1233261 () Bool)

(declare-fun e!699613 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79505 (_ BitVec 32) List!27136) Bool)

(assert (=> b!1233261 (= e!699613 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27132 (select (arr!38363 a!3806) from!3184) Nil!27133)))))

(declare-fun b!1233262 () Bool)

(declare-fun res!821479 () Bool)

(assert (=> b!1233262 (=> (not res!821479) (not e!699614))))

(assert (=> b!1233262 (= res!821479 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38899 a!3806)) (bvslt from!3184 (size!38899 a!3806))))))

(declare-fun b!1233263 () Bool)

(declare-fun res!821470 () Bool)

(assert (=> b!1233263 (=> (not res!821470) (not e!699614))))

(assert (=> b!1233263 (= res!821470 (validKeyInArray!0 k!2913))))

(declare-fun b!1233264 () Bool)

(declare-fun res!821481 () Bool)

(assert (=> b!1233264 (=> (not res!821481) (not e!699614))))

(assert (=> b!1233264 (= res!821481 (noDuplicate!1795 acc!823))))

(declare-fun b!1233265 () Bool)

(declare-fun res!821476 () Bool)

(assert (=> b!1233265 (=> (not res!821476) (not e!699614))))

(assert (=> b!1233265 (= res!821476 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233266 () Bool)

(assert (=> b!1233266 (= e!699614 (not e!699615))))

(declare-fun res!821472 () Bool)

(assert (=> b!1233266 (=> res!821472 e!699615)))

(assert (=> b!1233266 (= res!821472 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1233266 (= lt!559647 (Cons!27132 (select (arr!38363 a!3806) from!3184) Nil!27133))))

(assert (=> b!1233266 e!699613))

(declare-fun res!821474 () Bool)

(assert (=> b!1233266 (=> (not res!821474) (not e!699613))))

(assert (=> b!1233266 (= res!821474 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27133))))

(declare-datatypes ((Unit!40832 0))(
  ( (Unit!40833) )
))
(declare-fun lt!559649 () Unit!40832)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79505 List!27136 List!27136 (_ BitVec 32)) Unit!40832)

(assert (=> b!1233266 (= lt!559649 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27133 from!3184))))

(assert (=> b!1233266 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27132 (select (arr!38363 a!3806) from!3184) acc!823))))

(assert (= (and start!102576 res!821471) b!1233263))

(assert (= (and b!1233263 res!821470) b!1233262))

(assert (= (and b!1233262 res!821479) b!1233264))

(assert (= (and b!1233264 res!821481) b!1233259))

(assert (= (and b!1233259 res!821482) b!1233257))

(assert (= (and b!1233257 res!821475) b!1233258))

(assert (= (and b!1233258 res!821480) b!1233265))

(assert (= (and b!1233265 res!821476) b!1233254))

(assert (= (and b!1233254 res!821477) b!1233266))

(assert (= (and b!1233266 res!821474) b!1233261))

(assert (= (and b!1233266 (not res!821472)) b!1233256))

(assert (= (and b!1233256 (not res!821473)) b!1233260))

(assert (= (and b!1233260 (not res!821478)) b!1233255))

(declare-fun m!1137355 () Bool)

(assert (=> b!1233258 m!1137355))

(declare-fun m!1137357 () Bool)

(assert (=> b!1233264 m!1137357))

(declare-fun m!1137359 () Bool)

(assert (=> b!1233256 m!1137359))

(declare-fun m!1137361 () Bool)

(assert (=> b!1233259 m!1137361))

(declare-fun m!1137363 () Bool)

(assert (=> b!1233261 m!1137363))

(declare-fun m!1137365 () Bool)

(assert (=> b!1233261 m!1137365))

(declare-fun m!1137367 () Bool)

(assert (=> b!1233263 m!1137367))

(declare-fun m!1137369 () Bool)

(assert (=> b!1233255 m!1137369))

(declare-fun m!1137371 () Bool)

(assert (=> b!1233265 m!1137371))

(assert (=> b!1233254 m!1137363))

(assert (=> b!1233254 m!1137363))

(declare-fun m!1137373 () Bool)

(assert (=> b!1233254 m!1137373))

(declare-fun m!1137375 () Bool)

(assert (=> b!1233257 m!1137375))

(declare-fun m!1137377 () Bool)

(assert (=> start!102576 m!1137377))

(declare-fun m!1137379 () Bool)

(assert (=> b!1233260 m!1137379))

(assert (=> b!1233266 m!1137363))

(declare-fun m!1137381 () Bool)

(assert (=> b!1233266 m!1137381))

(declare-fun m!1137383 () Bool)

(assert (=> b!1233266 m!1137383))

(declare-fun m!1137385 () Bool)

(assert (=> b!1233266 m!1137385))

(push 1)

(assert (not b!1233261))

(assert (not b!1233260))

(assert (not start!102576))

(assert (not b!1233259))

(assert (not b!1233254))

(assert (not b!1233255))

(assert (not b!1233263))

(assert (not b!1233258))

(assert (not b!1233256))

(assert (not b!1233264))

(assert (not b!1233265))

(assert (not b!1233266))

(assert (not b!1233257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

