; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129304 () Bool)

(assert start!129304)

(declare-fun b!1518700 () Bool)

(declare-fun e!847210 () Bool)

(declare-fun e!847204 () Bool)

(assert (=> b!1518700 (= e!847210 e!847204)))

(declare-fun res!1038606 () Bool)

(assert (=> b!1518700 (=> (not res!1038606) (not e!847204))))

(declare-datatypes ((array!101160 0))(
  ( (array!101161 (arr!48817 (Array (_ BitVec 32) (_ BitVec 64))) (size!49367 (_ BitVec 32))) )
))
(declare-fun lt!658302 () array!101160)

(declare-datatypes ((SeekEntryResult!12988 0))(
  ( (MissingZero!12988 (index!54347 (_ BitVec 32))) (Found!12988 (index!54348 (_ BitVec 32))) (Intermediate!12988 (undefined!13800 Bool) (index!54349 (_ BitVec 32)) (x!136018 (_ BitVec 32))) (Undefined!12988) (MissingVacant!12988 (index!54350 (_ BitVec 32))) )
))
(declare-fun lt!658299 () SeekEntryResult!12988)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!658297 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101160 (_ BitVec 32)) SeekEntryResult!12988)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518700 (= res!1038606 (= lt!658299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658297 mask!2512) lt!658297 lt!658302 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101160)

(assert (=> b!1518700 (= lt!658297 (select (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518700 (= lt!658302 (array!101161 (store (arr!48817 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49367 a!2804)))))

(declare-fun b!1518701 () Bool)

(declare-fun e!847205 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101160 (_ BitVec 32)) SeekEntryResult!12988)

(assert (=> b!1518701 (= e!847205 (= (seekEntry!0 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) (Found!12988 j!70)))))

(declare-fun b!1518702 () Bool)

(declare-fun res!1038611 () Bool)

(declare-fun e!847209 () Bool)

(assert (=> b!1518702 (=> (not res!1038611) (not e!847209))))

(assert (=> b!1518702 (= res!1038611 (and (= (size!49367 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49367 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49367 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518704 () Bool)

(declare-fun res!1038614 () Bool)

(assert (=> b!1518704 (=> (not res!1038614) (not e!847209))))

(declare-datatypes ((List!35300 0))(
  ( (Nil!35297) (Cons!35296 (h!36708 (_ BitVec 64)) (t!49994 List!35300)) )
))
(declare-fun arrayNoDuplicates!0 (array!101160 (_ BitVec 32) List!35300) Bool)

(assert (=> b!1518704 (= res!1038614 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35297))))

(declare-fun b!1518705 () Bool)

(declare-fun res!1038607 () Bool)

(assert (=> b!1518705 (=> (not res!1038607) (not e!847209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101160 (_ BitVec 32)) Bool)

(assert (=> b!1518705 (= res!1038607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518706 () Bool)

(declare-fun res!1038604 () Bool)

(declare-fun e!847208 () Bool)

(assert (=> b!1518706 (=> res!1038604 e!847208)))

(declare-fun lt!658298 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!658300 () SeekEntryResult!12988)

(assert (=> b!1518706 (= res!1038604 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658298 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658300)))))

(declare-fun b!1518707 () Bool)

(declare-fun e!847207 () Bool)

(assert (=> b!1518707 (= e!847207 e!847208)))

(declare-fun res!1038615 () Bool)

(assert (=> b!1518707 (=> res!1038615 e!847208)))

(assert (=> b!1518707 (= res!1038615 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658298 #b00000000000000000000000000000000) (bvsge lt!658298 (size!49367 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518707 (= lt!658298 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518708 () Bool)

(declare-fun res!1038605 () Bool)

(assert (=> b!1518708 (=> (not res!1038605) (not e!847210))))

(assert (=> b!1518708 (= res!1038605 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) lt!658300))))

(declare-fun b!1518709 () Bool)

(declare-fun res!1038612 () Bool)

(assert (=> b!1518709 (=> (not res!1038612) (not e!847209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518709 (= res!1038612 (validKeyInArray!0 (select (arr!48817 a!2804) j!70)))))

(declare-fun b!1518710 () Bool)

(declare-fun res!1038616 () Bool)

(assert (=> b!1518710 (=> (not res!1038616) (not e!847209))))

(assert (=> b!1518710 (= res!1038616 (validKeyInArray!0 (select (arr!48817 a!2804) i!961)))))

(declare-fun b!1518711 () Bool)

(assert (=> b!1518711 (= e!847208 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101160 (_ BitVec 32)) SeekEntryResult!12988)

(assert (=> b!1518711 (= (seekEntryOrOpen!0 (select (arr!48817 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658297 lt!658302 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((Unit!50844 0))(
  ( (Unit!50845) )
))
(declare-fun lt!658303 () Unit!50844)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50844)

(assert (=> b!1518711 (= lt!658303 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658298 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518703 () Bool)

(assert (=> b!1518703 (= e!847209 e!847210)))

(declare-fun res!1038608 () Bool)

(assert (=> b!1518703 (=> (not res!1038608) (not e!847210))))

(assert (=> b!1518703 (= res!1038608 (= lt!658299 lt!658300))))

(assert (=> b!1518703 (= lt!658300 (Intermediate!12988 false resIndex!21 resX!21))))

(assert (=> b!1518703 (= lt!658299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48817 a!2804) j!70) mask!2512) (select (arr!48817 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1038609 () Bool)

(assert (=> start!129304 (=> (not res!1038609) (not e!847209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129304 (= res!1038609 (validMask!0 mask!2512))))

(assert (=> start!129304 e!847209))

(assert (=> start!129304 true))

(declare-fun array_inv!37845 (array!101160) Bool)

(assert (=> start!129304 (array_inv!37845 a!2804)))

(declare-fun b!1518712 () Bool)

(assert (=> b!1518712 (= e!847204 (not e!847207))))

(declare-fun res!1038603 () Bool)

(assert (=> b!1518712 (=> res!1038603 e!847207)))

(assert (=> b!1518712 (= res!1038603 (or (not (= (select (arr!48817 a!2804) j!70) lt!658297)) (= x!534 resX!21)))))

(assert (=> b!1518712 e!847205))

(declare-fun res!1038610 () Bool)

(assert (=> b!1518712 (=> (not res!1038610) (not e!847205))))

(assert (=> b!1518712 (= res!1038610 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658301 () Unit!50844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50844)

(assert (=> b!1518712 (= lt!658301 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518713 () Bool)

(declare-fun res!1038613 () Bool)

(assert (=> b!1518713 (=> (not res!1038613) (not e!847209))))

(assert (=> b!1518713 (= res!1038613 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49367 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49367 a!2804))))))

(assert (= (and start!129304 res!1038609) b!1518702))

(assert (= (and b!1518702 res!1038611) b!1518710))

(assert (= (and b!1518710 res!1038616) b!1518709))

(assert (= (and b!1518709 res!1038612) b!1518705))

(assert (= (and b!1518705 res!1038607) b!1518704))

(assert (= (and b!1518704 res!1038614) b!1518713))

(assert (= (and b!1518713 res!1038613) b!1518703))

(assert (= (and b!1518703 res!1038608) b!1518708))

(assert (= (and b!1518708 res!1038605) b!1518700))

(assert (= (and b!1518700 res!1038606) b!1518712))

(assert (= (and b!1518712 res!1038610) b!1518701))

(assert (= (and b!1518712 (not res!1038603)) b!1518707))

(assert (= (and b!1518707 (not res!1038615)) b!1518706))

(assert (= (and b!1518706 (not res!1038604)) b!1518711))

(declare-fun m!1402035 () Bool)

(assert (=> b!1518706 m!1402035))

(assert (=> b!1518706 m!1402035))

(declare-fun m!1402037 () Bool)

(assert (=> b!1518706 m!1402037))

(assert (=> b!1518708 m!1402035))

(assert (=> b!1518708 m!1402035))

(declare-fun m!1402039 () Bool)

(assert (=> b!1518708 m!1402039))

(declare-fun m!1402041 () Bool)

(assert (=> b!1518710 m!1402041))

(assert (=> b!1518710 m!1402041))

(declare-fun m!1402043 () Bool)

(assert (=> b!1518710 m!1402043))

(assert (=> b!1518701 m!1402035))

(assert (=> b!1518701 m!1402035))

(declare-fun m!1402045 () Bool)

(assert (=> b!1518701 m!1402045))

(assert (=> b!1518709 m!1402035))

(assert (=> b!1518709 m!1402035))

(declare-fun m!1402047 () Bool)

(assert (=> b!1518709 m!1402047))

(declare-fun m!1402049 () Bool)

(assert (=> b!1518700 m!1402049))

(assert (=> b!1518700 m!1402049))

(declare-fun m!1402051 () Bool)

(assert (=> b!1518700 m!1402051))

(declare-fun m!1402053 () Bool)

(assert (=> b!1518700 m!1402053))

(declare-fun m!1402055 () Bool)

(assert (=> b!1518700 m!1402055))

(declare-fun m!1402057 () Bool)

(assert (=> b!1518707 m!1402057))

(declare-fun m!1402059 () Bool)

(assert (=> b!1518704 m!1402059))

(declare-fun m!1402061 () Bool)

(assert (=> b!1518705 m!1402061))

(declare-fun m!1402063 () Bool)

(assert (=> start!129304 m!1402063))

(declare-fun m!1402065 () Bool)

(assert (=> start!129304 m!1402065))

(assert (=> b!1518712 m!1402035))

(declare-fun m!1402067 () Bool)

(assert (=> b!1518712 m!1402067))

(declare-fun m!1402069 () Bool)

(assert (=> b!1518712 m!1402069))

(assert (=> b!1518703 m!1402035))

(assert (=> b!1518703 m!1402035))

(declare-fun m!1402071 () Bool)

(assert (=> b!1518703 m!1402071))

(assert (=> b!1518703 m!1402071))

(assert (=> b!1518703 m!1402035))

(declare-fun m!1402073 () Bool)

(assert (=> b!1518703 m!1402073))

(assert (=> b!1518711 m!1402035))

(assert (=> b!1518711 m!1402035))

(declare-fun m!1402075 () Bool)

(assert (=> b!1518711 m!1402075))

(declare-fun m!1402077 () Bool)

(assert (=> b!1518711 m!1402077))

(declare-fun m!1402079 () Bool)

(assert (=> b!1518711 m!1402079))

(push 1)

(assert (not b!1518711))

(assert (not b!1518709))

(assert (not b!1518706))

(assert (not b!1518710))

(assert (not b!1518700))

(assert (not b!1518707))

