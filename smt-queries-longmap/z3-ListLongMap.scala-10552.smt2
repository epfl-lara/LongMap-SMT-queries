; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124668 () Bool)

(assert start!124668)

(declare-fun b!1441223 () Bool)

(declare-fun res!972833 () Bool)

(declare-fun e!812851 () Bool)

(assert (=> b!1441223 (=> (not res!972833) (not e!812851))))

(declare-datatypes ((array!98011 0))(
  ( (array!98012 (arr!47290 (Array (_ BitVec 32) (_ BitVec 64))) (size!47841 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98011)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441223 (= res!972833 (validKeyInArray!0 (select (arr!47290 a!2862) i!1006)))))

(declare-fun b!1441224 () Bool)

(declare-fun res!972830 () Bool)

(assert (=> b!1441224 (=> (not res!972830) (not e!812851))))

(declare-datatypes ((List!33778 0))(
  ( (Nil!33775) (Cons!33774 (h!35135 (_ BitVec 64)) (t!48464 List!33778)) )
))
(declare-fun arrayNoDuplicates!0 (array!98011 (_ BitVec 32) List!33778) Bool)

(assert (=> b!1441224 (= res!972830 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33775))))

(declare-fun b!1441225 () Bool)

(declare-fun res!972831 () Bool)

(assert (=> b!1441225 (=> (not res!972831) (not e!812851))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98011 (_ BitVec 32)) Bool)

(assert (=> b!1441225 (= res!972831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441226 () Bool)

(declare-fun res!972828 () Bool)

(assert (=> b!1441226 (=> (not res!972828) (not e!812851))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441226 (= res!972828 (and (= (size!47841 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47841 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47841 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441227 () Bool)

(declare-fun res!972832 () Bool)

(assert (=> b!1441227 (=> (not res!972832) (not e!812851))))

(assert (=> b!1441227 (= res!972832 (validKeyInArray!0 (select (arr!47290 a!2862) j!93)))))

(declare-fun b!1441228 () Bool)

(declare-fun res!972827 () Bool)

(assert (=> b!1441228 (=> (not res!972827) (not e!812851))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441228 (= res!972827 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47841 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47841 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47841 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972829 () Bool)

(assert (=> start!124668 (=> (not res!972829) (not e!812851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124668 (= res!972829 (validMask!0 mask!2687))))

(assert (=> start!124668 e!812851))

(assert (=> start!124668 true))

(declare-fun array_inv!36571 (array!98011) Bool)

(assert (=> start!124668 (array_inv!36571 a!2862)))

(declare-fun b!1441229 () Bool)

(declare-fun e!812852 () Bool)

(assert (=> b!1441229 (= e!812851 e!812852)))

(declare-fun res!972826 () Bool)

(assert (=> b!1441229 (=> (not res!972826) (not e!812852))))

(declare-datatypes ((SeekEntryResult!11439 0))(
  ( (MissingZero!11439 (index!48148 (_ BitVec 32))) (Found!11439 (index!48149 (_ BitVec 32))) (Intermediate!11439 (undefined!12251 Bool) (index!48150 (_ BitVec 32)) (x!130056 (_ BitVec 32))) (Undefined!11439) (MissingVacant!11439 (index!48151 (_ BitVec 32))) )
))
(declare-fun lt!633361 () SeekEntryResult!11439)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98011 (_ BitVec 32)) SeekEntryResult!11439)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441229 (= res!972826 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47290 a!2862) j!93) mask!2687) (select (arr!47290 a!2862) j!93) a!2862 mask!2687) lt!633361))))

(assert (=> b!1441229 (= lt!633361 (Intermediate!11439 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441230 () Bool)

(declare-fun res!972825 () Bool)

(assert (=> b!1441230 (=> (not res!972825) (not e!812852))))

(assert (=> b!1441230 (= res!972825 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47290 a!2862) j!93) a!2862 mask!2687) lt!633361))))

(declare-fun b!1441231 () Bool)

(assert (=> b!1441231 (= e!812852 false)))

(declare-fun lt!633360 () SeekEntryResult!11439)

(assert (=> b!1441231 (= lt!633360 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98012 (store (arr!47290 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47841 a!2862)) mask!2687))))

(assert (= (and start!124668 res!972829) b!1441226))

(assert (= (and b!1441226 res!972828) b!1441223))

(assert (= (and b!1441223 res!972833) b!1441227))

(assert (= (and b!1441227 res!972832) b!1441225))

(assert (= (and b!1441225 res!972831) b!1441224))

(assert (= (and b!1441224 res!972830) b!1441228))

(assert (= (and b!1441228 res!972827) b!1441229))

(assert (= (and b!1441229 res!972826) b!1441230))

(assert (= (and b!1441230 res!972825) b!1441231))

(declare-fun m!1330459 () Bool)

(assert (=> b!1441229 m!1330459))

(assert (=> b!1441229 m!1330459))

(declare-fun m!1330461 () Bool)

(assert (=> b!1441229 m!1330461))

(assert (=> b!1441229 m!1330461))

(assert (=> b!1441229 m!1330459))

(declare-fun m!1330463 () Bool)

(assert (=> b!1441229 m!1330463))

(declare-fun m!1330465 () Bool)

(assert (=> b!1441223 m!1330465))

(assert (=> b!1441223 m!1330465))

(declare-fun m!1330467 () Bool)

(assert (=> b!1441223 m!1330467))

(declare-fun m!1330469 () Bool)

(assert (=> b!1441231 m!1330469))

(declare-fun m!1330471 () Bool)

(assert (=> b!1441231 m!1330471))

(assert (=> b!1441231 m!1330471))

(declare-fun m!1330473 () Bool)

(assert (=> b!1441231 m!1330473))

(assert (=> b!1441231 m!1330473))

(assert (=> b!1441231 m!1330471))

(declare-fun m!1330475 () Bool)

(assert (=> b!1441231 m!1330475))

(declare-fun m!1330477 () Bool)

(assert (=> start!124668 m!1330477))

(declare-fun m!1330479 () Bool)

(assert (=> start!124668 m!1330479))

(declare-fun m!1330481 () Bool)

(assert (=> b!1441225 m!1330481))

(assert (=> b!1441227 m!1330459))

(assert (=> b!1441227 m!1330459))

(declare-fun m!1330483 () Bool)

(assert (=> b!1441227 m!1330483))

(assert (=> b!1441228 m!1330469))

(declare-fun m!1330485 () Bool)

(assert (=> b!1441228 m!1330485))

(declare-fun m!1330487 () Bool)

(assert (=> b!1441224 m!1330487))

(assert (=> b!1441230 m!1330459))

(assert (=> b!1441230 m!1330459))

(declare-fun m!1330489 () Bool)

(assert (=> b!1441230 m!1330489))

(check-sat (not b!1441227) (not b!1441224) (not b!1441225) (not b!1441229) (not b!1441223) (not b!1441231) (not start!124668) (not b!1441230))
(check-sat)
