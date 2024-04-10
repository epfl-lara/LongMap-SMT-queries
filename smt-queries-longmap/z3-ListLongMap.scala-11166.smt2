; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130540 () Bool)

(assert start!130540)

(declare-fun b!1531999 () Bool)

(declare-fun e!853613 () Bool)

(declare-fun e!853609 () Bool)

(assert (=> b!1531999 (= e!853613 e!853609)))

(declare-fun res!1049152 () Bool)

(assert (=> b!1531999 (=> res!1049152 e!853609)))

(declare-fun lt!663490 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101719 0))(
  ( (array!101720 (arr!49080 (Array (_ BitVec 32) (_ BitVec 64))) (size!49630 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101719)

(assert (=> b!1531999 (= res!1049152 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663490 #b00000000000000000000000000000000) (bvsge lt!663490 (size!49630 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531999 (= lt!663490 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1532000 () Bool)

(declare-fun e!853614 () Bool)

(assert (=> b!1532000 (= e!853614 (not e!853613))))

(declare-fun res!1049140 () Bool)

(assert (=> b!1532000 (=> res!1049140 e!853613)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!663487 () (_ BitVec 64))

(assert (=> b!1532000 (= res!1049140 (or (not (= (select (arr!49080 a!2804) j!70) lt!663487)) (= x!534 resX!21)))))

(declare-fun e!853612 () Bool)

(assert (=> b!1532000 e!853612))

(declare-fun res!1049143 () Bool)

(assert (=> b!1532000 (=> (not res!1049143) (not e!853612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101719 (_ BitVec 32)) Bool)

(assert (=> b!1532000 (= res!1049143 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51274 0))(
  ( (Unit!51275) )
))
(declare-fun lt!663486 () Unit!51274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51274)

(assert (=> b!1532000 (= lt!663486 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532001 () Bool)

(declare-fun res!1049147 () Bool)

(declare-fun e!853615 () Bool)

(assert (=> b!1532001 (=> (not res!1049147) (not e!853615))))

(declare-datatypes ((SeekEntryResult!13245 0))(
  ( (MissingZero!13245 (index!55375 (_ BitVec 32))) (Found!13245 (index!55376 (_ BitVec 32))) (Intermediate!13245 (undefined!14057 Bool) (index!55377 (_ BitVec 32)) (x!137071 (_ BitVec 32))) (Undefined!13245) (MissingVacant!13245 (index!55378 (_ BitVec 32))) )
))
(declare-fun lt!663489 () SeekEntryResult!13245)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101719 (_ BitVec 32)) SeekEntryResult!13245)

(assert (=> b!1532001 (= res!1049147 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49080 a!2804) j!70) a!2804 mask!2512) lt!663489))))

(declare-fun b!1532003 () Bool)

(declare-fun res!1049150 () Bool)

(assert (=> b!1532003 (=> res!1049150 e!853609)))

(assert (=> b!1532003 (= res!1049150 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663490 (select (arr!49080 a!2804) j!70) a!2804 mask!2512) lt!663489)))))

(declare-fun b!1532004 () Bool)

(declare-fun e!853610 () Bool)

(assert (=> b!1532004 (= e!853610 e!853615)))

(declare-fun res!1049149 () Bool)

(assert (=> b!1532004 (=> (not res!1049149) (not e!853615))))

(declare-fun lt!663484 () SeekEntryResult!13245)

(assert (=> b!1532004 (= res!1049149 (= lt!663484 lt!663489))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1532004 (= lt!663489 (Intermediate!13245 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532004 (= lt!663484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49080 a!2804) j!70) mask!2512) (select (arr!49080 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532005 () Bool)

(declare-fun res!1049151 () Bool)

(assert (=> b!1532005 (=> (not res!1049151) (not e!853610))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1532005 (= res!1049151 (and (= (size!49630 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49630 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49630 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532006 () Bool)

(declare-fun res!1049148 () Bool)

(assert (=> b!1532006 (=> (not res!1049148) (not e!853610))))

(assert (=> b!1532006 (= res!1049148 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49630 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49630 a!2804))))))

(declare-fun b!1532007 () Bool)

(declare-fun res!1049142 () Bool)

(assert (=> b!1532007 (=> (not res!1049142) (not e!853610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532007 (= res!1049142 (validKeyInArray!0 (select (arr!49080 a!2804) i!961)))))

(declare-fun b!1532008 () Bool)

(declare-fun res!1049141 () Bool)

(assert (=> b!1532008 (=> (not res!1049141) (not e!853610))))

(declare-datatypes ((List!35563 0))(
  ( (Nil!35560) (Cons!35559 (h!37004 (_ BitVec 64)) (t!50257 List!35563)) )
))
(declare-fun arrayNoDuplicates!0 (array!101719 (_ BitVec 32) List!35563) Bool)

(assert (=> b!1532008 (= res!1049141 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35560))))

(declare-fun b!1532009 () Bool)

(assert (=> b!1532009 (= e!853615 e!853614)))

(declare-fun res!1049146 () Bool)

(assert (=> b!1532009 (=> (not res!1049146) (not e!853614))))

(declare-fun lt!663488 () array!101719)

(assert (=> b!1532009 (= res!1049146 (= lt!663484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663487 mask!2512) lt!663487 lt!663488 mask!2512)))))

(assert (=> b!1532009 (= lt!663487 (select (store (arr!49080 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1532009 (= lt!663488 (array!101720 (store (arr!49080 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49630 a!2804)))))

(declare-fun b!1532010 () Bool)

(declare-fun res!1049144 () Bool)

(assert (=> b!1532010 (=> (not res!1049144) (not e!853610))))

(assert (=> b!1532010 (= res!1049144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532002 () Bool)

(declare-fun res!1049145 () Bool)

(assert (=> b!1532002 (=> (not res!1049145) (not e!853610))))

(assert (=> b!1532002 (= res!1049145 (validKeyInArray!0 (select (arr!49080 a!2804) j!70)))))

(declare-fun res!1049139 () Bool)

(assert (=> start!130540 (=> (not res!1049139) (not e!853610))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130540 (= res!1049139 (validMask!0 mask!2512))))

(assert (=> start!130540 e!853610))

(assert (=> start!130540 true))

(declare-fun array_inv!38108 (array!101719) Bool)

(assert (=> start!130540 (array_inv!38108 a!2804)))

(declare-fun b!1532011 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101719 (_ BitVec 32)) SeekEntryResult!13245)

(assert (=> b!1532011 (= e!853612 (= (seekEntry!0 (select (arr!49080 a!2804) j!70) a!2804 mask!2512) (Found!13245 j!70)))))

(declare-fun b!1532012 () Bool)

(assert (=> b!1532012 (= e!853609 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101719 (_ BitVec 32)) SeekEntryResult!13245)

(assert (=> b!1532012 (= (seekEntryOrOpen!0 (select (arr!49080 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663487 lt!663488 mask!2512))))

(declare-fun lt!663485 () Unit!51274)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51274)

(assert (=> b!1532012 (= lt!663485 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663490 resX!21 resIndex!21 mask!2512))))

(assert (= (and start!130540 res!1049139) b!1532005))

(assert (= (and b!1532005 res!1049151) b!1532007))

(assert (= (and b!1532007 res!1049142) b!1532002))

(assert (= (and b!1532002 res!1049145) b!1532010))

(assert (= (and b!1532010 res!1049144) b!1532008))

(assert (= (and b!1532008 res!1049141) b!1532006))

(assert (= (and b!1532006 res!1049148) b!1532004))

(assert (= (and b!1532004 res!1049149) b!1532001))

(assert (= (and b!1532001 res!1049147) b!1532009))

(assert (= (and b!1532009 res!1049146) b!1532000))

(assert (= (and b!1532000 res!1049143) b!1532011))

(assert (= (and b!1532000 (not res!1049140)) b!1531999))

(assert (= (and b!1531999 (not res!1049152)) b!1532003))

(assert (= (and b!1532003 (not res!1049150)) b!1532012))

(declare-fun m!1414681 () Bool)

(assert (=> b!1532009 m!1414681))

(assert (=> b!1532009 m!1414681))

(declare-fun m!1414683 () Bool)

(assert (=> b!1532009 m!1414683))

(declare-fun m!1414685 () Bool)

(assert (=> b!1532009 m!1414685))

(declare-fun m!1414687 () Bool)

(assert (=> b!1532009 m!1414687))

(declare-fun m!1414689 () Bool)

(assert (=> b!1532010 m!1414689))

(declare-fun m!1414691 () Bool)

(assert (=> b!1532001 m!1414691))

(assert (=> b!1532001 m!1414691))

(declare-fun m!1414693 () Bool)

(assert (=> b!1532001 m!1414693))

(assert (=> b!1532002 m!1414691))

(assert (=> b!1532002 m!1414691))

(declare-fun m!1414695 () Bool)

(assert (=> b!1532002 m!1414695))

(declare-fun m!1414697 () Bool)

(assert (=> b!1531999 m!1414697))

(assert (=> b!1532011 m!1414691))

(assert (=> b!1532011 m!1414691))

(declare-fun m!1414699 () Bool)

(assert (=> b!1532011 m!1414699))

(assert (=> b!1532012 m!1414691))

(assert (=> b!1532012 m!1414691))

(declare-fun m!1414701 () Bool)

(assert (=> b!1532012 m!1414701))

(declare-fun m!1414703 () Bool)

(assert (=> b!1532012 m!1414703))

(declare-fun m!1414705 () Bool)

(assert (=> b!1532012 m!1414705))

(assert (=> b!1532000 m!1414691))

(declare-fun m!1414707 () Bool)

(assert (=> b!1532000 m!1414707))

(declare-fun m!1414709 () Bool)

(assert (=> b!1532000 m!1414709))

(assert (=> b!1532003 m!1414691))

(assert (=> b!1532003 m!1414691))

(declare-fun m!1414711 () Bool)

(assert (=> b!1532003 m!1414711))

(declare-fun m!1414713 () Bool)

(assert (=> b!1532008 m!1414713))

(declare-fun m!1414715 () Bool)

(assert (=> start!130540 m!1414715))

(declare-fun m!1414717 () Bool)

(assert (=> start!130540 m!1414717))

(declare-fun m!1414719 () Bool)

(assert (=> b!1532007 m!1414719))

(assert (=> b!1532007 m!1414719))

(declare-fun m!1414721 () Bool)

(assert (=> b!1532007 m!1414721))

(assert (=> b!1532004 m!1414691))

(assert (=> b!1532004 m!1414691))

(declare-fun m!1414723 () Bool)

(assert (=> b!1532004 m!1414723))

(assert (=> b!1532004 m!1414723))

(assert (=> b!1532004 m!1414691))

(declare-fun m!1414725 () Bool)

(assert (=> b!1532004 m!1414725))

(check-sat (not b!1532010) (not b!1532007) (not b!1532011) (not b!1532000) (not b!1532012) (not b!1532001) (not b!1532002) (not start!130540) (not b!1532004) (not b!1532009) (not b!1532003) (not b!1532008) (not b!1531999))
