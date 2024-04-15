; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125506 () Bool)

(assert start!125506)

(declare-fun b!1468555 () Bool)

(declare-fun e!824569 () Bool)

(declare-fun e!824570 () Bool)

(assert (=> b!1468555 (= e!824569 e!824570)))

(declare-fun res!997211 () Bool)

(assert (=> b!1468555 (=> (not res!997211) (not e!824570))))

(declare-datatypes ((array!98932 0))(
  ( (array!98933 (arr!47755 (Array (_ BitVec 32) (_ BitVec 64))) (size!48307 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98932)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12020 0))(
  ( (MissingZero!12020 (index!50472 (_ BitVec 32))) (Found!12020 (index!50473 (_ BitVec 32))) (Intermediate!12020 (undefined!12832 Bool) (index!50474 (_ BitVec 32)) (x!132056 (_ BitVec 32))) (Undefined!12020) (MissingVacant!12020 (index!50475 (_ BitVec 32))) )
))
(declare-fun lt!642126 () SeekEntryResult!12020)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98932 (_ BitVec 32)) SeekEntryResult!12020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468555 (= res!997211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47755 a!2862) j!93) mask!2687) (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642126))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468555 (= lt!642126 (Intermediate!12020 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468556 () Bool)

(assert (=> b!1468556 (= e!824570 false)))

(declare-fun lt!642125 () SeekEntryResult!12020)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468556 (= lt!642125 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98933 (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48307 a!2862)) mask!2687))))

(declare-fun b!1468557 () Bool)

(declare-fun res!997215 () Bool)

(assert (=> b!1468557 (=> (not res!997215) (not e!824569))))

(declare-datatypes ((List!34334 0))(
  ( (Nil!34331) (Cons!34330 (h!35680 (_ BitVec 64)) (t!49020 List!34334)) )
))
(declare-fun arrayNoDuplicates!0 (array!98932 (_ BitVec 32) List!34334) Bool)

(assert (=> b!1468557 (= res!997215 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34331))))

(declare-fun res!997212 () Bool)

(assert (=> start!125506 (=> (not res!997212) (not e!824569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125506 (= res!997212 (validMask!0 mask!2687))))

(assert (=> start!125506 e!824569))

(assert (=> start!125506 true))

(declare-fun array_inv!36988 (array!98932) Bool)

(assert (=> start!125506 (array_inv!36988 a!2862)))

(declare-fun b!1468558 () Bool)

(declare-fun res!997213 () Bool)

(assert (=> b!1468558 (=> (not res!997213) (not e!824569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98932 (_ BitVec 32)) Bool)

(assert (=> b!1468558 (= res!997213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468559 () Bool)

(declare-fun res!997218 () Bool)

(assert (=> b!1468559 (=> (not res!997218) (not e!824569))))

(assert (=> b!1468559 (= res!997218 (and (= (size!48307 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48307 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48307 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468560 () Bool)

(declare-fun res!997217 () Bool)

(assert (=> b!1468560 (=> (not res!997217) (not e!824569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468560 (= res!997217 (validKeyInArray!0 (select (arr!47755 a!2862) i!1006)))))

(declare-fun b!1468561 () Bool)

(declare-fun res!997216 () Bool)

(assert (=> b!1468561 (=> (not res!997216) (not e!824569))))

(assert (=> b!1468561 (= res!997216 (validKeyInArray!0 (select (arr!47755 a!2862) j!93)))))

(declare-fun b!1468562 () Bool)

(declare-fun res!997219 () Bool)

(assert (=> b!1468562 (=> (not res!997219) (not e!824569))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468562 (= res!997219 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48307 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48307 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48307 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468563 () Bool)

(declare-fun res!997214 () Bool)

(assert (=> b!1468563 (=> (not res!997214) (not e!824570))))

(assert (=> b!1468563 (= res!997214 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642126))))

(assert (= (and start!125506 res!997212) b!1468559))

(assert (= (and b!1468559 res!997218) b!1468560))

(assert (= (and b!1468560 res!997217) b!1468561))

(assert (= (and b!1468561 res!997216) b!1468558))

(assert (= (and b!1468558 res!997213) b!1468557))

(assert (= (and b!1468557 res!997215) b!1468562))

(assert (= (and b!1468562 res!997219) b!1468555))

(assert (= (and b!1468555 res!997211) b!1468563))

(assert (= (and b!1468563 res!997214) b!1468556))

(declare-fun m!1355193 () Bool)

(assert (=> b!1468557 m!1355193))

(declare-fun m!1355195 () Bool)

(assert (=> b!1468562 m!1355195))

(declare-fun m!1355197 () Bool)

(assert (=> b!1468562 m!1355197))

(declare-fun m!1355199 () Bool)

(assert (=> b!1468560 m!1355199))

(assert (=> b!1468560 m!1355199))

(declare-fun m!1355201 () Bool)

(assert (=> b!1468560 m!1355201))

(declare-fun m!1355203 () Bool)

(assert (=> start!125506 m!1355203))

(declare-fun m!1355205 () Bool)

(assert (=> start!125506 m!1355205))

(declare-fun m!1355207 () Bool)

(assert (=> b!1468561 m!1355207))

(assert (=> b!1468561 m!1355207))

(declare-fun m!1355209 () Bool)

(assert (=> b!1468561 m!1355209))

(assert (=> b!1468555 m!1355207))

(assert (=> b!1468555 m!1355207))

(declare-fun m!1355211 () Bool)

(assert (=> b!1468555 m!1355211))

(assert (=> b!1468555 m!1355211))

(assert (=> b!1468555 m!1355207))

(declare-fun m!1355213 () Bool)

(assert (=> b!1468555 m!1355213))

(assert (=> b!1468563 m!1355207))

(assert (=> b!1468563 m!1355207))

(declare-fun m!1355215 () Bool)

(assert (=> b!1468563 m!1355215))

(assert (=> b!1468556 m!1355195))

(declare-fun m!1355217 () Bool)

(assert (=> b!1468556 m!1355217))

(assert (=> b!1468556 m!1355217))

(declare-fun m!1355219 () Bool)

(assert (=> b!1468556 m!1355219))

(assert (=> b!1468556 m!1355219))

(assert (=> b!1468556 m!1355217))

(declare-fun m!1355221 () Bool)

(assert (=> b!1468556 m!1355221))

(declare-fun m!1355223 () Bool)

(assert (=> b!1468558 m!1355223))

(check-sat (not b!1468560) (not b!1468558) (not b!1468557) (not start!125506) (not b!1468555) (not b!1468556) (not b!1468563) (not b!1468561))
(check-sat)
