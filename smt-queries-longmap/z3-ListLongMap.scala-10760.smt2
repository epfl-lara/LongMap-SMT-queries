; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126156 () Bool)

(assert start!126156)

(declare-fun b!1475111 () Bool)

(declare-fun res!1001333 () Bool)

(declare-fun e!827886 () Bool)

(assert (=> b!1475111 (=> (not res!1001333) (not e!827886))))

(declare-datatypes ((array!99271 0))(
  ( (array!99272 (arr!47914 (Array (_ BitVec 32) (_ BitVec 64))) (size!48465 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99271)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1475111 (= res!1001333 (validKeyInArray!0 (select (arr!47914 a!2862) i!1006)))))

(declare-fun b!1475112 () Bool)

(declare-fun res!1001334 () Bool)

(declare-fun e!827887 () Bool)

(assert (=> b!1475112 (=> (not res!1001334) (not e!827887))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12051 0))(
  ( (MissingZero!12051 (index!50596 (_ BitVec 32))) (Found!12051 (index!50597 (_ BitVec 32))) (Intermediate!12051 (undefined!12863 Bool) (index!50598 (_ BitVec 32)) (x!132368 (_ BitVec 32))) (Undefined!12051) (MissingVacant!12051 (index!50599 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99271 (_ BitVec 32)) SeekEntryResult!12051)

(assert (=> b!1475112 (= res!1001334 (= (seekEntryOrOpen!0 (select (arr!47914 a!2862) j!93) a!2862 mask!2687) (Found!12051 j!93)))))

(declare-fun b!1475113 () Bool)

(declare-fun res!1001345 () Bool)

(declare-fun e!827882 () Bool)

(assert (=> b!1475113 (=> (not res!1001345) (not e!827882))))

(declare-fun lt!644557 () SeekEntryResult!12051)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99271 (_ BitVec 32)) SeekEntryResult!12051)

(assert (=> b!1475113 (= res!1001345 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47914 a!2862) j!93) a!2862 mask!2687) lt!644557))))

(declare-fun b!1475114 () Bool)

(declare-fun e!827885 () Bool)

(assert (=> b!1475114 (= e!827886 e!827885)))

(declare-fun res!1001344 () Bool)

(assert (=> b!1475114 (=> (not res!1001344) (not e!827885))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1475114 (= res!1001344 (= (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644553 () array!99271)

(assert (=> b!1475114 (= lt!644553 (array!99272 (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48465 a!2862)))))

(declare-fun b!1475115 () Bool)

(declare-fun res!1001342 () Bool)

(assert (=> b!1475115 (=> (not res!1001342) (not e!827886))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1475115 (= res!1001342 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48465 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48465 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48465 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!827883 () Bool)

(declare-fun b!1475116 () Bool)

(declare-fun lt!644556 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99271 (_ BitVec 32)) SeekEntryResult!12051)

(assert (=> b!1475116 (= e!827883 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644556 lt!644553 mask!2687) (seekEntryOrOpen!0 lt!644556 lt!644553 mask!2687)))))

(declare-fun b!1475117 () Bool)

(declare-fun res!1001341 () Bool)

(assert (=> b!1475117 (=> (not res!1001341) (not e!827886))))

(assert (=> b!1475117 (= res!1001341 (and (= (size!48465 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48465 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48465 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1475118 () Bool)

(declare-fun e!827889 () Bool)

(assert (=> b!1475118 (= e!827889 true)))

(declare-fun lt!644555 () SeekEntryResult!12051)

(assert (=> b!1475118 (= lt!644555 (seekEntryOrOpen!0 lt!644556 lt!644553 mask!2687))))

(declare-fun res!1001338 () Bool)

(assert (=> start!126156 (=> (not res!1001338) (not e!827886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126156 (= res!1001338 (validMask!0 mask!2687))))

(assert (=> start!126156 e!827886))

(assert (=> start!126156 true))

(declare-fun array_inv!37195 (array!99271) Bool)

(assert (=> start!126156 (array_inv!37195 a!2862)))

(declare-fun b!1475119 () Bool)

(declare-fun e!827888 () Bool)

(assert (=> b!1475119 (= e!827882 e!827888)))

(declare-fun res!1001343 () Bool)

(assert (=> b!1475119 (=> (not res!1001343) (not e!827888))))

(declare-fun lt!644552 () SeekEntryResult!12051)

(assert (=> b!1475119 (= res!1001343 (= lt!644552 (Intermediate!12051 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1475119 (= lt!644552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644556 mask!2687) lt!644556 lt!644553 mask!2687))))

(assert (=> b!1475119 (= lt!644556 (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1475120 () Bool)

(declare-fun res!1001339 () Bool)

(assert (=> b!1475120 (=> (not res!1001339) (not e!827886))))

(assert (=> b!1475120 (= res!1001339 (validKeyInArray!0 (select (arr!47914 a!2862) j!93)))))

(declare-fun b!1475121 () Bool)

(assert (=> b!1475121 (= e!827883 (= lt!644552 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644556 lt!644553 mask!2687)))))

(declare-fun b!1475122 () Bool)

(declare-fun res!1001337 () Bool)

(assert (=> b!1475122 (=> (not res!1001337) (not e!827888))))

(assert (=> b!1475122 (= res!1001337 e!827883)))

(declare-fun c!136414 () Bool)

(assert (=> b!1475122 (= c!136414 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1475123 () Bool)

(assert (=> b!1475123 (= e!827885 e!827882)))

(declare-fun res!1001336 () Bool)

(assert (=> b!1475123 (=> (not res!1001336) (not e!827882))))

(assert (=> b!1475123 (= res!1001336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47914 a!2862) j!93) mask!2687) (select (arr!47914 a!2862) j!93) a!2862 mask!2687) lt!644557))))

(assert (=> b!1475123 (= lt!644557 (Intermediate!12051 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1475124 () Bool)

(declare-fun res!1001348 () Bool)

(assert (=> b!1475124 (=> (not res!1001348) (not e!827886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99271 (_ BitVec 32)) Bool)

(assert (=> b!1475124 (= res!1001348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1475125 () Bool)

(assert (=> b!1475125 (= e!827887 (or (= (select (arr!47914 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47914 a!2862) intermediateBeforeIndex!19) (select (arr!47914 a!2862) j!93))))))

(declare-fun b!1475126 () Bool)

(declare-fun res!1001340 () Bool)

(assert (=> b!1475126 (=> (not res!1001340) (not e!827888))))

(assert (=> b!1475126 (= res!1001340 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1475127 () Bool)

(assert (=> b!1475127 (= e!827888 (not e!827889))))

(declare-fun res!1001335 () Bool)

(assert (=> b!1475127 (=> res!1001335 e!827889)))

(assert (=> b!1475127 (= res!1001335 (or (not (= (select (arr!47914 a!2862) index!646) (select (store (arr!47914 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47914 a!2862) index!646) (select (arr!47914 a!2862) j!93)))))))

(assert (=> b!1475127 e!827887))

(declare-fun res!1001347 () Bool)

(assert (=> b!1475127 (=> (not res!1001347) (not e!827887))))

(assert (=> b!1475127 (= res!1001347 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49475 0))(
  ( (Unit!49476) )
))
(declare-fun lt!644554 () Unit!49475)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49475)

(assert (=> b!1475127 (= lt!644554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1475128 () Bool)

(declare-fun res!1001346 () Bool)

(assert (=> b!1475128 (=> (not res!1001346) (not e!827886))))

(declare-datatypes ((List!34402 0))(
  ( (Nil!34399) (Cons!34398 (h!35771 (_ BitVec 64)) (t!49088 List!34402)) )
))
(declare-fun arrayNoDuplicates!0 (array!99271 (_ BitVec 32) List!34402) Bool)

(assert (=> b!1475128 (= res!1001346 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34399))))

(assert (= (and start!126156 res!1001338) b!1475117))

(assert (= (and b!1475117 res!1001341) b!1475111))

(assert (= (and b!1475111 res!1001333) b!1475120))

(assert (= (and b!1475120 res!1001339) b!1475124))

(assert (= (and b!1475124 res!1001348) b!1475128))

(assert (= (and b!1475128 res!1001346) b!1475115))

(assert (= (and b!1475115 res!1001342) b!1475114))

(assert (= (and b!1475114 res!1001344) b!1475123))

(assert (= (and b!1475123 res!1001336) b!1475113))

(assert (= (and b!1475113 res!1001345) b!1475119))

(assert (= (and b!1475119 res!1001343) b!1475122))

(assert (= (and b!1475122 c!136414) b!1475121))

(assert (= (and b!1475122 (not c!136414)) b!1475116))

(assert (= (and b!1475122 res!1001337) b!1475126))

(assert (= (and b!1475126 res!1001340) b!1475127))

(assert (= (and b!1475127 res!1001347) b!1475112))

(assert (= (and b!1475112 res!1001334) b!1475125))

(assert (= (and b!1475127 (not res!1001335)) b!1475118))

(declare-fun m!1361617 () Bool)

(assert (=> b!1475120 m!1361617))

(assert (=> b!1475120 m!1361617))

(declare-fun m!1361619 () Bool)

(assert (=> b!1475120 m!1361619))

(declare-fun m!1361621 () Bool)

(assert (=> b!1475125 m!1361621))

(assert (=> b!1475125 m!1361617))

(assert (=> b!1475113 m!1361617))

(assert (=> b!1475113 m!1361617))

(declare-fun m!1361623 () Bool)

(assert (=> b!1475113 m!1361623))

(declare-fun m!1361625 () Bool)

(assert (=> b!1475114 m!1361625))

(declare-fun m!1361627 () Bool)

(assert (=> b!1475114 m!1361627))

(declare-fun m!1361629 () Bool)

(assert (=> b!1475128 m!1361629))

(declare-fun m!1361631 () Bool)

(assert (=> b!1475111 m!1361631))

(assert (=> b!1475111 m!1361631))

(declare-fun m!1361633 () Bool)

(assert (=> b!1475111 m!1361633))

(declare-fun m!1361635 () Bool)

(assert (=> b!1475121 m!1361635))

(declare-fun m!1361637 () Bool)

(assert (=> b!1475124 m!1361637))

(declare-fun m!1361639 () Bool)

(assert (=> b!1475127 m!1361639))

(assert (=> b!1475127 m!1361625))

(declare-fun m!1361641 () Bool)

(assert (=> b!1475127 m!1361641))

(declare-fun m!1361643 () Bool)

(assert (=> b!1475127 m!1361643))

(declare-fun m!1361645 () Bool)

(assert (=> b!1475127 m!1361645))

(assert (=> b!1475127 m!1361617))

(declare-fun m!1361647 () Bool)

(assert (=> b!1475118 m!1361647))

(assert (=> b!1475112 m!1361617))

(assert (=> b!1475112 m!1361617))

(declare-fun m!1361649 () Bool)

(assert (=> b!1475112 m!1361649))

(declare-fun m!1361651 () Bool)

(assert (=> b!1475119 m!1361651))

(assert (=> b!1475119 m!1361651))

(declare-fun m!1361653 () Bool)

(assert (=> b!1475119 m!1361653))

(assert (=> b!1475119 m!1361625))

(declare-fun m!1361655 () Bool)

(assert (=> b!1475119 m!1361655))

(assert (=> b!1475123 m!1361617))

(assert (=> b!1475123 m!1361617))

(declare-fun m!1361657 () Bool)

(assert (=> b!1475123 m!1361657))

(assert (=> b!1475123 m!1361657))

(assert (=> b!1475123 m!1361617))

(declare-fun m!1361659 () Bool)

(assert (=> b!1475123 m!1361659))

(declare-fun m!1361661 () Bool)

(assert (=> start!126156 m!1361661))

(declare-fun m!1361663 () Bool)

(assert (=> start!126156 m!1361663))

(declare-fun m!1361665 () Bool)

(assert (=> b!1475116 m!1361665))

(assert (=> b!1475116 m!1361647))

(check-sat (not b!1475128) (not b!1475118) (not b!1475120) (not b!1475116) (not b!1475119) (not b!1475112) (not start!126156) (not b!1475113) (not b!1475127) (not b!1475123) (not b!1475111) (not b!1475124) (not b!1475121))
(check-sat)
