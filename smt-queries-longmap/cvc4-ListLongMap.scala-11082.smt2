; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129328 () Bool)

(assert start!129328)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101184 0))(
  ( (array!101185 (arr!48829 (Array (_ BitVec 32) (_ BitVec 64))) (size!49379 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101184)

(declare-fun b!1519204 () Bool)

(declare-fun e!847461 () Bool)

(declare-datatypes ((SeekEntryResult!13000 0))(
  ( (MissingZero!13000 (index!54395 (_ BitVec 32))) (Found!13000 (index!54396 (_ BitVec 32))) (Intermediate!13000 (undefined!13812 Bool) (index!54397 (_ BitVec 32)) (x!136062 (_ BitVec 32))) (Undefined!13000) (MissingVacant!13000 (index!54398 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101184 (_ BitVec 32)) SeekEntryResult!13000)

(assert (=> b!1519204 (= e!847461 (= (seekEntry!0 (select (arr!48829 a!2804) j!70) a!2804 mask!2512) (Found!13000 j!70)))))

(declare-fun b!1519205 () Bool)

(declare-fun res!1039109 () Bool)

(declare-fun e!847457 () Bool)

(assert (=> b!1519205 (=> (not res!1039109) (not e!847457))))

(declare-fun lt!658553 () SeekEntryResult!13000)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101184 (_ BitVec 32)) SeekEntryResult!13000)

(assert (=> b!1519205 (= res!1039109 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48829 a!2804) j!70) a!2804 mask!2512) lt!658553))))

(declare-fun b!1519206 () Bool)

(declare-fun e!847459 () Bool)

(assert (=> b!1519206 (= e!847457 e!847459)))

(declare-fun res!1039107 () Bool)

(assert (=> b!1519206 (=> (not res!1039107) (not e!847459))))

(declare-fun lt!658549 () SeekEntryResult!13000)

(declare-fun lt!658550 () (_ BitVec 64))

(declare-fun lt!658554 () array!101184)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519206 (= res!1039107 (= lt!658549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658550 mask!2512) lt!658550 lt!658554 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1519206 (= lt!658550 (select (store (arr!48829 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1519206 (= lt!658554 (array!101185 (store (arr!48829 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49379 a!2804)))))

(declare-fun b!1519207 () Bool)

(declare-fun e!847456 () Bool)

(assert (=> b!1519207 (= e!847459 (not e!847456))))

(declare-fun res!1039112 () Bool)

(assert (=> b!1519207 (=> res!1039112 e!847456)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519207 (= res!1039112 (or (not (= (select (arr!48829 a!2804) j!70) lt!658550)) (= x!534 resX!21)))))

(assert (=> b!1519207 e!847461))

(declare-fun res!1039118 () Bool)

(assert (=> b!1519207 (=> (not res!1039118) (not e!847461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101184 (_ BitVec 32)) Bool)

(assert (=> b!1519207 (= res!1039118 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50868 0))(
  ( (Unit!50869) )
))
(declare-fun lt!658555 () Unit!50868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50868)

(assert (=> b!1519207 (= lt!658555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519208 () Bool)

(declare-fun res!1039111 () Bool)

(declare-fun e!847462 () Bool)

(assert (=> b!1519208 (=> res!1039111 e!847462)))

(declare-fun lt!658551 () (_ BitVec 32))

(assert (=> b!1519208 (= res!1039111 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658551 (select (arr!48829 a!2804) j!70) a!2804 mask!2512) lt!658553)))))

(declare-fun b!1519209 () Bool)

(declare-fun res!1039110 () Bool)

(declare-fun e!847460 () Bool)

(assert (=> b!1519209 (=> (not res!1039110) (not e!847460))))

(assert (=> b!1519209 (= res!1039110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519210 () Bool)

(declare-fun res!1039119 () Bool)

(assert (=> b!1519210 (=> (not res!1039119) (not e!847460))))

(declare-datatypes ((List!35312 0))(
  ( (Nil!35309) (Cons!35308 (h!36720 (_ BitVec 64)) (t!50006 List!35312)) )
))
(declare-fun arrayNoDuplicates!0 (array!101184 (_ BitVec 32) List!35312) Bool)

(assert (=> b!1519210 (= res!1039119 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35309))))

(declare-fun b!1519211 () Bool)

(declare-fun res!1039113 () Bool)

(assert (=> b!1519211 (=> (not res!1039113) (not e!847460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519211 (= res!1039113 (validKeyInArray!0 (select (arr!48829 a!2804) i!961)))))

(declare-fun b!1519212 () Bool)

(declare-fun res!1039120 () Bool)

(assert (=> b!1519212 (=> (not res!1039120) (not e!847460))))

(assert (=> b!1519212 (= res!1039120 (validKeyInArray!0 (select (arr!48829 a!2804) j!70)))))

(declare-fun res!1039116 () Bool)

(assert (=> start!129328 (=> (not res!1039116) (not e!847460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129328 (= res!1039116 (validMask!0 mask!2512))))

(assert (=> start!129328 e!847460))

(assert (=> start!129328 true))

(declare-fun array_inv!37857 (array!101184) Bool)

(assert (=> start!129328 (array_inv!37857 a!2804)))

(declare-fun b!1519213 () Bool)

(declare-fun res!1039115 () Bool)

(assert (=> b!1519213 (=> (not res!1039115) (not e!847460))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519213 (= res!1039115 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49379 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49379 a!2804))))))

(declare-fun b!1519214 () Bool)

(assert (=> b!1519214 (= e!847456 e!847462)))

(declare-fun res!1039108 () Bool)

(assert (=> b!1519214 (=> res!1039108 e!847462)))

(assert (=> b!1519214 (= res!1039108 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658551 #b00000000000000000000000000000000) (bvsge lt!658551 (size!49379 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519214 (= lt!658551 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1519215 () Bool)

(assert (=> b!1519215 (= e!847460 e!847457)))

(declare-fun res!1039117 () Bool)

(assert (=> b!1519215 (=> (not res!1039117) (not e!847457))))

(assert (=> b!1519215 (= res!1039117 (= lt!658549 lt!658553))))

(assert (=> b!1519215 (= lt!658553 (Intermediate!13000 false resIndex!21 resX!21))))

(assert (=> b!1519215 (= lt!658549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48829 a!2804) j!70) mask!2512) (select (arr!48829 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519216 () Bool)

(declare-fun res!1039114 () Bool)

(assert (=> b!1519216 (=> (not res!1039114) (not e!847460))))

(assert (=> b!1519216 (= res!1039114 (and (= (size!49379 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49379 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49379 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519217 () Bool)

(assert (=> b!1519217 (= e!847462 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101184 (_ BitVec 32)) SeekEntryResult!13000)

(assert (=> b!1519217 (= (seekEntryOrOpen!0 (select (arr!48829 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658550 lt!658554 mask!2512))))

(declare-fun lt!658552 () Unit!50868)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50868)

(assert (=> b!1519217 (= lt!658552 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658551 resX!21 resIndex!21 mask!2512))))

(assert (= (and start!129328 res!1039116) b!1519216))

(assert (= (and b!1519216 res!1039114) b!1519211))

(assert (= (and b!1519211 res!1039113) b!1519212))

(assert (= (and b!1519212 res!1039120) b!1519209))

(assert (= (and b!1519209 res!1039110) b!1519210))

(assert (= (and b!1519210 res!1039119) b!1519213))

(assert (= (and b!1519213 res!1039115) b!1519215))

(assert (= (and b!1519215 res!1039117) b!1519205))

(assert (= (and b!1519205 res!1039109) b!1519206))

(assert (= (and b!1519206 res!1039107) b!1519207))

(assert (= (and b!1519207 res!1039118) b!1519204))

(assert (= (and b!1519207 (not res!1039112)) b!1519214))

(assert (= (and b!1519214 (not res!1039108)) b!1519208))

(assert (= (and b!1519208 (not res!1039111)) b!1519217))

(declare-fun m!1402587 () Bool)

(assert (=> b!1519215 m!1402587))

(assert (=> b!1519215 m!1402587))

(declare-fun m!1402589 () Bool)

(assert (=> b!1519215 m!1402589))

(assert (=> b!1519215 m!1402589))

(assert (=> b!1519215 m!1402587))

(declare-fun m!1402591 () Bool)

(assert (=> b!1519215 m!1402591))

(assert (=> b!1519217 m!1402587))

(assert (=> b!1519217 m!1402587))

(declare-fun m!1402593 () Bool)

(assert (=> b!1519217 m!1402593))

(declare-fun m!1402595 () Bool)

(assert (=> b!1519217 m!1402595))

(declare-fun m!1402597 () Bool)

(assert (=> b!1519217 m!1402597))

(declare-fun m!1402599 () Bool)

(assert (=> b!1519206 m!1402599))

(assert (=> b!1519206 m!1402599))

(declare-fun m!1402601 () Bool)

(assert (=> b!1519206 m!1402601))

(declare-fun m!1402603 () Bool)

(assert (=> b!1519206 m!1402603))

(declare-fun m!1402605 () Bool)

(assert (=> b!1519206 m!1402605))

(declare-fun m!1402607 () Bool)

(assert (=> b!1519211 m!1402607))

(assert (=> b!1519211 m!1402607))

(declare-fun m!1402609 () Bool)

(assert (=> b!1519211 m!1402609))

(assert (=> b!1519212 m!1402587))

(assert (=> b!1519212 m!1402587))

(declare-fun m!1402611 () Bool)

(assert (=> b!1519212 m!1402611))

(declare-fun m!1402613 () Bool)

(assert (=> b!1519210 m!1402613))

(declare-fun m!1402615 () Bool)

(assert (=> b!1519209 m!1402615))

(assert (=> b!1519207 m!1402587))

(declare-fun m!1402617 () Bool)

(assert (=> b!1519207 m!1402617))

(declare-fun m!1402619 () Bool)

(assert (=> b!1519207 m!1402619))

(assert (=> b!1519204 m!1402587))

(assert (=> b!1519204 m!1402587))

(declare-fun m!1402621 () Bool)

(assert (=> b!1519204 m!1402621))

(assert (=> b!1519208 m!1402587))

(assert (=> b!1519208 m!1402587))

(declare-fun m!1402623 () Bool)

(assert (=> b!1519208 m!1402623))

(assert (=> b!1519205 m!1402587))

(assert (=> b!1519205 m!1402587))

(declare-fun m!1402625 () Bool)

(assert (=> b!1519205 m!1402625))

(declare-fun m!1402627 () Bool)

(assert (=> b!1519214 m!1402627))

(declare-fun m!1402629 () Bool)

(assert (=> start!129328 m!1402629))

(declare-fun m!1402631 () Bool)

(assert (=> start!129328 m!1402631))

(push 1)

(assert (not b!1519208))

(assert (not b!1519205))

(assert (not b!1519204))

(assert (not b!1519210))

