; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129260 () Bool)

(assert start!129260)

(declare-fun b!1517825 () Bool)

(declare-fun res!1037732 () Bool)

(declare-fun e!846792 () Bool)

(assert (=> b!1517825 (=> (not res!1037732) (not e!846792))))

(declare-datatypes ((array!101116 0))(
  ( (array!101117 (arr!48795 (Array (_ BitVec 32) (_ BitVec 64))) (size!49345 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101116)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101116 (_ BitVec 32)) Bool)

(assert (=> b!1517825 (= res!1037732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517826 () Bool)

(declare-fun res!1037736 () Bool)

(assert (=> b!1517826 (=> (not res!1037736) (not e!846792))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517826 (= res!1037736 (validKeyInArray!0 (select (arr!48795 a!2804) j!70)))))

(declare-fun b!1517827 () Bool)

(declare-fun res!1037740 () Bool)

(assert (=> b!1517827 (=> (not res!1037740) (not e!846792))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1517827 (= res!1037740 (and (= (size!49345 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49345 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49345 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517829 () Bool)

(declare-fun res!1037730 () Bool)

(declare-fun e!846794 () Bool)

(assert (=> b!1517829 (=> (not res!1037730) (not e!846794))))

(declare-datatypes ((SeekEntryResult!12966 0))(
  ( (MissingZero!12966 (index!54259 (_ BitVec 32))) (Found!12966 (index!54260 (_ BitVec 32))) (Intermediate!12966 (undefined!13778 Bool) (index!54261 (_ BitVec 32)) (x!135940 (_ BitVec 32))) (Undefined!12966) (MissingVacant!12966 (index!54262 (_ BitVec 32))) )
))
(declare-fun lt!657934 () SeekEntryResult!12966)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12966)

(assert (=> b!1517829 (= res!1037730 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48795 a!2804) j!70) a!2804 mask!2512) lt!657934))))

(declare-fun b!1517830 () Bool)

(declare-fun e!846793 () Bool)

(assert (=> b!1517830 (= e!846794 (not e!846793))))

(declare-fun res!1037728 () Bool)

(assert (=> b!1517830 (=> res!1037728 e!846793)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1517830 (= res!1037728 (or (not (= (select (arr!48795 a!2804) j!70) (select (store (arr!48795 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846791 () Bool)

(assert (=> b!1517830 e!846791))

(declare-fun res!1037738 () Bool)

(assert (=> b!1517830 (=> (not res!1037738) (not e!846791))))

(assert (=> b!1517830 (= res!1037738 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50800 0))(
  ( (Unit!50801) )
))
(declare-fun lt!657936 () Unit!50800)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50800)

(assert (=> b!1517830 (= lt!657936 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517831 () Bool)

(declare-fun res!1037735 () Bool)

(assert (=> b!1517831 (=> (not res!1037735) (not e!846794))))

(declare-fun lt!657933 () SeekEntryResult!12966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517831 (= res!1037735 (= lt!657933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48795 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48795 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101117 (store (arr!48795 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49345 a!2804)) mask!2512)))))

(declare-fun b!1517828 () Bool)

(declare-fun e!846796 () Bool)

(assert (=> b!1517828 (= e!846796 true)))

(declare-fun lt!657937 () (_ BitVec 32))

(declare-fun lt!657935 () SeekEntryResult!12966)

(assert (=> b!1517828 (= lt!657935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657937 (select (arr!48795 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1037737 () Bool)

(assert (=> start!129260 (=> (not res!1037737) (not e!846792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129260 (= res!1037737 (validMask!0 mask!2512))))

(assert (=> start!129260 e!846792))

(assert (=> start!129260 true))

(declare-fun array_inv!37823 (array!101116) Bool)

(assert (=> start!129260 (array_inv!37823 a!2804)))

(declare-fun b!1517832 () Bool)

(assert (=> b!1517832 (= e!846792 e!846794)))

(declare-fun res!1037729 () Bool)

(assert (=> b!1517832 (=> (not res!1037729) (not e!846794))))

(assert (=> b!1517832 (= res!1037729 (= lt!657933 lt!657934))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517832 (= lt!657934 (Intermediate!12966 false resIndex!21 resX!21))))

(assert (=> b!1517832 (= lt!657933 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48795 a!2804) j!70) mask!2512) (select (arr!48795 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517833 () Bool)

(declare-fun res!1037734 () Bool)

(assert (=> b!1517833 (=> (not res!1037734) (not e!846792))))

(declare-datatypes ((List!35278 0))(
  ( (Nil!35275) (Cons!35274 (h!36686 (_ BitVec 64)) (t!49972 List!35278)) )
))
(declare-fun arrayNoDuplicates!0 (array!101116 (_ BitVec 32) List!35278) Bool)

(assert (=> b!1517833 (= res!1037734 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35275))))

(declare-fun b!1517834 () Bool)

(assert (=> b!1517834 (= e!846793 e!846796)))

(declare-fun res!1037731 () Bool)

(assert (=> b!1517834 (=> res!1037731 e!846796)))

(assert (=> b!1517834 (= res!1037731 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657937 #b00000000000000000000000000000000) (bvsge lt!657937 (size!49345 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517834 (= lt!657937 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517835 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101116 (_ BitVec 32)) SeekEntryResult!12966)

(assert (=> b!1517835 (= e!846791 (= (seekEntry!0 (select (arr!48795 a!2804) j!70) a!2804 mask!2512) (Found!12966 j!70)))))

(declare-fun b!1517836 () Bool)

(declare-fun res!1037733 () Bool)

(assert (=> b!1517836 (=> (not res!1037733) (not e!846792))))

(assert (=> b!1517836 (= res!1037733 (validKeyInArray!0 (select (arr!48795 a!2804) i!961)))))

(declare-fun b!1517837 () Bool)

(declare-fun res!1037739 () Bool)

(assert (=> b!1517837 (=> (not res!1037739) (not e!846792))))

(assert (=> b!1517837 (= res!1037739 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49345 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49345 a!2804))))))

(assert (= (and start!129260 res!1037737) b!1517827))

(assert (= (and b!1517827 res!1037740) b!1517836))

(assert (= (and b!1517836 res!1037733) b!1517826))

(assert (= (and b!1517826 res!1037736) b!1517825))

(assert (= (and b!1517825 res!1037732) b!1517833))

(assert (= (and b!1517833 res!1037734) b!1517837))

(assert (= (and b!1517837 res!1037739) b!1517832))

(assert (= (and b!1517832 res!1037729) b!1517829))

(assert (= (and b!1517829 res!1037730) b!1517831))

(assert (= (and b!1517831 res!1037735) b!1517830))

(assert (= (and b!1517830 res!1037738) b!1517835))

(assert (= (and b!1517830 (not res!1037728)) b!1517834))

(assert (= (and b!1517834 (not res!1037731)) b!1517828))

(declare-fun m!1401125 () Bool)

(assert (=> b!1517826 m!1401125))

(assert (=> b!1517826 m!1401125))

(declare-fun m!1401127 () Bool)

(assert (=> b!1517826 m!1401127))

(declare-fun m!1401129 () Bool)

(assert (=> b!1517831 m!1401129))

(declare-fun m!1401131 () Bool)

(assert (=> b!1517831 m!1401131))

(assert (=> b!1517831 m!1401131))

(declare-fun m!1401133 () Bool)

(assert (=> b!1517831 m!1401133))

(assert (=> b!1517831 m!1401133))

(assert (=> b!1517831 m!1401131))

(declare-fun m!1401135 () Bool)

(assert (=> b!1517831 m!1401135))

(declare-fun m!1401137 () Bool)

(assert (=> b!1517825 m!1401137))

(declare-fun m!1401139 () Bool)

(assert (=> b!1517836 m!1401139))

(assert (=> b!1517836 m!1401139))

(declare-fun m!1401141 () Bool)

(assert (=> b!1517836 m!1401141))

(assert (=> b!1517829 m!1401125))

(assert (=> b!1517829 m!1401125))

(declare-fun m!1401143 () Bool)

(assert (=> b!1517829 m!1401143))

(assert (=> b!1517832 m!1401125))

(assert (=> b!1517832 m!1401125))

(declare-fun m!1401145 () Bool)

(assert (=> b!1517832 m!1401145))

(assert (=> b!1517832 m!1401145))

(assert (=> b!1517832 m!1401125))

(declare-fun m!1401147 () Bool)

(assert (=> b!1517832 m!1401147))

(declare-fun m!1401149 () Bool)

(assert (=> b!1517834 m!1401149))

(assert (=> b!1517830 m!1401125))

(declare-fun m!1401151 () Bool)

(assert (=> b!1517830 m!1401151))

(assert (=> b!1517830 m!1401129))

(assert (=> b!1517830 m!1401131))

(declare-fun m!1401153 () Bool)

(assert (=> b!1517830 m!1401153))

(declare-fun m!1401155 () Bool)

(assert (=> b!1517833 m!1401155))

(assert (=> b!1517828 m!1401125))

(assert (=> b!1517828 m!1401125))

(declare-fun m!1401157 () Bool)

(assert (=> b!1517828 m!1401157))

(assert (=> b!1517835 m!1401125))

(assert (=> b!1517835 m!1401125))

(declare-fun m!1401159 () Bool)

(assert (=> b!1517835 m!1401159))

(declare-fun m!1401161 () Bool)

(assert (=> start!129260 m!1401161))

(declare-fun m!1401163 () Bool)

(assert (=> start!129260 m!1401163))

(check-sat (not b!1517829) (not b!1517834) (not b!1517830) (not b!1517826) (not b!1517825) (not b!1517832) (not b!1517835) (not start!129260) (not b!1517833) (not b!1517836) (not b!1517831) (not b!1517828))
(check-sat)
