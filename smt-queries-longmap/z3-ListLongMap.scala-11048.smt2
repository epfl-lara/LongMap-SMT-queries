; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129422 () Bool)

(assert start!129422)

(declare-fun b!1516990 () Bool)

(declare-fun res!1035717 () Bool)

(declare-fun e!846675 () Bool)

(assert (=> b!1516990 (=> (not res!1035717) (not e!846675))))

(declare-datatypes ((array!101092 0))(
  ( (array!101093 (arr!48778 (Array (_ BitVec 32) (_ BitVec 64))) (size!49329 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101092)

(declare-datatypes ((List!35248 0))(
  ( (Nil!35245) (Cons!35244 (h!36671 (_ BitVec 64)) (t!49934 List!35248)) )
))
(declare-fun arrayNoDuplicates!0 (array!101092 (_ BitVec 32) List!35248) Bool)

(assert (=> b!1516990 (= res!1035717 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35245))))

(declare-fun b!1516991 () Bool)

(declare-fun e!846670 () Bool)

(declare-fun e!846671 () Bool)

(assert (=> b!1516991 (= e!846670 e!846671)))

(declare-fun res!1035718 () Bool)

(assert (=> b!1516991 (=> (not res!1035718) (not e!846671))))

(declare-datatypes ((SeekEntryResult!12842 0))(
  ( (MissingZero!12842 (index!53763 (_ BitVec 32))) (Found!12842 (index!53764 (_ BitVec 32))) (Intermediate!12842 (undefined!13654 Bool) (index!53765 (_ BitVec 32)) (x!135669 (_ BitVec 32))) (Undefined!12842) (MissingVacant!12842 (index!53766 (_ BitVec 32))) )
))
(declare-fun lt!657319 () SeekEntryResult!12842)

(declare-fun lt!657316 () array!101092)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!657318 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516991 (= res!1035718 (= lt!657319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657318 mask!2512) lt!657318 lt!657316 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1516991 (= lt!657318 (select (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1516991 (= lt!657316 (array!101093 (store (arr!48778 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49329 a!2804)))))

(declare-fun b!1516992 () Bool)

(declare-fun res!1035716 () Bool)

(assert (=> b!1516992 (=> (not res!1035716) (not e!846670))))

(declare-fun lt!657314 () SeekEntryResult!12842)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516992 (= res!1035716 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48778 a!2804) j!70) a!2804 mask!2512) lt!657314))))

(declare-fun b!1516993 () Bool)

(declare-fun res!1035719 () Bool)

(assert (=> b!1516993 (=> (not res!1035719) (not e!846675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516993 (= res!1035719 (validKeyInArray!0 (select (arr!48778 a!2804) i!961)))))

(declare-fun b!1516994 () Bool)

(declare-fun e!846674 () Bool)

(assert (=> b!1516994 (= e!846674 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!657322 () SeekEntryResult!12842)

(declare-fun lt!657315 () SeekEntryResult!12842)

(assert (=> b!1516994 (= lt!657322 lt!657315)))

(declare-datatypes ((Unit!50587 0))(
  ( (Unit!50588) )
))
(declare-fun lt!657313 () Unit!50587)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50587)

(assert (=> b!1516994 (= lt!657313 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1516995 () Bool)

(assert (=> b!1516995 (= e!846675 e!846670)))

(declare-fun res!1035720 () Bool)

(assert (=> b!1516995 (=> (not res!1035720) (not e!846670))))

(assert (=> b!1516995 (= res!1035720 (= lt!657319 lt!657314))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516995 (= lt!657314 (Intermediate!12842 false resIndex!21 resX!21))))

(assert (=> b!1516995 (= lt!657319 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48778 a!2804) j!70) mask!2512) (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516996 () Bool)

(declare-fun e!846672 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12842)

(assert (=> b!1516996 (= e!846672 (= (seekEntry!0 (select (arr!48778 a!2804) j!70) a!2804 mask!2512) (Found!12842 j!70)))))

(declare-fun b!1516997 () Bool)

(declare-fun res!1035723 () Bool)

(assert (=> b!1516997 (=> (not res!1035723) (not e!846675))))

(assert (=> b!1516997 (= res!1035723 (validKeyInArray!0 (select (arr!48778 a!2804) j!70)))))

(declare-fun b!1516998 () Bool)

(declare-fun res!1035728 () Bool)

(assert (=> b!1516998 (=> (not res!1035728) (not e!846675))))

(assert (=> b!1516998 (= res!1035728 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49329 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49329 a!2804))))))

(declare-fun b!1517000 () Bool)

(declare-fun e!846669 () Bool)

(assert (=> b!1517000 (= e!846671 (not e!846669))))

(declare-fun res!1035724 () Bool)

(assert (=> b!1517000 (=> res!1035724 e!846669)))

(assert (=> b!1517000 (= res!1035724 (or (not (= (select (arr!48778 a!2804) j!70) lt!657318)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48778 a!2804) index!487) (select (arr!48778 a!2804) j!70)) (not (= (select (arr!48778 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1517000 e!846672))

(declare-fun res!1035727 () Bool)

(assert (=> b!1517000 (=> (not res!1035727) (not e!846672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101092 (_ BitVec 32)) Bool)

(assert (=> b!1517000 (= res!1035727 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657317 () Unit!50587)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50587)

(assert (=> b!1517000 (= lt!657317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516999 () Bool)

(declare-fun res!1035725 () Bool)

(assert (=> b!1516999 (=> (not res!1035725) (not e!846675))))

(assert (=> b!1516999 (= res!1035725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1035722 () Bool)

(assert (=> start!129422 (=> (not res!1035722) (not e!846675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129422 (= res!1035722 (validMask!0 mask!2512))))

(assert (=> start!129422 e!846675))

(assert (=> start!129422 true))

(declare-fun array_inv!38059 (array!101092) Bool)

(assert (=> start!129422 (array_inv!38059 a!2804)))

(declare-fun b!1517001 () Bool)

(declare-fun res!1035726 () Bool)

(assert (=> b!1517001 (=> (not res!1035726) (not e!846675))))

(assert (=> b!1517001 (= res!1035726 (and (= (size!49329 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49329 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49329 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517002 () Bool)

(assert (=> b!1517002 (= e!846669 e!846674)))

(declare-fun res!1035721 () Bool)

(assert (=> b!1517002 (=> res!1035721 e!846674)))

(assert (=> b!1517002 (= res!1035721 (not (= lt!657315 (Found!12842 j!70))))))

(declare-fun lt!657320 () SeekEntryResult!12842)

(assert (=> b!1517002 (= lt!657320 lt!657322)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12842)

(assert (=> b!1517002 (= lt!657322 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657318 lt!657316 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12842)

(assert (=> b!1517002 (= lt!657320 (seekEntryOrOpen!0 lt!657318 lt!657316 mask!2512))))

(declare-fun lt!657321 () SeekEntryResult!12842)

(assert (=> b!1517002 (= lt!657321 lt!657315)))

(assert (=> b!1517002 (= lt!657315 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517002 (= lt!657321 (seekEntryOrOpen!0 (select (arr!48778 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129422 res!1035722) b!1517001))

(assert (= (and b!1517001 res!1035726) b!1516993))

(assert (= (and b!1516993 res!1035719) b!1516997))

(assert (= (and b!1516997 res!1035723) b!1516999))

(assert (= (and b!1516999 res!1035725) b!1516990))

(assert (= (and b!1516990 res!1035717) b!1516998))

(assert (= (and b!1516998 res!1035728) b!1516995))

(assert (= (and b!1516995 res!1035720) b!1516992))

(assert (= (and b!1516992 res!1035716) b!1516991))

(assert (= (and b!1516991 res!1035718) b!1517000))

(assert (= (and b!1517000 res!1035727) b!1516996))

(assert (= (and b!1517000 (not res!1035724)) b!1517002))

(assert (= (and b!1517002 (not res!1035721)) b!1516994))

(declare-fun m!1399995 () Bool)

(assert (=> b!1516990 m!1399995))

(declare-fun m!1399997 () Bool)

(assert (=> b!1516993 m!1399997))

(assert (=> b!1516993 m!1399997))

(declare-fun m!1399999 () Bool)

(assert (=> b!1516993 m!1399999))

(declare-fun m!1400001 () Bool)

(assert (=> b!1517002 m!1400001))

(declare-fun m!1400003 () Bool)

(assert (=> b!1517002 m!1400003))

(assert (=> b!1517002 m!1400001))

(declare-fun m!1400005 () Bool)

(assert (=> b!1517002 m!1400005))

(declare-fun m!1400007 () Bool)

(assert (=> b!1517002 m!1400007))

(assert (=> b!1517002 m!1400001))

(declare-fun m!1400009 () Bool)

(assert (=> b!1517002 m!1400009))

(assert (=> b!1517000 m!1400001))

(declare-fun m!1400011 () Bool)

(assert (=> b!1517000 m!1400011))

(declare-fun m!1400013 () Bool)

(assert (=> b!1517000 m!1400013))

(declare-fun m!1400015 () Bool)

(assert (=> b!1517000 m!1400015))

(declare-fun m!1400017 () Bool)

(assert (=> b!1516999 m!1400017))

(assert (=> b!1516995 m!1400001))

(assert (=> b!1516995 m!1400001))

(declare-fun m!1400019 () Bool)

(assert (=> b!1516995 m!1400019))

(assert (=> b!1516995 m!1400019))

(assert (=> b!1516995 m!1400001))

(declare-fun m!1400021 () Bool)

(assert (=> b!1516995 m!1400021))

(declare-fun m!1400023 () Bool)

(assert (=> b!1516994 m!1400023))

(assert (=> b!1516992 m!1400001))

(assert (=> b!1516992 m!1400001))

(declare-fun m!1400025 () Bool)

(assert (=> b!1516992 m!1400025))

(assert (=> b!1516997 m!1400001))

(assert (=> b!1516997 m!1400001))

(declare-fun m!1400027 () Bool)

(assert (=> b!1516997 m!1400027))

(declare-fun m!1400029 () Bool)

(assert (=> start!129422 m!1400029))

(declare-fun m!1400031 () Bool)

(assert (=> start!129422 m!1400031))

(declare-fun m!1400033 () Bool)

(assert (=> b!1516991 m!1400033))

(assert (=> b!1516991 m!1400033))

(declare-fun m!1400035 () Bool)

(assert (=> b!1516991 m!1400035))

(declare-fun m!1400037 () Bool)

(assert (=> b!1516991 m!1400037))

(declare-fun m!1400039 () Bool)

(assert (=> b!1516991 m!1400039))

(assert (=> b!1516996 m!1400001))

(assert (=> b!1516996 m!1400001))

(declare-fun m!1400041 () Bool)

(assert (=> b!1516996 m!1400041))

(check-sat (not b!1517000) (not b!1516990) (not b!1516991) (not b!1516995) (not b!1517002) (not b!1516997) (not start!129422) (not b!1516992) (not b!1516993) (not b!1516999) (not b!1516994) (not b!1516996))
(check-sat)
