; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129146 () Bool)

(assert start!129146)

(declare-fun b!1516276 () Bool)

(declare-fun res!1036388 () Bool)

(declare-fun e!846019 () Bool)

(assert (=> b!1516276 (=> (not res!1036388) (not e!846019))))

(declare-datatypes ((SeekEntryResult!12933 0))(
  ( (MissingZero!12933 (index!54127 (_ BitVec 32))) (Found!12933 (index!54128 (_ BitVec 32))) (Intermediate!12933 (undefined!13745 Bool) (index!54129 (_ BitVec 32)) (x!135821 (_ BitVec 32))) (Undefined!12933) (MissingVacant!12933 (index!54130 (_ BitVec 32))) )
))
(declare-fun lt!657174 () SeekEntryResult!12933)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101002 0))(
  ( (array!101003 (arr!48739 (Array (_ BitVec 32) (_ BitVec 64))) (size!49291 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101002)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516276 (= res!1036388 (= lt!657174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101003 (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49291 a!2804)) mask!2512)))))

(declare-fun b!1516277 () Bool)

(declare-fun res!1036392 () Bool)

(assert (=> b!1516277 (=> (not res!1036392) (not e!846019))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657173 () SeekEntryResult!12933)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516277 (= res!1036392 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) lt!657173))))

(declare-fun b!1516278 () Bool)

(declare-fun res!1036389 () Bool)

(declare-fun e!846021 () Bool)

(assert (=> b!1516278 (=> (not res!1036389) (not e!846021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101002 (_ BitVec 32)) Bool)

(assert (=> b!1516278 (= res!1036389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516280 () Bool)

(declare-fun res!1036385 () Bool)

(assert (=> b!1516280 (=> (not res!1036385) (not e!846021))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516280 (= res!1036385 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49291 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49291 a!2804))))))

(declare-fun b!1516281 () Bool)

(declare-fun res!1036391 () Bool)

(assert (=> b!1516281 (=> (not res!1036391) (not e!846021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516281 (= res!1036391 (validKeyInArray!0 (select (arr!48739 a!2804) i!961)))))

(declare-fun b!1516282 () Bool)

(declare-fun e!846022 () Bool)

(assert (=> b!1516282 (= e!846019 (not e!846022))))

(declare-fun res!1036395 () Bool)

(assert (=> b!1516282 (=> res!1036395 e!846022)))

(assert (=> b!1516282 (= res!1036395 (or (not (= (select (arr!48739 a!2804) j!70) (select (store (arr!48739 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846024 () Bool)

(assert (=> b!1516282 e!846024))

(declare-fun res!1036390 () Bool)

(assert (=> b!1516282 (=> (not res!1036390) (not e!846024))))

(assert (=> b!1516282 (= res!1036390 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50573 0))(
  ( (Unit!50574) )
))
(declare-fun lt!657176 () Unit!50573)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50573)

(assert (=> b!1516282 (= lt!657176 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516283 () Bool)

(declare-fun e!846020 () Bool)

(assert (=> b!1516283 (= e!846020 true)))

(declare-fun lt!657177 () (_ BitVec 32))

(declare-fun lt!657175 () SeekEntryResult!12933)

(assert (=> b!1516283 (= lt!657175 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657177 (select (arr!48739 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516284 () Bool)

(assert (=> b!1516284 (= e!846021 e!846019)))

(declare-fun res!1036393 () Bool)

(assert (=> b!1516284 (=> (not res!1036393) (not e!846019))))

(assert (=> b!1516284 (= res!1036393 (= lt!657174 lt!657173))))

(assert (=> b!1516284 (= lt!657173 (Intermediate!12933 false resIndex!21 resX!21))))

(assert (=> b!1516284 (= lt!657174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48739 a!2804) j!70) mask!2512) (select (arr!48739 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516279 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101002 (_ BitVec 32)) SeekEntryResult!12933)

(assert (=> b!1516279 (= e!846024 (= (seekEntry!0 (select (arr!48739 a!2804) j!70) a!2804 mask!2512) (Found!12933 j!70)))))

(declare-fun res!1036394 () Bool)

(assert (=> start!129146 (=> (not res!1036394) (not e!846021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129146 (= res!1036394 (validMask!0 mask!2512))))

(assert (=> start!129146 e!846021))

(assert (=> start!129146 true))

(declare-fun array_inv!37972 (array!101002) Bool)

(assert (=> start!129146 (array_inv!37972 a!2804)))

(declare-fun b!1516285 () Bool)

(assert (=> b!1516285 (= e!846022 e!846020)))

(declare-fun res!1036396 () Bool)

(assert (=> b!1516285 (=> res!1036396 e!846020)))

(assert (=> b!1516285 (= res!1036396 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657177 #b00000000000000000000000000000000) (bvsge lt!657177 (size!49291 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516285 (= lt!657177 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516286 () Bool)

(declare-fun res!1036387 () Bool)

(assert (=> b!1516286 (=> (not res!1036387) (not e!846021))))

(assert (=> b!1516286 (= res!1036387 (validKeyInArray!0 (select (arr!48739 a!2804) j!70)))))

(declare-fun b!1516287 () Bool)

(declare-fun res!1036386 () Bool)

(assert (=> b!1516287 (=> (not res!1036386) (not e!846021))))

(assert (=> b!1516287 (= res!1036386 (and (= (size!49291 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49291 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49291 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516288 () Bool)

(declare-fun res!1036397 () Bool)

(assert (=> b!1516288 (=> (not res!1036397) (not e!846021))))

(declare-datatypes ((List!35300 0))(
  ( (Nil!35297) (Cons!35296 (h!36709 (_ BitVec 64)) (t!49986 List!35300)) )
))
(declare-fun arrayNoDuplicates!0 (array!101002 (_ BitVec 32) List!35300) Bool)

(assert (=> b!1516288 (= res!1036397 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35297))))

(assert (= (and start!129146 res!1036394) b!1516287))

(assert (= (and b!1516287 res!1036386) b!1516281))

(assert (= (and b!1516281 res!1036391) b!1516286))

(assert (= (and b!1516286 res!1036387) b!1516278))

(assert (= (and b!1516278 res!1036389) b!1516288))

(assert (= (and b!1516288 res!1036397) b!1516280))

(assert (= (and b!1516280 res!1036385) b!1516284))

(assert (= (and b!1516284 res!1036393) b!1516277))

(assert (= (and b!1516277 res!1036392) b!1516276))

(assert (= (and b!1516276 res!1036388) b!1516282))

(assert (= (and b!1516282 res!1036390) b!1516279))

(assert (= (and b!1516282 (not res!1036395)) b!1516285))

(assert (= (and b!1516285 (not res!1036396)) b!1516283))

(declare-fun m!1398977 () Bool)

(assert (=> b!1516286 m!1398977))

(assert (=> b!1516286 m!1398977))

(declare-fun m!1398979 () Bool)

(assert (=> b!1516286 m!1398979))

(assert (=> b!1516283 m!1398977))

(assert (=> b!1516283 m!1398977))

(declare-fun m!1398981 () Bool)

(assert (=> b!1516283 m!1398981))

(assert (=> b!1516284 m!1398977))

(assert (=> b!1516284 m!1398977))

(declare-fun m!1398983 () Bool)

(assert (=> b!1516284 m!1398983))

(assert (=> b!1516284 m!1398983))

(assert (=> b!1516284 m!1398977))

(declare-fun m!1398985 () Bool)

(assert (=> b!1516284 m!1398985))

(declare-fun m!1398987 () Bool)

(assert (=> b!1516285 m!1398987))

(declare-fun m!1398989 () Bool)

(assert (=> b!1516278 m!1398989))

(assert (=> b!1516279 m!1398977))

(assert (=> b!1516279 m!1398977))

(declare-fun m!1398991 () Bool)

(assert (=> b!1516279 m!1398991))

(declare-fun m!1398993 () Bool)

(assert (=> b!1516288 m!1398993))

(declare-fun m!1398995 () Bool)

(assert (=> start!129146 m!1398995))

(declare-fun m!1398997 () Bool)

(assert (=> start!129146 m!1398997))

(assert (=> b!1516282 m!1398977))

(declare-fun m!1398999 () Bool)

(assert (=> b!1516282 m!1398999))

(declare-fun m!1399001 () Bool)

(assert (=> b!1516282 m!1399001))

(declare-fun m!1399003 () Bool)

(assert (=> b!1516282 m!1399003))

(declare-fun m!1399005 () Bool)

(assert (=> b!1516282 m!1399005))

(assert (=> b!1516276 m!1399001))

(assert (=> b!1516276 m!1399003))

(assert (=> b!1516276 m!1399003))

(declare-fun m!1399007 () Bool)

(assert (=> b!1516276 m!1399007))

(assert (=> b!1516276 m!1399007))

(assert (=> b!1516276 m!1399003))

(declare-fun m!1399009 () Bool)

(assert (=> b!1516276 m!1399009))

(assert (=> b!1516277 m!1398977))

(assert (=> b!1516277 m!1398977))

(declare-fun m!1399011 () Bool)

(assert (=> b!1516277 m!1399011))

(declare-fun m!1399013 () Bool)

(assert (=> b!1516281 m!1399013))

(assert (=> b!1516281 m!1399013))

(declare-fun m!1399015 () Bool)

(assert (=> b!1516281 m!1399015))

(check-sat (not b!1516284) (not b!1516282) (not b!1516281) (not b!1516286) (not b!1516279) (not b!1516278) (not b!1516277) (not b!1516288) (not start!129146) (not b!1516285) (not b!1516283) (not b!1516276))
(check-sat)
