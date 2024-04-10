; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134284 () Bool)

(assert start!134284)

(declare-fun res!1072008 () Bool)

(declare-fun e!874291 () Bool)

(assert (=> start!134284 (=> (not res!1072008) (not e!874291))))

(declare-fun from!2856 () (_ BitVec 32))

(declare-datatypes ((array!104774 0))(
  ( (array!104775 (arr!50567 (Array (_ BitVec 32) (_ BitVec 64))) (size!51117 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104774)

(assert (=> start!134284 (= res!1072008 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51117 a!3481)) (bvslt (size!51117 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134284 e!874291))

(assert (=> start!134284 true))

(declare-fun array_inv!39294 (array!104774) Bool)

(assert (=> start!134284 (array_inv!39294 a!3481)))

(declare-fun b!1568320 () Bool)

(declare-fun res!1072007 () Bool)

(assert (=> b!1568320 (=> (not res!1072007) (not e!874291))))

(declare-datatypes ((List!36699 0))(
  ( (Nil!36696) (Cons!36695 (h!38142 (_ BitVec 64)) (t!51607 List!36699)) )
))
(declare-fun acc!619 () List!36699)

(declare-fun noDuplicate!2673 (List!36699) Bool)

(assert (=> b!1568320 (= res!1072007 (noDuplicate!2673 acc!619))))

(declare-fun b!1568321 () Bool)

(declare-fun res!1072006 () Bool)

(assert (=> b!1568321 (=> (not res!1072006) (not e!874291))))

(declare-fun contains!10401 (List!36699 (_ BitVec 64)) Bool)

(assert (=> b!1568321 (= res!1072006 (not (contains!10401 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568322 () Bool)

(assert (=> b!1568322 (= e!874291 false)))

(declare-fun lt!673162 () Bool)

(assert (=> b!1568322 (= lt!673162 (contains!10401 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!134284 res!1072008) b!1568320))

(assert (= (and b!1568320 res!1072007) b!1568321))

(assert (= (and b!1568321 res!1072006) b!1568322))

(declare-fun m!1443015 () Bool)

(assert (=> start!134284 m!1443015))

(declare-fun m!1443017 () Bool)

(assert (=> b!1568320 m!1443017))

(declare-fun m!1443019 () Bool)

(assert (=> b!1568321 m!1443019))

(declare-fun m!1443021 () Bool)

(assert (=> b!1568322 m!1443021))

(check-sat (not b!1568322) (not start!134284) (not b!1568321) (not b!1568320))
(check-sat)
