; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125504 () Bool)

(assert start!125504)

(declare-fun b!1468318 () Bool)

(declare-fun res!996865 () Bool)

(declare-fun e!824543 () Bool)

(assert (=> b!1468318 (=> (not res!996865) (not e!824543))))

(declare-datatypes ((array!98952 0))(
  ( (array!98953 (arr!47764 (Array (_ BitVec 32) (_ BitVec 64))) (size!48314 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98952)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468318 (= res!996865 (validKeyInArray!0 (select (arr!47764 a!2862) i!1006)))))

(declare-fun b!1468319 () Bool)

(declare-fun e!824541 () Bool)

(assert (=> b!1468319 (= e!824541 false)))

(declare-datatypes ((SeekEntryResult!12004 0))(
  ( (MissingZero!12004 (index!50408 (_ BitVec 32))) (Found!12004 (index!50409 (_ BitVec 32))) (Intermediate!12004 (undefined!12816 Bool) (index!50410 (_ BitVec 32)) (x!131997 (_ BitVec 32))) (Undefined!12004) (MissingVacant!12004 (index!50411 (_ BitVec 32))) )
))
(declare-fun lt!642264 () SeekEntryResult!12004)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98952 (_ BitVec 32)) SeekEntryResult!12004)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468319 (= lt!642264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98953 (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48314 a!2862)) mask!2687))))

(declare-fun b!1468320 () Bool)

(declare-fun res!996861 () Bool)

(assert (=> b!1468320 (=> (not res!996861) (not e!824543))))

(assert (=> b!1468320 (= res!996861 (validKeyInArray!0 (select (arr!47764 a!2862) j!93)))))

(declare-fun res!996857 () Bool)

(assert (=> start!125504 (=> (not res!996857) (not e!824543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125504 (= res!996857 (validMask!0 mask!2687))))

(assert (=> start!125504 e!824543))

(assert (=> start!125504 true))

(declare-fun array_inv!36792 (array!98952) Bool)

(assert (=> start!125504 (array_inv!36792 a!2862)))

(declare-fun b!1468321 () Bool)

(declare-fun res!996864 () Bool)

(assert (=> b!1468321 (=> (not res!996864) (not e!824543))))

(declare-datatypes ((List!34265 0))(
  ( (Nil!34262) (Cons!34261 (h!35611 (_ BitVec 64)) (t!48959 List!34265)) )
))
(declare-fun arrayNoDuplicates!0 (array!98952 (_ BitVec 32) List!34265) Bool)

(assert (=> b!1468321 (= res!996864 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34262))))

(declare-fun b!1468322 () Bool)

(assert (=> b!1468322 (= e!824543 e!824541)))

(declare-fun res!996859 () Bool)

(assert (=> b!1468322 (=> (not res!996859) (not e!824541))))

(declare-fun lt!642263 () SeekEntryResult!12004)

(assert (=> b!1468322 (= res!996859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47764 a!2862) j!93) mask!2687) (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642263))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468322 (= lt!642263 (Intermediate!12004 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468323 () Bool)

(declare-fun res!996863 () Bool)

(assert (=> b!1468323 (=> (not res!996863) (not e!824543))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98952 (_ BitVec 32)) Bool)

(assert (=> b!1468323 (= res!996863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468324 () Bool)

(declare-fun res!996860 () Bool)

(assert (=> b!1468324 (=> (not res!996860) (not e!824543))))

(assert (=> b!1468324 (= res!996860 (and (= (size!48314 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48314 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48314 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468325 () Bool)

(declare-fun res!996862 () Bool)

(assert (=> b!1468325 (=> (not res!996862) (not e!824543))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1468325 (= res!996862 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48314 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48314 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48314 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47764 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468326 () Bool)

(declare-fun res!996858 () Bool)

(assert (=> b!1468326 (=> (not res!996858) (not e!824541))))

(assert (=> b!1468326 (= res!996858 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47764 a!2862) j!93) a!2862 mask!2687) lt!642263))))

(assert (= (and start!125504 res!996857) b!1468324))

(assert (= (and b!1468324 res!996860) b!1468318))

(assert (= (and b!1468318 res!996865) b!1468320))

(assert (= (and b!1468320 res!996861) b!1468323))

(assert (= (and b!1468323 res!996863) b!1468321))

(assert (= (and b!1468321 res!996864) b!1468325))

(assert (= (and b!1468325 res!996862) b!1468322))

(assert (= (and b!1468322 res!996859) b!1468326))

(assert (= (and b!1468326 res!996858) b!1468319))

(declare-fun m!1355357 () Bool)

(assert (=> b!1468326 m!1355357))

(assert (=> b!1468326 m!1355357))

(declare-fun m!1355359 () Bool)

(assert (=> b!1468326 m!1355359))

(declare-fun m!1355361 () Bool)

(assert (=> b!1468319 m!1355361))

(declare-fun m!1355363 () Bool)

(assert (=> b!1468319 m!1355363))

(assert (=> b!1468319 m!1355363))

(declare-fun m!1355365 () Bool)

(assert (=> b!1468319 m!1355365))

(assert (=> b!1468319 m!1355365))

(assert (=> b!1468319 m!1355363))

(declare-fun m!1355367 () Bool)

(assert (=> b!1468319 m!1355367))

(declare-fun m!1355369 () Bool)

(assert (=> b!1468318 m!1355369))

(assert (=> b!1468318 m!1355369))

(declare-fun m!1355371 () Bool)

(assert (=> b!1468318 m!1355371))

(declare-fun m!1355373 () Bool)

(assert (=> start!125504 m!1355373))

(declare-fun m!1355375 () Bool)

(assert (=> start!125504 m!1355375))

(declare-fun m!1355377 () Bool)

(assert (=> b!1468321 m!1355377))

(declare-fun m!1355379 () Bool)

(assert (=> b!1468323 m!1355379))

(assert (=> b!1468322 m!1355357))

(assert (=> b!1468322 m!1355357))

(declare-fun m!1355381 () Bool)

(assert (=> b!1468322 m!1355381))

(assert (=> b!1468322 m!1355381))

(assert (=> b!1468322 m!1355357))

(declare-fun m!1355383 () Bool)

(assert (=> b!1468322 m!1355383))

(assert (=> b!1468325 m!1355361))

(declare-fun m!1355385 () Bool)

(assert (=> b!1468325 m!1355385))

(assert (=> b!1468320 m!1355357))

(assert (=> b!1468320 m!1355357))

(declare-fun m!1355387 () Bool)

(assert (=> b!1468320 m!1355387))

(push 1)

(assert (not b!1468318))

(assert (not b!1468321))

(assert (not b!1468322))

(assert (not b!1468320))

(assert (not start!125504))

(assert (not b!1468319))

(assert (not b!1468323))

(assert (not b!1468326))

