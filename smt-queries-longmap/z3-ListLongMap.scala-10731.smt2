; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125526 () Bool)

(assert start!125526)

(declare-fun b!1468615 () Bool)

(declare-fun res!997161 () Bool)

(declare-fun e!824640 () Bool)

(assert (=> b!1468615 (=> (not res!997161) (not e!824640))))

(declare-datatypes ((array!98974 0))(
  ( (array!98975 (arr!47775 (Array (_ BitVec 32) (_ BitVec 64))) (size!48325 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98974)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468615 (= res!997161 (validKeyInArray!0 (select (arr!47775 a!2862) i!1006)))))

(declare-fun b!1468616 () Bool)

(declare-fun res!997155 () Bool)

(declare-fun e!824642 () Bool)

(assert (=> b!1468616 (=> (not res!997155) (not e!824642))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12015 0))(
  ( (MissingZero!12015 (index!50452 (_ BitVec 32))) (Found!12015 (index!50453 (_ BitVec 32))) (Intermediate!12015 (undefined!12827 Bool) (index!50454 (_ BitVec 32)) (x!132040 (_ BitVec 32))) (Undefined!12015) (MissingVacant!12015 (index!50455 (_ BitVec 32))) )
))
(declare-fun lt!642330 () SeekEntryResult!12015)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98974 (_ BitVec 32)) SeekEntryResult!12015)

(assert (=> b!1468616 (= res!997155 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47775 a!2862) j!93) a!2862 mask!2687) lt!642330))))

(declare-fun b!1468617 () Bool)

(assert (=> b!1468617 (= e!824640 e!824642)))

(declare-fun res!997160 () Bool)

(assert (=> b!1468617 (=> (not res!997160) (not e!824642))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468617 (= res!997160 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47775 a!2862) j!93) mask!2687) (select (arr!47775 a!2862) j!93) a!2862 mask!2687) lt!642330))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468617 (= lt!642330 (Intermediate!12015 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468618 () Bool)

(assert (=> b!1468618 (= e!824642 false)))

(declare-fun lt!642329 () SeekEntryResult!12015)

(assert (=> b!1468618 (= lt!642329 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47775 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47775 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98975 (store (arr!47775 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48325 a!2862)) mask!2687))))

(declare-fun b!1468620 () Bool)

(declare-fun res!997156 () Bool)

(assert (=> b!1468620 (=> (not res!997156) (not e!824640))))

(assert (=> b!1468620 (= res!997156 (and (= (size!48325 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48325 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48325 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468621 () Bool)

(declare-fun res!997154 () Bool)

(assert (=> b!1468621 (=> (not res!997154) (not e!824640))))

(declare-datatypes ((List!34276 0))(
  ( (Nil!34273) (Cons!34272 (h!35622 (_ BitVec 64)) (t!48970 List!34276)) )
))
(declare-fun arrayNoDuplicates!0 (array!98974 (_ BitVec 32) List!34276) Bool)

(assert (=> b!1468621 (= res!997154 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34273))))

(declare-fun b!1468622 () Bool)

(declare-fun res!997157 () Bool)

(assert (=> b!1468622 (=> (not res!997157) (not e!824640))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468622 (= res!997157 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48325 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48325 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48325 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47775 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468623 () Bool)

(declare-fun res!997162 () Bool)

(assert (=> b!1468623 (=> (not res!997162) (not e!824640))))

(assert (=> b!1468623 (= res!997162 (validKeyInArray!0 (select (arr!47775 a!2862) j!93)))))

(declare-fun b!1468619 () Bool)

(declare-fun res!997158 () Bool)

(assert (=> b!1468619 (=> (not res!997158) (not e!824640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98974 (_ BitVec 32)) Bool)

(assert (=> b!1468619 (= res!997158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997159 () Bool)

(assert (=> start!125526 (=> (not res!997159) (not e!824640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125526 (= res!997159 (validMask!0 mask!2687))))

(assert (=> start!125526 e!824640))

(assert (=> start!125526 true))

(declare-fun array_inv!36803 (array!98974) Bool)

(assert (=> start!125526 (array_inv!36803 a!2862)))

(assert (= (and start!125526 res!997159) b!1468620))

(assert (= (and b!1468620 res!997156) b!1468615))

(assert (= (and b!1468615 res!997161) b!1468623))

(assert (= (and b!1468623 res!997162) b!1468619))

(assert (= (and b!1468619 res!997158) b!1468621))

(assert (= (and b!1468621 res!997154) b!1468622))

(assert (= (and b!1468622 res!997157) b!1468617))

(assert (= (and b!1468617 res!997160) b!1468616))

(assert (= (and b!1468616 res!997155) b!1468618))

(declare-fun m!1355709 () Bool)

(assert (=> b!1468621 m!1355709))

(declare-fun m!1355711 () Bool)

(assert (=> b!1468618 m!1355711))

(declare-fun m!1355713 () Bool)

(assert (=> b!1468618 m!1355713))

(assert (=> b!1468618 m!1355713))

(declare-fun m!1355715 () Bool)

(assert (=> b!1468618 m!1355715))

(assert (=> b!1468618 m!1355715))

(assert (=> b!1468618 m!1355713))

(declare-fun m!1355717 () Bool)

(assert (=> b!1468618 m!1355717))

(assert (=> b!1468622 m!1355711))

(declare-fun m!1355719 () Bool)

(assert (=> b!1468622 m!1355719))

(declare-fun m!1355721 () Bool)

(assert (=> b!1468615 m!1355721))

(assert (=> b!1468615 m!1355721))

(declare-fun m!1355723 () Bool)

(assert (=> b!1468615 m!1355723))

(declare-fun m!1355725 () Bool)

(assert (=> b!1468617 m!1355725))

(assert (=> b!1468617 m!1355725))

(declare-fun m!1355727 () Bool)

(assert (=> b!1468617 m!1355727))

(assert (=> b!1468617 m!1355727))

(assert (=> b!1468617 m!1355725))

(declare-fun m!1355729 () Bool)

(assert (=> b!1468617 m!1355729))

(declare-fun m!1355731 () Bool)

(assert (=> start!125526 m!1355731))

(declare-fun m!1355733 () Bool)

(assert (=> start!125526 m!1355733))

(assert (=> b!1468616 m!1355725))

(assert (=> b!1468616 m!1355725))

(declare-fun m!1355735 () Bool)

(assert (=> b!1468616 m!1355735))

(declare-fun m!1355737 () Bool)

(assert (=> b!1468619 m!1355737))

(assert (=> b!1468623 m!1355725))

(assert (=> b!1468623 m!1355725))

(declare-fun m!1355739 () Bool)

(assert (=> b!1468623 m!1355739))

(check-sat (not b!1468615) (not b!1468623) (not b!1468621) (not b!1468619) (not b!1468617) (not b!1468618) (not b!1468616) (not start!125526))
(check-sat)
