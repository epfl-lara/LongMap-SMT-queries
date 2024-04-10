; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134296 () Bool)

(assert start!134296)

(declare-datatypes ((array!104786 0))(
  ( (array!104787 (arr!50573 (Array (_ BitVec 32) (_ BitVec 64))) (size!51123 (_ BitVec 32))) )
))
(declare-fun a!3481 () array!104786)

(declare-datatypes ((List!36705 0))(
  ( (Nil!36702) (Cons!36701 (h!38148 (_ BitVec 64)) (t!51613 List!36705)) )
))
(declare-fun acc!619 () List!36705)

(declare-fun b!1568416 () Bool)

(declare-fun from!2856 () (_ BitVec 32))

(declare-fun e!874342 () Bool)

(declare-fun contains!10407 (List!36705 (_ BitVec 64)) Bool)

(assert (=> b!1568416 (= e!874342 (not (contains!10407 acc!619 (select (arr!50573 a!3481) from!2856))))))

(declare-fun b!1568417 () Bool)

(declare-fun res!1072103 () Bool)

(declare-fun e!874343 () Bool)

(assert (=> b!1568417 (=> (not res!1072103) (not e!874343))))

(declare-fun noDuplicate!2679 (List!36705) Bool)

(assert (=> b!1568417 (= res!1072103 (noDuplicate!2679 acc!619))))

(declare-fun b!1568418 () Bool)

(declare-fun res!1072102 () Bool)

(assert (=> b!1568418 (=> (not res!1072102) (not e!874343))))

(assert (=> b!1568418 (= res!1072102 (not (contains!10407 acc!619 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568419 () Bool)

(declare-fun res!1072105 () Bool)

(assert (=> b!1568419 (=> (not res!1072105) (not e!874343))))

(assert (=> b!1568419 (= res!1072105 (not (contains!10407 acc!619 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1568421 () Bool)

(declare-fun res!1072104 () Bool)

(assert (=> b!1568421 (=> (not res!1072104) (not e!874343))))

(assert (=> b!1568421 (= res!1072104 (bvslt from!2856 (size!51123 a!3481)))))

(declare-fun b!1568420 () Bool)

(assert (=> b!1568420 (= e!874343 false)))

(declare-fun lt!673180 () Bool)

(assert (=> b!1568420 (= lt!673180 e!874342)))

(declare-fun res!1072106 () Bool)

(assert (=> b!1568420 (=> res!1072106 e!874342)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568420 (= res!1072106 (not (validKeyInArray!0 (select (arr!50573 a!3481) from!2856))))))

(declare-fun res!1072107 () Bool)

(assert (=> start!134296 (=> (not res!1072107) (not e!874343))))

(assert (=> start!134296 (= res!1072107 (and (bvsge from!2856 #b00000000000000000000000000000000) (bvsle from!2856 (size!51123 a!3481)) (bvslt (size!51123 a!3481) #b01111111111111111111111111111111)))))

(assert (=> start!134296 e!874343))

(assert (=> start!134296 true))

(declare-fun array_inv!39300 (array!104786) Bool)

(assert (=> start!134296 (array_inv!39300 a!3481)))

(assert (= (and start!134296 res!1072107) b!1568417))

(assert (= (and b!1568417 res!1072103) b!1568418))

(assert (= (and b!1568418 res!1072102) b!1568419))

(assert (= (and b!1568419 res!1072105) b!1568421))

(assert (= (and b!1568421 res!1072104) b!1568420))

(assert (= (and b!1568420 (not res!1072106)) b!1568416))

(declare-fun m!1443087 () Bool)

(assert (=> b!1568420 m!1443087))

(assert (=> b!1568420 m!1443087))

(declare-fun m!1443089 () Bool)

(assert (=> b!1568420 m!1443089))

(assert (=> b!1568416 m!1443087))

(assert (=> b!1568416 m!1443087))

(declare-fun m!1443091 () Bool)

(assert (=> b!1568416 m!1443091))

(declare-fun m!1443093 () Bool)

(assert (=> b!1568417 m!1443093))

(declare-fun m!1443095 () Bool)

(assert (=> b!1568419 m!1443095))

(declare-fun m!1443097 () Bool)

(assert (=> b!1568418 m!1443097))

(declare-fun m!1443099 () Bool)

(assert (=> start!134296 m!1443099))

(check-sat (not b!1568420) (not b!1568416) (not b!1568417) (not b!1568419) (not b!1568418) (not start!134296))
(check-sat)
