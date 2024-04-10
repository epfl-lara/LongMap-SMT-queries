; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124412 () Bool)

(assert start!124412)

(declare-fun b!1439345 () Bool)

(declare-fun e!811844 () Bool)

(declare-fun e!811843 () Bool)

(assert (=> b!1439345 (= e!811844 e!811843)))

(declare-fun res!971779 () Bool)

(assert (=> b!1439345 (=> (not res!971779) (not e!811843))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!632796 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97860 0))(
  ( (array!97861 (arr!47218 (Array (_ BitVec 32) (_ BitVec 64))) (size!47768 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97860)

(declare-datatypes ((SeekEntryResult!11470 0))(
  ( (MissingZero!11470 (index!48272 (_ BitVec 32))) (Found!11470 (index!48273 (_ BitVec 32))) (Intermediate!11470 (undefined!12282 Bool) (index!48274 (_ BitVec 32)) (x!130007 (_ BitVec 32))) (Undefined!11470) (MissingVacant!11470 (index!48275 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97860 (_ BitVec 32)) SeekEntryResult!11470)

(assert (=> b!1439345 (= res!971779 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632796 (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97861 (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47768 a!2862)) mask!2687) (Intermediate!11470 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439345 (= lt!632796 (toIndex!0 (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun res!971774 () Bool)

(declare-fun e!811841 () Bool)

(assert (=> start!124412 (=> (not res!971774) (not e!811841))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124412 (= res!971774 (validMask!0 mask!2687))))

(assert (=> start!124412 e!811841))

(assert (=> start!124412 true))

(declare-fun array_inv!36246 (array!97860) Bool)

(assert (=> start!124412 (array_inv!36246 a!2862)))

(declare-fun b!1439346 () Bool)

(declare-fun res!971775 () Bool)

(assert (=> b!1439346 (=> (not res!971775) (not e!811841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97860 (_ BitVec 32)) Bool)

(assert (=> b!1439346 (= res!971775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439347 () Bool)

(declare-fun res!971776 () Bool)

(assert (=> b!1439347 (=> (not res!971776) (not e!811841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439347 (= res!971776 (validKeyInArray!0 (select (arr!47218 a!2862) i!1006)))))

(declare-fun b!1439348 () Bool)

(assert (=> b!1439348 (= e!811841 e!811844)))

(declare-fun res!971782 () Bool)

(assert (=> b!1439348 (=> (not res!971782) (not e!811844))))

(declare-fun lt!632795 () SeekEntryResult!11470)

(assert (=> b!1439348 (= res!971782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47218 a!2862) j!93) mask!2687) (select (arr!47218 a!2862) j!93) a!2862 mask!2687) lt!632795))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439348 (= lt!632795 (Intermediate!11470 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439349 () Bool)

(declare-fun res!971772 () Bool)

(assert (=> b!1439349 (=> (not res!971772) (not e!811841))))

(assert (=> b!1439349 (= res!971772 (validKeyInArray!0 (select (arr!47218 a!2862) j!93)))))

(declare-fun b!1439350 () Bool)

(declare-fun res!971778 () Bool)

(assert (=> b!1439350 (=> (not res!971778) (not e!811844))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439350 (= res!971778 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47218 a!2862) j!93) a!2862 mask!2687) lt!632795))))

(declare-fun b!1439351 () Bool)

(declare-fun res!971781 () Bool)

(assert (=> b!1439351 (=> (not res!971781) (not e!811843))))

(assert (=> b!1439351 (= res!971781 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632796 #b00000000000000000000000000000000) (bvslt lt!632796 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439352 () Bool)

(declare-fun res!971780 () Bool)

(assert (=> b!1439352 (=> (not res!971780) (not e!811841))))

(assert (=> b!1439352 (= res!971780 (and (= (size!47768 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47768 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47768 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439353 () Bool)

(assert (=> b!1439353 (= e!811843 (not (validKeyInArray!0 (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439354 () Bool)

(declare-fun res!971773 () Bool)

(assert (=> b!1439354 (=> (not res!971773) (not e!811841))))

(declare-datatypes ((List!33719 0))(
  ( (Nil!33716) (Cons!33715 (h!35065 (_ BitVec 64)) (t!48413 List!33719)) )
))
(declare-fun arrayNoDuplicates!0 (array!97860 (_ BitVec 32) List!33719) Bool)

(assert (=> b!1439354 (= res!971773 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33716))))

(declare-fun b!1439355 () Bool)

(declare-fun res!971777 () Bool)

(assert (=> b!1439355 (=> (not res!971777) (not e!811841))))

(assert (=> b!1439355 (= res!971777 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47768 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47768 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47768 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124412 res!971774) b!1439352))

(assert (= (and b!1439352 res!971780) b!1439347))

(assert (= (and b!1439347 res!971776) b!1439349))

(assert (= (and b!1439349 res!971772) b!1439346))

(assert (= (and b!1439346 res!971775) b!1439354))

(assert (= (and b!1439354 res!971773) b!1439355))

(assert (= (and b!1439355 res!971777) b!1439348))

(assert (= (and b!1439348 res!971782) b!1439350))

(assert (= (and b!1439350 res!971778) b!1439345))

(assert (= (and b!1439345 res!971779) b!1439351))

(assert (= (and b!1439351 res!971781) b!1439353))

(declare-fun m!1328403 () Bool)

(assert (=> b!1439345 m!1328403))

(declare-fun m!1328405 () Bool)

(assert (=> b!1439345 m!1328405))

(assert (=> b!1439345 m!1328405))

(declare-fun m!1328407 () Bool)

(assert (=> b!1439345 m!1328407))

(assert (=> b!1439345 m!1328405))

(declare-fun m!1328409 () Bool)

(assert (=> b!1439345 m!1328409))

(declare-fun m!1328411 () Bool)

(assert (=> b!1439346 m!1328411))

(declare-fun m!1328413 () Bool)

(assert (=> b!1439348 m!1328413))

(assert (=> b!1439348 m!1328413))

(declare-fun m!1328415 () Bool)

(assert (=> b!1439348 m!1328415))

(assert (=> b!1439348 m!1328415))

(assert (=> b!1439348 m!1328413))

(declare-fun m!1328417 () Bool)

(assert (=> b!1439348 m!1328417))

(assert (=> b!1439353 m!1328403))

(assert (=> b!1439353 m!1328405))

(assert (=> b!1439353 m!1328405))

(declare-fun m!1328419 () Bool)

(assert (=> b!1439353 m!1328419))

(assert (=> b!1439349 m!1328413))

(assert (=> b!1439349 m!1328413))

(declare-fun m!1328421 () Bool)

(assert (=> b!1439349 m!1328421))

(assert (=> b!1439355 m!1328403))

(declare-fun m!1328423 () Bool)

(assert (=> b!1439355 m!1328423))

(declare-fun m!1328425 () Bool)

(assert (=> start!124412 m!1328425))

(declare-fun m!1328427 () Bool)

(assert (=> start!124412 m!1328427))

(declare-fun m!1328429 () Bool)

(assert (=> b!1439347 m!1328429))

(assert (=> b!1439347 m!1328429))

(declare-fun m!1328431 () Bool)

(assert (=> b!1439347 m!1328431))

(assert (=> b!1439350 m!1328413))

(assert (=> b!1439350 m!1328413))

(declare-fun m!1328433 () Bool)

(assert (=> b!1439350 m!1328433))

(declare-fun m!1328435 () Bool)

(assert (=> b!1439354 m!1328435))

(push 1)

(assert (not b!1439350))

(assert (not b!1439346))

(assert (not b!1439347))

(assert (not b!1439348))

(assert (not b!1439354))

(assert (not b!1439353))

(assert (not b!1439349))

(assert (not start!124412))

(assert (not b!1439345))

(check-sat)

(pop 1)

