; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125494 () Bool)

(assert start!125494)

(declare-fun b!1468183 () Bool)

(declare-fun e!824497 () Bool)

(declare-fun e!824496 () Bool)

(assert (=> b!1468183 (= e!824497 e!824496)))

(declare-fun res!996722 () Bool)

(assert (=> b!1468183 (=> (not res!996722) (not e!824496))))

(declare-datatypes ((SeekEntryResult!11999 0))(
  ( (MissingZero!11999 (index!50388 (_ BitVec 32))) (Found!11999 (index!50389 (_ BitVec 32))) (Intermediate!11999 (undefined!12811 Bool) (index!50390 (_ BitVec 32)) (x!131984 (_ BitVec 32))) (Undefined!11999) (MissingVacant!11999 (index!50391 (_ BitVec 32))) )
))
(declare-fun lt!642233 () SeekEntryResult!11999)

(declare-datatypes ((array!98942 0))(
  ( (array!98943 (arr!47759 (Array (_ BitVec 32) (_ BitVec 64))) (size!48309 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98942)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98942 (_ BitVec 32)) SeekEntryResult!11999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468183 (= res!996722 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47759 a!2862) j!93) mask!2687) (select (arr!47759 a!2862) j!93) a!2862 mask!2687) lt!642233))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468183 (= lt!642233 (Intermediate!11999 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468184 () Bool)

(declare-fun res!996730 () Bool)

(assert (=> b!1468184 (=> (not res!996730) (not e!824497))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468184 (= res!996730 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48309 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48309 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48309 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47759 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!996728 () Bool)

(assert (=> start!125494 (=> (not res!996728) (not e!824497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125494 (= res!996728 (validMask!0 mask!2687))))

(assert (=> start!125494 e!824497))

(assert (=> start!125494 true))

(declare-fun array_inv!36787 (array!98942) Bool)

(assert (=> start!125494 (array_inv!36787 a!2862)))

(declare-fun b!1468185 () Bool)

(declare-fun res!996725 () Bool)

(assert (=> b!1468185 (=> (not res!996725) (not e!824497))))

(declare-datatypes ((List!34260 0))(
  ( (Nil!34257) (Cons!34256 (h!35606 (_ BitVec 64)) (t!48954 List!34260)) )
))
(declare-fun arrayNoDuplicates!0 (array!98942 (_ BitVec 32) List!34260) Bool)

(assert (=> b!1468185 (= res!996725 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34257))))

(declare-fun b!1468186 () Bool)

(assert (=> b!1468186 (= e!824496 false)))

(declare-fun lt!642234 () SeekEntryResult!11999)

(assert (=> b!1468186 (= lt!642234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47759 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47759 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98943 (store (arr!47759 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48309 a!2862)) mask!2687))))

(declare-fun b!1468187 () Bool)

(declare-fun res!996729 () Bool)

(assert (=> b!1468187 (=> (not res!996729) (not e!824497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98942 (_ BitVec 32)) Bool)

(assert (=> b!1468187 (= res!996729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468188 () Bool)

(declare-fun res!996727 () Bool)

(assert (=> b!1468188 (=> (not res!996727) (not e!824496))))

(assert (=> b!1468188 (= res!996727 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47759 a!2862) j!93) a!2862 mask!2687) lt!642233))))

(declare-fun b!1468189 () Bool)

(declare-fun res!996724 () Bool)

(assert (=> b!1468189 (=> (not res!996724) (not e!824497))))

(assert (=> b!1468189 (= res!996724 (and (= (size!48309 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48309 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48309 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468190 () Bool)

(declare-fun res!996723 () Bool)

(assert (=> b!1468190 (=> (not res!996723) (not e!824497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468190 (= res!996723 (validKeyInArray!0 (select (arr!47759 a!2862) i!1006)))))

(declare-fun b!1468191 () Bool)

(declare-fun res!996726 () Bool)

(assert (=> b!1468191 (=> (not res!996726) (not e!824497))))

(assert (=> b!1468191 (= res!996726 (validKeyInArray!0 (select (arr!47759 a!2862) j!93)))))

(assert (= (and start!125494 res!996728) b!1468189))

(assert (= (and b!1468189 res!996724) b!1468190))

(assert (= (and b!1468190 res!996723) b!1468191))

(assert (= (and b!1468191 res!996726) b!1468187))

(assert (= (and b!1468187 res!996729) b!1468185))

(assert (= (and b!1468185 res!996725) b!1468184))

(assert (= (and b!1468184 res!996730) b!1468183))

(assert (= (and b!1468183 res!996722) b!1468188))

(assert (= (and b!1468188 res!996727) b!1468186))

(declare-fun m!1355197 () Bool)

(assert (=> b!1468183 m!1355197))

(assert (=> b!1468183 m!1355197))

(declare-fun m!1355199 () Bool)

(assert (=> b!1468183 m!1355199))

(assert (=> b!1468183 m!1355199))

(assert (=> b!1468183 m!1355197))

(declare-fun m!1355201 () Bool)

(assert (=> b!1468183 m!1355201))

(declare-fun m!1355203 () Bool)

(assert (=> b!1468184 m!1355203))

(declare-fun m!1355205 () Bool)

(assert (=> b!1468184 m!1355205))

(assert (=> b!1468186 m!1355203))

(declare-fun m!1355207 () Bool)

(assert (=> b!1468186 m!1355207))

(assert (=> b!1468186 m!1355207))

(declare-fun m!1355209 () Bool)

(assert (=> b!1468186 m!1355209))

(assert (=> b!1468186 m!1355209))

(assert (=> b!1468186 m!1355207))

(declare-fun m!1355211 () Bool)

(assert (=> b!1468186 m!1355211))

(declare-fun m!1355213 () Bool)

(assert (=> b!1468187 m!1355213))

(assert (=> b!1468188 m!1355197))

(assert (=> b!1468188 m!1355197))

(declare-fun m!1355215 () Bool)

(assert (=> b!1468188 m!1355215))

(declare-fun m!1355217 () Bool)

(assert (=> b!1468190 m!1355217))

(assert (=> b!1468190 m!1355217))

(declare-fun m!1355219 () Bool)

(assert (=> b!1468190 m!1355219))

(declare-fun m!1355221 () Bool)

(assert (=> start!125494 m!1355221))

(declare-fun m!1355223 () Bool)

(assert (=> start!125494 m!1355223))

(declare-fun m!1355225 () Bool)

(assert (=> b!1468185 m!1355225))

(assert (=> b!1468191 m!1355197))

(assert (=> b!1468191 m!1355197))

(declare-fun m!1355227 () Bool)

(assert (=> b!1468191 m!1355227))

(push 1)

