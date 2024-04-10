; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124484 () Bool)

(assert start!124484)

(declare-fun b!1440381 () Bool)

(declare-fun res!972812 () Bool)

(declare-fun e!812167 () Bool)

(assert (=> b!1440381 (=> (not res!972812) (not e!812167))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97932 0))(
  ( (array!97933 (arr!47254 (Array (_ BitVec 32) (_ BitVec 64))) (size!47804 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97932)

(declare-datatypes ((SeekEntryResult!11506 0))(
  ( (MissingZero!11506 (index!48416 (_ BitVec 32))) (Found!11506 (index!48417 (_ BitVec 32))) (Intermediate!11506 (undefined!12318 Bool) (index!48418 (_ BitVec 32)) (x!130139 (_ BitVec 32))) (Undefined!11506) (MissingVacant!11506 (index!48419 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97932 (_ BitVec 32)) SeekEntryResult!11506)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440381 (= res!972812 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97933 (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47804 a!2862)) mask!2687) (Intermediate!11506 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440382 () Bool)

(declare-fun res!972813 () Bool)

(declare-fun e!812168 () Bool)

(assert (=> b!1440382 (=> (not res!972813) (not e!812168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97932 (_ BitVec 32)) Bool)

(assert (=> b!1440382 (= res!972813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440383 () Bool)

(declare-fun res!972811 () Bool)

(assert (=> b!1440383 (=> (not res!972811) (not e!812168))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1440383 (= res!972811 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47804 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47804 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47804 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47254 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440384 () Bool)

(assert (=> b!1440384 (= e!812168 e!812167)))

(declare-fun res!972817 () Bool)

(assert (=> b!1440384 (=> (not res!972817) (not e!812167))))

(declare-fun lt!632958 () SeekEntryResult!11506)

(assert (=> b!1440384 (= res!972817 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47254 a!2862) j!93) mask!2687) (select (arr!47254 a!2862) j!93) a!2862 mask!2687) lt!632958))))

(assert (=> b!1440384 (= lt!632958 (Intermediate!11506 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440385 () Bool)

(declare-fun res!972808 () Bool)

(assert (=> b!1440385 (=> (not res!972808) (not e!812168))))

(assert (=> b!1440385 (= res!972808 (and (= (size!47804 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47804 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47804 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440386 () Bool)

(declare-fun res!972815 () Bool)

(assert (=> b!1440386 (=> (not res!972815) (not e!812168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440386 (= res!972815 (validKeyInArray!0 (select (arr!47254 a!2862) i!1006)))))

(declare-fun b!1440387 () Bool)

(declare-fun res!972814 () Bool)

(assert (=> b!1440387 (=> (not res!972814) (not e!812167))))

(assert (=> b!1440387 (= res!972814 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47254 a!2862) j!93) a!2862 mask!2687) lt!632958))))

(declare-fun b!1440389 () Bool)

(assert (=> b!1440389 (= e!812167 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440390 () Bool)

(declare-fun res!972809 () Bool)

(assert (=> b!1440390 (=> (not res!972809) (not e!812168))))

(declare-datatypes ((List!33755 0))(
  ( (Nil!33752) (Cons!33751 (h!35101 (_ BitVec 64)) (t!48449 List!33755)) )
))
(declare-fun arrayNoDuplicates!0 (array!97932 (_ BitVec 32) List!33755) Bool)

(assert (=> b!1440390 (= res!972809 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33752))))

(declare-fun res!972816 () Bool)

(assert (=> start!124484 (=> (not res!972816) (not e!812168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124484 (= res!972816 (validMask!0 mask!2687))))

(assert (=> start!124484 e!812168))

(assert (=> start!124484 true))

(declare-fun array_inv!36282 (array!97932) Bool)

(assert (=> start!124484 (array_inv!36282 a!2862)))

(declare-fun b!1440388 () Bool)

(declare-fun res!972810 () Bool)

(assert (=> b!1440388 (=> (not res!972810) (not e!812168))))

(assert (=> b!1440388 (= res!972810 (validKeyInArray!0 (select (arr!47254 a!2862) j!93)))))

(assert (= (and start!124484 res!972816) b!1440385))

(assert (= (and b!1440385 res!972808) b!1440386))

(assert (= (and b!1440386 res!972815) b!1440388))

(assert (= (and b!1440388 res!972810) b!1440382))

(assert (= (and b!1440382 res!972813) b!1440390))

(assert (= (and b!1440390 res!972809) b!1440383))

(assert (= (and b!1440383 res!972811) b!1440384))

(assert (= (and b!1440384 res!972817) b!1440387))

(assert (= (and b!1440387 res!972814) b!1440381))

(assert (= (and b!1440381 res!972812) b!1440389))

(declare-fun m!1329563 () Bool)

(assert (=> b!1440384 m!1329563))

(assert (=> b!1440384 m!1329563))

(declare-fun m!1329565 () Bool)

(assert (=> b!1440384 m!1329565))

(assert (=> b!1440384 m!1329565))

(assert (=> b!1440384 m!1329563))

(declare-fun m!1329567 () Bool)

(assert (=> b!1440384 m!1329567))

(declare-fun m!1329569 () Bool)

(assert (=> b!1440386 m!1329569))

(assert (=> b!1440386 m!1329569))

(declare-fun m!1329571 () Bool)

(assert (=> b!1440386 m!1329571))

(declare-fun m!1329573 () Bool)

(assert (=> b!1440382 m!1329573))

(declare-fun m!1329575 () Bool)

(assert (=> start!124484 m!1329575))

(declare-fun m!1329577 () Bool)

(assert (=> start!124484 m!1329577))

(declare-fun m!1329579 () Bool)

(assert (=> b!1440383 m!1329579))

(declare-fun m!1329581 () Bool)

(assert (=> b!1440383 m!1329581))

(assert (=> b!1440381 m!1329579))

(declare-fun m!1329583 () Bool)

(assert (=> b!1440381 m!1329583))

(assert (=> b!1440381 m!1329583))

(declare-fun m!1329585 () Bool)

(assert (=> b!1440381 m!1329585))

(assert (=> b!1440381 m!1329585))

(assert (=> b!1440381 m!1329583))

(declare-fun m!1329587 () Bool)

(assert (=> b!1440381 m!1329587))

(declare-fun m!1329589 () Bool)

(assert (=> b!1440390 m!1329589))

(assert (=> b!1440388 m!1329563))

(assert (=> b!1440388 m!1329563))

(declare-fun m!1329591 () Bool)

(assert (=> b!1440388 m!1329591))

(assert (=> b!1440387 m!1329563))

(assert (=> b!1440387 m!1329563))

(declare-fun m!1329593 () Bool)

(assert (=> b!1440387 m!1329593))

(push 1)

(assert (not b!1440386))

(assert (not b!1440390))

(assert (not b!1440384))

(assert (not start!124484))

(assert (not b!1440387))

(assert (not b!1440388))

(assert (not b!1440381))

(assert (not b!1440382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

