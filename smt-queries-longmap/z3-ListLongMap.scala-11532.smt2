; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134278 () Bool)

(assert start!134278)

(declare-fun res!1071980 () Bool)

(declare-fun e!874273 () Bool)

(assert (=> start!134278 (=> (not res!1071980) (not e!874273))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104768 0))(
  ( (array!104769 (arr!50564 (Array (_ BitVec 32) (_ BitVec 64))) (size!51114 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104768)

(assert (=> start!134278 (= res!1071980 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51114 a!3481)) (bvslt (size!51114 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134278 e!874273))

(assert (=> start!134278 true))

(declare-fun array_inv!39291 (array!104768) Bool)

(assert (=> start!134278 (array_inv!39291 a!3481)))

(declare-fun b!1568293 () Bool)

(declare-fun res!1071979 () Bool)

(assert (=> b!1568293 (=> (not res!1071979) (not e!874273))))

(declare-datatypes ((List!36696 0))(
  ( (Nil!36693) (Cons!36692 (h!38139 (_ BitVec 64)) (t!51604 List!36696)) )
))
(declare-fun acc!619 () List!36696)

(declare-fun noDuplicate!2670 (List!36696) Bool)

(assert (=> b!1568293 (= res!1071979 (noDuplicate!2670 acc!619))))

(declare-fun b!1568294 () Bool)

(declare-fun res!1071981 () Bool)

(assert (=> b!1568294 (=> (not res!1071981) (not e!874273))))

(declare-fun contains!10398 (List!36696 (_ BitVec 64)) Bool)

(assert (=> b!1568294 (= res!1071981 (not (contains!10398 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568295 () Bool)

(assert (=> b!1568295 (= e!874273 false)))

(declare-fun lt!673153 () Bool)

(assert (=> b!1568295 (= lt!673153 (contains!10398 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134278 res!1071980) b!1568293))

(assert (= (and b!1568293 res!1071979) b!1568294))

(assert (= (and b!1568294 res!1071981) b!1568295))

(declare-fun m!1442991 () Bool)

(assert (=> start!134278 m!1442991))

(declare-fun m!1442993 () Bool)

(assert (=> b!1568293 m!1442993))

(declare-fun m!1442995 () Bool)

(assert (=> b!1568294 m!1442995))

(declare-fun m!1442997 () Bool)

(assert (=> b!1568295 m!1442997))

(check-sat (not b!1568295) (not start!134278) (not b!1568294) (not b!1568293))
(check-sat)
