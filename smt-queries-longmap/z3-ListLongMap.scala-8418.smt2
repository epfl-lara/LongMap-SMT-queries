; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102446 () Bool)

(assert start!102446)

(declare-fun b!1232252 () Bool)

(declare-fun res!820630 () Bool)

(declare-fun e!698936 () Bool)

(assert (=> b!1232252 (=> (not res!820630) (not e!698936))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79477 0))(
  ( (array!79478 (arr!38352 (Array (_ BitVec 32) (_ BitVec 64))) (size!38888 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79477)

(assert (=> b!1232252 (= res!820630 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38888 a!3806)) (bvslt from!3184 (size!38888 a!3806))))))

(declare-fun b!1232253 () Bool)

(declare-fun res!820637 () Bool)

(assert (=> b!1232253 (=> (not res!820637) (not e!698936))))

(declare-datatypes ((List!27125 0))(
  ( (Nil!27122) (Cons!27121 (h!28330 (_ BitVec 64)) (t!40588 List!27125)) )
))
(declare-fun acc!823 () List!27125)

(declare-fun arrayNoDuplicates!0 (array!79477 (_ BitVec 32) List!27125) Bool)

(assert (=> b!1232253 (= res!820637 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232254 () Bool)

(declare-fun res!820631 () Bool)

(assert (=> b!1232254 (=> (not res!820631) (not e!698936))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232254 (= res!820631 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232255 () Bool)

(declare-fun res!820636 () Bool)

(assert (=> b!1232255 (=> (not res!820636) (not e!698936))))

(assert (=> b!1232255 (= res!820636 (validKeyInArray!0 (select (arr!38352 a!3806) from!3184)))))

(declare-fun res!820635 () Bool)

(assert (=> start!102446 (=> (not res!820635) (not e!698936))))

(assert (=> start!102446 (= res!820635 (bvslt (size!38888 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102446 e!698936))

(declare-fun array_inv!29200 (array!79477) Bool)

(assert (=> start!102446 (array_inv!29200 a!3806)))

(assert (=> start!102446 true))

(declare-fun b!1232256 () Bool)

(declare-fun res!820633 () Bool)

(assert (=> b!1232256 (=> (not res!820633) (not e!698936))))

(declare-fun arrayContainsKey!0 (array!79477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232256 (= res!820633 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232257 () Bool)

(declare-fun res!820634 () Bool)

(assert (=> b!1232257 (=> (not res!820634) (not e!698936))))

(declare-fun contains!7187 (List!27125 (_ BitVec 64)) Bool)

(assert (=> b!1232257 (= res!820634 (not (contains!7187 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232258 () Bool)

(assert (=> b!1232258 (= e!698936 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(declare-fun e!698937 () Bool)

(assert (=> b!1232258 e!698937))

(declare-fun res!820639 () Bool)

(assert (=> b!1232258 (=> (not res!820639) (not e!698937))))

(assert (=> b!1232258 (= res!820639 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27122))))

(declare-datatypes ((Unit!40810 0))(
  ( (Unit!40811) )
))
(declare-fun lt!559499 () Unit!40810)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79477 List!27125 List!27125 (_ BitVec 32)) Unit!40810)

(assert (=> b!1232258 (= lt!559499 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27122 from!3184))))

(assert (=> b!1232258 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27121 (select (arr!38352 a!3806) from!3184) acc!823))))

(declare-fun b!1232259 () Bool)

(assert (=> b!1232259 (= e!698937 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27121 (select (arr!38352 a!3806) from!3184) Nil!27122)))))

(declare-fun b!1232260 () Bool)

(declare-fun res!820638 () Bool)

(assert (=> b!1232260 (=> (not res!820638) (not e!698936))))

(assert (=> b!1232260 (= res!820638 (not (contains!7187 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232261 () Bool)

(declare-fun res!820632 () Bool)

(assert (=> b!1232261 (=> (not res!820632) (not e!698936))))

(declare-fun noDuplicate!1784 (List!27125) Bool)

(assert (=> b!1232261 (= res!820632 (noDuplicate!1784 acc!823))))

(assert (= (and start!102446 res!820635) b!1232254))

(assert (= (and b!1232254 res!820631) b!1232252))

(assert (= (and b!1232252 res!820630) b!1232261))

(assert (= (and b!1232261 res!820632) b!1232260))

(assert (= (and b!1232260 res!820638) b!1232257))

(assert (= (and b!1232257 res!820634) b!1232256))

(assert (= (and b!1232256 res!820633) b!1232253))

(assert (= (and b!1232253 res!820637) b!1232255))

(assert (= (and b!1232255 res!820636) b!1232258))

(assert (= (and b!1232258 res!820639) b!1232259))

(declare-fun m!1136265 () Bool)

(assert (=> start!102446 m!1136265))

(declare-fun m!1136267 () Bool)

(assert (=> b!1232260 m!1136267))

(declare-fun m!1136269 () Bool)

(assert (=> b!1232254 m!1136269))

(declare-fun m!1136271 () Bool)

(assert (=> b!1232253 m!1136271))

(declare-fun m!1136273 () Bool)

(assert (=> b!1232255 m!1136273))

(assert (=> b!1232255 m!1136273))

(declare-fun m!1136275 () Bool)

(assert (=> b!1232255 m!1136275))

(declare-fun m!1136277 () Bool)

(assert (=> b!1232257 m!1136277))

(assert (=> b!1232259 m!1136273))

(declare-fun m!1136279 () Bool)

(assert (=> b!1232259 m!1136279))

(declare-fun m!1136281 () Bool)

(assert (=> b!1232256 m!1136281))

(declare-fun m!1136283 () Bool)

(assert (=> b!1232258 m!1136283))

(declare-fun m!1136285 () Bool)

(assert (=> b!1232258 m!1136285))

(assert (=> b!1232258 m!1136273))

(declare-fun m!1136287 () Bool)

(assert (=> b!1232258 m!1136287))

(declare-fun m!1136289 () Bool)

(assert (=> b!1232261 m!1136289))

(check-sat (not b!1232253) (not b!1232258) (not b!1232257) (not b!1232255) (not b!1232254) (not b!1232261) (not start!102446) (not b!1232259) (not b!1232256) (not b!1232260))
(check-sat)
