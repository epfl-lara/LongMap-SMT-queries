; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129236 () Bool)

(assert start!129236)

(declare-fun b!1518031 () Bool)

(declare-fun e!846829 () Bool)

(assert (=> b!1518031 (= e!846829 true)))

(declare-datatypes ((SeekEntryResult!12978 0))(
  ( (MissingZero!12978 (index!54307 (_ BitVec 32))) (Found!12978 (index!54308 (_ BitVec 32))) (Intermediate!12978 (undefined!13790 Bool) (index!54309 (_ BitVec 32)) (x!135986 (_ BitVec 32))) (Undefined!12978) (MissingVacant!12978 (index!54310 (_ BitVec 32))) )
))
(declare-fun lt!657851 () SeekEntryResult!12978)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101092 0))(
  ( (array!101093 (arr!48784 (Array (_ BitVec 32) (_ BitVec 64))) (size!49336 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101092)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!657849 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12978)

(assert (=> b!1518031 (= lt!657851 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657849 (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518032 () Bool)

(declare-fun res!1038144 () Bool)

(declare-fun e!846832 () Bool)

(assert (=> b!1518032 (=> (not res!1038144) (not e!846832))))

(declare-fun lt!657852 () SeekEntryResult!12978)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518032 (= res!1038144 (= lt!657852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101093 (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49336 a!2804)) mask!2512)))))

(declare-fun b!1518033 () Bool)

(declare-fun res!1038141 () Bool)

(assert (=> b!1518033 (=> (not res!1038141) (not e!846832))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657850 () SeekEntryResult!12978)

(assert (=> b!1518033 (= res!1038141 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48784 a!2804) j!70) a!2804 mask!2512) lt!657850))))

(declare-fun b!1518034 () Bool)

(declare-fun e!846833 () Bool)

(assert (=> b!1518034 (= e!846832 (not e!846833))))

(declare-fun res!1038143 () Bool)

(assert (=> b!1518034 (=> res!1038143 e!846833)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518034 (= res!1038143 (or (not (= (select (arr!48784 a!2804) j!70) (select (store (arr!48784 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846830 () Bool)

(assert (=> b!1518034 e!846830))

(declare-fun res!1038142 () Bool)

(assert (=> b!1518034 (=> (not res!1038142) (not e!846830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101092 (_ BitVec 32)) Bool)

(assert (=> b!1518034 (= res!1038142 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50663 0))(
  ( (Unit!50664) )
))
(declare-fun lt!657848 () Unit!50663)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50663)

(assert (=> b!1518034 (= lt!657848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518035 () Bool)

(declare-fun res!1038148 () Bool)

(declare-fun e!846834 () Bool)

(assert (=> b!1518035 (=> (not res!1038148) (not e!846834))))

(declare-datatypes ((List!35345 0))(
  ( (Nil!35342) (Cons!35341 (h!36754 (_ BitVec 64)) (t!50031 List!35345)) )
))
(declare-fun arrayNoDuplicates!0 (array!101092 (_ BitVec 32) List!35345) Bool)

(assert (=> b!1518035 (= res!1038148 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35342))))

(declare-fun b!1518036 () Bool)

(declare-fun res!1038149 () Bool)

(assert (=> b!1518036 (=> (not res!1038149) (not e!846834))))

(assert (=> b!1518036 (= res!1038149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518037 () Bool)

(declare-fun res!1038152 () Bool)

(assert (=> b!1518037 (=> (not res!1038152) (not e!846834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518037 (= res!1038152 (validKeyInArray!0 (select (arr!48784 a!2804) i!961)))))

(declare-fun b!1518038 () Bool)

(declare-fun res!1038140 () Bool)

(assert (=> b!1518038 (=> (not res!1038140) (not e!846834))))

(assert (=> b!1518038 (= res!1038140 (and (= (size!49336 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49336 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49336 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518039 () Bool)

(declare-fun res!1038147 () Bool)

(assert (=> b!1518039 (=> (not res!1038147) (not e!846834))))

(assert (=> b!1518039 (= res!1038147 (validKeyInArray!0 (select (arr!48784 a!2804) j!70)))))

(declare-fun b!1518040 () Bool)

(assert (=> b!1518040 (= e!846833 e!846829)))

(declare-fun res!1038151 () Bool)

(assert (=> b!1518040 (=> res!1038151 e!846829)))

(assert (=> b!1518040 (= res!1038151 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657849 #b00000000000000000000000000000000) (bvsge lt!657849 (size!49336 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518040 (= lt!657849 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518042 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101092 (_ BitVec 32)) SeekEntryResult!12978)

(assert (=> b!1518042 (= e!846830 (= (seekEntry!0 (select (arr!48784 a!2804) j!70) a!2804 mask!2512) (Found!12978 j!70)))))

(declare-fun b!1518043 () Bool)

(declare-fun res!1038150 () Bool)

(assert (=> b!1518043 (=> (not res!1038150) (not e!846834))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518043 (= res!1038150 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49336 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49336 a!2804))))))

(declare-fun b!1518041 () Bool)

(assert (=> b!1518041 (= e!846834 e!846832)))

(declare-fun res!1038145 () Bool)

(assert (=> b!1518041 (=> (not res!1038145) (not e!846832))))

(assert (=> b!1518041 (= res!1038145 (= lt!657852 lt!657850))))

(assert (=> b!1518041 (= lt!657850 (Intermediate!12978 false resIndex!21 resX!21))))

(assert (=> b!1518041 (= lt!657852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48784 a!2804) j!70) mask!2512) (select (arr!48784 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1038146 () Bool)

(assert (=> start!129236 (=> (not res!1038146) (not e!846834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129236 (= res!1038146 (validMask!0 mask!2512))))

(assert (=> start!129236 e!846834))

(assert (=> start!129236 true))

(declare-fun array_inv!38017 (array!101092) Bool)

(assert (=> start!129236 (array_inv!38017 a!2804)))

(assert (= (and start!129236 res!1038146) b!1518038))

(assert (= (and b!1518038 res!1038140) b!1518037))

(assert (= (and b!1518037 res!1038152) b!1518039))

(assert (= (and b!1518039 res!1038147) b!1518036))

(assert (= (and b!1518036 res!1038149) b!1518035))

(assert (= (and b!1518035 res!1038148) b!1518043))

(assert (= (and b!1518043 res!1038150) b!1518041))

(assert (= (and b!1518041 res!1038145) b!1518033))

(assert (= (and b!1518033 res!1038141) b!1518032))

(assert (= (and b!1518032 res!1038144) b!1518034))

(assert (= (and b!1518034 res!1038142) b!1518042))

(assert (= (and b!1518034 (not res!1038143)) b!1518040))

(assert (= (and b!1518040 (not res!1038151)) b!1518031))

(declare-fun m!1400777 () Bool)

(assert (=> b!1518035 m!1400777))

(declare-fun m!1400779 () Bool)

(assert (=> start!129236 m!1400779))

(declare-fun m!1400781 () Bool)

(assert (=> start!129236 m!1400781))

(declare-fun m!1400783 () Bool)

(assert (=> b!1518039 m!1400783))

(assert (=> b!1518039 m!1400783))

(declare-fun m!1400785 () Bool)

(assert (=> b!1518039 m!1400785))

(assert (=> b!1518031 m!1400783))

(assert (=> b!1518031 m!1400783))

(declare-fun m!1400787 () Bool)

(assert (=> b!1518031 m!1400787))

(assert (=> b!1518034 m!1400783))

(declare-fun m!1400789 () Bool)

(assert (=> b!1518034 m!1400789))

(declare-fun m!1400791 () Bool)

(assert (=> b!1518034 m!1400791))

(declare-fun m!1400793 () Bool)

(assert (=> b!1518034 m!1400793))

(declare-fun m!1400795 () Bool)

(assert (=> b!1518034 m!1400795))

(declare-fun m!1400797 () Bool)

(assert (=> b!1518040 m!1400797))

(declare-fun m!1400799 () Bool)

(assert (=> b!1518037 m!1400799))

(assert (=> b!1518037 m!1400799))

(declare-fun m!1400801 () Bool)

(assert (=> b!1518037 m!1400801))

(declare-fun m!1400803 () Bool)

(assert (=> b!1518036 m!1400803))

(assert (=> b!1518042 m!1400783))

(assert (=> b!1518042 m!1400783))

(declare-fun m!1400805 () Bool)

(assert (=> b!1518042 m!1400805))

(assert (=> b!1518032 m!1400791))

(assert (=> b!1518032 m!1400793))

(assert (=> b!1518032 m!1400793))

(declare-fun m!1400807 () Bool)

(assert (=> b!1518032 m!1400807))

(assert (=> b!1518032 m!1400807))

(assert (=> b!1518032 m!1400793))

(declare-fun m!1400809 () Bool)

(assert (=> b!1518032 m!1400809))

(assert (=> b!1518041 m!1400783))

(assert (=> b!1518041 m!1400783))

(declare-fun m!1400811 () Bool)

(assert (=> b!1518041 m!1400811))

(assert (=> b!1518041 m!1400811))

(assert (=> b!1518041 m!1400783))

(declare-fun m!1400813 () Bool)

(assert (=> b!1518041 m!1400813))

(assert (=> b!1518033 m!1400783))

(assert (=> b!1518033 m!1400783))

(declare-fun m!1400815 () Bool)

(assert (=> b!1518033 m!1400815))

(check-sat (not b!1518039) (not b!1518031) (not b!1518036) (not b!1518033) (not b!1518035) (not b!1518042) (not b!1518037) (not b!1518032) (not b!1518034) (not b!1518040) (not start!129236) (not b!1518041))
(check-sat)
