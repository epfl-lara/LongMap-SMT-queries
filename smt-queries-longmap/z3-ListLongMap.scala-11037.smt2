; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129056 () Bool)

(assert start!129056)

(declare-fun b!1513825 () Bool)

(declare-fun e!844866 () Bool)

(assert (=> b!1513825 (= e!844866 (not true))))

(declare-fun e!844862 () Bool)

(assert (=> b!1513825 e!844862))

(declare-fun res!1033737 () Bool)

(assert (=> b!1513825 (=> (not res!1033737) (not e!844862))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100912 0))(
  ( (array!100913 (arr!48693 (Array (_ BitVec 32) (_ BitVec 64))) (size!49243 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100912)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100912 (_ BitVec 32)) Bool)

(assert (=> b!1513825 (= res!1033737 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50596 0))(
  ( (Unit!50597) )
))
(declare-fun lt!656118 () Unit!50596)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50596)

(assert (=> b!1513825 (= lt!656118 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513826 () Bool)

(declare-fun res!1033734 () Bool)

(declare-fun e!844864 () Bool)

(assert (=> b!1513826 (=> (not res!1033734) (not e!844864))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513826 (= res!1033734 (validKeyInArray!0 (select (arr!48693 a!2804) j!70)))))

(declare-fun b!1513827 () Bool)

(declare-fun res!1033728 () Bool)

(assert (=> b!1513827 (=> (not res!1033728) (not e!844864))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513827 (= res!1033728 (validKeyInArray!0 (select (arr!48693 a!2804) i!961)))))

(declare-fun b!1513828 () Bool)

(declare-fun e!844865 () Bool)

(assert (=> b!1513828 (= e!844865 e!844866)))

(declare-fun res!1033735 () Bool)

(assert (=> b!1513828 (=> (not res!1033735) (not e!844866))))

(declare-fun lt!656119 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12864 0))(
  ( (MissingZero!12864 (index!53851 (_ BitVec 32))) (Found!12864 (index!53852 (_ BitVec 32))) (Intermediate!12864 (undefined!13676 Bool) (index!53853 (_ BitVec 32)) (x!135566 (_ BitVec 32))) (Undefined!12864) (MissingVacant!12864 (index!53854 (_ BitVec 32))) )
))
(declare-fun lt!656115 () SeekEntryResult!12864)

(declare-fun lt!656117 () array!100912)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513828 (= res!1033735 (= lt!656115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656119 mask!2512) lt!656119 lt!656117 mask!2512)))))

(assert (=> b!1513828 (= lt!656119 (select (store (arr!48693 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513828 (= lt!656117 (array!100913 (store (arr!48693 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49243 a!2804)))))

(declare-fun res!1033731 () Bool)

(assert (=> start!129056 (=> (not res!1033731) (not e!844864))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129056 (= res!1033731 (validMask!0 mask!2512))))

(assert (=> start!129056 e!844864))

(assert (=> start!129056 true))

(declare-fun array_inv!37721 (array!100912) Bool)

(assert (=> start!129056 (array_inv!37721 a!2804)))

(declare-fun b!1513829 () Bool)

(declare-fun res!1033729 () Bool)

(assert (=> b!1513829 (=> (not res!1033729) (not e!844864))))

(assert (=> b!1513829 (= res!1033729 (and (= (size!49243 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49243 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49243 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513830 () Bool)

(declare-fun res!1033739 () Bool)

(assert (=> b!1513830 (=> (not res!1033739) (not e!844864))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513830 (= res!1033739 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49243 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49243 a!2804))))))

(declare-fun b!1513831 () Bool)

(declare-fun res!1033738 () Bool)

(assert (=> b!1513831 (=> (not res!1033738) (not e!844864))))

(assert (=> b!1513831 (= res!1033738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513832 () Bool)

(assert (=> b!1513832 (= e!844864 e!844865)))

(declare-fun res!1033741 () Bool)

(assert (=> b!1513832 (=> (not res!1033741) (not e!844865))))

(declare-fun lt!656116 () SeekEntryResult!12864)

(assert (=> b!1513832 (= res!1033741 (= lt!656115 lt!656116))))

(assert (=> b!1513832 (= lt!656116 (Intermediate!12864 false resIndex!21 resX!21))))

(assert (=> b!1513832 (= lt!656115 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48693 a!2804) j!70) mask!2512) (select (arr!48693 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513833 () Bool)

(declare-fun e!844861 () Bool)

(assert (=> b!1513833 (= e!844862 e!844861)))

(declare-fun res!1033730 () Bool)

(assert (=> b!1513833 (=> res!1033730 e!844861)))

(assert (=> b!1513833 (= res!1033730 (or (not (= (select (arr!48693 a!2804) j!70) lt!656119)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48693 a!2804) index!487) (select (arr!48693 a!2804) j!70)) (not (= (select (arr!48693 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513834 () Bool)

(declare-fun e!844863 () Bool)

(assert (=> b!1513834 (= e!844861 e!844863)))

(declare-fun res!1033732 () Bool)

(assert (=> b!1513834 (=> (not res!1033732) (not e!844863))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12864)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12864)

(assert (=> b!1513834 (= res!1033732 (= (seekEntryOrOpen!0 (select (arr!48693 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48693 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513835 () Bool)

(declare-fun res!1033740 () Bool)

(assert (=> b!1513835 (=> (not res!1033740) (not e!844864))))

(declare-datatypes ((List!35176 0))(
  ( (Nil!35173) (Cons!35172 (h!36584 (_ BitVec 64)) (t!49870 List!35176)) )
))
(declare-fun arrayNoDuplicates!0 (array!100912 (_ BitVec 32) List!35176) Bool)

(assert (=> b!1513835 (= res!1033740 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35173))))

(declare-fun b!1513836 () Bool)

(assert (=> b!1513836 (= e!844863 (= (seekEntryOrOpen!0 lt!656119 lt!656117 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656119 lt!656117 mask!2512)))))

(declare-fun b!1513837 () Bool)

(declare-fun res!1033733 () Bool)

(assert (=> b!1513837 (=> (not res!1033733) (not e!844865))))

(assert (=> b!1513837 (= res!1033733 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48693 a!2804) j!70) a!2804 mask!2512) lt!656116))))

(declare-fun b!1513838 () Bool)

(declare-fun res!1033736 () Bool)

(assert (=> b!1513838 (=> (not res!1033736) (not e!844862))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100912 (_ BitVec 32)) SeekEntryResult!12864)

(assert (=> b!1513838 (= res!1033736 (= (seekEntry!0 (select (arr!48693 a!2804) j!70) a!2804 mask!2512) (Found!12864 j!70)))))

(assert (= (and start!129056 res!1033731) b!1513829))

(assert (= (and b!1513829 res!1033729) b!1513827))

(assert (= (and b!1513827 res!1033728) b!1513826))

(assert (= (and b!1513826 res!1033734) b!1513831))

(assert (= (and b!1513831 res!1033738) b!1513835))

(assert (= (and b!1513835 res!1033740) b!1513830))

(assert (= (and b!1513830 res!1033739) b!1513832))

(assert (= (and b!1513832 res!1033741) b!1513837))

(assert (= (and b!1513837 res!1033733) b!1513828))

(assert (= (and b!1513828 res!1033735) b!1513825))

(assert (= (and b!1513825 res!1033737) b!1513838))

(assert (= (and b!1513838 res!1033736) b!1513833))

(assert (= (and b!1513833 (not res!1033730)) b!1513834))

(assert (= (and b!1513834 res!1033732) b!1513836))

(declare-fun m!1396721 () Bool)

(assert (=> b!1513833 m!1396721))

(declare-fun m!1396723 () Bool)

(assert (=> b!1513833 m!1396723))

(assert (=> b!1513826 m!1396721))

(assert (=> b!1513826 m!1396721))

(declare-fun m!1396725 () Bool)

(assert (=> b!1513826 m!1396725))

(declare-fun m!1396727 () Bool)

(assert (=> b!1513831 m!1396727))

(assert (=> b!1513837 m!1396721))

(assert (=> b!1513837 m!1396721))

(declare-fun m!1396729 () Bool)

(assert (=> b!1513837 m!1396729))

(assert (=> b!1513832 m!1396721))

(assert (=> b!1513832 m!1396721))

(declare-fun m!1396731 () Bool)

(assert (=> b!1513832 m!1396731))

(assert (=> b!1513832 m!1396731))

(assert (=> b!1513832 m!1396721))

(declare-fun m!1396733 () Bool)

(assert (=> b!1513832 m!1396733))

(declare-fun m!1396735 () Bool)

(assert (=> b!1513825 m!1396735))

(declare-fun m!1396737 () Bool)

(assert (=> b!1513825 m!1396737))

(declare-fun m!1396739 () Bool)

(assert (=> b!1513827 m!1396739))

(assert (=> b!1513827 m!1396739))

(declare-fun m!1396741 () Bool)

(assert (=> b!1513827 m!1396741))

(declare-fun m!1396743 () Bool)

(assert (=> start!129056 m!1396743))

(declare-fun m!1396745 () Bool)

(assert (=> start!129056 m!1396745))

(declare-fun m!1396747 () Bool)

(assert (=> b!1513828 m!1396747))

(assert (=> b!1513828 m!1396747))

(declare-fun m!1396749 () Bool)

(assert (=> b!1513828 m!1396749))

(declare-fun m!1396751 () Bool)

(assert (=> b!1513828 m!1396751))

(declare-fun m!1396753 () Bool)

(assert (=> b!1513828 m!1396753))

(assert (=> b!1513838 m!1396721))

(assert (=> b!1513838 m!1396721))

(declare-fun m!1396755 () Bool)

(assert (=> b!1513838 m!1396755))

(declare-fun m!1396757 () Bool)

(assert (=> b!1513836 m!1396757))

(declare-fun m!1396759 () Bool)

(assert (=> b!1513836 m!1396759))

(assert (=> b!1513834 m!1396721))

(assert (=> b!1513834 m!1396721))

(declare-fun m!1396761 () Bool)

(assert (=> b!1513834 m!1396761))

(assert (=> b!1513834 m!1396721))

(declare-fun m!1396763 () Bool)

(assert (=> b!1513834 m!1396763))

(declare-fun m!1396765 () Bool)

(assert (=> b!1513835 m!1396765))

(check-sat (not start!129056) (not b!1513836) (not b!1513835) (not b!1513826) (not b!1513834) (not b!1513832) (not b!1513838) (not b!1513831) (not b!1513837) (not b!1513827) (not b!1513825) (not b!1513828))
(check-sat)
