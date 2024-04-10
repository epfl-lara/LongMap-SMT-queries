; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125498 () Bool)

(assert start!125498)

(declare-fun b!1468237 () Bool)

(declare-fun res!996783 () Bool)

(declare-fun e!824515 () Bool)

(assert (=> b!1468237 (=> (not res!996783) (not e!824515))))

(declare-datatypes ((array!98946 0))(
  ( (array!98947 (arr!47761 (Array (_ BitVec 32) (_ BitVec 64))) (size!48311 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98946)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98946 (_ BitVec 32)) Bool)

(assert (=> b!1468237 (= res!996783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468238 () Bool)

(declare-fun res!996778 () Bool)

(assert (=> b!1468238 (=> (not res!996778) (not e!824515))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468238 (= res!996778 (validKeyInArray!0 (select (arr!47761 a!2862) i!1006)))))

(declare-fun b!1468239 () Bool)

(declare-fun e!824514 () Bool)

(assert (=> b!1468239 (= e!824514 false)))

(declare-datatypes ((SeekEntryResult!12001 0))(
  ( (MissingZero!12001 (index!50396 (_ BitVec 32))) (Found!12001 (index!50397 (_ BitVec 32))) (Intermediate!12001 (undefined!12813 Bool) (index!50398 (_ BitVec 32)) (x!131986 (_ BitVec 32))) (Undefined!12001) (MissingVacant!12001 (index!50399 (_ BitVec 32))) )
))
(declare-fun lt!642245 () SeekEntryResult!12001)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98946 (_ BitVec 32)) SeekEntryResult!12001)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468239 (= lt!642245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98947 (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48311 a!2862)) mask!2687))))

(declare-fun b!1468240 () Bool)

(assert (=> b!1468240 (= e!824515 e!824514)))

(declare-fun res!996781 () Bool)

(assert (=> b!1468240 (=> (not res!996781) (not e!824514))))

(declare-fun lt!642246 () SeekEntryResult!12001)

(assert (=> b!1468240 (= res!996781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47761 a!2862) j!93) mask!2687) (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642246))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468240 (= lt!642246 (Intermediate!12001 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468242 () Bool)

(declare-fun res!996782 () Bool)

(assert (=> b!1468242 (=> (not res!996782) (not e!824515))))

(assert (=> b!1468242 (= res!996782 (validKeyInArray!0 (select (arr!47761 a!2862) j!93)))))

(declare-fun b!1468243 () Bool)

(declare-fun res!996779 () Bool)

(assert (=> b!1468243 (=> (not res!996779) (not e!824514))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468243 (= res!996779 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642246))))

(declare-fun b!1468244 () Bool)

(declare-fun res!996776 () Bool)

(assert (=> b!1468244 (=> (not res!996776) (not e!824515))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468244 (= res!996776 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48311 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48311 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48311 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468245 () Bool)

(declare-fun res!996780 () Bool)

(assert (=> b!1468245 (=> (not res!996780) (not e!824515))))

(assert (=> b!1468245 (= res!996780 (and (= (size!48311 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48311 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48311 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468241 () Bool)

(declare-fun res!996777 () Bool)

(assert (=> b!1468241 (=> (not res!996777) (not e!824515))))

(declare-datatypes ((List!34262 0))(
  ( (Nil!34259) (Cons!34258 (h!35608 (_ BitVec 64)) (t!48956 List!34262)) )
))
(declare-fun arrayNoDuplicates!0 (array!98946 (_ BitVec 32) List!34262) Bool)

(assert (=> b!1468241 (= res!996777 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34259))))

(declare-fun res!996784 () Bool)

(assert (=> start!125498 (=> (not res!996784) (not e!824515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125498 (= res!996784 (validMask!0 mask!2687))))

(assert (=> start!125498 e!824515))

(assert (=> start!125498 true))

(declare-fun array_inv!36789 (array!98946) Bool)

(assert (=> start!125498 (array_inv!36789 a!2862)))

(assert (= (and start!125498 res!996784) b!1468245))

(assert (= (and b!1468245 res!996780) b!1468238))

(assert (= (and b!1468238 res!996778) b!1468242))

(assert (= (and b!1468242 res!996782) b!1468237))

(assert (= (and b!1468237 res!996783) b!1468241))

(assert (= (and b!1468241 res!996777) b!1468244))

(assert (= (and b!1468244 res!996776) b!1468240))

(assert (= (and b!1468240 res!996781) b!1468243))

(assert (= (and b!1468243 res!996779) b!1468239))

(declare-fun m!1355261 () Bool)

(assert (=> b!1468240 m!1355261))

(assert (=> b!1468240 m!1355261))

(declare-fun m!1355263 () Bool)

(assert (=> b!1468240 m!1355263))

(assert (=> b!1468240 m!1355263))

(assert (=> b!1468240 m!1355261))

(declare-fun m!1355265 () Bool)

(assert (=> b!1468240 m!1355265))

(assert (=> b!1468242 m!1355261))

(assert (=> b!1468242 m!1355261))

(declare-fun m!1355267 () Bool)

(assert (=> b!1468242 m!1355267))

(declare-fun m!1355269 () Bool)

(assert (=> b!1468238 m!1355269))

(assert (=> b!1468238 m!1355269))

(declare-fun m!1355271 () Bool)

(assert (=> b!1468238 m!1355271))

(declare-fun m!1355273 () Bool)

(assert (=> b!1468237 m!1355273))

(declare-fun m!1355275 () Bool)

(assert (=> b!1468244 m!1355275))

(declare-fun m!1355277 () Bool)

(assert (=> b!1468244 m!1355277))

(declare-fun m!1355279 () Bool)

(assert (=> b!1468241 m!1355279))

(declare-fun m!1355281 () Bool)

(assert (=> start!125498 m!1355281))

(declare-fun m!1355283 () Bool)

(assert (=> start!125498 m!1355283))

(assert (=> b!1468239 m!1355275))

(declare-fun m!1355285 () Bool)

(assert (=> b!1468239 m!1355285))

(assert (=> b!1468239 m!1355285))

(declare-fun m!1355287 () Bool)

(assert (=> b!1468239 m!1355287))

(assert (=> b!1468239 m!1355287))

(assert (=> b!1468239 m!1355285))

(declare-fun m!1355289 () Bool)

(assert (=> b!1468239 m!1355289))

(assert (=> b!1468243 m!1355261))

(assert (=> b!1468243 m!1355261))

(declare-fun m!1355291 () Bool)

(assert (=> b!1468243 m!1355291))

(push 1)

(assert (not b!1468242))

(assert (not b!1468241))

(assert (not b!1468243))

(assert (not b!1468238))

(assert (not b!1468237))

(assert (not start!125498))

(assert (not b!1468240))

(assert (not b!1468239))

