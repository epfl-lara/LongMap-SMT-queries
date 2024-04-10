; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130978 () Bool)

(assert start!130978)

(declare-fun b!1536562 () Bool)

(declare-fun res!1053658 () Bool)

(declare-fun e!855238 () Bool)

(assert (=> b!1536562 (=> (not res!1053658) (not e!855238))))

(declare-datatypes ((array!102076 0))(
  ( (array!102077 (arr!49254 (Array (_ BitVec 32) (_ BitVec 64))) (size!49804 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102076)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536562 (= res!1053658 (validKeyInArray!0 (select (arr!49254 a!2792) i!951)))))

(declare-fun b!1536563 () Bool)

(declare-fun e!855236 () Bool)

(assert (=> b!1536563 (= e!855238 e!855236)))

(declare-fun res!1053652 () Bool)

(assert (=> b!1536563 (=> (not res!1053652) (not e!855236))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13386 0))(
  ( (MissingZero!13386 (index!55939 (_ BitVec 32))) (Found!13386 (index!55940 (_ BitVec 32))) (Intermediate!13386 (undefined!14198 Bool) (index!55941 (_ BitVec 32)) (x!137676 (_ BitVec 32))) (Undefined!13386) (MissingVacant!13386 (index!55942 (_ BitVec 32))) )
))
(declare-fun lt!664393 () SeekEntryResult!13386)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102076 (_ BitVec 32)) SeekEntryResult!13386)

(assert (=> b!1536563 (= res!1053652 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49254 a!2792) j!64) a!2792 mask!2480) lt!664393))))

(assert (=> b!1536563 (= lt!664393 (Found!13386 j!64))))

(declare-fun res!1053648 () Bool)

(assert (=> start!130978 (=> (not res!1053648) (not e!855238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130978 (= res!1053648 (validMask!0 mask!2480))))

(assert (=> start!130978 e!855238))

(assert (=> start!130978 true))

(declare-fun array_inv!38282 (array!102076) Bool)

(assert (=> start!130978 (array_inv!38282 a!2792)))

(declare-fun b!1536564 () Bool)

(declare-fun res!1053656 () Bool)

(assert (=> b!1536564 (=> (not res!1053656) (not e!855238))))

(declare-datatypes ((List!35728 0))(
  ( (Nil!35725) (Cons!35724 (h!37169 (_ BitVec 64)) (t!50422 List!35728)) )
))
(declare-fun arrayNoDuplicates!0 (array!102076 (_ BitVec 32) List!35728) Bool)

(assert (=> b!1536564 (= res!1053656 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35725))))

(declare-fun b!1536565 () Bool)

(declare-fun res!1053649 () Bool)

(assert (=> b!1536565 (=> (not res!1053649) (not e!855238))))

(assert (=> b!1536565 (= res!1053649 (and (= (size!49804 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49804 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49804 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536566 () Bool)

(declare-fun res!1053655 () Bool)

(assert (=> b!1536566 (=> (not res!1053655) (not e!855238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102076 (_ BitVec 32)) Bool)

(assert (=> b!1536566 (= res!1053655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536567 () Bool)

(declare-fun res!1053653 () Bool)

(assert (=> b!1536567 (=> (not res!1053653) (not e!855238))))

(assert (=> b!1536567 (= res!1053653 (validKeyInArray!0 (select (arr!49254 a!2792) j!64)))))

(declare-fun b!1536568 () Bool)

(declare-fun e!855237 () Bool)

(declare-fun e!855234 () Bool)

(assert (=> b!1536568 (= e!855237 e!855234)))

(declare-fun res!1053657 () Bool)

(assert (=> b!1536568 (=> (not res!1053657) (not e!855234))))

(declare-fun lt!664390 () SeekEntryResult!13386)

(assert (=> b!1536568 (= res!1053657 (= lt!664390 lt!664393))))

(declare-fun lt!664391 () (_ BitVec 32))

(assert (=> b!1536568 (= lt!664390 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664391 vacantIndex!5 (select (arr!49254 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536569 () Bool)

(assert (=> b!1536569 (= e!855236 e!855237)))

(declare-fun res!1053654 () Bool)

(assert (=> b!1536569 (=> (not res!1053654) (not e!855237))))

(assert (=> b!1536569 (= res!1053654 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664391 #b00000000000000000000000000000000) (bvslt lt!664391 (size!49804 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536569 (= lt!664391 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536570 () Bool)

(assert (=> b!1536570 (= e!855234 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49254 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1536570 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664391 vacantIndex!5 (select (store (arr!49254 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102077 (store (arr!49254 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49804 a!2792)) mask!2480) lt!664390)))

(declare-datatypes ((Unit!51344 0))(
  ( (Unit!51345) )
))
(declare-fun lt!664392 () Unit!51344)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51344)

(assert (=> b!1536570 (= lt!664392 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664391 vacantIndex!5 mask!2480))))

(declare-fun b!1536571 () Bool)

(declare-fun res!1053650 () Bool)

(assert (=> b!1536571 (=> (not res!1053650) (not e!855238))))

(assert (=> b!1536571 (= res!1053650 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49804 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49804 a!2792)) (= (select (arr!49254 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536572 () Bool)

(declare-fun res!1053651 () Bool)

(assert (=> b!1536572 (=> (not res!1053651) (not e!855236))))

(assert (=> b!1536572 (= res!1053651 (not (= (select (arr!49254 a!2792) index!463) (select (arr!49254 a!2792) j!64))))))

(assert (= (and start!130978 res!1053648) b!1536565))

(assert (= (and b!1536565 res!1053649) b!1536562))

(assert (= (and b!1536562 res!1053658) b!1536567))

(assert (= (and b!1536567 res!1053653) b!1536566))

(assert (= (and b!1536566 res!1053655) b!1536564))

(assert (= (and b!1536564 res!1053656) b!1536571))

(assert (= (and b!1536571 res!1053650) b!1536563))

(assert (= (and b!1536563 res!1053652) b!1536572))

(assert (= (and b!1536572 res!1053651) b!1536569))

(assert (= (and b!1536569 res!1053654) b!1536568))

(assert (= (and b!1536568 res!1053657) b!1536570))

(declare-fun m!1419033 () Bool)

(assert (=> b!1536568 m!1419033))

(assert (=> b!1536568 m!1419033))

(declare-fun m!1419035 () Bool)

(assert (=> b!1536568 m!1419035))

(declare-fun m!1419037 () Bool)

(assert (=> b!1536572 m!1419037))

(assert (=> b!1536572 m!1419033))

(declare-fun m!1419039 () Bool)

(assert (=> b!1536564 m!1419039))

(declare-fun m!1419041 () Bool)

(assert (=> b!1536571 m!1419041))

(declare-fun m!1419043 () Bool)

(assert (=> b!1536570 m!1419043))

(declare-fun m!1419045 () Bool)

(assert (=> b!1536570 m!1419045))

(assert (=> b!1536570 m!1419043))

(declare-fun m!1419047 () Bool)

(assert (=> b!1536570 m!1419047))

(declare-fun m!1419049 () Bool)

(assert (=> b!1536570 m!1419049))

(declare-fun m!1419051 () Bool)

(assert (=> b!1536570 m!1419051))

(assert (=> b!1536563 m!1419033))

(assert (=> b!1536563 m!1419033))

(declare-fun m!1419053 () Bool)

(assert (=> b!1536563 m!1419053))

(declare-fun m!1419055 () Bool)

(assert (=> b!1536566 m!1419055))

(declare-fun m!1419057 () Bool)

(assert (=> b!1536562 m!1419057))

(assert (=> b!1536562 m!1419057))

(declare-fun m!1419059 () Bool)

(assert (=> b!1536562 m!1419059))

(declare-fun m!1419061 () Bool)

(assert (=> start!130978 m!1419061))

(declare-fun m!1419063 () Bool)

(assert (=> start!130978 m!1419063))

(assert (=> b!1536567 m!1419033))

(assert (=> b!1536567 m!1419033))

(declare-fun m!1419065 () Bool)

(assert (=> b!1536567 m!1419065))

(declare-fun m!1419067 () Bool)

(assert (=> b!1536569 m!1419067))

(check-sat (not b!1536563) (not b!1536568) (not b!1536562) (not b!1536566) (not b!1536570) (not b!1536564) (not b!1536569) (not b!1536567) (not start!130978))
(check-sat)
