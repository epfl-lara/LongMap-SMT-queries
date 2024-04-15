; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124474 () Bool)

(assert start!124474)

(declare-fun b!1440477 () Bool)

(declare-fun res!973024 () Bool)

(declare-fun e!812140 () Bool)

(assert (=> b!1440477 (=> (not res!973024) (not e!812140))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11516 0))(
  ( (MissingZero!11516 (index!48456 (_ BitVec 32))) (Found!11516 (index!48457 (_ BitVec 32))) (Intermediate!11516 (undefined!12328 Bool) (index!48458 (_ BitVec 32)) (x!130176 (_ BitVec 32))) (Undefined!11516) (MissingVacant!11516 (index!48459 (_ BitVec 32))) )
))
(declare-fun lt!632772 () SeekEntryResult!11516)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97900 0))(
  ( (array!97901 (arr!47239 (Array (_ BitVec 32) (_ BitVec 64))) (size!47791 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97900)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97900 (_ BitVec 32)) SeekEntryResult!11516)

(assert (=> b!1440477 (= res!973024 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632772))))

(declare-fun b!1440478 () Bool)

(declare-fun e!812141 () Bool)

(assert (=> b!1440478 (= e!812141 e!812140)))

(declare-fun res!973029 () Bool)

(assert (=> b!1440478 (=> (not res!973029) (not e!812140))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440478 (= res!973029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632772))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440478 (= lt!632772 (Intermediate!11516 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440479 () Bool)

(declare-fun res!973030 () Bool)

(assert (=> b!1440479 (=> (not res!973030) (not e!812141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97900 (_ BitVec 32)) Bool)

(assert (=> b!1440479 (= res!973030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440480 () Bool)

(declare-fun res!973021 () Bool)

(assert (=> b!1440480 (=> (not res!973021) (not e!812141))))

(declare-datatypes ((List!33818 0))(
  ( (Nil!33815) (Cons!33814 (h!35164 (_ BitVec 64)) (t!48504 List!33818)) )
))
(declare-fun arrayNoDuplicates!0 (array!97900 (_ BitVec 32) List!33818) Bool)

(assert (=> b!1440480 (= res!973021 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33815))))

(declare-fun res!973025 () Bool)

(assert (=> start!124474 (=> (not res!973025) (not e!812141))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124474 (= res!973025 (validMask!0 mask!2687))))

(assert (=> start!124474 e!812141))

(assert (=> start!124474 true))

(declare-fun array_inv!36472 (array!97900) Bool)

(assert (=> start!124474 (array_inv!36472 a!2862)))

(declare-fun b!1440481 () Bool)

(declare-fun res!973027 () Bool)

(assert (=> b!1440481 (=> (not res!973027) (not e!812141))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440481 (= res!973027 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47791 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47791 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47791 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440482 () Bool)

(declare-fun res!973022 () Bool)

(assert (=> b!1440482 (=> (not res!973022) (not e!812141))))

(assert (=> b!1440482 (= res!973022 (and (= (size!47791 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47791 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47791 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440483 () Bool)

(declare-fun res!973023 () Bool)

(assert (=> b!1440483 (=> (not res!973023) (not e!812140))))

(assert (=> b!1440483 (= res!973023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97901 (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47791 a!2862)) mask!2687) (Intermediate!11516 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440484 () Bool)

(declare-fun res!973028 () Bool)

(assert (=> b!1440484 (=> (not res!973028) (not e!812141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440484 (= res!973028 (validKeyInArray!0 (select (arr!47239 a!2862) j!93)))))

(declare-fun b!1440485 () Bool)

(assert (=> b!1440485 (= e!812140 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440486 () Bool)

(declare-fun res!973026 () Bool)

(assert (=> b!1440486 (=> (not res!973026) (not e!812141))))

(assert (=> b!1440486 (= res!973026 (validKeyInArray!0 (select (arr!47239 a!2862) i!1006)))))

(assert (= (and start!124474 res!973025) b!1440482))

(assert (= (and b!1440482 res!973022) b!1440486))

(assert (= (and b!1440486 res!973026) b!1440484))

(assert (= (and b!1440484 res!973028) b!1440479))

(assert (= (and b!1440479 res!973030) b!1440480))

(assert (= (and b!1440480 res!973021) b!1440481))

(assert (= (and b!1440481 res!973027) b!1440478))

(assert (= (and b!1440478 res!973029) b!1440477))

(assert (= (and b!1440477 res!973024) b!1440483))

(assert (= (and b!1440483 res!973023) b!1440485))

(declare-fun m!1329213 () Bool)

(assert (=> b!1440486 m!1329213))

(assert (=> b!1440486 m!1329213))

(declare-fun m!1329215 () Bool)

(assert (=> b!1440486 m!1329215))

(declare-fun m!1329217 () Bool)

(assert (=> start!124474 m!1329217))

(declare-fun m!1329219 () Bool)

(assert (=> start!124474 m!1329219))

(declare-fun m!1329221 () Bool)

(assert (=> b!1440478 m!1329221))

(assert (=> b!1440478 m!1329221))

(declare-fun m!1329223 () Bool)

(assert (=> b!1440478 m!1329223))

(assert (=> b!1440478 m!1329223))

(assert (=> b!1440478 m!1329221))

(declare-fun m!1329225 () Bool)

(assert (=> b!1440478 m!1329225))

(declare-fun m!1329227 () Bool)

(assert (=> b!1440483 m!1329227))

(declare-fun m!1329229 () Bool)

(assert (=> b!1440483 m!1329229))

(assert (=> b!1440483 m!1329229))

(declare-fun m!1329231 () Bool)

(assert (=> b!1440483 m!1329231))

(assert (=> b!1440483 m!1329231))

(assert (=> b!1440483 m!1329229))

(declare-fun m!1329233 () Bool)

(assert (=> b!1440483 m!1329233))

(declare-fun m!1329235 () Bool)

(assert (=> b!1440480 m!1329235))

(assert (=> b!1440484 m!1329221))

(assert (=> b!1440484 m!1329221))

(declare-fun m!1329237 () Bool)

(assert (=> b!1440484 m!1329237))

(declare-fun m!1329239 () Bool)

(assert (=> b!1440479 m!1329239))

(assert (=> b!1440477 m!1329221))

(assert (=> b!1440477 m!1329221))

(declare-fun m!1329241 () Bool)

(assert (=> b!1440477 m!1329241))

(assert (=> b!1440481 m!1329227))

(declare-fun m!1329243 () Bool)

(assert (=> b!1440481 m!1329243))

(check-sat (not b!1440483) (not start!124474) (not b!1440480) (not b!1440479) (not b!1440477) (not b!1440478) (not b!1440486) (not b!1440484))
(check-sat)
