; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128990 () Bool)

(assert start!128990)

(declare-fun b!1512470 () Bool)

(declare-fun res!1032374 () Bool)

(declare-fun e!844225 () Bool)

(assert (=> b!1512470 (=> (not res!1032374) (not e!844225))))

(declare-datatypes ((array!100846 0))(
  ( (array!100847 (arr!48660 (Array (_ BitVec 32) (_ BitVec 64))) (size!49210 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100846)

(declare-datatypes ((List!35143 0))(
  ( (Nil!35140) (Cons!35139 (h!36551 (_ BitVec 64)) (t!49837 List!35143)) )
))
(declare-fun arrayNoDuplicates!0 (array!100846 (_ BitVec 32) List!35143) Bool)

(assert (=> b!1512470 (= res!1032374 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35140))))

(declare-fun b!1512471 () Bool)

(declare-fun res!1032384 () Bool)

(assert (=> b!1512471 (=> (not res!1032384) (not e!844225))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512471 (= res!1032384 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49210 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49210 a!2804))))))

(declare-fun b!1512473 () Bool)

(declare-fun res!1032379 () Bool)

(declare-fun e!844224 () Bool)

(assert (=> b!1512473 (=> (not res!1032379) (not e!844224))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12831 0))(
  ( (MissingZero!12831 (index!53719 (_ BitVec 32))) (Found!12831 (index!53720 (_ BitVec 32))) (Intermediate!12831 (undefined!13643 Bool) (index!53721 (_ BitVec 32)) (x!135445 (_ BitVec 32))) (Undefined!12831) (MissingVacant!12831 (index!53722 (_ BitVec 32))) )
))
(declare-fun lt!655683 () SeekEntryResult!12831)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512473 (= res!1032379 (= lt!655683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48660 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48660 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100847 (store (arr!48660 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49210 a!2804)) mask!2512)))))

(declare-fun b!1512474 () Bool)

(declare-fun res!1032378 () Bool)

(assert (=> b!1512474 (=> (not res!1032378) (not e!844225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512474 (= res!1032378 (validKeyInArray!0 (select (arr!48660 a!2804) j!70)))))

(declare-fun b!1512475 () Bool)

(assert (=> b!1512475 (= e!844224 (not (or (not (= (select (arr!48660 a!2804) j!70) (select (store (arr!48660 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48660 a!2804) index!487) (select (arr!48660 a!2804) j!70)) (not (= (select (arr!48660 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!844221 () Bool)

(assert (=> b!1512475 e!844221))

(declare-fun res!1032376 () Bool)

(assert (=> b!1512475 (=> (not res!1032376) (not e!844221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100846 (_ BitVec 32)) Bool)

(assert (=> b!1512475 (= res!1032376 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50530 0))(
  ( (Unit!50531) )
))
(declare-fun lt!655682 () Unit!50530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50530)

(assert (=> b!1512475 (= lt!655682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512476 () Bool)

(declare-fun res!1032377 () Bool)

(assert (=> b!1512476 (=> (not res!1032377) (not e!844225))))

(assert (=> b!1512476 (= res!1032377 (and (= (size!49210 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49210 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49210 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512477 () Bool)

(declare-fun res!1032383 () Bool)

(assert (=> b!1512477 (=> (not res!1032383) (not e!844225))))

(assert (=> b!1512477 (= res!1032383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512478 () Bool)

(declare-fun res!1032385 () Bool)

(assert (=> b!1512478 (=> (not res!1032385) (not e!844225))))

(assert (=> b!1512478 (= res!1032385 (validKeyInArray!0 (select (arr!48660 a!2804) i!961)))))

(declare-fun b!1512479 () Bool)

(declare-fun e!844222 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12831)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12831)

(assert (=> b!1512479 (= e!844222 (= (seekEntryOrOpen!0 (select (arr!48660 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48660 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512480 () Bool)

(assert (=> b!1512480 (= e!844225 e!844224)))

(declare-fun res!1032381 () Bool)

(assert (=> b!1512480 (=> (not res!1032381) (not e!844224))))

(declare-fun lt!655684 () SeekEntryResult!12831)

(assert (=> b!1512480 (= res!1032381 (= lt!655683 lt!655684))))

(assert (=> b!1512480 (= lt!655684 (Intermediate!12831 false resIndex!21 resX!21))))

(assert (=> b!1512480 (= lt!655683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48660 a!2804) j!70) mask!2512) (select (arr!48660 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1032373 () Bool)

(assert (=> start!128990 (=> (not res!1032373) (not e!844225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128990 (= res!1032373 (validMask!0 mask!2512))))

(assert (=> start!128990 e!844225))

(assert (=> start!128990 true))

(declare-fun array_inv!37688 (array!100846) Bool)

(assert (=> start!128990 (array_inv!37688 a!2804)))

(declare-fun b!1512472 () Bool)

(declare-fun res!1032375 () Bool)

(assert (=> b!1512472 (=> (not res!1032375) (not e!844224))))

(assert (=> b!1512472 (= res!1032375 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48660 a!2804) j!70) a!2804 mask!2512) lt!655684))))

(declare-fun b!1512481 () Bool)

(assert (=> b!1512481 (= e!844221 e!844222)))

(declare-fun res!1032380 () Bool)

(assert (=> b!1512481 (=> res!1032380 e!844222)))

(assert (=> b!1512481 (= res!1032380 (or (not (= (select (arr!48660 a!2804) j!70) (select (store (arr!48660 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48660 a!2804) index!487) (select (arr!48660 a!2804) j!70)) (not (= (select (arr!48660 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512482 () Bool)

(declare-fun res!1032382 () Bool)

(assert (=> b!1512482 (=> (not res!1032382) (not e!844221))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100846 (_ BitVec 32)) SeekEntryResult!12831)

(assert (=> b!1512482 (= res!1032382 (= (seekEntry!0 (select (arr!48660 a!2804) j!70) a!2804 mask!2512) (Found!12831 j!70)))))

(assert (= (and start!128990 res!1032373) b!1512476))

(assert (= (and b!1512476 res!1032377) b!1512478))

(assert (= (and b!1512478 res!1032385) b!1512474))

(assert (= (and b!1512474 res!1032378) b!1512477))

(assert (= (and b!1512477 res!1032383) b!1512470))

(assert (= (and b!1512470 res!1032374) b!1512471))

(assert (= (and b!1512471 res!1032384) b!1512480))

(assert (= (and b!1512480 res!1032381) b!1512472))

(assert (= (and b!1512472 res!1032375) b!1512473))

(assert (= (and b!1512473 res!1032379) b!1512475))

(assert (= (and b!1512475 res!1032376) b!1512482))

(assert (= (and b!1512482 res!1032382) b!1512481))

(assert (= (and b!1512481 (not res!1032380)) b!1512479))

(declare-fun m!1395241 () Bool)

(assert (=> b!1512475 m!1395241))

(declare-fun m!1395243 () Bool)

(assert (=> b!1512475 m!1395243))

(declare-fun m!1395245 () Bool)

(assert (=> b!1512475 m!1395245))

(declare-fun m!1395247 () Bool)

(assert (=> b!1512475 m!1395247))

(declare-fun m!1395249 () Bool)

(assert (=> b!1512475 m!1395249))

(declare-fun m!1395251 () Bool)

(assert (=> b!1512475 m!1395251))

(declare-fun m!1395253 () Bool)

(assert (=> b!1512477 m!1395253))

(declare-fun m!1395255 () Bool)

(assert (=> b!1512478 m!1395255))

(assert (=> b!1512478 m!1395255))

(declare-fun m!1395257 () Bool)

(assert (=> b!1512478 m!1395257))

(assert (=> b!1512480 m!1395241))

(assert (=> b!1512480 m!1395241))

(declare-fun m!1395259 () Bool)

(assert (=> b!1512480 m!1395259))

(assert (=> b!1512480 m!1395259))

(assert (=> b!1512480 m!1395241))

(declare-fun m!1395261 () Bool)

(assert (=> b!1512480 m!1395261))

(assert (=> b!1512481 m!1395241))

(assert (=> b!1512481 m!1395245))

(assert (=> b!1512481 m!1395249))

(assert (=> b!1512481 m!1395247))

(declare-fun m!1395263 () Bool)

(assert (=> start!128990 m!1395263))

(declare-fun m!1395265 () Bool)

(assert (=> start!128990 m!1395265))

(assert (=> b!1512479 m!1395241))

(assert (=> b!1512479 m!1395241))

(declare-fun m!1395267 () Bool)

(assert (=> b!1512479 m!1395267))

(assert (=> b!1512479 m!1395241))

(declare-fun m!1395269 () Bool)

(assert (=> b!1512479 m!1395269))

(assert (=> b!1512482 m!1395241))

(assert (=> b!1512482 m!1395241))

(declare-fun m!1395271 () Bool)

(assert (=> b!1512482 m!1395271))

(assert (=> b!1512472 m!1395241))

(assert (=> b!1512472 m!1395241))

(declare-fun m!1395273 () Bool)

(assert (=> b!1512472 m!1395273))

(declare-fun m!1395275 () Bool)

(assert (=> b!1512470 m!1395275))

(assert (=> b!1512473 m!1395245))

(assert (=> b!1512473 m!1395249))

(assert (=> b!1512473 m!1395249))

(declare-fun m!1395277 () Bool)

(assert (=> b!1512473 m!1395277))

(assert (=> b!1512473 m!1395277))

(assert (=> b!1512473 m!1395249))

(declare-fun m!1395279 () Bool)

(assert (=> b!1512473 m!1395279))

(assert (=> b!1512474 m!1395241))

(assert (=> b!1512474 m!1395241))

(declare-fun m!1395281 () Bool)

(assert (=> b!1512474 m!1395281))

(check-sat (not b!1512479) (not b!1512480) (not b!1512478) (not b!1512477) (not b!1512473) (not b!1512472) (not b!1512475) (not b!1512470) (not start!128990) (not b!1512482) (not b!1512474))
(check-sat)
