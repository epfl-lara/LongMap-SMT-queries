; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102444 () Bool)

(assert start!102444)

(declare-fun b!1232222 () Bool)

(declare-fun res!820606 () Bool)

(declare-fun e!698928 () Bool)

(assert (=> b!1232222 (=> (not res!820606) (not e!698928))))

(declare-datatypes ((List!27124 0))(
  ( (Nil!27121) (Cons!27120 (h!28329 (_ BitVec 64)) (t!40587 List!27124)) )
))
(declare-fun acc!823 () List!27124)

(declare-fun contains!7186 (List!27124 (_ BitVec 64)) Bool)

(assert (=> b!1232222 (= res!820606 (not (contains!7186 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232223 () Bool)

(declare-fun res!820607 () Bool)

(assert (=> b!1232223 (=> (not res!820607) (not e!698928))))

(declare-datatypes ((array!79475 0))(
  ( (array!79476 (arr!38351 (Array (_ BitVec 32) (_ BitVec 64))) (size!38887 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79475)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232223 (= res!820607 (validKeyInArray!0 (select (arr!38351 a!3806) from!3184)))))

(declare-fun b!1232224 () Bool)

(declare-fun res!820602 () Bool)

(assert (=> b!1232224 (=> (not res!820602) (not e!698928))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1232224 (= res!820602 (validKeyInArray!0 k!2913))))

(declare-fun b!1232225 () Bool)

(declare-fun e!698926 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79475 (_ BitVec 32) List!27124) Bool)

(assert (=> b!1232225 (= e!698926 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27120 (select (arr!38351 a!3806) from!3184) Nil!27121)))))

(declare-fun b!1232226 () Bool)

(declare-fun res!820608 () Bool)

(assert (=> b!1232226 (=> (not res!820608) (not e!698928))))

(declare-fun noDuplicate!1783 (List!27124) Bool)

(assert (=> b!1232226 (= res!820608 (noDuplicate!1783 acc!823))))

(declare-fun b!1232227 () Bool)

(assert (=> b!1232227 (= e!698928 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1232227 e!698926))

(declare-fun res!820600 () Bool)

(assert (=> b!1232227 (=> (not res!820600) (not e!698926))))

(assert (=> b!1232227 (= res!820600 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27121))))

(declare-datatypes ((Unit!40808 0))(
  ( (Unit!40809) )
))
(declare-fun lt!559496 () Unit!40808)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79475 List!27124 List!27124 (_ BitVec 32)) Unit!40808)

(assert (=> b!1232227 (= lt!559496 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27121 from!3184))))

(assert (=> b!1232227 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27120 (select (arr!38351 a!3806) from!3184) acc!823))))

(declare-fun b!1232228 () Bool)

(declare-fun res!820603 () Bool)

(assert (=> b!1232228 (=> (not res!820603) (not e!698928))))

(assert (=> b!1232228 (= res!820603 (not (contains!7186 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232229 () Bool)

(declare-fun res!820601 () Bool)

(assert (=> b!1232229 (=> (not res!820601) (not e!698928))))

(assert (=> b!1232229 (= res!820601 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38887 a!3806)) (bvslt from!3184 (size!38887 a!3806))))))

(declare-fun res!820609 () Bool)

(assert (=> start!102444 (=> (not res!820609) (not e!698928))))

(assert (=> start!102444 (= res!820609 (bvslt (size!38887 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102444 e!698928))

(declare-fun array_inv!29199 (array!79475) Bool)

(assert (=> start!102444 (array_inv!29199 a!3806)))

(assert (=> start!102444 true))

(declare-fun b!1232230 () Bool)

(declare-fun res!820605 () Bool)

(assert (=> b!1232230 (=> (not res!820605) (not e!698928))))

(declare-fun arrayContainsKey!0 (array!79475 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232230 (= res!820605 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232231 () Bool)

(declare-fun res!820604 () Bool)

(assert (=> b!1232231 (=> (not res!820604) (not e!698928))))

(assert (=> b!1232231 (= res!820604 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102444 res!820609) b!1232224))

(assert (= (and b!1232224 res!820602) b!1232229))

(assert (= (and b!1232229 res!820601) b!1232226))

(assert (= (and b!1232226 res!820608) b!1232222))

(assert (= (and b!1232222 res!820606) b!1232228))

(assert (= (and b!1232228 res!820603) b!1232230))

(assert (= (and b!1232230 res!820605) b!1232231))

(assert (= (and b!1232231 res!820604) b!1232223))

(assert (= (and b!1232223 res!820607) b!1232227))

(assert (= (and b!1232227 res!820600) b!1232225))

(declare-fun m!1136239 () Bool)

(assert (=> b!1232228 m!1136239))

(declare-fun m!1136241 () Bool)

(assert (=> b!1232224 m!1136241))

(declare-fun m!1136243 () Bool)

(assert (=> b!1232230 m!1136243))

(declare-fun m!1136245 () Bool)

(assert (=> start!102444 m!1136245))

(declare-fun m!1136247 () Bool)

(assert (=> b!1232222 m!1136247))

(declare-fun m!1136249 () Bool)

(assert (=> b!1232226 m!1136249))

(declare-fun m!1136251 () Bool)

(assert (=> b!1232231 m!1136251))

(declare-fun m!1136253 () Bool)

(assert (=> b!1232225 m!1136253))

(declare-fun m!1136255 () Bool)

(assert (=> b!1232225 m!1136255))

(assert (=> b!1232223 m!1136253))

(assert (=> b!1232223 m!1136253))

(declare-fun m!1136257 () Bool)

(assert (=> b!1232223 m!1136257))

(declare-fun m!1136259 () Bool)

(assert (=> b!1232227 m!1136259))

(declare-fun m!1136261 () Bool)

(assert (=> b!1232227 m!1136261))

(assert (=> b!1232227 m!1136253))

(declare-fun m!1136263 () Bool)

(assert (=> b!1232227 m!1136263))

(push 1)

