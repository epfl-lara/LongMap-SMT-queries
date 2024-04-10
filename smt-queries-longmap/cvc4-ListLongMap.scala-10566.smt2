; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124538 () Bool)

(assert start!124538)

(declare-fun b!1441260 () Bool)

(declare-fun e!812487 () Bool)

(declare-fun e!812488 () Bool)

(assert (=> b!1441260 (= e!812487 e!812488)))

(declare-fun res!973645 () Bool)

(assert (=> b!1441260 (=> (not res!973645) (not e!812488))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97986 0))(
  ( (array!97987 (arr!47281 (Array (_ BitVec 32) (_ BitVec 64))) (size!47831 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97986)

(assert (=> b!1441260 (= res!973645 (= (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633173 () array!97986)

(assert (=> b!1441260 (= lt!633173 (array!97987 (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47831 a!2862)))))

(declare-fun res!973641 () Bool)

(assert (=> start!124538 (=> (not res!973641) (not e!812487))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124538 (= res!973641 (validMask!0 mask!2687))))

(assert (=> start!124538 e!812487))

(assert (=> start!124538 true))

(declare-fun array_inv!36309 (array!97986) Bool)

(assert (=> start!124538 (array_inv!36309 a!2862)))

(declare-fun b!1441261 () Bool)

(declare-fun res!973643 () Bool)

(assert (=> b!1441261 (=> (not res!973643) (not e!812487))))

(declare-datatypes ((List!33782 0))(
  ( (Nil!33779) (Cons!33778 (h!35128 (_ BitVec 64)) (t!48476 List!33782)) )
))
(declare-fun arrayNoDuplicates!0 (array!97986 (_ BitVec 32) List!33782) Bool)

(assert (=> b!1441261 (= res!973643 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33779))))

(declare-fun b!1441262 () Bool)

(declare-fun res!973635 () Bool)

(assert (=> b!1441262 (=> (not res!973635) (not e!812487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441262 (= res!973635 (validKeyInArray!0 (select (arr!47281 a!2862) i!1006)))))

(declare-fun b!1441263 () Bool)

(declare-fun res!973640 () Bool)

(assert (=> b!1441263 (=> (not res!973640) (not e!812487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97986 (_ BitVec 32)) Bool)

(assert (=> b!1441263 (= res!973640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441264 () Bool)

(declare-fun res!973638 () Bool)

(assert (=> b!1441264 (=> (not res!973638) (not e!812487))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441264 (= res!973638 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47831 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47831 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47831 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441265 () Bool)

(declare-fun e!812492 () Bool)

(declare-fun e!812489 () Bool)

(assert (=> b!1441265 (= e!812492 e!812489)))

(declare-fun res!973639 () Bool)

(assert (=> b!1441265 (=> (not res!973639) (not e!812489))))

(declare-datatypes ((SeekEntryResult!11533 0))(
  ( (MissingZero!11533 (index!48524 (_ BitVec 32))) (Found!11533 (index!48525 (_ BitVec 32))) (Intermediate!11533 (undefined!12345 Bool) (index!48526 (_ BitVec 32)) (x!130238 (_ BitVec 32))) (Undefined!11533) (MissingVacant!11533 (index!48527 (_ BitVec 32))) )
))
(declare-fun lt!633174 () SeekEntryResult!11533)

(assert (=> b!1441265 (= res!973639 (= lt!633174 (Intermediate!11533 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633170 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97986 (_ BitVec 32)) SeekEntryResult!11533)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441265 (= lt!633174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633170 mask!2687) lt!633170 lt!633173 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441265 (= lt!633170 (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441266 () Bool)

(assert (=> b!1441266 (= e!812488 e!812492)))

(declare-fun res!973644 () Bool)

(assert (=> b!1441266 (=> (not res!973644) (not e!812492))))

(declare-fun lt!633171 () SeekEntryResult!11533)

(assert (=> b!1441266 (= res!973644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47281 a!2862) j!93) mask!2687) (select (arr!47281 a!2862) j!93) a!2862 mask!2687) lt!633171))))

(assert (=> b!1441266 (= lt!633171 (Intermediate!11533 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!812491 () Bool)

(declare-fun b!1441267 () Bool)

(assert (=> b!1441267 (= e!812491 (not (= lt!633174 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633170 lt!633173 mask!2687))))))

(declare-fun b!1441268 () Bool)

(declare-fun res!973637 () Bool)

(assert (=> b!1441268 (=> (not res!973637) (not e!812487))))

(assert (=> b!1441268 (= res!973637 (and (= (size!47831 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47831 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47831 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441269 () Bool)

(declare-fun res!973636 () Bool)

(assert (=> b!1441269 (=> (not res!973636) (not e!812492))))

(assert (=> b!1441269 (= res!973636 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47281 a!2862) j!93) a!2862 mask!2687) lt!633171))))

(declare-fun b!1441270 () Bool)

(assert (=> b!1441270 (= e!812489 false)))

(declare-fun lt!633172 () Bool)

(assert (=> b!1441270 (= lt!633172 e!812491)))

(declare-fun c!133323 () Bool)

(assert (=> b!1441270 (= c!133323 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441271 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97986 (_ BitVec 32)) SeekEntryResult!11533)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97986 (_ BitVec 32)) SeekEntryResult!11533)

(assert (=> b!1441271 (= e!812491 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633170 lt!633173 mask!2687) (seekEntryOrOpen!0 lt!633170 lt!633173 mask!2687))))))

(declare-fun b!1441272 () Bool)

(declare-fun res!973642 () Bool)

(assert (=> b!1441272 (=> (not res!973642) (not e!812487))))

(assert (=> b!1441272 (= res!973642 (validKeyInArray!0 (select (arr!47281 a!2862) j!93)))))

(assert (= (and start!124538 res!973641) b!1441268))

(assert (= (and b!1441268 res!973637) b!1441262))

(assert (= (and b!1441262 res!973635) b!1441272))

(assert (= (and b!1441272 res!973642) b!1441263))

(assert (= (and b!1441263 res!973640) b!1441261))

(assert (= (and b!1441261 res!973643) b!1441264))

(assert (= (and b!1441264 res!973638) b!1441260))

(assert (= (and b!1441260 res!973645) b!1441266))

(assert (= (and b!1441266 res!973644) b!1441269))

(assert (= (and b!1441269 res!973636) b!1441265))

(assert (= (and b!1441265 res!973639) b!1441270))

(assert (= (and b!1441270 c!133323) b!1441267))

(assert (= (and b!1441270 (not c!133323)) b!1441271))

(declare-fun m!1330487 () Bool)

(assert (=> b!1441267 m!1330487))

(declare-fun m!1330489 () Bool)

(assert (=> b!1441263 m!1330489))

(declare-fun m!1330491 () Bool)

(assert (=> b!1441271 m!1330491))

(declare-fun m!1330493 () Bool)

(assert (=> b!1441271 m!1330493))

(declare-fun m!1330495 () Bool)

(assert (=> b!1441265 m!1330495))

(assert (=> b!1441265 m!1330495))

(declare-fun m!1330497 () Bool)

(assert (=> b!1441265 m!1330497))

(declare-fun m!1330499 () Bool)

(assert (=> b!1441265 m!1330499))

(declare-fun m!1330501 () Bool)

(assert (=> b!1441265 m!1330501))

(declare-fun m!1330503 () Bool)

(assert (=> b!1441272 m!1330503))

(assert (=> b!1441272 m!1330503))

(declare-fun m!1330505 () Bool)

(assert (=> b!1441272 m!1330505))

(declare-fun m!1330507 () Bool)

(assert (=> start!124538 m!1330507))

(declare-fun m!1330509 () Bool)

(assert (=> start!124538 m!1330509))

(assert (=> b!1441269 m!1330503))

(assert (=> b!1441269 m!1330503))

(declare-fun m!1330511 () Bool)

(assert (=> b!1441269 m!1330511))

(assert (=> b!1441260 m!1330499))

(declare-fun m!1330513 () Bool)

(assert (=> b!1441260 m!1330513))

(declare-fun m!1330515 () Bool)

(assert (=> b!1441261 m!1330515))

(assert (=> b!1441266 m!1330503))

(assert (=> b!1441266 m!1330503))

(declare-fun m!1330517 () Bool)

(assert (=> b!1441266 m!1330517))

(assert (=> b!1441266 m!1330517))

(assert (=> b!1441266 m!1330503))

(declare-fun m!1330519 () Bool)

(assert (=> b!1441266 m!1330519))

(declare-fun m!1330521 () Bool)

(assert (=> b!1441262 m!1330521))

(assert (=> b!1441262 m!1330521))

(declare-fun m!1330523 () Bool)

(assert (=> b!1441262 m!1330523))

(push 1)

(assert (not b!1441262))

(assert (not start!124538))

(assert (not b!1441261))

