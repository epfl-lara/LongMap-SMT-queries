; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120864 () Bool)

(assert start!120864)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96124 0))(
  ( (array!96125 (arr!46410 (Array (_ BitVec 32) (_ BitVec 64))) (size!46962 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96124)

(declare-fun e!795964 () Bool)

(declare-fun b!1406279 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10747 0))(
  ( (MissingZero!10747 (index!45365 (_ BitVec 32))) (Found!10747 (index!45366 (_ BitVec 32))) (Intermediate!10747 (undefined!11559 Bool) (index!45367 (_ BitVec 32)) (x!126959 (_ BitVec 32))) (Undefined!10747) (MissingVacant!10747 (index!45368 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96124 (_ BitVec 32)) SeekEntryResult!10747)

(assert (=> b!1406279 (= e!795964 (= (seekEntryOrOpen!0 (select (arr!46410 a!2901) j!112) a!2901 mask!2840) (Found!10747 j!112)))))

(declare-fun b!1406280 () Bool)

(declare-fun e!795965 () Bool)

(assert (=> b!1406280 (= e!795965 true)))

(declare-fun lt!619165 () SeekEntryResult!10747)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96124 (_ BitVec 32)) SeekEntryResult!10747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406280 (= lt!619165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46410 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46410 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96125 (store (arr!46410 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46962 a!2901)) mask!2840))))

(declare-fun b!1406281 () Bool)

(declare-fun res!944552 () Bool)

(declare-fun e!795963 () Bool)

(assert (=> b!1406281 (=> (not res!944552) (not e!795963))))

(declare-datatypes ((List!33007 0))(
  ( (Nil!33004) (Cons!33003 (h!34257 (_ BitVec 64)) (t!47693 List!33007)) )
))
(declare-fun arrayNoDuplicates!0 (array!96124 (_ BitVec 32) List!33007) Bool)

(assert (=> b!1406281 (= res!944552 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33004))))

(declare-fun b!1406282 () Bool)

(declare-fun res!944553 () Bool)

(assert (=> b!1406282 (=> (not res!944553) (not e!795963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96124 (_ BitVec 32)) Bool)

(assert (=> b!1406282 (= res!944553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406283 () Bool)

(declare-fun res!944547 () Bool)

(assert (=> b!1406283 (=> (not res!944547) (not e!795963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406283 (= res!944547 (validKeyInArray!0 (select (arr!46410 a!2901) j!112)))))

(declare-fun b!1406284 () Bool)

(declare-fun res!944549 () Bool)

(assert (=> b!1406284 (=> (not res!944549) (not e!795963))))

(assert (=> b!1406284 (= res!944549 (and (= (size!46962 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46962 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46962 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944548 () Bool)

(assert (=> start!120864 (=> (not res!944548) (not e!795963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120864 (= res!944548 (validMask!0 mask!2840))))

(assert (=> start!120864 e!795963))

(assert (=> start!120864 true))

(declare-fun array_inv!35643 (array!96124) Bool)

(assert (=> start!120864 (array_inv!35643 a!2901)))

(declare-fun b!1406285 () Bool)

(declare-fun res!944551 () Bool)

(assert (=> b!1406285 (=> (not res!944551) (not e!795963))))

(assert (=> b!1406285 (= res!944551 (validKeyInArray!0 (select (arr!46410 a!2901) i!1037)))))

(declare-fun b!1406286 () Bool)

(assert (=> b!1406286 (= e!795963 (not e!795965))))

(declare-fun res!944550 () Bool)

(assert (=> b!1406286 (=> res!944550 e!795965)))

(declare-fun lt!619164 () SeekEntryResult!10747)

(assert (=> b!1406286 (= res!944550 (or (not (is-Intermediate!10747 lt!619164)) (undefined!11559 lt!619164)))))

(assert (=> b!1406286 e!795964))

(declare-fun res!944554 () Bool)

(assert (=> b!1406286 (=> (not res!944554) (not e!795964))))

(assert (=> b!1406286 (= res!944554 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47311 0))(
  ( (Unit!47312) )
))
(declare-fun lt!619166 () Unit!47311)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96124 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47311)

(assert (=> b!1406286 (= lt!619166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1406286 (= lt!619164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46410 a!2901) j!112) mask!2840) (select (arr!46410 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120864 res!944548) b!1406284))

(assert (= (and b!1406284 res!944549) b!1406285))

(assert (= (and b!1406285 res!944551) b!1406283))

(assert (= (and b!1406283 res!944547) b!1406282))

(assert (= (and b!1406282 res!944553) b!1406281))

(assert (= (and b!1406281 res!944552) b!1406286))

(assert (= (and b!1406286 res!944554) b!1406279))

(assert (= (and b!1406286 (not res!944550)) b!1406280))

(declare-fun m!1294935 () Bool)

(assert (=> start!120864 m!1294935))

(declare-fun m!1294937 () Bool)

(assert (=> start!120864 m!1294937))

(declare-fun m!1294939 () Bool)

(assert (=> b!1406282 m!1294939))

(declare-fun m!1294941 () Bool)

(assert (=> b!1406285 m!1294941))

(assert (=> b!1406285 m!1294941))

(declare-fun m!1294943 () Bool)

(assert (=> b!1406285 m!1294943))

(declare-fun m!1294945 () Bool)

(assert (=> b!1406280 m!1294945))

(declare-fun m!1294947 () Bool)

(assert (=> b!1406280 m!1294947))

(assert (=> b!1406280 m!1294947))

(declare-fun m!1294949 () Bool)

(assert (=> b!1406280 m!1294949))

(assert (=> b!1406280 m!1294949))

(assert (=> b!1406280 m!1294947))

(declare-fun m!1294951 () Bool)

(assert (=> b!1406280 m!1294951))

(declare-fun m!1294953 () Bool)

(assert (=> b!1406281 m!1294953))

(declare-fun m!1294955 () Bool)

(assert (=> b!1406283 m!1294955))

(assert (=> b!1406283 m!1294955))

(declare-fun m!1294957 () Bool)

(assert (=> b!1406283 m!1294957))

(assert (=> b!1406279 m!1294955))

(assert (=> b!1406279 m!1294955))

(declare-fun m!1294959 () Bool)

(assert (=> b!1406279 m!1294959))

(assert (=> b!1406286 m!1294955))

(declare-fun m!1294961 () Bool)

(assert (=> b!1406286 m!1294961))

(assert (=> b!1406286 m!1294955))

(declare-fun m!1294963 () Bool)

(assert (=> b!1406286 m!1294963))

(assert (=> b!1406286 m!1294961))

(assert (=> b!1406286 m!1294955))

(declare-fun m!1294965 () Bool)

(assert (=> b!1406286 m!1294965))

(declare-fun m!1294967 () Bool)

(assert (=> b!1406286 m!1294967))

(push 1)

(assert (not start!120864))

(assert (not b!1406282))

(assert (not b!1406280))

(assert (not b!1406281))

(assert (not b!1406283))

(assert (not b!1406285))

(assert (not b!1406286))

(assert (not b!1406279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

