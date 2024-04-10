; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129302 () Bool)

(assert start!129302)

(declare-fun b!1518658 () Bool)

(declare-fun e!847187 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1518658 (= e!847187 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-datatypes ((array!101158 0))(
  ( (array!101159 (arr!48816 (Array (_ BitVec 32) (_ BitVec 64))) (size!49366 (_ BitVec 32))) )
))
(declare-fun lt!658280 () array!101158)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101158)

(declare-fun lt!658278 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12987 0))(
  ( (MissingZero!12987 (index!54343 (_ BitVec 32))) (Found!12987 (index!54344 (_ BitVec 32))) (Intermediate!12987 (undefined!13799 Bool) (index!54345 (_ BitVec 32)) (x!136017 (_ BitVec 32))) (Undefined!12987) (MissingVacant!12987 (index!54346 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101158 (_ BitVec 32)) SeekEntryResult!12987)

(assert (=> b!1518658 (= (seekEntryOrOpen!0 (select (arr!48816 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658278 lt!658280 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!658281 () (_ BitVec 32))

(declare-datatypes ((Unit!50842 0))(
  ( (Unit!50843) )
))
(declare-fun lt!658276 () Unit!50842)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50842)

(assert (=> b!1518658 (= lt!658276 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658281 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518659 () Bool)

(declare-fun res!1038567 () Bool)

(assert (=> b!1518659 (=> res!1038567 e!847187)))

(declare-fun lt!658277 () SeekEntryResult!12987)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101158 (_ BitVec 32)) SeekEntryResult!12987)

(assert (=> b!1518659 (= res!1038567 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658281 (select (arr!48816 a!2804) j!70) a!2804 mask!2512) lt!658277)))))

(declare-fun b!1518660 () Bool)

(declare-fun e!847189 () Bool)

(declare-fun e!847184 () Bool)

(assert (=> b!1518660 (= e!847189 e!847184)))

(declare-fun res!1038564 () Bool)

(assert (=> b!1518660 (=> (not res!1038564) (not e!847184))))

(declare-fun lt!658279 () SeekEntryResult!12987)

(assert (=> b!1518660 (= res!1038564 (= lt!658279 lt!658277))))

(assert (=> b!1518660 (= lt!658277 (Intermediate!12987 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518660 (= lt!658279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48816 a!2804) j!70) mask!2512) (select (arr!48816 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518661 () Bool)

(declare-fun res!1038562 () Bool)

(assert (=> b!1518661 (=> (not res!1038562) (not e!847189))))

(declare-datatypes ((List!35299 0))(
  ( (Nil!35296) (Cons!35295 (h!36707 (_ BitVec 64)) (t!49993 List!35299)) )
))
(declare-fun arrayNoDuplicates!0 (array!101158 (_ BitVec 32) List!35299) Bool)

(assert (=> b!1518661 (= res!1038562 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35296))))

(declare-fun b!1518662 () Bool)

(declare-fun res!1038563 () Bool)

(assert (=> b!1518662 (=> (not res!1038563) (not e!847189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518662 (= res!1038563 (validKeyInArray!0 (select (arr!48816 a!2804) j!70)))))

(declare-fun b!1518663 () Bool)

(declare-fun e!847186 () Bool)

(assert (=> b!1518663 (= e!847184 e!847186)))

(declare-fun res!1038568 () Bool)

(assert (=> b!1518663 (=> (not res!1038568) (not e!847186))))

(assert (=> b!1518663 (= res!1038568 (= lt!658279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658278 mask!2512) lt!658278 lt!658280 mask!2512)))))

(assert (=> b!1518663 (= lt!658278 (select (store (arr!48816 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518663 (= lt!658280 (array!101159 (store (arr!48816 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))

(declare-fun b!1518664 () Bool)

(declare-fun res!1038570 () Bool)

(assert (=> b!1518664 (=> (not res!1038570) (not e!847184))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518664 (= res!1038570 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48816 a!2804) j!70) a!2804 mask!2512) lt!658277))))

(declare-fun res!1038573 () Bool)

(assert (=> start!129302 (=> (not res!1038573) (not e!847189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129302 (= res!1038573 (validMask!0 mask!2512))))

(assert (=> start!129302 e!847189))

(assert (=> start!129302 true))

(declare-fun array_inv!37844 (array!101158) Bool)

(assert (=> start!129302 (array_inv!37844 a!2804)))

(declare-fun b!1518665 () Bool)

(declare-fun res!1038574 () Bool)

(assert (=> b!1518665 (=> (not res!1038574) (not e!847189))))

(assert (=> b!1518665 (= res!1038574 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49366 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49366 a!2804))))))

(declare-fun b!1518666 () Bool)

(declare-fun e!847185 () Bool)

(assert (=> b!1518666 (= e!847185 e!847187)))

(declare-fun res!1038572 () Bool)

(assert (=> b!1518666 (=> res!1038572 e!847187)))

(assert (=> b!1518666 (= res!1038572 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658281 #b00000000000000000000000000000000) (bvsge lt!658281 (size!49366 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518666 (= lt!658281 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518667 () Bool)

(declare-fun res!1038561 () Bool)

(assert (=> b!1518667 (=> (not res!1038561) (not e!847189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101158 (_ BitVec 32)) Bool)

(assert (=> b!1518667 (= res!1038561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518668 () Bool)

(declare-fun res!1038565 () Bool)

(assert (=> b!1518668 (=> (not res!1038565) (not e!847189))))

(assert (=> b!1518668 (= res!1038565 (validKeyInArray!0 (select (arr!48816 a!2804) i!961)))))

(declare-fun b!1518669 () Bool)

(assert (=> b!1518669 (= e!847186 (not e!847185))))

(declare-fun res!1038569 () Bool)

(assert (=> b!1518669 (=> res!1038569 e!847185)))

(assert (=> b!1518669 (= res!1038569 (or (not (= (select (arr!48816 a!2804) j!70) lt!658278)) (= x!534 resX!21)))))

(declare-fun e!847188 () Bool)

(assert (=> b!1518669 e!847188))

(declare-fun res!1038571 () Bool)

(assert (=> b!1518669 (=> (not res!1038571) (not e!847188))))

(assert (=> b!1518669 (= res!1038571 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658282 () Unit!50842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50842)

(assert (=> b!1518669 (= lt!658282 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518670 () Bool)

(declare-fun res!1038566 () Bool)

(assert (=> b!1518670 (=> (not res!1038566) (not e!847189))))

(assert (=> b!1518670 (= res!1038566 (and (= (size!49366 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49366 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49366 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518671 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101158 (_ BitVec 32)) SeekEntryResult!12987)

(assert (=> b!1518671 (= e!847188 (= (seekEntry!0 (select (arr!48816 a!2804) j!70) a!2804 mask!2512) (Found!12987 j!70)))))

(assert (= (and start!129302 res!1038573) b!1518670))

(assert (= (and b!1518670 res!1038566) b!1518668))

(assert (= (and b!1518668 res!1038565) b!1518662))

(assert (= (and b!1518662 res!1038563) b!1518667))

(assert (= (and b!1518667 res!1038561) b!1518661))

(assert (= (and b!1518661 res!1038562) b!1518665))

(assert (= (and b!1518665 res!1038574) b!1518660))

(assert (= (and b!1518660 res!1038564) b!1518664))

(assert (= (and b!1518664 res!1038570) b!1518663))

(assert (= (and b!1518663 res!1038568) b!1518669))

(assert (= (and b!1518669 res!1038571) b!1518671))

(assert (= (and b!1518669 (not res!1038569)) b!1518666))

(assert (= (and b!1518666 (not res!1038572)) b!1518659))

(assert (= (and b!1518659 (not res!1038567)) b!1518658))

(declare-fun m!1401989 () Bool)

(assert (=> b!1518659 m!1401989))

(assert (=> b!1518659 m!1401989))

(declare-fun m!1401991 () Bool)

(assert (=> b!1518659 m!1401991))

(declare-fun m!1401993 () Bool)

(assert (=> b!1518668 m!1401993))

(assert (=> b!1518668 m!1401993))

(declare-fun m!1401995 () Bool)

(assert (=> b!1518668 m!1401995))

(declare-fun m!1401997 () Bool)

(assert (=> start!129302 m!1401997))

(declare-fun m!1401999 () Bool)

(assert (=> start!129302 m!1401999))

(assert (=> b!1518658 m!1401989))

(assert (=> b!1518658 m!1401989))

(declare-fun m!1402001 () Bool)

(assert (=> b!1518658 m!1402001))

(declare-fun m!1402003 () Bool)

(assert (=> b!1518658 m!1402003))

(declare-fun m!1402005 () Bool)

(assert (=> b!1518658 m!1402005))

(assert (=> b!1518669 m!1401989))

(declare-fun m!1402007 () Bool)

(assert (=> b!1518669 m!1402007))

(declare-fun m!1402009 () Bool)

(assert (=> b!1518669 m!1402009))

(assert (=> b!1518662 m!1401989))

(assert (=> b!1518662 m!1401989))

(declare-fun m!1402011 () Bool)

(assert (=> b!1518662 m!1402011))

(declare-fun m!1402013 () Bool)

(assert (=> b!1518661 m!1402013))

(declare-fun m!1402015 () Bool)

(assert (=> b!1518663 m!1402015))

(assert (=> b!1518663 m!1402015))

(declare-fun m!1402017 () Bool)

(assert (=> b!1518663 m!1402017))

(declare-fun m!1402019 () Bool)

(assert (=> b!1518663 m!1402019))

(declare-fun m!1402021 () Bool)

(assert (=> b!1518663 m!1402021))

(assert (=> b!1518671 m!1401989))

(assert (=> b!1518671 m!1401989))

(declare-fun m!1402023 () Bool)

(assert (=> b!1518671 m!1402023))

(declare-fun m!1402025 () Bool)

(assert (=> b!1518667 m!1402025))

(assert (=> b!1518664 m!1401989))

(assert (=> b!1518664 m!1401989))

(declare-fun m!1402027 () Bool)

(assert (=> b!1518664 m!1402027))

(assert (=> b!1518660 m!1401989))

(assert (=> b!1518660 m!1401989))

(declare-fun m!1402029 () Bool)

(assert (=> b!1518660 m!1402029))

(assert (=> b!1518660 m!1402029))

(assert (=> b!1518660 m!1401989))

(declare-fun m!1402031 () Bool)

(assert (=> b!1518660 m!1402031))

(declare-fun m!1402033 () Bool)

(assert (=> b!1518666 m!1402033))

(check-sat (not b!1518664) (not b!1518658) (not b!1518659) (not b!1518669) (not b!1518671) (not b!1518660) (not b!1518662) (not b!1518661) (not b!1518666) (not b!1518663) (not start!129302) (not b!1518668) (not b!1518667))
(check-sat)
