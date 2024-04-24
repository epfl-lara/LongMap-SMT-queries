; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131334 () Bool)

(assert start!131334)

(declare-fun b!1538009 () Bool)

(declare-fun res!1053527 () Bool)

(declare-fun e!856347 () Bool)

(assert (=> b!1538009 (=> (not res!1053527) (not e!856347))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102136 0))(
  ( (array!102137 (arr!49276 (Array (_ BitVec 32) (_ BitVec 64))) (size!49827 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102136)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538009 (= res!1053527 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49827 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49827 a!2792)) (= (select (arr!49276 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538010 () Bool)

(declare-fun res!1053520 () Bool)

(assert (=> b!1538010 (=> (not res!1053520) (not e!856347))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538010 (= res!1053520 (and (= (size!49827 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49827 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49827 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538011 () Bool)

(declare-fun res!1053526 () Bool)

(assert (=> b!1538011 (=> (not res!1053526) (not e!856347))))

(declare-datatypes ((SeekEntryResult!13303 0))(
  ( (MissingZero!13303 (index!55607 (_ BitVec 32))) (Found!13303 (index!55608 (_ BitVec 32))) (Intermediate!13303 (undefined!14115 Bool) (index!55609 (_ BitVec 32)) (x!137563 (_ BitVec 32))) (Undefined!13303) (MissingVacant!13303 (index!55610 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102136 (_ BitVec 32)) SeekEntryResult!13303)

(assert (=> b!1538011 (= res!1053526 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49276 a!2792) j!64) a!2792 mask!2480) (Found!13303 j!64)))))

(declare-fun res!1053519 () Bool)

(assert (=> start!131334 (=> (not res!1053519) (not e!856347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131334 (= res!1053519 (validMask!0 mask!2480))))

(assert (=> start!131334 e!856347))

(assert (=> start!131334 true))

(declare-fun array_inv!38557 (array!102136) Bool)

(assert (=> start!131334 (array_inv!38557 a!2792)))

(declare-fun b!1538012 () Bool)

(declare-fun res!1053521 () Bool)

(assert (=> b!1538012 (=> (not res!1053521) (not e!856347))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538012 (= res!1053521 (validKeyInArray!0 (select (arr!49276 a!2792) j!64)))))

(declare-fun b!1538013 () Bool)

(declare-fun e!856346 () Bool)

(assert (=> b!1538013 (= e!856346 false)))

(declare-fun lt!664998 () SeekEntryResult!13303)

(declare-fun lt!664997 () (_ BitVec 32))

(assert (=> b!1538013 (= lt!664998 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664997 vacantIndex!5 (select (arr!49276 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538014 () Bool)

(declare-fun res!1053525 () Bool)

(assert (=> b!1538014 (=> (not res!1053525) (not e!856347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102136 (_ BitVec 32)) Bool)

(assert (=> b!1538014 (= res!1053525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538015 () Bool)

(declare-fun res!1053528 () Bool)

(assert (=> b!1538015 (=> (not res!1053528) (not e!856347))))

(declare-datatypes ((List!35737 0))(
  ( (Nil!35734) (Cons!35733 (h!37196 (_ BitVec 64)) (t!50423 List!35737)) )
))
(declare-fun arrayNoDuplicates!0 (array!102136 (_ BitVec 32) List!35737) Bool)

(assert (=> b!1538015 (= res!1053528 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35734))))

(declare-fun b!1538016 () Bool)

(declare-fun res!1053524 () Bool)

(assert (=> b!1538016 (=> (not res!1053524) (not e!856347))))

(assert (=> b!1538016 (= res!1053524 (validKeyInArray!0 (select (arr!49276 a!2792) i!951)))))

(declare-fun b!1538017 () Bool)

(assert (=> b!1538017 (= e!856347 e!856346)))

(declare-fun res!1053523 () Bool)

(assert (=> b!1538017 (=> (not res!1053523) (not e!856346))))

(assert (=> b!1538017 (= res!1053523 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664997 #b00000000000000000000000000000000) (bvslt lt!664997 (size!49827 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538017 (= lt!664997 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun b!1538018 () Bool)

(declare-fun res!1053522 () Bool)

(assert (=> b!1538018 (=> (not res!1053522) (not e!856347))))

(assert (=> b!1538018 (= res!1053522 (not (= (select (arr!49276 a!2792) index!463) (select (arr!49276 a!2792) j!64))))))

(assert (= (and start!131334 res!1053519) b!1538010))

(assert (= (and b!1538010 res!1053520) b!1538016))

(assert (= (and b!1538016 res!1053524) b!1538012))

(assert (= (and b!1538012 res!1053521) b!1538014))

(assert (= (and b!1538014 res!1053525) b!1538015))

(assert (= (and b!1538015 res!1053528) b!1538009))

(assert (= (and b!1538009 res!1053527) b!1538011))

(assert (= (and b!1538011 res!1053526) b!1538018))

(assert (= (and b!1538018 res!1053522) b!1538017))

(assert (= (and b!1538017 res!1053523) b!1538013))

(declare-fun m!1420309 () Bool)

(assert (=> b!1538017 m!1420309))

(declare-fun m!1420311 () Bool)

(assert (=> b!1538012 m!1420311))

(assert (=> b!1538012 m!1420311))

(declare-fun m!1420313 () Bool)

(assert (=> b!1538012 m!1420313))

(declare-fun m!1420315 () Bool)

(assert (=> b!1538018 m!1420315))

(assert (=> b!1538018 m!1420311))

(declare-fun m!1420317 () Bool)

(assert (=> b!1538009 m!1420317))

(declare-fun m!1420319 () Bool)

(assert (=> b!1538015 m!1420319))

(declare-fun m!1420321 () Bool)

(assert (=> b!1538014 m!1420321))

(assert (=> b!1538011 m!1420311))

(assert (=> b!1538011 m!1420311))

(declare-fun m!1420323 () Bool)

(assert (=> b!1538011 m!1420323))

(assert (=> b!1538013 m!1420311))

(assert (=> b!1538013 m!1420311))

(declare-fun m!1420325 () Bool)

(assert (=> b!1538013 m!1420325))

(declare-fun m!1420327 () Bool)

(assert (=> start!131334 m!1420327))

(declare-fun m!1420329 () Bool)

(assert (=> start!131334 m!1420329))

(declare-fun m!1420331 () Bool)

(assert (=> b!1538016 m!1420331))

(assert (=> b!1538016 m!1420331))

(declare-fun m!1420333 () Bool)

(assert (=> b!1538016 m!1420333))

(check-sat (not b!1538011) (not b!1538017) (not start!131334) (not b!1538012) (not b!1538015) (not b!1538016) (not b!1538014) (not b!1538013))
(check-sat)
