; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130274 () Bool)

(assert start!130274)

(declare-fun b!1529496 () Bool)

(declare-fun res!1047207 () Bool)

(declare-fun e!852355 () Bool)

(assert (=> b!1529496 (=> (not res!1047207) (not e!852355))))

(declare-datatypes ((array!101624 0))(
  ( (array!101625 (arr!49037 (Array (_ BitVec 32) (_ BitVec 64))) (size!49587 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101624)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101624 (_ BitVec 32)) Bool)

(assert (=> b!1529496 (= res!1047207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529497 () Bool)

(declare-fun res!1047213 () Bool)

(assert (=> b!1529497 (=> (not res!1047213) (not e!852355))))

(declare-datatypes ((List!35520 0))(
  ( (Nil!35517) (Cons!35516 (h!36952 (_ BitVec 64)) (t!50214 List!35520)) )
))
(declare-fun arrayNoDuplicates!0 (array!101624 (_ BitVec 32) List!35520) Bool)

(assert (=> b!1529497 (= res!1047213 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35517))))

(declare-fun b!1529498 () Bool)

(declare-fun res!1047204 () Bool)

(declare-fun e!852358 () Bool)

(assert (=> b!1529498 (=> (not res!1047204) (not e!852358))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13202 0))(
  ( (MissingZero!13202 (index!55203 (_ BitVec 32))) (Found!13202 (index!55204 (_ BitVec 32))) (Intermediate!13202 (undefined!14014 Bool) (index!55205 (_ BitVec 32)) (x!136889 (_ BitVec 32))) (Undefined!13202) (MissingVacant!13202 (index!55206 (_ BitVec 32))) )
))
(declare-fun lt!662453 () SeekEntryResult!13202)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101624 (_ BitVec 32)) SeekEntryResult!13202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529498 (= res!1047204 (= lt!662453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49037 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49037 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101625 (store (arr!49037 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49587 a!2804)) mask!2512)))))

(declare-fun res!1047212 () Bool)

(assert (=> start!130274 (=> (not res!1047212) (not e!852355))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130274 (= res!1047212 (validMask!0 mask!2512))))

(assert (=> start!130274 e!852355))

(assert (=> start!130274 true))

(declare-fun array_inv!38065 (array!101624) Bool)

(assert (=> start!130274 (array_inv!38065 a!2804)))

(declare-fun b!1529499 () Bool)

(declare-fun e!852356 () Bool)

(assert (=> b!1529499 (= e!852356 true)))

(declare-fun lt!662455 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529499 (= lt!662455 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529500 () Bool)

(assert (=> b!1529500 (= e!852358 (not e!852356))))

(declare-fun res!1047208 () Bool)

(assert (=> b!1529500 (=> res!1047208 e!852356)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529500 (= res!1047208 (or (not (= (select (arr!49037 a!2804) j!70) (select (store (arr!49037 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852357 () Bool)

(assert (=> b!1529500 e!852357))

(declare-fun res!1047205 () Bool)

(assert (=> b!1529500 (=> (not res!1047205) (not e!852357))))

(assert (=> b!1529500 (= res!1047205 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51188 0))(
  ( (Unit!51189) )
))
(declare-fun lt!662452 () Unit!51188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101624 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51188)

(assert (=> b!1529500 (= lt!662452 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529501 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101624 (_ BitVec 32)) SeekEntryResult!13202)

(assert (=> b!1529501 (= e!852357 (= (seekEntry!0 (select (arr!49037 a!2804) j!70) a!2804 mask!2512) (Found!13202 j!70)))))

(declare-fun b!1529502 () Bool)

(declare-fun res!1047214 () Bool)

(assert (=> b!1529502 (=> (not res!1047214) (not e!852355))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529502 (= res!1047214 (validKeyInArray!0 (select (arr!49037 a!2804) i!961)))))

(declare-fun b!1529503 () Bool)

(declare-fun res!1047211 () Bool)

(assert (=> b!1529503 (=> (not res!1047211) (not e!852355))))

(assert (=> b!1529503 (= res!1047211 (and (= (size!49587 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49587 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49587 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529504 () Bool)

(declare-fun res!1047203 () Bool)

(assert (=> b!1529504 (=> (not res!1047203) (not e!852355))))

(assert (=> b!1529504 (= res!1047203 (validKeyInArray!0 (select (arr!49037 a!2804) j!70)))))

(declare-fun b!1529505 () Bool)

(declare-fun res!1047206 () Bool)

(assert (=> b!1529505 (=> (not res!1047206) (not e!852355))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529505 (= res!1047206 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49587 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49587 a!2804))))))

(declare-fun b!1529506 () Bool)

(declare-fun res!1047210 () Bool)

(assert (=> b!1529506 (=> (not res!1047210) (not e!852358))))

(declare-fun lt!662454 () SeekEntryResult!13202)

(assert (=> b!1529506 (= res!1047210 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49037 a!2804) j!70) a!2804 mask!2512) lt!662454))))

(declare-fun b!1529507 () Bool)

(assert (=> b!1529507 (= e!852355 e!852358)))

(declare-fun res!1047209 () Bool)

(assert (=> b!1529507 (=> (not res!1047209) (not e!852358))))

(assert (=> b!1529507 (= res!1047209 (= lt!662453 lt!662454))))

(assert (=> b!1529507 (= lt!662454 (Intermediate!13202 false resIndex!21 resX!21))))

(assert (=> b!1529507 (= lt!662453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49037 a!2804) j!70) mask!2512) (select (arr!49037 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130274 res!1047212) b!1529503))

(assert (= (and b!1529503 res!1047211) b!1529502))

(assert (= (and b!1529502 res!1047214) b!1529504))

(assert (= (and b!1529504 res!1047203) b!1529496))

(assert (= (and b!1529496 res!1047207) b!1529497))

(assert (= (and b!1529497 res!1047213) b!1529505))

(assert (= (and b!1529505 res!1047206) b!1529507))

(assert (= (and b!1529507 res!1047209) b!1529506))

(assert (= (and b!1529506 res!1047210) b!1529498))

(assert (= (and b!1529498 res!1047204) b!1529500))

(assert (= (and b!1529500 res!1047205) b!1529501))

(assert (= (and b!1529500 (not res!1047208)) b!1529499))

(declare-fun m!1412445 () Bool)

(assert (=> b!1529507 m!1412445))

(assert (=> b!1529507 m!1412445))

(declare-fun m!1412447 () Bool)

(assert (=> b!1529507 m!1412447))

(assert (=> b!1529507 m!1412447))

(assert (=> b!1529507 m!1412445))

(declare-fun m!1412449 () Bool)

(assert (=> b!1529507 m!1412449))

(assert (=> b!1529506 m!1412445))

(assert (=> b!1529506 m!1412445))

(declare-fun m!1412451 () Bool)

(assert (=> b!1529506 m!1412451))

(assert (=> b!1529501 m!1412445))

(assert (=> b!1529501 m!1412445))

(declare-fun m!1412453 () Bool)

(assert (=> b!1529501 m!1412453))

(declare-fun m!1412455 () Bool)

(assert (=> start!130274 m!1412455))

(declare-fun m!1412457 () Bool)

(assert (=> start!130274 m!1412457))

(assert (=> b!1529500 m!1412445))

(declare-fun m!1412459 () Bool)

(assert (=> b!1529500 m!1412459))

(declare-fun m!1412461 () Bool)

(assert (=> b!1529500 m!1412461))

(declare-fun m!1412463 () Bool)

(assert (=> b!1529500 m!1412463))

(declare-fun m!1412465 () Bool)

(assert (=> b!1529500 m!1412465))

(assert (=> b!1529504 m!1412445))

(assert (=> b!1529504 m!1412445))

(declare-fun m!1412467 () Bool)

(assert (=> b!1529504 m!1412467))

(declare-fun m!1412469 () Bool)

(assert (=> b!1529502 m!1412469))

(assert (=> b!1529502 m!1412469))

(declare-fun m!1412471 () Bool)

(assert (=> b!1529502 m!1412471))

(declare-fun m!1412473 () Bool)

(assert (=> b!1529496 m!1412473))

(assert (=> b!1529498 m!1412461))

(assert (=> b!1529498 m!1412463))

(assert (=> b!1529498 m!1412463))

(declare-fun m!1412475 () Bool)

(assert (=> b!1529498 m!1412475))

(assert (=> b!1529498 m!1412475))

(assert (=> b!1529498 m!1412463))

(declare-fun m!1412477 () Bool)

(assert (=> b!1529498 m!1412477))

(declare-fun m!1412479 () Bool)

(assert (=> b!1529497 m!1412479))

(declare-fun m!1412481 () Bool)

(assert (=> b!1529499 m!1412481))

(push 1)

