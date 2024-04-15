; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129188 () Bool)

(assert start!129188)

(declare-fun b!1517095 () Bool)

(declare-fun res!1037205 () Bool)

(declare-fun e!846399 () Bool)

(assert (=> b!1517095 (=> (not res!1037205) (not e!846399))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101044 0))(
  ( (array!101045 (arr!48760 (Array (_ BitVec 32) (_ BitVec 64))) (size!49312 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101044)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12954 0))(
  ( (MissingZero!12954 (index!54211 (_ BitVec 32))) (Found!12954 (index!54212 (_ BitVec 32))) (Intermediate!12954 (undefined!13766 Bool) (index!54213 (_ BitVec 32)) (x!135898 (_ BitVec 32))) (Undefined!12954) (MissingVacant!12954 (index!54214 (_ BitVec 32))) )
))
(declare-fun lt!657490 () SeekEntryResult!12954)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12954)

(assert (=> b!1517095 (= res!1037205 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) lt!657490))))

(declare-fun b!1517096 () Bool)

(declare-fun e!846402 () Bool)

(assert (=> b!1517096 (= e!846402 true)))

(declare-fun lt!657491 () SeekEntryResult!12954)

(declare-fun lt!657489 () (_ BitVec 32))

(assert (=> b!1517096 (= lt!657491 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657489 (select (arr!48760 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517097 () Bool)

(declare-fun e!846401 () Bool)

(assert (=> b!1517097 (= e!846401 e!846402)))

(declare-fun res!1037212 () Bool)

(assert (=> b!1517097 (=> res!1037212 e!846402)))

(assert (=> b!1517097 (= res!1037212 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657489 #b00000000000000000000000000000000) (bvsge lt!657489 (size!49312 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517097 (= lt!657489 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517098 () Bool)

(declare-fun res!1037213 () Bool)

(declare-fun e!846400 () Bool)

(assert (=> b!1517098 (=> (not res!1037213) (not e!846400))))

(declare-datatypes ((List!35321 0))(
  ( (Nil!35318) (Cons!35317 (h!36730 (_ BitVec 64)) (t!50007 List!35321)) )
))
(declare-fun arrayNoDuplicates!0 (array!101044 (_ BitVec 32) List!35321) Bool)

(assert (=> b!1517098 (= res!1037213 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35318))))

(declare-fun b!1517099 () Bool)

(declare-fun res!1037214 () Bool)

(assert (=> b!1517099 (=> (not res!1037214) (not e!846399))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!657488 () SeekEntryResult!12954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517099 (= res!1037214 (= lt!657488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101045 (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49312 a!2804)) mask!2512)))))

(declare-fun b!1517100 () Bool)

(declare-fun res!1037216 () Bool)

(assert (=> b!1517100 (=> (not res!1037216) (not e!846400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517100 (= res!1037216 (validKeyInArray!0 (select (arr!48760 a!2804) j!70)))))

(declare-fun b!1517101 () Bool)

(declare-fun res!1037206 () Bool)

(assert (=> b!1517101 (=> (not res!1037206) (not e!846400))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517101 (= res!1037206 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49312 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49312 a!2804))))))

(declare-fun e!846398 () Bool)

(declare-fun b!1517102 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101044 (_ BitVec 32)) SeekEntryResult!12954)

(assert (=> b!1517102 (= e!846398 (= (seekEntry!0 (select (arr!48760 a!2804) j!70) a!2804 mask!2512) (Found!12954 j!70)))))

(declare-fun b!1517103 () Bool)

(declare-fun res!1037211 () Bool)

(assert (=> b!1517103 (=> (not res!1037211) (not e!846400))))

(assert (=> b!1517103 (= res!1037211 (validKeyInArray!0 (select (arr!48760 a!2804) i!961)))))

(declare-fun b!1517104 () Bool)

(declare-fun res!1037209 () Bool)

(assert (=> b!1517104 (=> (not res!1037209) (not e!846400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101044 (_ BitVec 32)) Bool)

(assert (=> b!1517104 (= res!1037209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517105 () Bool)

(assert (=> b!1517105 (= e!846399 (not e!846401))))

(declare-fun res!1037210 () Bool)

(assert (=> b!1517105 (=> res!1037210 e!846401)))

(assert (=> b!1517105 (= res!1037210 (or (not (= (select (arr!48760 a!2804) j!70) (select (store (arr!48760 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517105 e!846398))

(declare-fun res!1037208 () Bool)

(assert (=> b!1517105 (=> (not res!1037208) (not e!846398))))

(assert (=> b!1517105 (= res!1037208 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50615 0))(
  ( (Unit!50616) )
))
(declare-fun lt!657492 () Unit!50615)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50615)

(assert (=> b!1517105 (= lt!657492 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1037204 () Bool)

(assert (=> start!129188 (=> (not res!1037204) (not e!846400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129188 (= res!1037204 (validMask!0 mask!2512))))

(assert (=> start!129188 e!846400))

(assert (=> start!129188 true))

(declare-fun array_inv!37993 (array!101044) Bool)

(assert (=> start!129188 (array_inv!37993 a!2804)))

(declare-fun b!1517106 () Bool)

(declare-fun res!1037215 () Bool)

(assert (=> b!1517106 (=> (not res!1037215) (not e!846400))))

(assert (=> b!1517106 (= res!1037215 (and (= (size!49312 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49312 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49312 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517107 () Bool)

(assert (=> b!1517107 (= e!846400 e!846399)))

(declare-fun res!1037207 () Bool)

(assert (=> b!1517107 (=> (not res!1037207) (not e!846399))))

(assert (=> b!1517107 (= res!1037207 (= lt!657488 lt!657490))))

(assert (=> b!1517107 (= lt!657490 (Intermediate!12954 false resIndex!21 resX!21))))

(assert (=> b!1517107 (= lt!657488 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48760 a!2804) j!70) mask!2512) (select (arr!48760 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129188 res!1037204) b!1517106))

(assert (= (and b!1517106 res!1037215) b!1517103))

(assert (= (and b!1517103 res!1037211) b!1517100))

(assert (= (and b!1517100 res!1037216) b!1517104))

(assert (= (and b!1517104 res!1037209) b!1517098))

(assert (= (and b!1517098 res!1037213) b!1517101))

(assert (= (and b!1517101 res!1037206) b!1517107))

(assert (= (and b!1517107 res!1037207) b!1517095))

(assert (= (and b!1517095 res!1037205) b!1517099))

(assert (= (and b!1517099 res!1037214) b!1517105))

(assert (= (and b!1517105 res!1037208) b!1517102))

(assert (= (and b!1517105 (not res!1037210)) b!1517097))

(assert (= (and b!1517097 (not res!1037212)) b!1517096))

(declare-fun m!1399817 () Bool)

(assert (=> b!1517100 m!1399817))

(assert (=> b!1517100 m!1399817))

(declare-fun m!1399819 () Bool)

(assert (=> b!1517100 m!1399819))

(declare-fun m!1399821 () Bool)

(assert (=> b!1517103 m!1399821))

(assert (=> b!1517103 m!1399821))

(declare-fun m!1399823 () Bool)

(assert (=> b!1517103 m!1399823))

(declare-fun m!1399825 () Bool)

(assert (=> b!1517099 m!1399825))

(declare-fun m!1399827 () Bool)

(assert (=> b!1517099 m!1399827))

(assert (=> b!1517099 m!1399827))

(declare-fun m!1399829 () Bool)

(assert (=> b!1517099 m!1399829))

(assert (=> b!1517099 m!1399829))

(assert (=> b!1517099 m!1399827))

(declare-fun m!1399831 () Bool)

(assert (=> b!1517099 m!1399831))

(declare-fun m!1399833 () Bool)

(assert (=> b!1517104 m!1399833))

(assert (=> b!1517096 m!1399817))

(assert (=> b!1517096 m!1399817))

(declare-fun m!1399835 () Bool)

(assert (=> b!1517096 m!1399835))

(declare-fun m!1399837 () Bool)

(assert (=> b!1517098 m!1399837))

(assert (=> b!1517102 m!1399817))

(assert (=> b!1517102 m!1399817))

(declare-fun m!1399839 () Bool)

(assert (=> b!1517102 m!1399839))

(declare-fun m!1399841 () Bool)

(assert (=> start!129188 m!1399841))

(declare-fun m!1399843 () Bool)

(assert (=> start!129188 m!1399843))

(assert (=> b!1517095 m!1399817))

(assert (=> b!1517095 m!1399817))

(declare-fun m!1399845 () Bool)

(assert (=> b!1517095 m!1399845))

(declare-fun m!1399847 () Bool)

(assert (=> b!1517097 m!1399847))

(assert (=> b!1517107 m!1399817))

(assert (=> b!1517107 m!1399817))

(declare-fun m!1399849 () Bool)

(assert (=> b!1517107 m!1399849))

(assert (=> b!1517107 m!1399849))

(assert (=> b!1517107 m!1399817))

(declare-fun m!1399851 () Bool)

(assert (=> b!1517107 m!1399851))

(assert (=> b!1517105 m!1399817))

(declare-fun m!1399853 () Bool)

(assert (=> b!1517105 m!1399853))

(assert (=> b!1517105 m!1399825))

(assert (=> b!1517105 m!1399827))

(declare-fun m!1399855 () Bool)

(assert (=> b!1517105 m!1399855))

(check-sat (not b!1517098) (not b!1517107) (not b!1517099) (not b!1517096) (not b!1517097) (not b!1517100) (not b!1517102) (not b!1517104) (not b!1517105) (not start!129188) (not b!1517095) (not b!1517103))
(check-sat)
