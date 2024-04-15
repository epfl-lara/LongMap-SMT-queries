; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128720 () Bool)

(assert start!128720)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!842687 () Bool)

(declare-datatypes ((array!100576 0))(
  ( (array!100577 (arr!48526 (Array (_ BitVec 32) (_ BitVec 64))) (size!49078 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100576)

(declare-fun b!1508503 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508503 (= e!842687 (not (validKeyInArray!0 (select (store (arr!48526 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(declare-fun b!1508504 () Bool)

(declare-fun res!1028612 () Bool)

(declare-fun e!842688 () Bool)

(assert (=> b!1508504 (=> (not res!1028612) (not e!842688))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12720 0))(
  ( (MissingZero!12720 (index!53275 (_ BitVec 32))) (Found!12720 (index!53276 (_ BitVec 32))) (Intermediate!12720 (undefined!13532 Bool) (index!53277 (_ BitVec 32)) (x!135040 (_ BitVec 32))) (Undefined!12720) (MissingVacant!12720 (index!53278 (_ BitVec 32))) )
))
(declare-fun lt!654459 () SeekEntryResult!12720)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100576 (_ BitVec 32)) SeekEntryResult!12720)

(assert (=> b!1508504 (= res!1028612 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48526 a!2804) j!70) a!2804 mask!2512) lt!654459))))

(declare-fun b!1508505 () Bool)

(assert (=> b!1508505 (= e!842688 e!842687)))

(declare-fun res!1028617 () Bool)

(assert (=> b!1508505 (=> (not res!1028617) (not e!842687))))

(declare-fun lt!654458 () (_ BitVec 32))

(assert (=> b!1508505 (= res!1028617 (and (bvsge mask!2512 #b00000000000000000000000000000000) (bvsge lt!654458 #b00000000000000000000000000000000) (bvslt lt!654458 (bvadd #b00000000000000000000000000000001 mask!2512))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508505 (= lt!654458 (toIndex!0 (select (store (arr!48526 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1508506 () Bool)

(declare-fun res!1028621 () Bool)

(declare-fun e!842685 () Bool)

(assert (=> b!1508506 (=> (not res!1028621) (not e!842685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100576 (_ BitVec 32)) Bool)

(assert (=> b!1508506 (= res!1028621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1028618 () Bool)

(assert (=> start!128720 (=> (not res!1028618) (not e!842685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128720 (= res!1028618 (validMask!0 mask!2512))))

(assert (=> start!128720 e!842685))

(assert (=> start!128720 true))

(declare-fun array_inv!37759 (array!100576) Bool)

(assert (=> start!128720 (array_inv!37759 a!2804)))

(declare-fun b!1508507 () Bool)

(declare-fun res!1028616 () Bool)

(assert (=> b!1508507 (=> (not res!1028616) (not e!842685))))

(declare-datatypes ((List!35087 0))(
  ( (Nil!35084) (Cons!35083 (h!36496 (_ BitVec 64)) (t!49773 List!35087)) )
))
(declare-fun arrayNoDuplicates!0 (array!100576 (_ BitVec 32) List!35087) Bool)

(assert (=> b!1508507 (= res!1028616 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35084))))

(declare-fun b!1508508 () Bool)

(declare-fun res!1028613 () Bool)

(assert (=> b!1508508 (=> (not res!1028613) (not e!842685))))

(assert (=> b!1508508 (= res!1028613 (validKeyInArray!0 (select (arr!48526 a!2804) j!70)))))

(declare-fun b!1508509 () Bool)

(declare-fun res!1028619 () Bool)

(assert (=> b!1508509 (=> (not res!1028619) (not e!842685))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508509 (= res!1028619 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49078 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49078 a!2804))))))

(declare-fun b!1508510 () Bool)

(declare-fun res!1028614 () Bool)

(assert (=> b!1508510 (=> (not res!1028614) (not e!842685))))

(assert (=> b!1508510 (= res!1028614 (and (= (size!49078 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49078 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49078 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508511 () Bool)

(assert (=> b!1508511 (= e!842685 e!842688)))

(declare-fun res!1028615 () Bool)

(assert (=> b!1508511 (=> (not res!1028615) (not e!842688))))

(assert (=> b!1508511 (= res!1028615 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48526 a!2804) j!70) mask!2512) (select (arr!48526 a!2804) j!70) a!2804 mask!2512) lt!654459))))

(assert (=> b!1508511 (= lt!654459 (Intermediate!12720 false resIndex!21 resX!21))))

(declare-fun b!1508512 () Bool)

(declare-fun res!1028620 () Bool)

(assert (=> b!1508512 (=> (not res!1028620) (not e!842685))))

(assert (=> b!1508512 (= res!1028620 (validKeyInArray!0 (select (arr!48526 a!2804) i!961)))))

(assert (= (and start!128720 res!1028618) b!1508510))

(assert (= (and b!1508510 res!1028614) b!1508512))

(assert (= (and b!1508512 res!1028620) b!1508508))

(assert (= (and b!1508508 res!1028613) b!1508506))

(assert (= (and b!1508506 res!1028621) b!1508507))

(assert (= (and b!1508507 res!1028616) b!1508509))

(assert (= (and b!1508509 res!1028619) b!1508511))

(assert (= (and b!1508511 res!1028615) b!1508504))

(assert (= (and b!1508504 res!1028612) b!1508505))

(assert (= (and b!1508505 res!1028617) b!1508503))

(declare-fun m!1390355 () Bool)

(assert (=> b!1508505 m!1390355))

(declare-fun m!1390357 () Bool)

(assert (=> b!1508505 m!1390357))

(assert (=> b!1508505 m!1390357))

(declare-fun m!1390359 () Bool)

(assert (=> b!1508505 m!1390359))

(declare-fun m!1390361 () Bool)

(assert (=> b!1508506 m!1390361))

(assert (=> b!1508503 m!1390355))

(assert (=> b!1508503 m!1390357))

(assert (=> b!1508503 m!1390357))

(declare-fun m!1390363 () Bool)

(assert (=> b!1508503 m!1390363))

(declare-fun m!1390365 () Bool)

(assert (=> b!1508507 m!1390365))

(declare-fun m!1390367 () Bool)

(assert (=> b!1508511 m!1390367))

(assert (=> b!1508511 m!1390367))

(declare-fun m!1390369 () Bool)

(assert (=> b!1508511 m!1390369))

(assert (=> b!1508511 m!1390369))

(assert (=> b!1508511 m!1390367))

(declare-fun m!1390371 () Bool)

(assert (=> b!1508511 m!1390371))

(declare-fun m!1390373 () Bool)

(assert (=> b!1508512 m!1390373))

(assert (=> b!1508512 m!1390373))

(declare-fun m!1390375 () Bool)

(assert (=> b!1508512 m!1390375))

(declare-fun m!1390377 () Bool)

(assert (=> start!128720 m!1390377))

(declare-fun m!1390379 () Bool)

(assert (=> start!128720 m!1390379))

(assert (=> b!1508504 m!1390367))

(assert (=> b!1508504 m!1390367))

(declare-fun m!1390381 () Bool)

(assert (=> b!1508504 m!1390381))

(assert (=> b!1508508 m!1390367))

(assert (=> b!1508508 m!1390367))

(declare-fun m!1390383 () Bool)

(assert (=> b!1508508 m!1390383))

(check-sat (not start!128720) (not b!1508506) (not b!1508505) (not b!1508507) (not b!1508503) (not b!1508504) (not b!1508512) (not b!1508508) (not b!1508511))
(check-sat)
