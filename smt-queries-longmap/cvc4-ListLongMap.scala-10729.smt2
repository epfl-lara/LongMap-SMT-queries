; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125516 () Bool)

(assert start!125516)

(declare-fun b!1468480 () Bool)

(declare-fun e!824597 () Bool)

(declare-fun e!824596 () Bool)

(assert (=> b!1468480 (= e!824597 e!824596)))

(declare-fun res!997020 () Bool)

(assert (=> b!1468480 (=> (not res!997020) (not e!824596))))

(declare-datatypes ((SeekEntryResult!12010 0))(
  ( (MissingZero!12010 (index!50432 (_ BitVec 32))) (Found!12010 (index!50433 (_ BitVec 32))) (Intermediate!12010 (undefined!12822 Bool) (index!50434 (_ BitVec 32)) (x!132019 (_ BitVec 32))) (Undefined!12010) (MissingVacant!12010 (index!50435 (_ BitVec 32))) )
))
(declare-fun lt!642300 () SeekEntryResult!12010)

(declare-datatypes ((array!98964 0))(
  ( (array!98965 (arr!47770 (Array (_ BitVec 32) (_ BitVec 64))) (size!48320 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98964)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98964 (_ BitVec 32)) SeekEntryResult!12010)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468480 (= res!997020 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47770 a!2862) j!93) mask!2687) (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642300))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468480 (= lt!642300 (Intermediate!12010 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997022 () Bool)

(assert (=> start!125516 (=> (not res!997022) (not e!824597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125516 (= res!997022 (validMask!0 mask!2687))))

(assert (=> start!125516 e!824597))

(assert (=> start!125516 true))

(declare-fun array_inv!36798 (array!98964) Bool)

(assert (=> start!125516 (array_inv!36798 a!2862)))

(declare-fun b!1468481 () Bool)

(declare-fun res!997026 () Bool)

(assert (=> b!1468481 (=> (not res!997026) (not e!824597))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98964 (_ BitVec 32)) Bool)

(assert (=> b!1468481 (= res!997026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468482 () Bool)

(declare-fun res!997024 () Bool)

(assert (=> b!1468482 (=> (not res!997024) (not e!824597))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468482 (= res!997024 (validKeyInArray!0 (select (arr!47770 a!2862) i!1006)))))

(declare-fun b!1468483 () Bool)

(declare-fun res!997019 () Bool)

(assert (=> b!1468483 (=> (not res!997019) (not e!824597))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468483 (= res!997019 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48320 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48320 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48320 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468484 () Bool)

(declare-fun res!997021 () Bool)

(assert (=> b!1468484 (=> (not res!997021) (not e!824597))))

(declare-datatypes ((List!34271 0))(
  ( (Nil!34268) (Cons!34267 (h!35617 (_ BitVec 64)) (t!48965 List!34271)) )
))
(declare-fun arrayNoDuplicates!0 (array!98964 (_ BitVec 32) List!34271) Bool)

(assert (=> b!1468484 (= res!997021 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34268))))

(declare-fun b!1468485 () Bool)

(assert (=> b!1468485 (= e!824596 false)))

(declare-fun lt!642299 () SeekEntryResult!12010)

(assert (=> b!1468485 (= lt!642299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98965 (store (arr!47770 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48320 a!2862)) mask!2687))))

(declare-fun b!1468486 () Bool)

(declare-fun res!997023 () Bool)

(assert (=> b!1468486 (=> (not res!997023) (not e!824597))))

(assert (=> b!1468486 (= res!997023 (validKeyInArray!0 (select (arr!47770 a!2862) j!93)))))

(declare-fun b!1468487 () Bool)

(declare-fun res!997027 () Bool)

(assert (=> b!1468487 (=> (not res!997027) (not e!824596))))

(assert (=> b!1468487 (= res!997027 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47770 a!2862) j!93) a!2862 mask!2687) lt!642300))))

(declare-fun b!1468488 () Bool)

(declare-fun res!997025 () Bool)

(assert (=> b!1468488 (=> (not res!997025) (not e!824597))))

(assert (=> b!1468488 (= res!997025 (and (= (size!48320 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48320 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48320 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125516 res!997022) b!1468488))

(assert (= (and b!1468488 res!997025) b!1468482))

(assert (= (and b!1468482 res!997024) b!1468486))

(assert (= (and b!1468486 res!997023) b!1468481))

(assert (= (and b!1468481 res!997026) b!1468484))

(assert (= (and b!1468484 res!997021) b!1468483))

(assert (= (and b!1468483 res!997019) b!1468480))

(assert (= (and b!1468480 res!997020) b!1468487))

(assert (= (and b!1468487 res!997027) b!1468485))

(declare-fun m!1355549 () Bool)

(assert (=> b!1468484 m!1355549))

(declare-fun m!1355551 () Bool)

(assert (=> b!1468485 m!1355551))

(declare-fun m!1355553 () Bool)

(assert (=> b!1468485 m!1355553))

(assert (=> b!1468485 m!1355553))

(declare-fun m!1355555 () Bool)

(assert (=> b!1468485 m!1355555))

(assert (=> b!1468485 m!1355555))

(assert (=> b!1468485 m!1355553))

(declare-fun m!1355557 () Bool)

(assert (=> b!1468485 m!1355557))

(declare-fun m!1355559 () Bool)

(assert (=> b!1468480 m!1355559))

(assert (=> b!1468480 m!1355559))

(declare-fun m!1355561 () Bool)

(assert (=> b!1468480 m!1355561))

(assert (=> b!1468480 m!1355561))

(assert (=> b!1468480 m!1355559))

(declare-fun m!1355563 () Bool)

(assert (=> b!1468480 m!1355563))

(declare-fun m!1355565 () Bool)

(assert (=> start!125516 m!1355565))

(declare-fun m!1355567 () Bool)

(assert (=> start!125516 m!1355567))

(declare-fun m!1355569 () Bool)

(assert (=> b!1468482 m!1355569))

(assert (=> b!1468482 m!1355569))

(declare-fun m!1355571 () Bool)

(assert (=> b!1468482 m!1355571))

(assert (=> b!1468487 m!1355559))

(assert (=> b!1468487 m!1355559))

(declare-fun m!1355573 () Bool)

(assert (=> b!1468487 m!1355573))

(assert (=> b!1468486 m!1355559))

(assert (=> b!1468486 m!1355559))

(declare-fun m!1355575 () Bool)

(assert (=> b!1468486 m!1355575))

(assert (=> b!1468483 m!1355551))

(declare-fun m!1355577 () Bool)

(assert (=> b!1468483 m!1355577))

(declare-fun m!1355579 () Bool)

(assert (=> b!1468481 m!1355579))

(push 1)

(assert (not b!1468480))

(assert (not start!125516))

(assert (not b!1468487))

(assert (not b!1468486))

(assert (not b!1468482))

(assert (not b!1468485))

(assert (not b!1468484))

(assert (not b!1468481))

