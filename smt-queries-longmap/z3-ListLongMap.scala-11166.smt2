; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130920 () Bool)

(assert start!130920)

(declare-fun b!1534249 () Bool)

(declare-fun res!1049906 () Bool)

(declare-fun e!855011 () Bool)

(assert (=> b!1534249 (=> (not res!1049906) (not e!855011))))

(declare-datatypes ((array!101836 0))(
  ( (array!101837 (arr!49132 (Array (_ BitVec 32) (_ BitVec 64))) (size!49683 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101836)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534249 (= res!1049906 (validKeyInArray!0 (select (arr!49132 a!2804) i!961)))))

(declare-fun b!1534251 () Bool)

(declare-fun e!855010 () Bool)

(assert (=> b!1534251 (= e!855010 true)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!664343 () array!101836)

(declare-fun lt!664341 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13190 0))(
  ( (MissingZero!13190 (index!55155 (_ BitVec 32))) (Found!13190 (index!55156 (_ BitVec 32))) (Intermediate!13190 (undefined!14002 Bool) (index!55157 (_ BitVec 32)) (x!137063 (_ BitVec 32))) (Undefined!13190) (MissingVacant!13190 (index!55158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101836 (_ BitVec 32)) SeekEntryResult!13190)

(assert (=> b!1534251 (= (seekEntryOrOpen!0 (select (arr!49132 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!664341 lt!664343 mask!2512))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((Unit!51199 0))(
  ( (Unit!51200) )
))
(declare-fun lt!664344 () Unit!51199)

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!664340 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51199)

(assert (=> b!1534251 (= lt!664344 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!664340 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1534252 () Bool)

(declare-fun e!855013 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101836 (_ BitVec 32)) SeekEntryResult!13190)

(assert (=> b!1534252 (= e!855013 (= (seekEntry!0 (select (arr!49132 a!2804) j!70) a!2804 mask!2512) (Found!13190 j!70)))))

(declare-fun b!1534253 () Bool)

(declare-fun res!1049907 () Bool)

(assert (=> b!1534253 (=> (not res!1049907) (not e!855011))))

(assert (=> b!1534253 (= res!1049907 (validKeyInArray!0 (select (arr!49132 a!2804) j!70)))))

(declare-fun b!1534254 () Bool)

(declare-fun res!1049903 () Bool)

(assert (=> b!1534254 (=> (not res!1049903) (not e!855011))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1534254 (= res!1049903 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49683 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49683 a!2804))))))

(declare-fun b!1534255 () Bool)

(declare-fun e!855008 () Bool)

(declare-fun e!855007 () Bool)

(assert (=> b!1534255 (= e!855008 e!855007)))

(declare-fun res!1049914 () Bool)

(assert (=> b!1534255 (=> (not res!1049914) (not e!855007))))

(declare-fun lt!664338 () SeekEntryResult!13190)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101836 (_ BitVec 32)) SeekEntryResult!13190)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534255 (= res!1049914 (= lt!664338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!664341 mask!2512) lt!664341 lt!664343 mask!2512)))))

(assert (=> b!1534255 (= lt!664341 (select (store (arr!49132 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1534255 (= lt!664343 (array!101837 (store (arr!49132 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49683 a!2804)))))

(declare-fun b!1534256 () Bool)

(declare-fun e!855012 () Bool)

(assert (=> b!1534256 (= e!855012 e!855010)))

(declare-fun res!1049904 () Bool)

(assert (=> b!1534256 (=> res!1049904 e!855010)))

(assert (=> b!1534256 (= res!1049904 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664340 #b00000000000000000000000000000000) (bvsge lt!664340 (size!49683 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534256 (= lt!664340 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1534257 () Bool)

(declare-fun res!1049911 () Bool)

(assert (=> b!1534257 (=> (not res!1049911) (not e!855011))))

(declare-datatypes ((List!35602 0))(
  ( (Nil!35599) (Cons!35598 (h!37061 (_ BitVec 64)) (t!50288 List!35602)) )
))
(declare-fun arrayNoDuplicates!0 (array!101836 (_ BitVec 32) List!35602) Bool)

(assert (=> b!1534257 (= res!1049911 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35599))))

(declare-fun b!1534258 () Bool)

(assert (=> b!1534258 (= e!855007 (not e!855012))))

(declare-fun res!1049912 () Bool)

(assert (=> b!1534258 (=> res!1049912 e!855012)))

(assert (=> b!1534258 (= res!1049912 (or (not (= (select (arr!49132 a!2804) j!70) lt!664341)) (= x!534 resX!21)))))

(assert (=> b!1534258 e!855013))

(declare-fun res!1049908 () Bool)

(assert (=> b!1534258 (=> (not res!1049908) (not e!855013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101836 (_ BitVec 32)) Bool)

(assert (=> b!1534258 (= res!1049908 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!664342 () Unit!51199)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51199)

(assert (=> b!1534258 (= lt!664342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1049916 () Bool)

(assert (=> start!130920 (=> (not res!1049916) (not e!855011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130920 (= res!1049916 (validMask!0 mask!2512))))

(assert (=> start!130920 e!855011))

(assert (=> start!130920 true))

(declare-fun array_inv!38413 (array!101836) Bool)

(assert (=> start!130920 (array_inv!38413 a!2804)))

(declare-fun b!1534250 () Bool)

(assert (=> b!1534250 (= e!855011 e!855008)))

(declare-fun res!1049910 () Bool)

(assert (=> b!1534250 (=> (not res!1049910) (not e!855008))))

(declare-fun lt!664339 () SeekEntryResult!13190)

(assert (=> b!1534250 (= res!1049910 (= lt!664338 lt!664339))))

(assert (=> b!1534250 (= lt!664339 (Intermediate!13190 false resIndex!21 resX!21))))

(assert (=> b!1534250 (= lt!664338 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49132 a!2804) j!70) mask!2512) (select (arr!49132 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1534259 () Bool)

(declare-fun res!1049915 () Bool)

(assert (=> b!1534259 (=> (not res!1049915) (not e!855011))))

(assert (=> b!1534259 (= res!1049915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1534260 () Bool)

(declare-fun res!1049905 () Bool)

(assert (=> b!1534260 (=> (not res!1049905) (not e!855011))))

(assert (=> b!1534260 (= res!1049905 (and (= (size!49683 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49683 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49683 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1534261 () Bool)

(declare-fun res!1049913 () Bool)

(assert (=> b!1534261 (=> (not res!1049913) (not e!855008))))

(assert (=> b!1534261 (= res!1049913 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49132 a!2804) j!70) a!2804 mask!2512) lt!664339))))

(declare-fun b!1534262 () Bool)

(declare-fun res!1049909 () Bool)

(assert (=> b!1534262 (=> res!1049909 e!855010)))

(assert (=> b!1534262 (= res!1049909 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664340 (select (arr!49132 a!2804) j!70) a!2804 mask!2512) lt!664339)))))

(assert (= (and start!130920 res!1049916) b!1534260))

(assert (= (and b!1534260 res!1049905) b!1534249))

(assert (= (and b!1534249 res!1049906) b!1534253))

(assert (= (and b!1534253 res!1049907) b!1534259))

(assert (= (and b!1534259 res!1049915) b!1534257))

(assert (= (and b!1534257 res!1049911) b!1534254))

(assert (= (and b!1534254 res!1049903) b!1534250))

(assert (= (and b!1534250 res!1049910) b!1534261))

(assert (= (and b!1534261 res!1049913) b!1534255))

(assert (= (and b!1534255 res!1049914) b!1534258))

(assert (= (and b!1534258 res!1049908) b!1534252))

(assert (= (and b!1534258 (not res!1049912)) b!1534256))

(assert (= (and b!1534256 (not res!1049904)) b!1534262))

(assert (= (and b!1534262 (not res!1049909)) b!1534251))

(declare-fun m!1416793 () Bool)

(assert (=> b!1534261 m!1416793))

(assert (=> b!1534261 m!1416793))

(declare-fun m!1416795 () Bool)

(assert (=> b!1534261 m!1416795))

(declare-fun m!1416797 () Bool)

(assert (=> start!130920 m!1416797))

(declare-fun m!1416799 () Bool)

(assert (=> start!130920 m!1416799))

(assert (=> b!1534250 m!1416793))

(assert (=> b!1534250 m!1416793))

(declare-fun m!1416801 () Bool)

(assert (=> b!1534250 m!1416801))

(assert (=> b!1534250 m!1416801))

(assert (=> b!1534250 m!1416793))

(declare-fun m!1416803 () Bool)

(assert (=> b!1534250 m!1416803))

(declare-fun m!1416805 () Bool)

(assert (=> b!1534256 m!1416805))

(declare-fun m!1416807 () Bool)

(assert (=> b!1534257 m!1416807))

(assert (=> b!1534252 m!1416793))

(assert (=> b!1534252 m!1416793))

(declare-fun m!1416809 () Bool)

(assert (=> b!1534252 m!1416809))

(assert (=> b!1534251 m!1416793))

(assert (=> b!1534251 m!1416793))

(declare-fun m!1416811 () Bool)

(assert (=> b!1534251 m!1416811))

(declare-fun m!1416813 () Bool)

(assert (=> b!1534251 m!1416813))

(declare-fun m!1416815 () Bool)

(assert (=> b!1534251 m!1416815))

(assert (=> b!1534258 m!1416793))

(declare-fun m!1416817 () Bool)

(assert (=> b!1534258 m!1416817))

(declare-fun m!1416819 () Bool)

(assert (=> b!1534258 m!1416819))

(declare-fun m!1416821 () Bool)

(assert (=> b!1534255 m!1416821))

(assert (=> b!1534255 m!1416821))

(declare-fun m!1416823 () Bool)

(assert (=> b!1534255 m!1416823))

(declare-fun m!1416825 () Bool)

(assert (=> b!1534255 m!1416825))

(declare-fun m!1416827 () Bool)

(assert (=> b!1534255 m!1416827))

(declare-fun m!1416829 () Bool)

(assert (=> b!1534249 m!1416829))

(assert (=> b!1534249 m!1416829))

(declare-fun m!1416831 () Bool)

(assert (=> b!1534249 m!1416831))

(assert (=> b!1534262 m!1416793))

(assert (=> b!1534262 m!1416793))

(declare-fun m!1416833 () Bool)

(assert (=> b!1534262 m!1416833))

(declare-fun m!1416835 () Bool)

(assert (=> b!1534259 m!1416835))

(assert (=> b!1534253 m!1416793))

(assert (=> b!1534253 m!1416793))

(declare-fun m!1416837 () Bool)

(assert (=> b!1534253 m!1416837))

(check-sat (not b!1534249) (not b!1534256) (not start!130920) (not b!1534261) (not b!1534255) (not b!1534252) (not b!1534258) (not b!1534250) (not b!1534251) (not b!1534259) (not b!1534253) (not b!1534257) (not b!1534262))
(check-sat)
