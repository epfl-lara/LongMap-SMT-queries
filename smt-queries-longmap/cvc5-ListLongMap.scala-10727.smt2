; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125500 () Bool)

(assert start!125500)

(declare-fun b!1468264 () Bool)

(declare-fun res!996808 () Bool)

(declare-fun e!824525 () Bool)

(assert (=> b!1468264 (=> (not res!996808) (not e!824525))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98948 0))(
  ( (array!98949 (arr!47762 (Array (_ BitVec 32) (_ BitVec 64))) (size!48312 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98948)

(assert (=> b!1468264 (= res!996808 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48312 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48312 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48312 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47762 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468265 () Bool)

(declare-fun res!996811 () Bool)

(assert (=> b!1468265 (=> (not res!996811) (not e!824525))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98948 (_ BitVec 32)) Bool)

(assert (=> b!1468265 (= res!996811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!996805 () Bool)

(assert (=> start!125500 (=> (not res!996805) (not e!824525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125500 (= res!996805 (validMask!0 mask!2687))))

(assert (=> start!125500 e!824525))

(assert (=> start!125500 true))

(declare-fun array_inv!36790 (array!98948) Bool)

(assert (=> start!125500 (array_inv!36790 a!2862)))

(declare-fun b!1468266 () Bool)

(declare-fun res!996804 () Bool)

(assert (=> b!1468266 (=> (not res!996804) (not e!824525))))

(declare-datatypes ((List!34263 0))(
  ( (Nil!34260) (Cons!34259 (h!35609 (_ BitVec 64)) (t!48957 List!34263)) )
))
(declare-fun arrayNoDuplicates!0 (array!98948 (_ BitVec 32) List!34263) Bool)

(assert (=> b!1468266 (= res!996804 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34260))))

(declare-fun b!1468267 () Bool)

(declare-fun e!824523 () Bool)

(assert (=> b!1468267 (= e!824525 e!824523)))

(declare-fun res!996806 () Bool)

(assert (=> b!1468267 (=> (not res!996806) (not e!824523))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12002 0))(
  ( (MissingZero!12002 (index!50400 (_ BitVec 32))) (Found!12002 (index!50401 (_ BitVec 32))) (Intermediate!12002 (undefined!12814 Bool) (index!50402 (_ BitVec 32)) (x!131995 (_ BitVec 32))) (Undefined!12002) (MissingVacant!12002 (index!50403 (_ BitVec 32))) )
))
(declare-fun lt!642251 () SeekEntryResult!12002)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98948 (_ BitVec 32)) SeekEntryResult!12002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468267 (= res!996806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47762 a!2862) j!93) mask!2687) (select (arr!47762 a!2862) j!93) a!2862 mask!2687) lt!642251))))

(assert (=> b!1468267 (= lt!642251 (Intermediate!12002 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468268 () Bool)

(declare-fun res!996809 () Bool)

(assert (=> b!1468268 (=> (not res!996809) (not e!824523))))

(assert (=> b!1468268 (= res!996809 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47762 a!2862) j!93) a!2862 mask!2687) lt!642251))))

(declare-fun b!1468269 () Bool)

(assert (=> b!1468269 (= e!824523 false)))

(declare-fun lt!642252 () SeekEntryResult!12002)

(assert (=> b!1468269 (= lt!642252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47762 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47762 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98949 (store (arr!47762 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48312 a!2862)) mask!2687))))

(declare-fun b!1468270 () Bool)

(declare-fun res!996810 () Bool)

(assert (=> b!1468270 (=> (not res!996810) (not e!824525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468270 (= res!996810 (validKeyInArray!0 (select (arr!47762 a!2862) j!93)))))

(declare-fun b!1468271 () Bool)

(declare-fun res!996803 () Bool)

(assert (=> b!1468271 (=> (not res!996803) (not e!824525))))

(assert (=> b!1468271 (= res!996803 (and (= (size!48312 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48312 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48312 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468272 () Bool)

(declare-fun res!996807 () Bool)

(assert (=> b!1468272 (=> (not res!996807) (not e!824525))))

(assert (=> b!1468272 (= res!996807 (validKeyInArray!0 (select (arr!47762 a!2862) i!1006)))))

(assert (= (and start!125500 res!996805) b!1468271))

(assert (= (and b!1468271 res!996803) b!1468272))

(assert (= (and b!1468272 res!996807) b!1468270))

(assert (= (and b!1468270 res!996810) b!1468265))

(assert (= (and b!1468265 res!996811) b!1468266))

(assert (= (and b!1468266 res!996804) b!1468264))

(assert (= (and b!1468264 res!996808) b!1468267))

(assert (= (and b!1468267 res!996806) b!1468268))

(assert (= (and b!1468268 res!996809) b!1468269))

(declare-fun m!1355293 () Bool)

(assert (=> b!1468269 m!1355293))

(declare-fun m!1355295 () Bool)

(assert (=> b!1468269 m!1355295))

(assert (=> b!1468269 m!1355295))

(declare-fun m!1355297 () Bool)

(assert (=> b!1468269 m!1355297))

(assert (=> b!1468269 m!1355297))

(assert (=> b!1468269 m!1355295))

(declare-fun m!1355299 () Bool)

(assert (=> b!1468269 m!1355299))

(assert (=> b!1468264 m!1355293))

(declare-fun m!1355301 () Bool)

(assert (=> b!1468264 m!1355301))

(declare-fun m!1355303 () Bool)

(assert (=> start!125500 m!1355303))

(declare-fun m!1355305 () Bool)

(assert (=> start!125500 m!1355305))

(declare-fun m!1355307 () Bool)

(assert (=> b!1468265 m!1355307))

(declare-fun m!1355309 () Bool)

(assert (=> b!1468267 m!1355309))

(assert (=> b!1468267 m!1355309))

(declare-fun m!1355311 () Bool)

(assert (=> b!1468267 m!1355311))

(assert (=> b!1468267 m!1355311))

(assert (=> b!1468267 m!1355309))

(declare-fun m!1355313 () Bool)

(assert (=> b!1468267 m!1355313))

(declare-fun m!1355315 () Bool)

(assert (=> b!1468266 m!1355315))

(declare-fun m!1355317 () Bool)

(assert (=> b!1468272 m!1355317))

(assert (=> b!1468272 m!1355317))

(declare-fun m!1355319 () Bool)

(assert (=> b!1468272 m!1355319))

(assert (=> b!1468268 m!1355309))

(assert (=> b!1468268 m!1355309))

(declare-fun m!1355321 () Bool)

(assert (=> b!1468268 m!1355321))

(assert (=> b!1468270 m!1355309))

(assert (=> b!1468270 m!1355309))

(declare-fun m!1355323 () Bool)

(assert (=> b!1468270 m!1355323))

(push 1)

