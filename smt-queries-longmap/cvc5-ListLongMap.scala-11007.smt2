; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128874 () Bool)

(assert start!128874)

(declare-fun b!1510411 () Bool)

(declare-fun res!1030321 () Bool)

(declare-fun e!843450 () Bool)

(assert (=> b!1510411 (=> (not res!1030321) (not e!843450))))

(declare-datatypes ((array!100730 0))(
  ( (array!100731 (arr!48602 (Array (_ BitVec 32) (_ BitVec 64))) (size!49152 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100730)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510411 (= res!1030321 (validKeyInArray!0 (select (arr!48602 a!2804) i!961)))))

(declare-fun b!1510412 () Bool)

(declare-fun res!1030323 () Bool)

(declare-fun e!843451 () Bool)

(assert (=> b!1510412 (=> (not res!1030323) (not e!843451))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12773 0))(
  ( (MissingZero!12773 (index!53487 (_ BitVec 32))) (Found!12773 (index!53488 (_ BitVec 32))) (Intermediate!12773 (undefined!13585 Bool) (index!53489 (_ BitVec 32)) (x!135235 (_ BitVec 32))) (Undefined!12773) (MissingVacant!12773 (index!53490 (_ BitVec 32))) )
))
(declare-fun lt!655160 () SeekEntryResult!12773)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100730 (_ BitVec 32)) SeekEntryResult!12773)

(assert (=> b!1510412 (= res!1030323 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48602 a!2804) j!70) a!2804 mask!2512) lt!655160))))

(declare-fun b!1510413 () Bool)

(declare-fun res!1030316 () Bool)

(assert (=> b!1510413 (=> (not res!1030316) (not e!843450))))

(declare-datatypes ((List!35085 0))(
  ( (Nil!35082) (Cons!35081 (h!36493 (_ BitVec 64)) (t!49779 List!35085)) )
))
(declare-fun arrayNoDuplicates!0 (array!100730 (_ BitVec 32) List!35085) Bool)

(assert (=> b!1510413 (= res!1030316 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35082))))

(declare-fun b!1510414 () Bool)

(declare-fun res!1030322 () Bool)

(assert (=> b!1510414 (=> (not res!1030322) (not e!843450))))

(assert (=> b!1510414 (= res!1030322 (validKeyInArray!0 (select (arr!48602 a!2804) j!70)))))

(declare-fun b!1510415 () Bool)

(assert (=> b!1510415 (= e!843451 (not true))))

(declare-fun e!843449 () Bool)

(assert (=> b!1510415 e!843449))

(declare-fun res!1030318 () Bool)

(assert (=> b!1510415 (=> (not res!1030318) (not e!843449))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100730 (_ BitVec 32)) Bool)

(assert (=> b!1510415 (= res!1030318 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50414 0))(
  ( (Unit!50415) )
))
(declare-fun lt!655162 () Unit!50414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100730 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50414)

(assert (=> b!1510415 (= lt!655162 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510416 () Bool)

(declare-fun res!1030319 () Bool)

(assert (=> b!1510416 (=> (not res!1030319) (not e!843450))))

(assert (=> b!1510416 (= res!1030319 (and (= (size!49152 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49152 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49152 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510417 () Bool)

(declare-fun res!1030317 () Bool)

(assert (=> b!1510417 (=> (not res!1030317) (not e!843451))))

(declare-fun lt!655161 () SeekEntryResult!12773)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510417 (= res!1030317 (= lt!655161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48602 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48602 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100731 (store (arr!48602 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49152 a!2804)) mask!2512)))))

(declare-fun res!1030314 () Bool)

(assert (=> start!128874 (=> (not res!1030314) (not e!843450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128874 (= res!1030314 (validMask!0 mask!2512))))

(assert (=> start!128874 e!843450))

(assert (=> start!128874 true))

(declare-fun array_inv!37630 (array!100730) Bool)

(assert (=> start!128874 (array_inv!37630 a!2804)))

(declare-fun b!1510418 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100730 (_ BitVec 32)) SeekEntryResult!12773)

(assert (=> b!1510418 (= e!843449 (= (seekEntry!0 (select (arr!48602 a!2804) j!70) a!2804 mask!2512) (Found!12773 j!70)))))

(declare-fun b!1510419 () Bool)

(declare-fun res!1030320 () Bool)

(assert (=> b!1510419 (=> (not res!1030320) (not e!843450))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510419 (= res!1030320 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49152 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49152 a!2804))))))

(declare-fun b!1510420 () Bool)

(assert (=> b!1510420 (= e!843450 e!843451)))

(declare-fun res!1030324 () Bool)

(assert (=> b!1510420 (=> (not res!1030324) (not e!843451))))

(assert (=> b!1510420 (= res!1030324 (= lt!655161 lt!655160))))

(assert (=> b!1510420 (= lt!655160 (Intermediate!12773 false resIndex!21 resX!21))))

(assert (=> b!1510420 (= lt!655161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48602 a!2804) j!70) mask!2512) (select (arr!48602 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510421 () Bool)

(declare-fun res!1030315 () Bool)

(assert (=> b!1510421 (=> (not res!1030315) (not e!843450))))

(assert (=> b!1510421 (= res!1030315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128874 res!1030314) b!1510416))

(assert (= (and b!1510416 res!1030319) b!1510411))

(assert (= (and b!1510411 res!1030321) b!1510414))

(assert (= (and b!1510414 res!1030322) b!1510421))

(assert (= (and b!1510421 res!1030315) b!1510413))

(assert (= (and b!1510413 res!1030316) b!1510419))

(assert (= (and b!1510419 res!1030320) b!1510420))

(assert (= (and b!1510420 res!1030324) b!1510412))

(assert (= (and b!1510412 res!1030323) b!1510417))

(assert (= (and b!1510417 res!1030317) b!1510415))

(assert (= (and b!1510415 res!1030318) b!1510418))

(declare-fun m!1392997 () Bool)

(assert (=> b!1510414 m!1392997))

(assert (=> b!1510414 m!1392997))

(declare-fun m!1392999 () Bool)

(assert (=> b!1510414 m!1392999))

(declare-fun m!1393001 () Bool)

(assert (=> b!1510415 m!1393001))

(declare-fun m!1393003 () Bool)

(assert (=> b!1510415 m!1393003))

(declare-fun m!1393005 () Bool)

(assert (=> start!128874 m!1393005))

(declare-fun m!1393007 () Bool)

(assert (=> start!128874 m!1393007))

(declare-fun m!1393009 () Bool)

(assert (=> b!1510417 m!1393009))

(declare-fun m!1393011 () Bool)

(assert (=> b!1510417 m!1393011))

(assert (=> b!1510417 m!1393011))

(declare-fun m!1393013 () Bool)

(assert (=> b!1510417 m!1393013))

(assert (=> b!1510417 m!1393013))

(assert (=> b!1510417 m!1393011))

(declare-fun m!1393015 () Bool)

(assert (=> b!1510417 m!1393015))

(declare-fun m!1393017 () Bool)

(assert (=> b!1510413 m!1393017))

(assert (=> b!1510412 m!1392997))

(assert (=> b!1510412 m!1392997))

(declare-fun m!1393019 () Bool)

(assert (=> b!1510412 m!1393019))

(assert (=> b!1510420 m!1392997))

(assert (=> b!1510420 m!1392997))

(declare-fun m!1393021 () Bool)

(assert (=> b!1510420 m!1393021))

(assert (=> b!1510420 m!1393021))

(assert (=> b!1510420 m!1392997))

(declare-fun m!1393023 () Bool)

(assert (=> b!1510420 m!1393023))

(declare-fun m!1393025 () Bool)

(assert (=> b!1510411 m!1393025))

(assert (=> b!1510411 m!1393025))

(declare-fun m!1393027 () Bool)

(assert (=> b!1510411 m!1393027))

(assert (=> b!1510418 m!1392997))

(assert (=> b!1510418 m!1392997))

(declare-fun m!1393029 () Bool)

(assert (=> b!1510418 m!1393029))

(declare-fun m!1393031 () Bool)

(assert (=> b!1510421 m!1393031))

(push 1)

