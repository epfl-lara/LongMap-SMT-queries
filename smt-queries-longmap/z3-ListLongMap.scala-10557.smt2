; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124482 () Bool)

(assert start!124482)

(declare-fun b!1440351 () Bool)

(declare-fun res!972778 () Bool)

(declare-fun e!812158 () Bool)

(assert (=> b!1440351 (=> (not res!972778) (not e!812158))))

(declare-datatypes ((array!97930 0))(
  ( (array!97931 (arr!47253 (Array (_ BitVec 32) (_ BitVec 64))) (size!47803 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97930)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440351 (= res!972778 (validKeyInArray!0 (select (arr!47253 a!2862) i!1006)))))

(declare-fun b!1440352 () Bool)

(declare-fun res!972786 () Bool)

(assert (=> b!1440352 (=> (not res!972786) (not e!812158))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1440352 (= res!972786 (and (= (size!47803 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47803 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47803 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440353 () Bool)

(declare-fun res!972785 () Bool)

(assert (=> b!1440353 (=> (not res!972785) (not e!812158))))

(assert (=> b!1440353 (= res!972785 (validKeyInArray!0 (select (arr!47253 a!2862) j!93)))))

(declare-fun res!972784 () Bool)

(assert (=> start!124482 (=> (not res!972784) (not e!812158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124482 (= res!972784 (validMask!0 mask!2687))))

(assert (=> start!124482 e!812158))

(assert (=> start!124482 true))

(declare-fun array_inv!36281 (array!97930) Bool)

(assert (=> start!124482 (array_inv!36281 a!2862)))

(declare-fun b!1440354 () Bool)

(declare-fun res!972780 () Bool)

(assert (=> b!1440354 (=> (not res!972780) (not e!812158))))

(declare-datatypes ((List!33754 0))(
  ( (Nil!33751) (Cons!33750 (h!35100 (_ BitVec 64)) (t!48448 List!33754)) )
))
(declare-fun arrayNoDuplicates!0 (array!97930 (_ BitVec 32) List!33754) Bool)

(assert (=> b!1440354 (= res!972780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33751))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1440355 () Bool)

(declare-fun e!812159 () Bool)

(assert (=> b!1440355 (= e!812159 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440356 () Bool)

(declare-fun res!972781 () Bool)

(assert (=> b!1440356 (=> (not res!972781) (not e!812158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97930 (_ BitVec 32)) Bool)

(assert (=> b!1440356 (= res!972781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440357 () Bool)

(declare-fun res!972787 () Bool)

(assert (=> b!1440357 (=> (not res!972787) (not e!812158))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440357 (= res!972787 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47803 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47803 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47803 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47253 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440358 () Bool)

(declare-fun res!972779 () Bool)

(assert (=> b!1440358 (=> (not res!972779) (not e!812159))))

(declare-datatypes ((SeekEntryResult!11505 0))(
  ( (MissingZero!11505 (index!48412 (_ BitVec 32))) (Found!11505 (index!48413 (_ BitVec 32))) (Intermediate!11505 (undefined!12317 Bool) (index!48414 (_ BitVec 32)) (x!130138 (_ BitVec 32))) (Undefined!11505) (MissingVacant!11505 (index!48415 (_ BitVec 32))) )
))
(declare-fun lt!632955 () SeekEntryResult!11505)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97930 (_ BitVec 32)) SeekEntryResult!11505)

(assert (=> b!1440358 (= res!972779 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47253 a!2862) j!93) a!2862 mask!2687) lt!632955))))

(declare-fun b!1440359 () Bool)

(declare-fun res!972783 () Bool)

(assert (=> b!1440359 (=> (not res!972783) (not e!812159))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440359 (= res!972783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47253 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47253 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97931 (store (arr!47253 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47803 a!2862)) mask!2687) (Intermediate!11505 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440360 () Bool)

(assert (=> b!1440360 (= e!812158 e!812159)))

(declare-fun res!972782 () Bool)

(assert (=> b!1440360 (=> (not res!972782) (not e!812159))))

(assert (=> b!1440360 (= res!972782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47253 a!2862) j!93) mask!2687) (select (arr!47253 a!2862) j!93) a!2862 mask!2687) lt!632955))))

(assert (=> b!1440360 (= lt!632955 (Intermediate!11505 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124482 res!972784) b!1440352))

(assert (= (and b!1440352 res!972786) b!1440351))

(assert (= (and b!1440351 res!972778) b!1440353))

(assert (= (and b!1440353 res!972785) b!1440356))

(assert (= (and b!1440356 res!972781) b!1440354))

(assert (= (and b!1440354 res!972780) b!1440357))

(assert (= (and b!1440357 res!972787) b!1440360))

(assert (= (and b!1440360 res!972782) b!1440358))

(assert (= (and b!1440358 res!972779) b!1440359))

(assert (= (and b!1440359 res!972783) b!1440355))

(declare-fun m!1329531 () Bool)

(assert (=> b!1440356 m!1329531))

(declare-fun m!1329533 () Bool)

(assert (=> b!1440357 m!1329533))

(declare-fun m!1329535 () Bool)

(assert (=> b!1440357 m!1329535))

(declare-fun m!1329537 () Bool)

(assert (=> b!1440360 m!1329537))

(assert (=> b!1440360 m!1329537))

(declare-fun m!1329539 () Bool)

(assert (=> b!1440360 m!1329539))

(assert (=> b!1440360 m!1329539))

(assert (=> b!1440360 m!1329537))

(declare-fun m!1329541 () Bool)

(assert (=> b!1440360 m!1329541))

(declare-fun m!1329543 () Bool)

(assert (=> b!1440351 m!1329543))

(assert (=> b!1440351 m!1329543))

(declare-fun m!1329545 () Bool)

(assert (=> b!1440351 m!1329545))

(declare-fun m!1329547 () Bool)

(assert (=> start!124482 m!1329547))

(declare-fun m!1329549 () Bool)

(assert (=> start!124482 m!1329549))

(assert (=> b!1440359 m!1329533))

(declare-fun m!1329551 () Bool)

(assert (=> b!1440359 m!1329551))

(assert (=> b!1440359 m!1329551))

(declare-fun m!1329553 () Bool)

(assert (=> b!1440359 m!1329553))

(assert (=> b!1440359 m!1329553))

(assert (=> b!1440359 m!1329551))

(declare-fun m!1329555 () Bool)

(assert (=> b!1440359 m!1329555))

(assert (=> b!1440353 m!1329537))

(assert (=> b!1440353 m!1329537))

(declare-fun m!1329557 () Bool)

(assert (=> b!1440353 m!1329557))

(declare-fun m!1329559 () Bool)

(assert (=> b!1440354 m!1329559))

(assert (=> b!1440358 m!1329537))

(assert (=> b!1440358 m!1329537))

(declare-fun m!1329561 () Bool)

(assert (=> b!1440358 m!1329561))

(check-sat (not b!1440351) (not start!124482) (not b!1440356) (not b!1440360) (not b!1440354) (not b!1440359) (not b!1440358) (not b!1440353))
(check-sat)
