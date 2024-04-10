; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125560 () Bool)

(assert start!125560)

(declare-fun b!1469074 () Bool)

(declare-fun e!824795 () Bool)

(assert (=> b!1469074 (= e!824795 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12032 0))(
  ( (MissingZero!12032 (index!50520 (_ BitVec 32))) (Found!12032 (index!50521 (_ BitVec 32))) (Intermediate!12032 (undefined!12844 Bool) (index!50522 (_ BitVec 32)) (x!132105 (_ BitVec 32))) (Undefined!12032) (MissingVacant!12032 (index!50523 (_ BitVec 32))) )
))
(declare-fun lt!642431 () SeekEntryResult!12032)

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99008 0))(
  ( (array!99009 (arr!47792 (Array (_ BitVec 32) (_ BitVec 64))) (size!48342 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99008 (_ BitVec 32)) SeekEntryResult!12032)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469074 (= lt!642431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47792 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47792 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99009 (store (arr!47792 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48342 a!2862)) mask!2687))))

(declare-fun b!1469075 () Bool)

(declare-fun res!997621 () Bool)

(declare-fun e!824794 () Bool)

(assert (=> b!1469075 (=> (not res!997621) (not e!824794))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469075 (= res!997621 (validKeyInArray!0 (select (arr!47792 a!2862) i!1006)))))

(declare-fun b!1469076 () Bool)

(declare-fun res!997616 () Bool)

(assert (=> b!1469076 (=> (not res!997616) (not e!824795))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642432 () SeekEntryResult!12032)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469076 (= res!997616 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47792 a!2862) j!93) a!2862 mask!2687) lt!642432))))

(declare-fun b!1469077 () Bool)

(declare-fun res!997618 () Bool)

(assert (=> b!1469077 (=> (not res!997618) (not e!824794))))

(assert (=> b!1469077 (= res!997618 (and (= (size!48342 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48342 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48342 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469078 () Bool)

(declare-fun res!997615 () Bool)

(assert (=> b!1469078 (=> (not res!997615) (not e!824794))))

(declare-datatypes ((List!34293 0))(
  ( (Nil!34290) (Cons!34289 (h!35639 (_ BitVec 64)) (t!48987 List!34293)) )
))
(declare-fun arrayNoDuplicates!0 (array!99008 (_ BitVec 32) List!34293) Bool)

(assert (=> b!1469078 (= res!997615 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34290))))

(declare-fun b!1469079 () Bool)

(declare-fun res!997614 () Bool)

(assert (=> b!1469079 (=> (not res!997614) (not e!824794))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469079 (= res!997614 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48342 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48342 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48342 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47792 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!997617 () Bool)

(assert (=> start!125560 (=> (not res!997617) (not e!824794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125560 (= res!997617 (validMask!0 mask!2687))))

(assert (=> start!125560 e!824794))

(assert (=> start!125560 true))

(declare-fun array_inv!36820 (array!99008) Bool)

(assert (=> start!125560 (array_inv!36820 a!2862)))

(declare-fun b!1469080 () Bool)

(declare-fun res!997619 () Bool)

(assert (=> b!1469080 (=> (not res!997619) (not e!824794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99008 (_ BitVec 32)) Bool)

(assert (=> b!1469080 (= res!997619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469081 () Bool)

(declare-fun res!997613 () Bool)

(assert (=> b!1469081 (=> (not res!997613) (not e!824794))))

(assert (=> b!1469081 (= res!997613 (validKeyInArray!0 (select (arr!47792 a!2862) j!93)))))

(declare-fun b!1469082 () Bool)

(assert (=> b!1469082 (= e!824794 e!824795)))

(declare-fun res!997620 () Bool)

(assert (=> b!1469082 (=> (not res!997620) (not e!824795))))

(assert (=> b!1469082 (= res!997620 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47792 a!2862) j!93) mask!2687) (select (arr!47792 a!2862) j!93) a!2862 mask!2687) lt!642432))))

(assert (=> b!1469082 (= lt!642432 (Intermediate!12032 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125560 res!997617) b!1469077))

(assert (= (and b!1469077 res!997618) b!1469075))

(assert (= (and b!1469075 res!997621) b!1469081))

(assert (= (and b!1469081 res!997613) b!1469080))

(assert (= (and b!1469080 res!997619) b!1469078))

(assert (= (and b!1469078 res!997615) b!1469079))

(assert (= (and b!1469079 res!997614) b!1469082))

(assert (= (and b!1469082 res!997620) b!1469076))

(assert (= (and b!1469076 res!997616) b!1469074))

(declare-fun m!1356253 () Bool)

(assert (=> b!1469080 m!1356253))

(declare-fun m!1356255 () Bool)

(assert (=> b!1469082 m!1356255))

(assert (=> b!1469082 m!1356255))

(declare-fun m!1356257 () Bool)

(assert (=> b!1469082 m!1356257))

(assert (=> b!1469082 m!1356257))

(assert (=> b!1469082 m!1356255))

(declare-fun m!1356259 () Bool)

(assert (=> b!1469082 m!1356259))

(declare-fun m!1356261 () Bool)

(assert (=> b!1469075 m!1356261))

(assert (=> b!1469075 m!1356261))

(declare-fun m!1356263 () Bool)

(assert (=> b!1469075 m!1356263))

(declare-fun m!1356265 () Bool)

(assert (=> b!1469079 m!1356265))

(declare-fun m!1356267 () Bool)

(assert (=> b!1469079 m!1356267))

(declare-fun m!1356269 () Bool)

(assert (=> start!125560 m!1356269))

(declare-fun m!1356271 () Bool)

(assert (=> start!125560 m!1356271))

(declare-fun m!1356273 () Bool)

(assert (=> b!1469078 m!1356273))

(assert (=> b!1469081 m!1356255))

(assert (=> b!1469081 m!1356255))

(declare-fun m!1356275 () Bool)

(assert (=> b!1469081 m!1356275))

(assert (=> b!1469076 m!1356255))

(assert (=> b!1469076 m!1356255))

(declare-fun m!1356277 () Bool)

(assert (=> b!1469076 m!1356277))

(assert (=> b!1469074 m!1356265))

(declare-fun m!1356279 () Bool)

(assert (=> b!1469074 m!1356279))

(assert (=> b!1469074 m!1356279))

(declare-fun m!1356281 () Bool)

(assert (=> b!1469074 m!1356281))

(assert (=> b!1469074 m!1356281))

(assert (=> b!1469074 m!1356279))

(declare-fun m!1356283 () Bool)

(assert (=> b!1469074 m!1356283))

(push 1)

