; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130614 () Bool)

(assert start!130614)

(declare-fun b!1531032 () Bool)

(declare-fun res!1047262 () Bool)

(declare-fun e!853458 () Bool)

(assert (=> b!1531032 (=> (not res!1047262) (not e!853458))))

(declare-datatypes ((array!101701 0))(
  ( (array!101702 (arr!49069 (Array (_ BitVec 32) (_ BitVec 64))) (size!49620 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101701)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101701 (_ BitVec 32)) Bool)

(assert (=> b!1531032 (= res!1047262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531033 () Bool)

(declare-fun e!853459 () Bool)

(assert (=> b!1531033 (= e!853459 true)))

(declare-fun lt!663076 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531033 (= lt!663076 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531034 () Bool)

(declare-fun res!1047264 () Bool)

(assert (=> b!1531034 (=> (not res!1047264) (not e!853458))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1531034 (= res!1047264 (and (= (size!49620 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49620 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49620 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531035 () Bool)

(declare-fun e!853462 () Bool)

(assert (=> b!1531035 (= e!853462 (not e!853459))))

(declare-fun res!1047260 () Bool)

(assert (=> b!1531035 (=> res!1047260 e!853459)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531035 (= res!1047260 (or (not (= (select (arr!49069 a!2804) j!70) (select (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853461 () Bool)

(assert (=> b!1531035 e!853461))

(declare-fun res!1047258 () Bool)

(assert (=> b!1531035 (=> (not res!1047258) (not e!853461))))

(assert (=> b!1531035 (= res!1047258 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51073 0))(
  ( (Unit!51074) )
))
(declare-fun lt!663078 () Unit!51073)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101701 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51073)

(assert (=> b!1531035 (= lt!663078 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531036 () Bool)

(declare-fun res!1047256 () Bool)

(assert (=> b!1531036 (=> (not res!1047256) (not e!853458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531036 (= res!1047256 (validKeyInArray!0 (select (arr!49069 a!2804) j!70)))))

(declare-fun b!1531037 () Bool)

(assert (=> b!1531037 (= e!853458 e!853462)))

(declare-fun res!1047255 () Bool)

(assert (=> b!1531037 (=> (not res!1047255) (not e!853462))))

(declare-datatypes ((SeekEntryResult!13127 0))(
  ( (MissingZero!13127 (index!54903 (_ BitVec 32))) (Found!13127 (index!54904 (_ BitVec 32))) (Intermediate!13127 (undefined!13939 Bool) (index!54905 (_ BitVec 32)) (x!136805 (_ BitVec 32))) (Undefined!13127) (MissingVacant!13127 (index!54906 (_ BitVec 32))) )
))
(declare-fun lt!663077 () SeekEntryResult!13127)

(declare-fun lt!663075 () SeekEntryResult!13127)

(assert (=> b!1531037 (= res!1047255 (= lt!663077 lt!663075))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531037 (= lt!663075 (Intermediate!13127 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101701 (_ BitVec 32)) SeekEntryResult!13127)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531037 (= lt!663077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49069 a!2804) j!70) mask!2512) (select (arr!49069 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531039 () Bool)

(declare-fun res!1047254 () Bool)

(assert (=> b!1531039 (=> (not res!1047254) (not e!853462))))

(assert (=> b!1531039 (= res!1047254 (= lt!663077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101702 (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49620 a!2804)) mask!2512)))))

(declare-fun b!1531040 () Bool)

(declare-fun res!1047257 () Bool)

(assert (=> b!1531040 (=> (not res!1047257) (not e!853462))))

(assert (=> b!1531040 (= res!1047257 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49069 a!2804) j!70) a!2804 mask!2512) lt!663075))))

(declare-fun b!1531041 () Bool)

(declare-fun res!1047261 () Bool)

(assert (=> b!1531041 (=> (not res!1047261) (not e!853458))))

(assert (=> b!1531041 (= res!1047261 (validKeyInArray!0 (select (arr!49069 a!2804) i!961)))))

(declare-fun b!1531042 () Bool)

(declare-fun res!1047259 () Bool)

(assert (=> b!1531042 (=> (not res!1047259) (not e!853458))))

(declare-datatypes ((List!35539 0))(
  ( (Nil!35536) (Cons!35535 (h!36989 (_ BitVec 64)) (t!50225 List!35539)) )
))
(declare-fun arrayNoDuplicates!0 (array!101701 (_ BitVec 32) List!35539) Bool)

(assert (=> b!1531042 (= res!1047259 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35536))))

(declare-fun b!1531043 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101701 (_ BitVec 32)) SeekEntryResult!13127)

(assert (=> b!1531043 (= e!853461 (= (seekEntry!0 (select (arr!49069 a!2804) j!70) a!2804 mask!2512) (Found!13127 j!70)))))

(declare-fun b!1531038 () Bool)

(declare-fun res!1047263 () Bool)

(assert (=> b!1531038 (=> (not res!1047263) (not e!853458))))

(assert (=> b!1531038 (= res!1047263 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49620 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49620 a!2804))))))

(declare-fun res!1047253 () Bool)

(assert (=> start!130614 (=> (not res!1047253) (not e!853458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130614 (= res!1047253 (validMask!0 mask!2512))))

(assert (=> start!130614 e!853458))

(assert (=> start!130614 true))

(declare-fun array_inv!38350 (array!101701) Bool)

(assert (=> start!130614 (array_inv!38350 a!2804)))

(assert (= (and start!130614 res!1047253) b!1531034))

(assert (= (and b!1531034 res!1047264) b!1531041))

(assert (= (and b!1531041 res!1047261) b!1531036))

(assert (= (and b!1531036 res!1047256) b!1531032))

(assert (= (and b!1531032 res!1047262) b!1531042))

(assert (= (and b!1531042 res!1047259) b!1531038))

(assert (= (and b!1531038 res!1047263) b!1531037))

(assert (= (and b!1531037 res!1047255) b!1531040))

(assert (= (and b!1531040 res!1047257) b!1531039))

(assert (= (and b!1531039 res!1047254) b!1531035))

(assert (= (and b!1531035 res!1047258) b!1531043))

(assert (= (and b!1531035 (not res!1047260)) b!1531033))

(declare-fun m!1413787 () Bool)

(assert (=> start!130614 m!1413787))

(declare-fun m!1413789 () Bool)

(assert (=> start!130614 m!1413789))

(declare-fun m!1413791 () Bool)

(assert (=> b!1531036 m!1413791))

(assert (=> b!1531036 m!1413791))

(declare-fun m!1413793 () Bool)

(assert (=> b!1531036 m!1413793))

(declare-fun m!1413795 () Bool)

(assert (=> b!1531033 m!1413795))

(assert (=> b!1531037 m!1413791))

(assert (=> b!1531037 m!1413791))

(declare-fun m!1413797 () Bool)

(assert (=> b!1531037 m!1413797))

(assert (=> b!1531037 m!1413797))

(assert (=> b!1531037 m!1413791))

(declare-fun m!1413799 () Bool)

(assert (=> b!1531037 m!1413799))

(assert (=> b!1531035 m!1413791))

(declare-fun m!1413801 () Bool)

(assert (=> b!1531035 m!1413801))

(declare-fun m!1413803 () Bool)

(assert (=> b!1531035 m!1413803))

(declare-fun m!1413805 () Bool)

(assert (=> b!1531035 m!1413805))

(declare-fun m!1413807 () Bool)

(assert (=> b!1531035 m!1413807))

(assert (=> b!1531039 m!1413803))

(assert (=> b!1531039 m!1413805))

(assert (=> b!1531039 m!1413805))

(declare-fun m!1413809 () Bool)

(assert (=> b!1531039 m!1413809))

(assert (=> b!1531039 m!1413809))

(assert (=> b!1531039 m!1413805))

(declare-fun m!1413811 () Bool)

(assert (=> b!1531039 m!1413811))

(assert (=> b!1531043 m!1413791))

(assert (=> b!1531043 m!1413791))

(declare-fun m!1413813 () Bool)

(assert (=> b!1531043 m!1413813))

(declare-fun m!1413815 () Bool)

(assert (=> b!1531042 m!1413815))

(declare-fun m!1413817 () Bool)

(assert (=> b!1531041 m!1413817))

(assert (=> b!1531041 m!1413817))

(declare-fun m!1413819 () Bool)

(assert (=> b!1531041 m!1413819))

(declare-fun m!1413821 () Bool)

(assert (=> b!1531032 m!1413821))

(assert (=> b!1531040 m!1413791))

(assert (=> b!1531040 m!1413791))

(declare-fun m!1413823 () Bool)

(assert (=> b!1531040 m!1413823))

(check-sat (not b!1531033) (not b!1531032) (not b!1531041) (not b!1531037) (not start!130614) (not b!1531036) (not b!1531043) (not b!1531042) (not b!1531035) (not b!1531039) (not b!1531040))
(check-sat)
