; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131340 () Bool)

(assert start!131340)

(declare-fun b!1538099 () Bool)

(declare-fun res!1053618 () Bool)

(declare-fun e!856375 () Bool)

(assert (=> b!1538099 (=> (not res!1053618) (not e!856375))))

(declare-datatypes ((array!102142 0))(
  ( (array!102143 (arr!49279 (Array (_ BitVec 32) (_ BitVec 64))) (size!49830 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102142)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538099 (= res!1053618 (validKeyInArray!0 (select (arr!49279 a!2792) i!951)))))

(declare-fun b!1538101 () Bool)

(declare-fun res!1053615 () Bool)

(assert (=> b!1538101 (=> (not res!1053615) (not e!856375))))

(declare-datatypes ((List!35740 0))(
  ( (Nil!35737) (Cons!35736 (h!37199 (_ BitVec 64)) (t!50426 List!35740)) )
))
(declare-fun arrayNoDuplicates!0 (array!102142 (_ BitVec 32) List!35740) Bool)

(assert (=> b!1538101 (= res!1053615 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35737))))

(declare-fun b!1538102 () Bool)

(declare-fun res!1053609 () Bool)

(assert (=> b!1538102 (=> (not res!1053609) (not e!856375))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538102 (= res!1053609 (validKeyInArray!0 (select (arr!49279 a!2792) j!64)))))

(declare-fun b!1538103 () Bool)

(declare-fun res!1053613 () Bool)

(assert (=> b!1538103 (=> (not res!1053613) (not e!856375))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102142 (_ BitVec 32)) Bool)

(assert (=> b!1538103 (= res!1053613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538104 () Bool)

(declare-fun res!1053611 () Bool)

(assert (=> b!1538104 (=> (not res!1053611) (not e!856375))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13306 0))(
  ( (MissingZero!13306 (index!55619 (_ BitVec 32))) (Found!13306 (index!55620 (_ BitVec 32))) (Intermediate!13306 (undefined!14118 Bool) (index!55621 (_ BitVec 32)) (x!137574 (_ BitVec 32))) (Undefined!13306) (MissingVacant!13306 (index!55622 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102142 (_ BitVec 32)) SeekEntryResult!13306)

(assert (=> b!1538104 (= res!1053611 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49279 a!2792) j!64) a!2792 mask!2480) (Found!13306 j!64)))))

(declare-fun b!1538105 () Bool)

(declare-fun res!1053617 () Bool)

(assert (=> b!1538105 (=> (not res!1053617) (not e!856375))))

(assert (=> b!1538105 (= res!1053617 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49830 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49830 a!2792)) (= (select (arr!49279 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538106 () Bool)

(declare-fun e!856373 () Bool)

(assert (=> b!1538106 (= e!856373 false)))

(declare-fun lt!665016 () SeekEntryResult!13306)

(declare-fun lt!665015 () (_ BitVec 32))

(assert (=> b!1538106 (= lt!665016 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665015 vacantIndex!5 (select (arr!49279 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1538107 () Bool)

(declare-fun res!1053612 () Bool)

(assert (=> b!1538107 (=> (not res!1053612) (not e!856375))))

(assert (=> b!1538107 (= res!1053612 (and (= (size!49830 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49830 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49830 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538108 () Bool)

(declare-fun res!1053614 () Bool)

(assert (=> b!1538108 (=> (not res!1053614) (not e!856375))))

(assert (=> b!1538108 (= res!1053614 (not (= (select (arr!49279 a!2792) index!463) (select (arr!49279 a!2792) j!64))))))

(declare-fun b!1538100 () Bool)

(assert (=> b!1538100 (= e!856375 e!856373)))

(declare-fun res!1053610 () Bool)

(assert (=> b!1538100 (=> (not res!1053610) (not e!856373))))

(assert (=> b!1538100 (= res!1053610 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665015 #b00000000000000000000000000000000) (bvslt lt!665015 (size!49830 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538100 (= lt!665015 (nextIndex!0 index!463 (bvadd #b00000000000000000000000000000001 x!510) mask!2480))))

(declare-fun res!1053616 () Bool)

(assert (=> start!131340 (=> (not res!1053616) (not e!856375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131340 (= res!1053616 (validMask!0 mask!2480))))

(assert (=> start!131340 e!856375))

(assert (=> start!131340 true))

(declare-fun array_inv!38560 (array!102142) Bool)

(assert (=> start!131340 (array_inv!38560 a!2792)))

(assert (= (and start!131340 res!1053616) b!1538107))

(assert (= (and b!1538107 res!1053612) b!1538099))

(assert (= (and b!1538099 res!1053618) b!1538102))

(assert (= (and b!1538102 res!1053609) b!1538103))

(assert (= (and b!1538103 res!1053613) b!1538101))

(assert (= (and b!1538101 res!1053615) b!1538105))

(assert (= (and b!1538105 res!1053617) b!1538104))

(assert (= (and b!1538104 res!1053611) b!1538108))

(assert (= (and b!1538108 res!1053614) b!1538100))

(assert (= (and b!1538100 res!1053610) b!1538106))

(declare-fun m!1420387 () Bool)

(assert (=> b!1538100 m!1420387))

(declare-fun m!1420389 () Bool)

(assert (=> b!1538102 m!1420389))

(assert (=> b!1538102 m!1420389))

(declare-fun m!1420391 () Bool)

(assert (=> b!1538102 m!1420391))

(declare-fun m!1420393 () Bool)

(assert (=> b!1538101 m!1420393))

(declare-fun m!1420395 () Bool)

(assert (=> b!1538099 m!1420395))

(assert (=> b!1538099 m!1420395))

(declare-fun m!1420397 () Bool)

(assert (=> b!1538099 m!1420397))

(assert (=> b!1538106 m!1420389))

(assert (=> b!1538106 m!1420389))

(declare-fun m!1420399 () Bool)

(assert (=> b!1538106 m!1420399))

(declare-fun m!1420401 () Bool)

(assert (=> b!1538108 m!1420401))

(assert (=> b!1538108 m!1420389))

(declare-fun m!1420403 () Bool)

(assert (=> start!131340 m!1420403))

(declare-fun m!1420405 () Bool)

(assert (=> start!131340 m!1420405))

(declare-fun m!1420407 () Bool)

(assert (=> b!1538105 m!1420407))

(assert (=> b!1538104 m!1420389))

(assert (=> b!1538104 m!1420389))

(declare-fun m!1420409 () Bool)

(assert (=> b!1538104 m!1420409))

(declare-fun m!1420411 () Bool)

(assert (=> b!1538103 m!1420411))

(check-sat (not start!131340) (not b!1538099) (not b!1538104) (not b!1538100) (not b!1538102) (not b!1538103) (not b!1538106) (not b!1538101))
(check-sat)
