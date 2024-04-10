; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129210 () Bool)

(assert start!129210)

(declare-fun res!1036753 () Bool)

(declare-fun e!846344 () Bool)

(assert (=> start!129210 (=> (not res!1036753) (not e!846344))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129210 (= res!1036753 (validMask!0 mask!2512))))

(assert (=> start!129210 e!846344))

(assert (=> start!129210 true))

(declare-datatypes ((array!101066 0))(
  ( (array!101067 (arr!48770 (Array (_ BitVec 32) (_ BitVec 64))) (size!49320 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101066)

(declare-fun array_inv!37798 (array!101066) Bool)

(assert (=> start!129210 (array_inv!37798 a!2804)))

(declare-fun b!1516850 () Bool)

(declare-fun res!1036765 () Bool)

(assert (=> b!1516850 (=> (not res!1036765) (not e!846344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101066 (_ BitVec 32)) Bool)

(assert (=> b!1516850 (= res!1036765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516851 () Bool)

(declare-fun res!1036763 () Bool)

(assert (=> b!1516851 (=> (not res!1036763) (not e!846344))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516851 (= res!1036763 (validKeyInArray!0 (select (arr!48770 a!2804) i!961)))))

(declare-fun b!1516852 () Bool)

(declare-fun res!1036758 () Bool)

(assert (=> b!1516852 (=> (not res!1036758) (not e!846344))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516852 (= res!1036758 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49320 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49320 a!2804))))))

(declare-fun b!1516853 () Bool)

(declare-fun e!846345 () Bool)

(assert (=> b!1516853 (= e!846344 e!846345)))

(declare-fun res!1036759 () Bool)

(assert (=> b!1516853 (=> (not res!1036759) (not e!846345))))

(declare-datatypes ((SeekEntryResult!12941 0))(
  ( (MissingZero!12941 (index!54159 (_ BitVec 32))) (Found!12941 (index!54160 (_ BitVec 32))) (Intermediate!12941 (undefined!13753 Bool) (index!54161 (_ BitVec 32)) (x!135851 (_ BitVec 32))) (Undefined!12941) (MissingVacant!12941 (index!54162 (_ BitVec 32))) )
))
(declare-fun lt!657558 () SeekEntryResult!12941)

(declare-fun lt!657559 () SeekEntryResult!12941)

(assert (=> b!1516853 (= res!1036759 (= lt!657558 lt!657559))))

(assert (=> b!1516853 (= lt!657559 (Intermediate!12941 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101066 (_ BitVec 32)) SeekEntryResult!12941)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516853 (= lt!657558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48770 a!2804) j!70) mask!2512) (select (arr!48770 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516854 () Bool)

(declare-fun res!1036760 () Bool)

(assert (=> b!1516854 (=> (not res!1036760) (not e!846345))))

(assert (=> b!1516854 (= res!1036760 (= lt!657558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48770 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48770 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101067 (store (arr!48770 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49320 a!2804)) mask!2512)))))

(declare-fun b!1516855 () Bool)

(declare-fun e!846342 () Bool)

(assert (=> b!1516855 (= e!846342 true)))

(declare-fun lt!657561 () SeekEntryResult!12941)

(declare-fun lt!657560 () (_ BitVec 32))

(assert (=> b!1516855 (= lt!657561 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657560 (select (arr!48770 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!846343 () Bool)

(declare-fun b!1516856 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101066 (_ BitVec 32)) SeekEntryResult!12941)

(assert (=> b!1516856 (= e!846343 (= (seekEntry!0 (select (arr!48770 a!2804) j!70) a!2804 mask!2512) (Found!12941 j!70)))))

(declare-fun b!1516857 () Bool)

(declare-fun res!1036756 () Bool)

(assert (=> b!1516857 (=> (not res!1036756) (not e!846345))))

(assert (=> b!1516857 (= res!1036756 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48770 a!2804) j!70) a!2804 mask!2512) lt!657559))))

(declare-fun b!1516858 () Bool)

(declare-fun e!846341 () Bool)

(assert (=> b!1516858 (= e!846345 (not e!846341))))

(declare-fun res!1036761 () Bool)

(assert (=> b!1516858 (=> res!1036761 e!846341)))

(assert (=> b!1516858 (= res!1036761 (or (not (= (select (arr!48770 a!2804) j!70) (select (store (arr!48770 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516858 e!846343))

(declare-fun res!1036762 () Bool)

(assert (=> b!1516858 (=> (not res!1036762) (not e!846343))))

(assert (=> b!1516858 (= res!1036762 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50750 0))(
  ( (Unit!50751) )
))
(declare-fun lt!657562 () Unit!50750)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101066 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50750)

(assert (=> b!1516858 (= lt!657562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516859 () Bool)

(declare-fun res!1036755 () Bool)

(assert (=> b!1516859 (=> (not res!1036755) (not e!846344))))

(declare-datatypes ((List!35253 0))(
  ( (Nil!35250) (Cons!35249 (h!36661 (_ BitVec 64)) (t!49947 List!35253)) )
))
(declare-fun arrayNoDuplicates!0 (array!101066 (_ BitVec 32) List!35253) Bool)

(assert (=> b!1516859 (= res!1036755 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35250))))

(declare-fun b!1516860 () Bool)

(declare-fun res!1036764 () Bool)

(assert (=> b!1516860 (=> (not res!1036764) (not e!846344))))

(assert (=> b!1516860 (= res!1036764 (and (= (size!49320 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49320 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49320 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516861 () Bool)

(assert (=> b!1516861 (= e!846341 e!846342)))

(declare-fun res!1036757 () Bool)

(assert (=> b!1516861 (=> res!1036757 e!846342)))

(assert (=> b!1516861 (= res!1036757 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657560 #b00000000000000000000000000000000) (bvsge lt!657560 (size!49320 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516861 (= lt!657560 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516862 () Bool)

(declare-fun res!1036754 () Bool)

(assert (=> b!1516862 (=> (not res!1036754) (not e!846344))))

(assert (=> b!1516862 (= res!1036754 (validKeyInArray!0 (select (arr!48770 a!2804) j!70)))))

(assert (= (and start!129210 res!1036753) b!1516860))

(assert (= (and b!1516860 res!1036764) b!1516851))

(assert (= (and b!1516851 res!1036763) b!1516862))

(assert (= (and b!1516862 res!1036754) b!1516850))

(assert (= (and b!1516850 res!1036765) b!1516859))

(assert (= (and b!1516859 res!1036755) b!1516852))

(assert (= (and b!1516852 res!1036758) b!1516853))

(assert (= (and b!1516853 res!1036759) b!1516857))

(assert (= (and b!1516857 res!1036756) b!1516854))

(assert (= (and b!1516854 res!1036760) b!1516858))

(assert (= (and b!1516858 res!1036762) b!1516856))

(assert (= (and b!1516858 (not res!1036761)) b!1516861))

(assert (= (and b!1516861 (not res!1036757)) b!1516855))

(declare-fun m!1400125 () Bool)

(assert (=> b!1516854 m!1400125))

(declare-fun m!1400127 () Bool)

(assert (=> b!1516854 m!1400127))

(assert (=> b!1516854 m!1400127))

(declare-fun m!1400129 () Bool)

(assert (=> b!1516854 m!1400129))

(assert (=> b!1516854 m!1400129))

(assert (=> b!1516854 m!1400127))

(declare-fun m!1400131 () Bool)

(assert (=> b!1516854 m!1400131))

(declare-fun m!1400133 () Bool)

(assert (=> b!1516850 m!1400133))

(declare-fun m!1400135 () Bool)

(assert (=> start!129210 m!1400135))

(declare-fun m!1400137 () Bool)

(assert (=> start!129210 m!1400137))

(declare-fun m!1400139 () Bool)

(assert (=> b!1516861 m!1400139))

(declare-fun m!1400141 () Bool)

(assert (=> b!1516858 m!1400141))

(declare-fun m!1400143 () Bool)

(assert (=> b!1516858 m!1400143))

(assert (=> b!1516858 m!1400125))

(assert (=> b!1516858 m!1400127))

(declare-fun m!1400145 () Bool)

(assert (=> b!1516858 m!1400145))

(assert (=> b!1516857 m!1400141))

(assert (=> b!1516857 m!1400141))

(declare-fun m!1400147 () Bool)

(assert (=> b!1516857 m!1400147))

(declare-fun m!1400149 () Bool)

(assert (=> b!1516859 m!1400149))

(assert (=> b!1516853 m!1400141))

(assert (=> b!1516853 m!1400141))

(declare-fun m!1400151 () Bool)

(assert (=> b!1516853 m!1400151))

(assert (=> b!1516853 m!1400151))

(assert (=> b!1516853 m!1400141))

(declare-fun m!1400153 () Bool)

(assert (=> b!1516853 m!1400153))

(assert (=> b!1516862 m!1400141))

(assert (=> b!1516862 m!1400141))

(declare-fun m!1400155 () Bool)

(assert (=> b!1516862 m!1400155))

(assert (=> b!1516855 m!1400141))

(assert (=> b!1516855 m!1400141))

(declare-fun m!1400157 () Bool)

(assert (=> b!1516855 m!1400157))

(assert (=> b!1516856 m!1400141))

(assert (=> b!1516856 m!1400141))

(declare-fun m!1400159 () Bool)

(assert (=> b!1516856 m!1400159))

(declare-fun m!1400161 () Bool)

(assert (=> b!1516851 m!1400161))

(assert (=> b!1516851 m!1400161))

(declare-fun m!1400163 () Bool)

(assert (=> b!1516851 m!1400163))

(push 1)

