; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129164 () Bool)

(assert start!129164)

(declare-fun b!1512036 () Bool)

(declare-fun res!1030771 () Bool)

(declare-fun e!844506 () Bool)

(assert (=> b!1512036 (=> (not res!1030771) (not e!844506))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100834 0))(
  ( (array!100835 (arr!48649 (Array (_ BitVec 32) (_ BitVec 64))) (size!49200 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100834)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512036 (= res!1030771 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49200 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49200 a!2804))))))

(declare-fun b!1512037 () Bool)

(declare-fun res!1030769 () Bool)

(assert (=> b!1512037 (=> (not res!1030769) (not e!844506))))

(declare-datatypes ((List!35119 0))(
  ( (Nil!35116) (Cons!35115 (h!36542 (_ BitVec 64)) (t!49805 List!35119)) )
))
(declare-fun arrayNoDuplicates!0 (array!100834 (_ BitVec 32) List!35119) Bool)

(assert (=> b!1512037 (= res!1030769 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35116))))

(declare-fun b!1512038 () Bool)

(declare-fun res!1030767 () Bool)

(declare-fun e!844503 () Bool)

(assert (=> b!1512038 (=> (not res!1030767) (not e!844503))))

(declare-datatypes ((SeekEntryResult!12713 0))(
  ( (MissingZero!12713 (index!53247 (_ BitVec 32))) (Found!12713 (index!53248 (_ BitVec 32))) (Intermediate!12713 (undefined!13525 Bool) (index!53249 (_ BitVec 32)) (x!135196 (_ BitVec 32))) (Undefined!12713) (MissingVacant!12713 (index!53250 (_ BitVec 32))) )
))
(declare-fun lt!655769 () SeekEntryResult!12713)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512038 (= res!1030767 (= lt!655769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100835 (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49200 a!2804)) mask!2512)))))

(declare-fun b!1512039 () Bool)

(declare-fun res!1030770 () Bool)

(assert (=> b!1512039 (=> (not res!1030770) (not e!844503))))

(declare-fun lt!655770 () SeekEntryResult!12713)

(assert (=> b!1512039 (= res!1030770 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) lt!655770))))

(declare-fun b!1512040 () Bool)

(declare-fun res!1030765 () Bool)

(assert (=> b!1512040 (=> (not res!1030765) (not e!844506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512040 (= res!1030765 (validKeyInArray!0 (select (arr!48649 a!2804) i!961)))))

(declare-fun res!1030762 () Bool)

(assert (=> start!129164 (=> (not res!1030762) (not e!844506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129164 (= res!1030762 (validMask!0 mask!2512))))

(assert (=> start!129164 e!844506))

(assert (=> start!129164 true))

(declare-fun array_inv!37930 (array!100834) Bool)

(assert (=> start!129164 (array_inv!37930 a!2804)))

(declare-fun b!1512041 () Bool)

(assert (=> b!1512041 (= e!844503 (not true))))

(declare-fun e!844505 () Bool)

(assert (=> b!1512041 e!844505))

(declare-fun res!1030772 () Bool)

(assert (=> b!1512041 (=> (not res!1030772) (not e!844505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100834 (_ BitVec 32)) Bool)

(assert (=> b!1512041 (= res!1030772 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50329 0))(
  ( (Unit!50330) )
))
(declare-fun lt!655771 () Unit!50329)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50329)

(assert (=> b!1512041 (= lt!655771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512042 () Bool)

(declare-fun res!1030768 () Bool)

(assert (=> b!1512042 (=> (not res!1030768) (not e!844506))))

(assert (=> b!1512042 (= res!1030768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512043 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12713)

(assert (=> b!1512043 (= e!844505 (= (seekEntry!0 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) (Found!12713 j!70)))))

(declare-fun b!1512044 () Bool)

(assert (=> b!1512044 (= e!844506 e!844503)))

(declare-fun res!1030763 () Bool)

(assert (=> b!1512044 (=> (not res!1030763) (not e!844503))))

(assert (=> b!1512044 (= res!1030763 (= lt!655769 lt!655770))))

(assert (=> b!1512044 (= lt!655770 (Intermediate!12713 false resIndex!21 resX!21))))

(assert (=> b!1512044 (= lt!655769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48649 a!2804) j!70) mask!2512) (select (arr!48649 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512045 () Bool)

(declare-fun res!1030766 () Bool)

(assert (=> b!1512045 (=> (not res!1030766) (not e!844506))))

(assert (=> b!1512045 (= res!1030766 (validKeyInArray!0 (select (arr!48649 a!2804) j!70)))))

(declare-fun b!1512046 () Bool)

(declare-fun res!1030764 () Bool)

(assert (=> b!1512046 (=> (not res!1030764) (not e!844506))))

(assert (=> b!1512046 (= res!1030764 (and (= (size!49200 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49200 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49200 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129164 res!1030762) b!1512046))

(assert (= (and b!1512046 res!1030764) b!1512040))

(assert (= (and b!1512040 res!1030765) b!1512045))

(assert (= (and b!1512045 res!1030766) b!1512042))

(assert (= (and b!1512042 res!1030768) b!1512037))

(assert (= (and b!1512037 res!1030769) b!1512036))

(assert (= (and b!1512036 res!1030771) b!1512044))

(assert (= (and b!1512044 res!1030763) b!1512039))

(assert (= (and b!1512039 res!1030770) b!1512038))

(assert (= (and b!1512038 res!1030767) b!1512041))

(assert (= (and b!1512041 res!1030772) b!1512043))

(declare-fun m!1394565 () Bool)

(assert (=> b!1512042 m!1394565))

(declare-fun m!1394567 () Bool)

(assert (=> b!1512039 m!1394567))

(assert (=> b!1512039 m!1394567))

(declare-fun m!1394569 () Bool)

(assert (=> b!1512039 m!1394569))

(assert (=> b!1512043 m!1394567))

(assert (=> b!1512043 m!1394567))

(declare-fun m!1394571 () Bool)

(assert (=> b!1512043 m!1394571))

(declare-fun m!1394573 () Bool)

(assert (=> b!1512037 m!1394573))

(assert (=> b!1512045 m!1394567))

(assert (=> b!1512045 m!1394567))

(declare-fun m!1394575 () Bool)

(assert (=> b!1512045 m!1394575))

(declare-fun m!1394577 () Bool)

(assert (=> b!1512040 m!1394577))

(assert (=> b!1512040 m!1394577))

(declare-fun m!1394579 () Bool)

(assert (=> b!1512040 m!1394579))

(declare-fun m!1394581 () Bool)

(assert (=> b!1512041 m!1394581))

(declare-fun m!1394583 () Bool)

(assert (=> b!1512041 m!1394583))

(declare-fun m!1394585 () Bool)

(assert (=> start!129164 m!1394585))

(declare-fun m!1394587 () Bool)

(assert (=> start!129164 m!1394587))

(assert (=> b!1512044 m!1394567))

(assert (=> b!1512044 m!1394567))

(declare-fun m!1394589 () Bool)

(assert (=> b!1512044 m!1394589))

(assert (=> b!1512044 m!1394589))

(assert (=> b!1512044 m!1394567))

(declare-fun m!1394591 () Bool)

(assert (=> b!1512044 m!1394591))

(declare-fun m!1394593 () Bool)

(assert (=> b!1512038 m!1394593))

(declare-fun m!1394595 () Bool)

(assert (=> b!1512038 m!1394595))

(assert (=> b!1512038 m!1394595))

(declare-fun m!1394597 () Bool)

(assert (=> b!1512038 m!1394597))

(assert (=> b!1512038 m!1394597))

(assert (=> b!1512038 m!1394595))

(declare-fun m!1394599 () Bool)

(assert (=> b!1512038 m!1394599))

(check-sat (not b!1512039) (not start!129164) (not b!1512043) (not b!1512037) (not b!1512044) (not b!1512038) (not b!1512042) (not b!1512045) (not b!1512040) (not b!1512041))
(check-sat)
