; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129284 () Bool)

(assert start!129284)

(declare-fun b!1519034 () Bool)

(declare-fun res!1039143 () Bool)

(declare-fun e!847330 () Bool)

(assert (=> b!1519034 (=> (not res!1039143) (not e!847330))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101140 0))(
  ( (array!101141 (arr!48808 (Array (_ BitVec 32) (_ BitVec 64))) (size!49360 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101140)

(assert (=> b!1519034 (= res!1039143 (and (= (size!49360 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49360 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49360 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519035 () Bool)

(declare-fun res!1039156 () Bool)

(declare-fun e!847334 () Bool)

(assert (=> b!1519035 (=> res!1039156 e!847334)))

(declare-fun lt!658341 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13002 0))(
  ( (MissingZero!13002 (index!54403 (_ BitVec 32))) (Found!13002 (index!54404 (_ BitVec 32))) (Intermediate!13002 (undefined!13814 Bool) (index!54405 (_ BitVec 32)) (x!136074 (_ BitVec 32))) (Undefined!13002) (MissingVacant!13002 (index!54406 (_ BitVec 32))) )
))
(declare-fun lt!658338 () SeekEntryResult!13002)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!13002)

(assert (=> b!1519035 (= res!1039156 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658341 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658338)))))

(declare-fun b!1519037 () Bool)

(declare-fun e!847328 () Bool)

(declare-fun e!847331 () Bool)

(assert (=> b!1519037 (= e!847328 (not e!847331))))

(declare-fun res!1039149 () Bool)

(assert (=> b!1519037 (=> res!1039149 e!847331)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!658343 () (_ BitVec 64))

(assert (=> b!1519037 (= res!1039149 (or (not (= (select (arr!48808 a!2804) j!70) lt!658343)) (= x!534 resX!21)))))

(declare-fun e!847333 () Bool)

(assert (=> b!1519037 e!847333))

(declare-fun res!1039157 () Bool)

(assert (=> b!1519037 (=> (not res!1039157) (not e!847333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101140 (_ BitVec 32)) Bool)

(assert (=> b!1519037 (= res!1039157 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50711 0))(
  ( (Unit!50712) )
))
(declare-fun lt!658342 () Unit!50711)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50711)

(assert (=> b!1519037 (= lt!658342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519038 () Bool)

(declare-fun res!1039145 () Bool)

(assert (=> b!1519038 (=> (not res!1039145) (not e!847330))))

(assert (=> b!1519038 (= res!1039145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519039 () Bool)

(declare-fun e!847329 () Bool)

(assert (=> b!1519039 (= e!847329 e!847328)))

(declare-fun res!1039151 () Bool)

(assert (=> b!1519039 (=> (not res!1039151) (not e!847328))))

(declare-fun lt!658339 () array!101140)

(declare-fun lt!658340 () SeekEntryResult!13002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519039 (= res!1039151 (= lt!658340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658343 mask!2512) lt!658343 lt!658339 mask!2512)))))

(assert (=> b!1519039 (= lt!658343 (select (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519039 (= lt!658339 (array!101141 (store (arr!48808 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49360 a!2804)))))

(declare-fun b!1519040 () Bool)

(declare-fun e!847332 () Bool)

(assert (=> b!1519040 (= e!847334 e!847332)))

(declare-fun res!1039144 () Bool)

(assert (=> b!1519040 (=> res!1039144 e!847332)))

(assert (=> b!1519040 (= res!1039144 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!13002)

(assert (=> b!1519040 (= (seekEntryOrOpen!0 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658343 lt!658339 mask!2512))))

(declare-fun lt!658344 () Unit!50711)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101140 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50711)

(assert (=> b!1519040 (= lt!658344 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658341 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1519041 () Bool)

(declare-fun res!1039150 () Bool)

(assert (=> b!1519041 (=> (not res!1039150) (not e!847330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519041 (= res!1039150 (validKeyInArray!0 (select (arr!48808 a!2804) j!70)))))

(declare-fun b!1519042 () Bool)

(assert (=> b!1519042 (= e!847330 e!847329)))

(declare-fun res!1039154 () Bool)

(assert (=> b!1519042 (=> (not res!1039154) (not e!847329))))

(assert (=> b!1519042 (= res!1039154 (= lt!658340 lt!658338))))

(assert (=> b!1519042 (= lt!658338 (Intermediate!13002 false resIndex!21 resX!21))))

(assert (=> b!1519042 (= lt!658340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48808 a!2804) j!70) mask!2512) (select (arr!48808 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519043 () Bool)

(declare-fun res!1039155 () Bool)

(assert (=> b!1519043 (=> (not res!1039155) (not e!847330))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1519043 (= res!1039155 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49360 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49360 a!2804))))))

(declare-fun b!1519044 () Bool)

(declare-fun res!1039153 () Bool)

(assert (=> b!1519044 (=> (not res!1039153) (not e!847330))))

(assert (=> b!1519044 (= res!1039153 (validKeyInArray!0 (select (arr!48808 a!2804) i!961)))))

(declare-fun b!1519036 () Bool)

(declare-fun res!1039146 () Bool)

(assert (=> b!1519036 (=> (not res!1039146) (not e!847330))))

(declare-datatypes ((List!35369 0))(
  ( (Nil!35366) (Cons!35365 (h!36778 (_ BitVec 64)) (t!50055 List!35369)) )
))
(declare-fun arrayNoDuplicates!0 (array!101140 (_ BitVec 32) List!35369) Bool)

(assert (=> b!1519036 (= res!1039146 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35366))))

(declare-fun res!1039148 () Bool)

(assert (=> start!129284 (=> (not res!1039148) (not e!847330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129284 (= res!1039148 (validMask!0 mask!2512))))

(assert (=> start!129284 e!847330))

(assert (=> start!129284 true))

(declare-fun array_inv!38041 (array!101140) Bool)

(assert (=> start!129284 (array_inv!38041 a!2804)))

(declare-fun b!1519045 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101140 (_ BitVec 32)) SeekEntryResult!13002)

(assert (=> b!1519045 (= e!847333 (= (seekEntry!0 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) (Found!13002 j!70)))))

(declare-fun b!1519046 () Bool)

(assert (=> b!1519046 (= e!847332 (validKeyInArray!0 lt!658343))))

(declare-fun b!1519047 () Bool)

(declare-fun res!1039152 () Bool)

(assert (=> b!1519047 (=> (not res!1039152) (not e!847329))))

(assert (=> b!1519047 (= res!1039152 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48808 a!2804) j!70) a!2804 mask!2512) lt!658338))))

(declare-fun b!1519048 () Bool)

(assert (=> b!1519048 (= e!847331 e!847334)))

(declare-fun res!1039147 () Bool)

(assert (=> b!1519048 (=> res!1039147 e!847334)))

(assert (=> b!1519048 (= res!1039147 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658341 #b00000000000000000000000000000000) (bvsge lt!658341 (size!49360 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519048 (= lt!658341 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!129284 res!1039148) b!1519034))

(assert (= (and b!1519034 res!1039143) b!1519044))

(assert (= (and b!1519044 res!1039153) b!1519041))

(assert (= (and b!1519041 res!1039150) b!1519038))

(assert (= (and b!1519038 res!1039145) b!1519036))

(assert (= (and b!1519036 res!1039146) b!1519043))

(assert (= (and b!1519043 res!1039155) b!1519042))

(assert (= (and b!1519042 res!1039154) b!1519047))

(assert (= (and b!1519047 res!1039152) b!1519039))

(assert (= (and b!1519039 res!1039151) b!1519037))

(assert (= (and b!1519037 res!1039157) b!1519045))

(assert (= (and b!1519037 (not res!1039149)) b!1519048))

(assert (= (and b!1519048 (not res!1039147)) b!1519035))

(assert (= (and b!1519035 (not res!1039156)) b!1519040))

(assert (= (and b!1519040 (not res!1039144)) b!1519046))

(declare-fun m!1401863 () Bool)

(assert (=> b!1519040 m!1401863))

(assert (=> b!1519040 m!1401863))

(declare-fun m!1401865 () Bool)

(assert (=> b!1519040 m!1401865))

(declare-fun m!1401867 () Bool)

(assert (=> b!1519040 m!1401867))

(declare-fun m!1401869 () Bool)

(assert (=> b!1519040 m!1401869))

(declare-fun m!1401871 () Bool)

(assert (=> b!1519038 m!1401871))

(assert (=> b!1519042 m!1401863))

(assert (=> b!1519042 m!1401863))

(declare-fun m!1401873 () Bool)

(assert (=> b!1519042 m!1401873))

(assert (=> b!1519042 m!1401873))

(assert (=> b!1519042 m!1401863))

(declare-fun m!1401875 () Bool)

(assert (=> b!1519042 m!1401875))

(declare-fun m!1401877 () Bool)

(assert (=> b!1519039 m!1401877))

(assert (=> b!1519039 m!1401877))

(declare-fun m!1401879 () Bool)

(assert (=> b!1519039 m!1401879))

(declare-fun m!1401881 () Bool)

(assert (=> b!1519039 m!1401881))

(declare-fun m!1401883 () Bool)

(assert (=> b!1519039 m!1401883))

(assert (=> b!1519037 m!1401863))

(declare-fun m!1401885 () Bool)

(assert (=> b!1519037 m!1401885))

(declare-fun m!1401887 () Bool)

(assert (=> b!1519037 m!1401887))

(declare-fun m!1401889 () Bool)

(assert (=> b!1519044 m!1401889))

(assert (=> b!1519044 m!1401889))

(declare-fun m!1401891 () Bool)

(assert (=> b!1519044 m!1401891))

(assert (=> b!1519035 m!1401863))

(assert (=> b!1519035 m!1401863))

(declare-fun m!1401893 () Bool)

(assert (=> b!1519035 m!1401893))

(assert (=> b!1519047 m!1401863))

(assert (=> b!1519047 m!1401863))

(declare-fun m!1401895 () Bool)

(assert (=> b!1519047 m!1401895))

(assert (=> b!1519045 m!1401863))

(assert (=> b!1519045 m!1401863))

(declare-fun m!1401897 () Bool)

(assert (=> b!1519045 m!1401897))

(declare-fun m!1401899 () Bool)

(assert (=> start!129284 m!1401899))

(declare-fun m!1401901 () Bool)

(assert (=> start!129284 m!1401901))

(assert (=> b!1519041 m!1401863))

(assert (=> b!1519041 m!1401863))

(declare-fun m!1401903 () Bool)

(assert (=> b!1519041 m!1401903))

(declare-fun m!1401905 () Bool)

(assert (=> b!1519046 m!1401905))

(declare-fun m!1401907 () Bool)

(assert (=> b!1519048 m!1401907))

(declare-fun m!1401909 () Bool)

(assert (=> b!1519036 m!1401909))

(check-sat (not b!1519048) (not b!1519046) (not b!1519035) (not b!1519047) (not b!1519038) (not b!1519037) (not b!1519044) (not b!1519042) (not b!1519040) (not b!1519045) (not b!1519036) (not b!1519041) (not start!129284) (not b!1519039))
(check-sat)
