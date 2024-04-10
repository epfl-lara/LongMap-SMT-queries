; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130894 () Bool)

(assert start!130894)

(declare-fun b!1535243 () Bool)

(declare-fun res!1052330 () Bool)

(declare-fun e!854740 () Bool)

(assert (=> b!1535243 (=> (not res!1052330) (not e!854740))))

(declare-datatypes ((array!101992 0))(
  ( (array!101993 (arr!49212 (Array (_ BitVec 32) (_ BitVec 64))) (size!49762 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101992)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535243 (= res!1052330 (not (= (select (arr!49212 a!2792) index!463) (select (arr!49212 a!2792) j!64))))))

(declare-fun b!1535244 () Bool)

(declare-fun res!1052329 () Bool)

(assert (=> b!1535244 (=> (not res!1052329) (not e!854740))))

(declare-datatypes ((List!35686 0))(
  ( (Nil!35683) (Cons!35682 (h!37127 (_ BitVec 64)) (t!50380 List!35686)) )
))
(declare-fun arrayNoDuplicates!0 (array!101992 (_ BitVec 32) List!35686) Bool)

(assert (=> b!1535244 (= res!1052329 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35683))))

(declare-fun b!1535245 () Bool)

(declare-fun res!1052337 () Bool)

(assert (=> b!1535245 (=> (not res!1052337) (not e!854740))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535245 (= res!1052337 (validKeyInArray!0 (select (arr!49212 a!2792) i!951)))))

(declare-fun res!1052336 () Bool)

(assert (=> start!130894 (=> (not res!1052336) (not e!854740))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130894 (= res!1052336 (validMask!0 mask!2480))))

(assert (=> start!130894 e!854740))

(assert (=> start!130894 true))

(declare-fun array_inv!38240 (array!101992) Bool)

(assert (=> start!130894 (array_inv!38240 a!2792)))

(declare-fun b!1535246 () Bool)

(declare-fun res!1052331 () Bool)

(assert (=> b!1535246 (=> (not res!1052331) (not e!854740))))

(assert (=> b!1535246 (= res!1052331 (and (= (size!49762 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49762 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49762 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535247 () Bool)

(declare-fun res!1052338 () Bool)

(assert (=> b!1535247 (=> (not res!1052338) (not e!854740))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13344 0))(
  ( (MissingZero!13344 (index!55771 (_ BitVec 32))) (Found!13344 (index!55772 (_ BitVec 32))) (Intermediate!13344 (undefined!14156 Bool) (index!55773 (_ BitVec 32)) (x!137522 (_ BitVec 32))) (Undefined!13344) (MissingVacant!13344 (index!55774 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101992 (_ BitVec 32)) SeekEntryResult!13344)

(assert (=> b!1535247 (= res!1052338 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49212 a!2792) j!64) a!2792 mask!2480) (Found!13344 j!64)))))

(declare-fun b!1535248 () Bool)

(declare-fun e!854739 () Bool)

(assert (=> b!1535248 (= e!854739 false)))

(declare-fun lt!664021 () (_ BitVec 32))

(declare-fun lt!664020 () SeekEntryResult!13344)

(assert (=> b!1535248 (= lt!664020 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664021 vacantIndex!5 (select (arr!49212 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535249 () Bool)

(assert (=> b!1535249 (= e!854740 e!854739)))

(declare-fun res!1052335 () Bool)

(assert (=> b!1535249 (=> (not res!1052335) (not e!854739))))

(assert (=> b!1535249 (= res!1052335 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664021 #b00000000000000000000000000000000) (bvslt lt!664021 (size!49762 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535249 (= lt!664021 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535250 () Bool)

(declare-fun res!1052333 () Bool)

(assert (=> b!1535250 (=> (not res!1052333) (not e!854740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101992 (_ BitVec 32)) Bool)

(assert (=> b!1535250 (= res!1052333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535251 () Bool)

(declare-fun res!1052334 () Bool)

(assert (=> b!1535251 (=> (not res!1052334) (not e!854740))))

(assert (=> b!1535251 (= res!1052334 (validKeyInArray!0 (select (arr!49212 a!2792) j!64)))))

(declare-fun b!1535252 () Bool)

(declare-fun res!1052332 () Bool)

(assert (=> b!1535252 (=> (not res!1052332) (not e!854740))))

(assert (=> b!1535252 (= res!1052332 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49762 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49762 a!2792)) (= (select (arr!49212 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130894 res!1052336) b!1535246))

(assert (= (and b!1535246 res!1052331) b!1535245))

(assert (= (and b!1535245 res!1052337) b!1535251))

(assert (= (and b!1535251 res!1052334) b!1535250))

(assert (= (and b!1535250 res!1052333) b!1535244))

(assert (= (and b!1535244 res!1052329) b!1535252))

(assert (= (and b!1535252 res!1052332) b!1535247))

(assert (= (and b!1535247 res!1052338) b!1535243))

(assert (= (and b!1535243 res!1052330) b!1535249))

(assert (= (and b!1535249 res!1052335) b!1535248))

(declare-fun m!1417787 () Bool)

(assert (=> b!1535249 m!1417787))

(declare-fun m!1417789 () Bool)

(assert (=> b!1535251 m!1417789))

(assert (=> b!1535251 m!1417789))

(declare-fun m!1417791 () Bool)

(assert (=> b!1535251 m!1417791))

(declare-fun m!1417793 () Bool)

(assert (=> b!1535250 m!1417793))

(declare-fun m!1417795 () Bool)

(assert (=> b!1535244 m!1417795))

(declare-fun m!1417797 () Bool)

(assert (=> b!1535243 m!1417797))

(assert (=> b!1535243 m!1417789))

(declare-fun m!1417799 () Bool)

(assert (=> start!130894 m!1417799))

(declare-fun m!1417801 () Bool)

(assert (=> start!130894 m!1417801))

(assert (=> b!1535247 m!1417789))

(assert (=> b!1535247 m!1417789))

(declare-fun m!1417803 () Bool)

(assert (=> b!1535247 m!1417803))

(declare-fun m!1417805 () Bool)

(assert (=> b!1535245 m!1417805))

(assert (=> b!1535245 m!1417805))

(declare-fun m!1417807 () Bool)

(assert (=> b!1535245 m!1417807))

(assert (=> b!1535248 m!1417789))

(assert (=> b!1535248 m!1417789))

(declare-fun m!1417809 () Bool)

(assert (=> b!1535248 m!1417809))

(declare-fun m!1417811 () Bool)

(assert (=> b!1535252 m!1417811))

(check-sat (not b!1535248) (not b!1535251) (not b!1535247) (not b!1535249) (not b!1535244) (not b!1535250) (not start!130894) (not b!1535245))
(check-sat)
