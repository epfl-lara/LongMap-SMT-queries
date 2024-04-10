; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125506 () Bool)

(assert start!125506)

(declare-fun b!1468345 () Bool)

(declare-fun res!996891 () Bool)

(declare-fun e!824552 () Bool)

(assert (=> b!1468345 (=> (not res!996891) (not e!824552))))

(declare-datatypes ((array!98954 0))(
  ( (array!98955 (arr!47765 (Array (_ BitVec 32) (_ BitVec 64))) (size!48315 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98954)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468345 (= res!996891 (validKeyInArray!0 (select (arr!47765 a!2862) i!1006)))))

(declare-fun b!1468346 () Bool)

(declare-fun res!996890 () Bool)

(assert (=> b!1468346 (=> (not res!996890) (not e!824552))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1468346 (= res!996890 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48315 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48315 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48315 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47765 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468347 () Bool)

(declare-fun res!996889 () Bool)

(assert (=> b!1468347 (=> (not res!996889) (not e!824552))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1468347 (= res!996889 (validKeyInArray!0 (select (arr!47765 a!2862) j!93)))))

(declare-fun b!1468348 () Bool)

(declare-fun e!824551 () Bool)

(assert (=> b!1468348 (= e!824551 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12005 0))(
  ( (MissingZero!12005 (index!50412 (_ BitVec 32))) (Found!12005 (index!50413 (_ BitVec 32))) (Intermediate!12005 (undefined!12817 Bool) (index!50414 (_ BitVec 32)) (x!132006 (_ BitVec 32))) (Undefined!12005) (MissingVacant!12005 (index!50415 (_ BitVec 32))) )
))
(declare-fun lt!642269 () SeekEntryResult!12005)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98954 (_ BitVec 32)) SeekEntryResult!12005)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468348 (= lt!642269 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47765 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47765 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98955 (store (arr!47765 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48315 a!2862)) mask!2687))))

(declare-fun b!1468350 () Bool)

(declare-fun res!996887 () Bool)

(assert (=> b!1468350 (=> (not res!996887) (not e!824552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98954 (_ BitVec 32)) Bool)

(assert (=> b!1468350 (= res!996887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468351 () Bool)

(declare-fun res!996885 () Bool)

(assert (=> b!1468351 (=> (not res!996885) (not e!824552))))

(assert (=> b!1468351 (= res!996885 (and (= (size!48315 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48315 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48315 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468352 () Bool)

(declare-fun res!996886 () Bool)

(assert (=> b!1468352 (=> (not res!996886) (not e!824551))))

(declare-fun lt!642270 () SeekEntryResult!12005)

(assert (=> b!1468352 (= res!996886 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47765 a!2862) j!93) a!2862 mask!2687) lt!642270))))

(declare-fun b!1468353 () Bool)

(declare-fun res!996888 () Bool)

(assert (=> b!1468353 (=> (not res!996888) (not e!824552))))

(declare-datatypes ((List!34266 0))(
  ( (Nil!34263) (Cons!34262 (h!35612 (_ BitVec 64)) (t!48960 List!34266)) )
))
(declare-fun arrayNoDuplicates!0 (array!98954 (_ BitVec 32) List!34266) Bool)

(assert (=> b!1468353 (= res!996888 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34263))))

(declare-fun res!996892 () Bool)

(assert (=> start!125506 (=> (not res!996892) (not e!824552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125506 (= res!996892 (validMask!0 mask!2687))))

(assert (=> start!125506 e!824552))

(assert (=> start!125506 true))

(declare-fun array_inv!36793 (array!98954) Bool)

(assert (=> start!125506 (array_inv!36793 a!2862)))

(declare-fun b!1468349 () Bool)

(assert (=> b!1468349 (= e!824552 e!824551)))

(declare-fun res!996884 () Bool)

(assert (=> b!1468349 (=> (not res!996884) (not e!824551))))

(assert (=> b!1468349 (= res!996884 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47765 a!2862) j!93) mask!2687) (select (arr!47765 a!2862) j!93) a!2862 mask!2687) lt!642270))))

(assert (=> b!1468349 (= lt!642270 (Intermediate!12005 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125506 res!996892) b!1468351))

(assert (= (and b!1468351 res!996885) b!1468345))

(assert (= (and b!1468345 res!996891) b!1468347))

(assert (= (and b!1468347 res!996889) b!1468350))

(assert (= (and b!1468350 res!996887) b!1468353))

(assert (= (and b!1468353 res!996888) b!1468346))

(assert (= (and b!1468346 res!996890) b!1468349))

(assert (= (and b!1468349 res!996884) b!1468352))

(assert (= (and b!1468352 res!996886) b!1468348))

(declare-fun m!1355389 () Bool)

(assert (=> b!1468345 m!1355389))

(assert (=> b!1468345 m!1355389))

(declare-fun m!1355391 () Bool)

(assert (=> b!1468345 m!1355391))

(declare-fun m!1355393 () Bool)

(assert (=> b!1468349 m!1355393))

(assert (=> b!1468349 m!1355393))

(declare-fun m!1355395 () Bool)

(assert (=> b!1468349 m!1355395))

(assert (=> b!1468349 m!1355395))

(assert (=> b!1468349 m!1355393))

(declare-fun m!1355397 () Bool)

(assert (=> b!1468349 m!1355397))

(declare-fun m!1355399 () Bool)

(assert (=> b!1468348 m!1355399))

(declare-fun m!1355401 () Bool)

(assert (=> b!1468348 m!1355401))

(assert (=> b!1468348 m!1355401))

(declare-fun m!1355403 () Bool)

(assert (=> b!1468348 m!1355403))

(assert (=> b!1468348 m!1355403))

(assert (=> b!1468348 m!1355401))

(declare-fun m!1355405 () Bool)

(assert (=> b!1468348 m!1355405))

(assert (=> b!1468352 m!1355393))

(assert (=> b!1468352 m!1355393))

(declare-fun m!1355407 () Bool)

(assert (=> b!1468352 m!1355407))

(assert (=> b!1468346 m!1355399))

(declare-fun m!1355409 () Bool)

(assert (=> b!1468346 m!1355409))

(declare-fun m!1355411 () Bool)

(assert (=> b!1468350 m!1355411))

(assert (=> b!1468347 m!1355393))

(assert (=> b!1468347 m!1355393))

(declare-fun m!1355413 () Bool)

(assert (=> b!1468347 m!1355413))

(declare-fun m!1355415 () Bool)

(assert (=> b!1468353 m!1355415))

(declare-fun m!1355417 () Bool)

(assert (=> start!125506 m!1355417))

(declare-fun m!1355419 () Bool)

(assert (=> start!125506 m!1355419))

(push 1)

