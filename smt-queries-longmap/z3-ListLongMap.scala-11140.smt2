; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130204 () Bool)

(assert start!130204)

(declare-fun res!1045915 () Bool)

(declare-fun e!851749 () Bool)

(assert (=> start!130204 (=> (not res!1045915) (not e!851749))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130204 (= res!1045915 (validMask!0 mask!2512))))

(assert (=> start!130204 e!851749))

(assert (=> start!130204 true))

(declare-datatypes ((array!101554 0))(
  ( (array!101555 (arr!49002 (Array (_ BitVec 32) (_ BitVec 64))) (size!49552 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101554)

(declare-fun array_inv!38030 (array!101554) Bool)

(assert (=> start!130204 (array_inv!38030 a!2804)))

(declare-fun b!1528196 () Bool)

(declare-fun e!851755 () Bool)

(declare-fun e!851753 () Bool)

(assert (=> b!1528196 (= e!851755 e!851753)))

(declare-fun res!1045909 () Bool)

(assert (=> b!1528196 (=> (not res!1045909) (not e!851753))))

(declare-fun lt!661799 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13167 0))(
  ( (MissingZero!13167 (index!55063 (_ BitVec 32))) (Found!13167 (index!55064 (_ BitVec 32))) (Intermediate!13167 (undefined!13979 Bool) (index!55065 (_ BitVec 32)) (x!136758 (_ BitVec 32))) (Undefined!13167) (MissingVacant!13167 (index!55066 (_ BitVec 32))) )
))
(declare-fun lt!661792 () SeekEntryResult!13167)

(declare-fun lt!661800 () array!101554)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101554 (_ BitVec 32)) SeekEntryResult!13167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528196 (= res!1045909 (= lt!661792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661799 mask!2512) lt!661799 lt!661800 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1528196 (= lt!661799 (select (store (arr!49002 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528196 (= lt!661800 (array!101555 (store (arr!49002 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49552 a!2804)))))

(declare-fun b!1528197 () Bool)

(declare-fun res!1045903 () Bool)

(assert (=> b!1528197 (=> (not res!1045903) (not e!851755))))

(declare-fun lt!661796 () SeekEntryResult!13167)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528197 (= res!1045903 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49002 a!2804) j!70) a!2804 mask!2512) lt!661796))))

(declare-fun b!1528198 () Bool)

(declare-fun e!851751 () Bool)

(assert (=> b!1528198 (= e!851753 (not e!851751))))

(declare-fun res!1045913 () Bool)

(assert (=> b!1528198 (=> res!1045913 e!851751)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528198 (= res!1045913 (or (not (= (select (arr!49002 a!2804) j!70) lt!661799)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49002 a!2804) index!487) (select (arr!49002 a!2804) j!70)) (not (= (select (arr!49002 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851754 () Bool)

(assert (=> b!1528198 e!851754))

(declare-fun res!1045905 () Bool)

(assert (=> b!1528198 (=> (not res!1045905) (not e!851754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101554 (_ BitVec 32)) Bool)

(assert (=> b!1528198 (= res!1045905 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51118 0))(
  ( (Unit!51119) )
))
(declare-fun lt!661794 () Unit!51118)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51118)

(assert (=> b!1528198 (= lt!661794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528199 () Bool)

(declare-fun res!1045910 () Bool)

(assert (=> b!1528199 (=> (not res!1045910) (not e!851749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528199 (= res!1045910 (validKeyInArray!0 (select (arr!49002 a!2804) i!961)))))

(declare-fun b!1528200 () Bool)

(declare-fun res!1045908 () Bool)

(assert (=> b!1528200 (=> (not res!1045908) (not e!851749))))

(assert (=> b!1528200 (= res!1045908 (and (= (size!49552 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49552 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49552 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528201 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101554 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1528201 (= e!851754 (= (seekEntry!0 (select (arr!49002 a!2804) j!70) a!2804 mask!2512) (Found!13167 j!70)))))

(declare-fun b!1528202 () Bool)

(assert (=> b!1528202 (= e!851749 e!851755)))

(declare-fun res!1045904 () Bool)

(assert (=> b!1528202 (=> (not res!1045904) (not e!851755))))

(assert (=> b!1528202 (= res!1045904 (= lt!661792 lt!661796))))

(assert (=> b!1528202 (= lt!661796 (Intermediate!13167 false resIndex!21 resX!21))))

(assert (=> b!1528202 (= lt!661792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49002 a!2804) j!70) mask!2512) (select (arr!49002 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528203 () Bool)

(declare-fun e!851750 () Bool)

(assert (=> b!1528203 (= e!851750 true)))

(declare-fun lt!661798 () SeekEntryResult!13167)

(declare-fun lt!661795 () SeekEntryResult!13167)

(assert (=> b!1528203 (= lt!661798 lt!661795)))

(declare-fun lt!661797 () Unit!51118)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101554 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51118)

(assert (=> b!1528203 (= lt!661797 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528204 () Bool)

(declare-fun res!1045914 () Bool)

(assert (=> b!1528204 (=> (not res!1045914) (not e!851749))))

(declare-datatypes ((List!35485 0))(
  ( (Nil!35482) (Cons!35481 (h!36917 (_ BitVec 64)) (t!50179 List!35485)) )
))
(declare-fun arrayNoDuplicates!0 (array!101554 (_ BitVec 32) List!35485) Bool)

(assert (=> b!1528204 (= res!1045914 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35482))))

(declare-fun b!1528205 () Bool)

(declare-fun res!1045906 () Bool)

(assert (=> b!1528205 (=> (not res!1045906) (not e!851749))))

(assert (=> b!1528205 (= res!1045906 (validKeyInArray!0 (select (arr!49002 a!2804) j!70)))))

(declare-fun b!1528206 () Bool)

(assert (=> b!1528206 (= e!851751 e!851750)))

(declare-fun res!1045911 () Bool)

(assert (=> b!1528206 (=> res!1045911 e!851750)))

(assert (=> b!1528206 (= res!1045911 (not (= lt!661795 (Found!13167 j!70))))))

(declare-fun lt!661801 () SeekEntryResult!13167)

(assert (=> b!1528206 (= lt!661801 lt!661798)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101554 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1528206 (= lt!661798 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661799 lt!661800 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101554 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1528206 (= lt!661801 (seekEntryOrOpen!0 lt!661799 lt!661800 mask!2512))))

(declare-fun lt!661793 () SeekEntryResult!13167)

(assert (=> b!1528206 (= lt!661793 lt!661795)))

(assert (=> b!1528206 (= lt!661795 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49002 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528206 (= lt!661793 (seekEntryOrOpen!0 (select (arr!49002 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528207 () Bool)

(declare-fun res!1045912 () Bool)

(assert (=> b!1528207 (=> (not res!1045912) (not e!851749))))

(assert (=> b!1528207 (= res!1045912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528208 () Bool)

(declare-fun res!1045907 () Bool)

(assert (=> b!1528208 (=> (not res!1045907) (not e!851749))))

(assert (=> b!1528208 (= res!1045907 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49552 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49552 a!2804))))))

(assert (= (and start!130204 res!1045915) b!1528200))

(assert (= (and b!1528200 res!1045908) b!1528199))

(assert (= (and b!1528199 res!1045910) b!1528205))

(assert (= (and b!1528205 res!1045906) b!1528207))

(assert (= (and b!1528207 res!1045912) b!1528204))

(assert (= (and b!1528204 res!1045914) b!1528208))

(assert (= (and b!1528208 res!1045907) b!1528202))

(assert (= (and b!1528202 res!1045904) b!1528197))

(assert (= (and b!1528197 res!1045903) b!1528196))

(assert (= (and b!1528196 res!1045909) b!1528198))

(assert (= (and b!1528198 res!1045905) b!1528201))

(assert (= (and b!1528198 (not res!1045913)) b!1528206))

(assert (= (and b!1528206 (not res!1045911)) b!1528203))

(declare-fun m!1410975 () Bool)

(assert (=> b!1528198 m!1410975))

(declare-fun m!1410977 () Bool)

(assert (=> b!1528198 m!1410977))

(declare-fun m!1410979 () Bool)

(assert (=> b!1528198 m!1410979))

(declare-fun m!1410981 () Bool)

(assert (=> b!1528198 m!1410981))

(assert (=> b!1528206 m!1410975))

(declare-fun m!1410983 () Bool)

(assert (=> b!1528206 m!1410983))

(assert (=> b!1528206 m!1410975))

(declare-fun m!1410985 () Bool)

(assert (=> b!1528206 m!1410985))

(declare-fun m!1410987 () Bool)

(assert (=> b!1528206 m!1410987))

(assert (=> b!1528206 m!1410975))

(declare-fun m!1410989 () Bool)

(assert (=> b!1528206 m!1410989))

(assert (=> b!1528197 m!1410975))

(assert (=> b!1528197 m!1410975))

(declare-fun m!1410991 () Bool)

(assert (=> b!1528197 m!1410991))

(declare-fun m!1410993 () Bool)

(assert (=> start!130204 m!1410993))

(declare-fun m!1410995 () Bool)

(assert (=> start!130204 m!1410995))

(declare-fun m!1410997 () Bool)

(assert (=> b!1528204 m!1410997))

(assert (=> b!1528205 m!1410975))

(assert (=> b!1528205 m!1410975))

(declare-fun m!1410999 () Bool)

(assert (=> b!1528205 m!1410999))

(declare-fun m!1411001 () Bool)

(assert (=> b!1528196 m!1411001))

(assert (=> b!1528196 m!1411001))

(declare-fun m!1411003 () Bool)

(assert (=> b!1528196 m!1411003))

(declare-fun m!1411005 () Bool)

(assert (=> b!1528196 m!1411005))

(declare-fun m!1411007 () Bool)

(assert (=> b!1528196 m!1411007))

(assert (=> b!1528201 m!1410975))

(assert (=> b!1528201 m!1410975))

(declare-fun m!1411009 () Bool)

(assert (=> b!1528201 m!1411009))

(assert (=> b!1528202 m!1410975))

(assert (=> b!1528202 m!1410975))

(declare-fun m!1411011 () Bool)

(assert (=> b!1528202 m!1411011))

(assert (=> b!1528202 m!1411011))

(assert (=> b!1528202 m!1410975))

(declare-fun m!1411013 () Bool)

(assert (=> b!1528202 m!1411013))

(declare-fun m!1411015 () Bool)

(assert (=> b!1528207 m!1411015))

(declare-fun m!1411017 () Bool)

(assert (=> b!1528199 m!1411017))

(assert (=> b!1528199 m!1411017))

(declare-fun m!1411019 () Bool)

(assert (=> b!1528199 m!1411019))

(declare-fun m!1411021 () Bool)

(assert (=> b!1528203 m!1411021))

(check-sat (not b!1528206) (not b!1528198) (not b!1528201) (not b!1528197) (not b!1528207) (not b!1528204) (not b!1528196) (not b!1528202) (not start!130204) (not b!1528203) (not b!1528199) (not b!1528205))
(check-sat)
