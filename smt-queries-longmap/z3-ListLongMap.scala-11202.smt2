; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130846 () Bool)

(assert start!130846)

(declare-fun res!1051616 () Bool)

(declare-fun e!854523 () Bool)

(assert (=> start!130846 (=> (not res!1051616) (not e!854523))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130846 (= res!1051616 (validMask!0 mask!2480))))

(assert (=> start!130846 e!854523))

(assert (=> start!130846 true))

(declare-datatypes ((array!101944 0))(
  ( (array!101945 (arr!49188 (Array (_ BitVec 32) (_ BitVec 64))) (size!49738 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101944)

(declare-fun array_inv!38216 (array!101944) Bool)

(assert (=> start!130846 (array_inv!38216 a!2792)))

(declare-fun b!1534523 () Bool)

(declare-fun res!1051618 () Bool)

(assert (=> b!1534523 (=> (not res!1051618) (not e!854523))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13320 0))(
  ( (MissingZero!13320 (index!55675 (_ BitVec 32))) (Found!13320 (index!55676 (_ BitVec 32))) (Intermediate!13320 (undefined!14132 Bool) (index!55677 (_ BitVec 32)) (x!137434 (_ BitVec 32))) (Undefined!13320) (MissingVacant!13320 (index!55678 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101944 (_ BitVec 32)) SeekEntryResult!13320)

(assert (=> b!1534523 (= res!1051618 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49188 a!2792) j!64) a!2792 mask!2480) (Found!13320 j!64)))))

(declare-fun b!1534524 () Bool)

(declare-fun res!1051614 () Bool)

(assert (=> b!1534524 (=> (not res!1051614) (not e!854523))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534524 (= res!1051614 (and (= (size!49738 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49738 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49738 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534525 () Bool)

(declare-fun e!854524 () Bool)

(assert (=> b!1534525 (= e!854523 e!854524)))

(declare-fun res!1051615 () Bool)

(assert (=> b!1534525 (=> (not res!1051615) (not e!854524))))

(declare-fun lt!663877 () (_ BitVec 32))

(assert (=> b!1534525 (= res!1051615 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663877 #b00000000000000000000000000000000) (bvslt lt!663877 (size!49738 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534525 (= lt!663877 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534526 () Bool)

(declare-fun res!1051609 () Bool)

(assert (=> b!1534526 (=> (not res!1051609) (not e!854523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534526 (= res!1051609 (validKeyInArray!0 (select (arr!49188 a!2792) j!64)))))

(declare-fun b!1534527 () Bool)

(declare-fun res!1051613 () Bool)

(assert (=> b!1534527 (=> (not res!1051613) (not e!854523))))

(declare-datatypes ((List!35662 0))(
  ( (Nil!35659) (Cons!35658 (h!37103 (_ BitVec 64)) (t!50356 List!35662)) )
))
(declare-fun arrayNoDuplicates!0 (array!101944 (_ BitVec 32) List!35662) Bool)

(assert (=> b!1534527 (= res!1051613 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35659))))

(declare-fun b!1534528 () Bool)

(assert (=> b!1534528 (= e!854524 false)))

(declare-fun lt!663876 () SeekEntryResult!13320)

(assert (=> b!1534528 (= lt!663876 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663877 vacantIndex!5 (select (arr!49188 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534529 () Bool)

(declare-fun res!1051612 () Bool)

(assert (=> b!1534529 (=> (not res!1051612) (not e!854523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101944 (_ BitVec 32)) Bool)

(assert (=> b!1534529 (= res!1051612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534530 () Bool)

(declare-fun res!1051611 () Bool)

(assert (=> b!1534530 (=> (not res!1051611) (not e!854523))))

(assert (=> b!1534530 (= res!1051611 (not (= (select (arr!49188 a!2792) index!463) (select (arr!49188 a!2792) j!64))))))

(declare-fun b!1534531 () Bool)

(declare-fun res!1051617 () Bool)

(assert (=> b!1534531 (=> (not res!1051617) (not e!854523))))

(assert (=> b!1534531 (= res!1051617 (validKeyInArray!0 (select (arr!49188 a!2792) i!951)))))

(declare-fun b!1534532 () Bool)

(declare-fun res!1051610 () Bool)

(assert (=> b!1534532 (=> (not res!1051610) (not e!854523))))

(assert (=> b!1534532 (= res!1051610 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49738 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49738 a!2792)) (= (select (arr!49188 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!130846 res!1051616) b!1534524))

(assert (= (and b!1534524 res!1051614) b!1534531))

(assert (= (and b!1534531 res!1051617) b!1534526))

(assert (= (and b!1534526 res!1051609) b!1534529))

(assert (= (and b!1534529 res!1051612) b!1534527))

(assert (= (and b!1534527 res!1051613) b!1534532))

(assert (= (and b!1534532 res!1051610) b!1534523))

(assert (= (and b!1534523 res!1051618) b!1534530))

(assert (= (and b!1534530 res!1051611) b!1534525))

(assert (= (and b!1534525 res!1051615) b!1534528))

(declare-fun m!1417163 () Bool)

(assert (=> b!1534532 m!1417163))

(declare-fun m!1417165 () Bool)

(assert (=> b!1534526 m!1417165))

(assert (=> b!1534526 m!1417165))

(declare-fun m!1417167 () Bool)

(assert (=> b!1534526 m!1417167))

(declare-fun m!1417169 () Bool)

(assert (=> b!1534530 m!1417169))

(assert (=> b!1534530 m!1417165))

(declare-fun m!1417171 () Bool)

(assert (=> start!130846 m!1417171))

(declare-fun m!1417173 () Bool)

(assert (=> start!130846 m!1417173))

(declare-fun m!1417175 () Bool)

(assert (=> b!1534525 m!1417175))

(assert (=> b!1534523 m!1417165))

(assert (=> b!1534523 m!1417165))

(declare-fun m!1417177 () Bool)

(assert (=> b!1534523 m!1417177))

(declare-fun m!1417179 () Bool)

(assert (=> b!1534531 m!1417179))

(assert (=> b!1534531 m!1417179))

(declare-fun m!1417181 () Bool)

(assert (=> b!1534531 m!1417181))

(declare-fun m!1417183 () Bool)

(assert (=> b!1534529 m!1417183))

(assert (=> b!1534528 m!1417165))

(assert (=> b!1534528 m!1417165))

(declare-fun m!1417185 () Bool)

(assert (=> b!1534528 m!1417185))

(declare-fun m!1417187 () Bool)

(assert (=> b!1534527 m!1417187))

(check-sat (not b!1534528) (not b!1534525) (not start!130846) (not b!1534523) (not b!1534531) (not b!1534526) (not b!1534527) (not b!1534529))
(check-sat)
