; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124462 () Bool)

(assert start!124462)

(declare-fun b!1440067 () Bool)

(declare-fun res!972501 () Bool)

(declare-fun e!812068 () Bool)

(assert (=> b!1440067 (=> (not res!972501) (not e!812068))))

(declare-datatypes ((array!97910 0))(
  ( (array!97911 (arr!47243 (Array (_ BitVec 32) (_ BitVec 64))) (size!47793 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97910)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97910 (_ BitVec 32)) Bool)

(assert (=> b!1440067 (= res!972501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440068 () Bool)

(declare-fun res!972502 () Bool)

(assert (=> b!1440068 (=> (not res!972502) (not e!812068))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440068 (= res!972502 (and (= (size!47793 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47793 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47793 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440069 () Bool)

(declare-fun res!972496 () Bool)

(assert (=> b!1440069 (=> (not res!972496) (not e!812068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440069 (= res!972496 (validKeyInArray!0 (select (arr!47243 a!2862) i!1006)))))

(declare-fun b!1440070 () Bool)

(declare-fun res!972499 () Bool)

(declare-fun e!812069 () Bool)

(assert (=> b!1440070 (=> (not res!972499) (not e!812069))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11495 0))(
  ( (MissingZero!11495 (index!48372 (_ BitVec 32))) (Found!11495 (index!48373 (_ BitVec 32))) (Intermediate!11495 (undefined!12307 Bool) (index!48374 (_ BitVec 32)) (x!130104 (_ BitVec 32))) (Undefined!11495) (MissingVacant!11495 (index!48375 (_ BitVec 32))) )
))
(declare-fun lt!632910 () SeekEntryResult!11495)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97910 (_ BitVec 32)) SeekEntryResult!11495)

(assert (=> b!1440070 (= res!972499 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47243 a!2862) j!93) a!2862 mask!2687) lt!632910))))

(declare-fun b!1440071 () Bool)

(declare-fun res!972494 () Bool)

(assert (=> b!1440071 (=> (not res!972494) (not e!812068))))

(assert (=> b!1440071 (= res!972494 (validKeyInArray!0 (select (arr!47243 a!2862) j!93)))))

(declare-fun b!1440072 () Bool)

(declare-fun res!972500 () Bool)

(assert (=> b!1440072 (=> (not res!972500) (not e!812068))))

(declare-datatypes ((List!33744 0))(
  ( (Nil!33741) (Cons!33740 (h!35090 (_ BitVec 64)) (t!48438 List!33744)) )
))
(declare-fun arrayNoDuplicates!0 (array!97910 (_ BitVec 32) List!33744) Bool)

(assert (=> b!1440072 (= res!972500 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33741))))

(declare-fun b!1440073 () Bool)

(assert (=> b!1440073 (= e!812068 e!812069)))

(declare-fun res!972498 () Bool)

(assert (=> b!1440073 (=> (not res!972498) (not e!812069))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440073 (= res!972498 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47243 a!2862) j!93) mask!2687) (select (arr!47243 a!2862) j!93) a!2862 mask!2687) lt!632910))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440073 (= lt!632910 (Intermediate!11495 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440074 () Bool)

(declare-fun res!972497 () Bool)

(assert (=> b!1440074 (=> (not res!972497) (not e!812068))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440074 (= res!972497 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47793 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47793 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47793 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47243 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972495 () Bool)

(assert (=> start!124462 (=> (not res!972495) (not e!812068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124462 (= res!972495 (validMask!0 mask!2687))))

(assert (=> start!124462 e!812068))

(assert (=> start!124462 true))

(declare-fun array_inv!36271 (array!97910) Bool)

(assert (=> start!124462 (array_inv!36271 a!2862)))

(declare-fun b!1440075 () Bool)

(assert (=> b!1440075 (= e!812069 false)))

(declare-fun lt!632909 () SeekEntryResult!11495)

(assert (=> b!1440075 (= lt!632909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47243 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47243 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97911 (store (arr!47243 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47793 a!2862)) mask!2687))))

(assert (= (and start!124462 res!972495) b!1440068))

(assert (= (and b!1440068 res!972502) b!1440069))

(assert (= (and b!1440069 res!972496) b!1440071))

(assert (= (and b!1440071 res!972494) b!1440067))

(assert (= (and b!1440067 res!972501) b!1440072))

(assert (= (and b!1440072 res!972500) b!1440074))

(assert (= (and b!1440074 res!972497) b!1440073))

(assert (= (and b!1440073 res!972498) b!1440070))

(assert (= (and b!1440070 res!972499) b!1440075))

(declare-fun m!1329211 () Bool)

(assert (=> b!1440070 m!1329211))

(assert (=> b!1440070 m!1329211))

(declare-fun m!1329213 () Bool)

(assert (=> b!1440070 m!1329213))

(declare-fun m!1329215 () Bool)

(assert (=> b!1440072 m!1329215))

(declare-fun m!1329217 () Bool)

(assert (=> b!1440069 m!1329217))

(assert (=> b!1440069 m!1329217))

(declare-fun m!1329219 () Bool)

(assert (=> b!1440069 m!1329219))

(declare-fun m!1329221 () Bool)

(assert (=> b!1440074 m!1329221))

(declare-fun m!1329223 () Bool)

(assert (=> b!1440074 m!1329223))

(assert (=> b!1440073 m!1329211))

(assert (=> b!1440073 m!1329211))

(declare-fun m!1329225 () Bool)

(assert (=> b!1440073 m!1329225))

(assert (=> b!1440073 m!1329225))

(assert (=> b!1440073 m!1329211))

(declare-fun m!1329227 () Bool)

(assert (=> b!1440073 m!1329227))

(assert (=> b!1440071 m!1329211))

(assert (=> b!1440071 m!1329211))

(declare-fun m!1329229 () Bool)

(assert (=> b!1440071 m!1329229))

(assert (=> b!1440075 m!1329221))

(declare-fun m!1329231 () Bool)

(assert (=> b!1440075 m!1329231))

(assert (=> b!1440075 m!1329231))

(declare-fun m!1329233 () Bool)

(assert (=> b!1440075 m!1329233))

(assert (=> b!1440075 m!1329233))

(assert (=> b!1440075 m!1329231))

(declare-fun m!1329235 () Bool)

(assert (=> b!1440075 m!1329235))

(declare-fun m!1329237 () Bool)

(assert (=> b!1440067 m!1329237))

(declare-fun m!1329239 () Bool)

(assert (=> start!124462 m!1329239))

(declare-fun m!1329241 () Bool)

(assert (=> start!124462 m!1329241))

(push 1)

